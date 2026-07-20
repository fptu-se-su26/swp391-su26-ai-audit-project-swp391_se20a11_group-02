import http from 'k6/http';
import { check } from 'k6';
import exec from 'k6/execution';

// Configuration
const BASE_URL = __ENV.BASE_URL || 'http://localhost:8080/nonstopcoding';
const MODE = __ENV.MODE || 'single'; // 'single' (1 user token) or 'multi' (100 distinct user tokens)
const VUS = parseInt(__ENV.VUS || '100');
const ITERATIONS = parseInt(__ENV.ITERATIONS || '100');

export const options = {
    scenarios: {
        concurrent_submissions: {
            executor: 'per-vu-iterations',
            vus: VUS,
            iterations: Math.ceil(ITERATIONS / VUS),
            maxDuration: '1m',
        },
    },
    thresholds: {
        http_req_failed: ['rate<0.05'], // < 5% error rate
        http_req_duration: ['p(95)<8000'], // 95% requests finish under 8s
    },
};

const cppSourceCode = `#include <bits/stdc++.h>
using namespace std;

int main() {
    string line;
    getline(cin, line);

    vector<int> nums;
    {
        stringstream ss(line);
        int x;
        while (ss >> x) nums.push_back(x);
    }

    int target;
    cin >> target;

    unordered_map<int, int> seen;

    for (int i = 0; i < (int)nums.size(); i++) {
        int need = target - nums[i];
        if (seen.count(need)) {
            cout << seen[need] << " " << i << endl;
            return 0;
        }
        seen[nums[i]] = i;
    }

    cout << -1 << " " << -1 << endl;
    return 0;
}`;

function loginAndGetToken(username, password) {
    const loginRes = http.post(
        `${BASE_URL}/auth/login`,
        JSON.stringify({ username: username, password: password }),
        { headers: { 'Content-Type': 'application/json' } }
    );

    if (loginRes.cookies && loginRes.cookies['access_token']) {
        return loginRes.cookies['access_token'][0].value;
    } else if (loginRes.json() && loginRes.json().result && loginRes.json().result.accessToken) {
        return loginRes.json().result.accessToken;
    }
    return null;
}

// Setup phase: Login users & retrieve JWT access tokens
export function setup() {
    console.log(`[SETUP] Initializing tokens for MODE=${MODE}, VUS=${VUS}, BASE_URL=${BASE_URL}`);

    if (MODE === 'single') {
        const token = loginAndGetToken('user1', 'user1');
        if (!token) {
            console.error(`[SETUP ERROR] Failed to retrieve token for user1.`);
        } else {
            console.log(`[SETUP SUCCESS] Retrieved token for single user scenario`);
        }
        return { tokens: [token] };
    } else {
        // Multi-token mode: Retrieve VUS unique JWT tokens
        const tokens = [];
        for (let i = 1; i <= VUS; i++) {
            const token = loginAndGetToken('user1', 'user1');
            if (token) {
                tokens.push(token);
            }
        }
        console.log(`[SETUP SUCCESS] Successfully retrieved ${tokens.length} distinct tokens for VUs`);
        return { tokens: tokens };
    }
}

// Main execution function
export default function (data) {
    const vuId = (exec.vu.idInInstance - 1) % data.tokens.length;
    const token = data.tokens[vuId];

    if (!token) {
        console.error(`[VU ${exec.vu.idInInstance}] No valid auth token available`);
        return;
    }

    const payload = JSON.stringify({
        problemId: 3,
        languageId: 54, // C++
        sourceCode: cppSourceCode,
    });

    const params = {
        headers: {
            'Content-Type': 'application/json',
            'Authorization': `Bearer ${token}`,
            'Cookie': `access_token=${token}`,
        },
    };

    const res = http.post(`${BASE_URL}/online-judge/submissions`, payload, params);

    const success = check(res, {
        'status is 200': (r) => r.status === 200,
        'has submissionId': (r) => r.json() && r.json().result && r.json().result.submissionId !== undefined,
    });

    if (!success) {
        console.error(`[VU ${exec.vu.idInInstance}] Submission failed: HTTP ${res.status} - ${res.body}`);
    }
}
