import React, { useState, useEffect, useRef } from 'react';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import { useApp } from '../context/AppContext';
import { dashboardService, type DashboardStatsResponse, type CourseListItemResponse, type SubmissionStatisticResponse } from '../services/dashboardService';
import { paymentService } from '../services/paymentService';
import { getPurchaseHistory, type PurchaseHistoryResponse } from '../services/orderService';

const TX_TYPE_OPTIONS = [
  { value: '', label: 'All Types', bg: 'bg-gray-100 text-gray-700' },
  { value: 'DEPOSIT', label: 'Deposit', bg: 'bg-blue-100 text-blue-700' },
  { value: 'BUY_COURSE', label: 'Buy Course', bg: 'bg-red-100 text-red-700' },
  { value: 'REFUND', label: 'Refund', bg: 'bg-purple-100 text-purple-700' },
  { value: 'AWARD', label: 'Award', bg: 'bg-amber-100 text-amber-700' }
];

// Mock datasets exactly as they are in the HTML
export const initialMyCourses = [
  {
    id: 'java-adv',
    title: 'Java Fundamentals to Advanced',
    author: 'Dr. Alan Turing',
    category: 'Java',
    progress: '65%',
    progressVal: 65,
    rating: 4.8,
    ratingsCount: '1,240',
    status: 'ongoing',
    thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBgy50UMGsrfiNlaMOGS5hIFfEB9ALLj2hHwL19FjiPxHtPdmdzDshyKCd9cxUE55L1IPGibJJ8XxYWvIOtq6nCmPgaCFoPxxlN64_OwyPrZocxC4bEzFtpL_km1YmpuA-CN4fUVjD5gO2NI7mdCoim7_CAT7njSdYphWceJpEIiRp5PAaZrqeglhZ4z73HAhMVJI5rSTTAUK3BmjBzHCR2ivCNvmKAvTRSv0bZDvGjfSB2GENwq1duU8S0jsS3Bgtxt-P5YEUi6M8'
  },
  {
    id: 'dsa',
    title: 'Data Structures & Algorithms',
    author: 'Ada Lovelace',
    category: 'Algorithms',
    progress: '32%',
    progressVal: 32,
    rating: 4.9,
    ratingsCount: '2,150',
    status: 'ongoing',
    thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBrLRPGmTw2WKOVjaU8vt3rWbyU_IutkyQCHmjb4756OHz94BzCcaaqOAypjovZ890SBIthYzF12ggMvhxo0w-S_OQizNFa5DtyTQfi3KxxxubXCobRHCPMK2auxCeFzRISNcp72GUb3AXRG4IbJSc1j1jqMRfbhbXBZFOzuEs9Zyv3mgRrXDRBAujfgQw5_uGSeKQI340ZtVWM81ZNu887j7-Ee2CMIXLXPiIRuva9t7_xMz7YydCPH56sKDASIrKT-SFU_pzI-q0'
  },
  {
    id: 'uiux',
    title: 'UI/UX Fundamentals',
    author: 'Don Norman',
    category: 'Design',
    progress: '48%',
    progressVal: 48,
    rating: 4.7,
    ratingsCount: '840',
    status: 'ongoing',
    thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBgMrlXcL6UyewsliLmYzTFGeK46VPXPWa0zqiFJFG3Hab-pyZxWtLpBIjHojZqQVgPRMLB8VMpFNSPznwO6UAHzZ2jcFWs6K0BKMoB0OD6WHKwN5vItAHep9ax_z9Omyl1BaSD9pXR8rHPLTMdus-Dh94N_UEM2V5mfs9b6xxFTVdKN7cmXk6y3CyGBnmOA0TKw6rbul5AenrOgS9aOiP0BR-apj6wQfoZlBJkkBtbvlPlXsTpO_CtKv-ITYmOrUJqs6SnUAzYMLw'
  },
  {
    id: 'react-master',
    title: 'React Masterclass',
    author: 'Dan Abramov',
    category: 'Frontend',
    progress: '12%',
    progressVal: 12,
    rating: 4.6,
    ratingsCount: '950',
    status: 'ongoing',
    thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDH38LU6e0yGxqrzZGQbdoxvw8ZMxy9gZPrCBCgMDBLa6vPS_quf5UAkp5VGyisE1ULnbzo9YYRhi8yTbWwl4UR6GVxXTz4-1sX-6PRw-ySY0em1pyh4D3F-VFRK4jIMlxj13KIG8hO_VPvC3PhAOls8fxw8ObhSCtHS6pnkg4VYl9tgu9e7MPzOVA5pB3h_BUM1EvsEu7pax7zpF--vWRIg5LCFhkUGjn_vWsZbht95_EyogbW4JoDYHSaDrmZ5uYj5r7NBCz-cHg'
  },
  {
    id: 'py-begin',
    title: 'Python for Beginners',
    author: 'Grace Hopper',
    category: 'Python',
    progress: '100%',
    progressVal: 100,
    rating: 4.9,
    ratingsCount: '3,400',
    status: 'completed',
    thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDprSKVqEq347pPqZ9M8ZWp_6T-Pvi_68sA90ExU-mSJXsImRMFa4q4dLHkArN6WOv5WFywpvaSZBRAHvu_Dx0r6w9yK_mlTECqCeq9Wg3oBbgZTv9n5f5XBS7cYcelKHCSqcutDcmpUqgS0-UThBEEYGjKVVlqjNkMD5LeFuWllGb4uhmZZ8l2nvSElcuet9dv6J2P59fo1VSbODozVKEkm5a4gpdTPT1T6CEHtGUDY7Lv6jRnLSmwUI2aNOpki1r5UtOOo4ccDQQ'
  },
  {
    id: 'sql-db',
    title: 'SQL Database Basics',
    author: 'Linus Torvalds',
    category: 'Database',
    progress: '100%',
    progressVal: 100,
    rating: 4.5,
    ratingsCount: '1,120',
    status: 'completed',
    thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuAgPQoJfVaRjxXQvS7N25MLctJghBgjcZCo8n2wpzkZMyEuTKFIvYs8qJ2OMD4PEp3G9tRzvqizo-W5TB-OIXup91n-sqoxw6_rFv5ZF7yMaaV5SWkkzoIX9SKxkU7xITu5AyPYUDImqxHExSi0alwlwCBoyyJ7vCnwTnwGJDlY9rskNWGjxxW-zx-A3-RRo_W1zlMWhLftwYj33PdKOQgv3aJAGj69mGWeFoSUXXRlcY-kkal5mjfr19Uf3qELIcDhvG1oiKO4s90'
  },
  {
    id: 'lin-alg',
    title: 'Linear Algebra for Devs',
    author: 'Carl Gauss',
    category: 'Math',
    progress: '100%',
    progressVal: 100,
    rating: 4.8,
    ratingsCount: '780',
    status: 'completed',
    thumbnail: 'https://lh3.googleusercontent.com/aida-public/AB6AXuBVomxWSJhKP4gY1tskEgBnc-uwlSGtjxGtlSCu0HYXgC2f8u-C8XBTqyfCbNtkTOh-QTmmyM2zQ3DabmlPoGAYyb_-BF4abtgwbZTrvvdbrcHBB7qmM1iUbRT5ZrIlwrYluTtcIEbeJf1Z_SDdboaLdzEWI2_bXGyIfZUUBr8yhoXgTsTyxW8XDIWq-o9FsZ9ICfSnvG5hRd6zraHfF7QIeuddoBdBlwpGAZExwYjtoUNqqZd-hwOexQZqZKm9xwlZSzsgu5iQn7E'
  },
  {
    id: 'sys-design',
    title: 'System Design Crash Course',
    author: 'Martin Fowler',
    category: 'Architecture',
    progress: '100%',
    progressVal: 100,
    rating: 4.9,
    ratingsCount: '1,850',
    status: 'completed',
    thumbnail: 'https://images.unsplash.com/photo-1555066931-4365d14bab8c?ixlib=rb-4.0.3&auto=format&fit=crop&w=500&q=60'
  }
];



const participatedContests = [
  { name: 'Weekly Algorithm Sprint #45', date: 'Oct 24, 2026', rank: '124 / 2450', score: '350 pts' },
  { name: 'Data Structures Challenge Series', date: 'Oct 15, 2026', rank: '342 / 1800', score: '280 pts' },
  { name: 'Intro to DP Challenge', date: 'Oct 01, 2026', rank: '950 / 4102', score: '150 pts' }
];

const contestHistoryData = [
  {
    name: 'Weekly Algorithm Sprint #45',
    status: 'Ongoing',
    date: 'Oct 24, 2026',
    startDate: 'Oct 24, 2026 08:00 AM',
    endDate: 'Oct 27, 2026 08:00 AM',
    problemsSolved: '3/5',
    timeSpent: '2h 15m',
    rank: '124 / 2450',
    score: '350 pts',
    category: 'Sprint League',
    difficulty: 'Medium',
    xpEarned: '+50 XP'
  },
  {
    name: 'Data Structures Challenge Series',
    status: 'Ended',
    date: 'Oct 15, 2026',
    startDate: 'Oct 15, 2026 09:00 AM',
    endDate: 'Oct 15, 2026 12:00 PM',
    problemsSolved: '4/5',
    timeSpent: '3h 10m',
    rank: '342 / 1800',
    score: '280 pts',
    category: 'Structure Series',
    difficulty: 'Hard',
    xpEarned: '+100 XP'
  },
  {
    name: 'Intro to DP Challenge',
    status: 'Ended',
    date: 'Oct 01, 2026',
    startDate: 'Oct 01, 2026 02:00 PM',
    endDate: 'Oct 01, 2026 05:00 PM',
    problemsSolved: '2/5',
    timeSpent: '1h 45m',
    rank: '950 / 4102',
    score: '150 pts',
    category: 'Past Arena',
    difficulty: 'Easy',
    xpEarned: '+30 XP'
  },
  {
    name: 'Code Masters Championship 2026',
    status: 'Upcoming',
    date: 'Nov 15, 2026',
    startDate: 'Nov 15, 2026 08:00 AM',
    endDate: 'Nov 15, 2026 11:00 AM',
    problemsSolved: 'N/A',
    timeSpent: 'N/A',
    rank: 'Registered',
    score: 'N/A',
    category: 'Mega Prize',
    difficulty: 'Hard',
    xpEarned: 'Pending'
  },
  {
    name: 'SQL Mastery Arena',
    status: 'Upcoming',
    date: 'Nov 25, 2026',
    startDate: 'Nov 25, 2026 10:00 AM',
    endDate: 'Nov 25, 2026 01:00 PM',
    problemsSolved: 'N/A',
    timeSpent: 'N/A',
    rank: 'Registered',
    score: 'N/A',
    category: 'Database Skill',
    difficulty: 'Medium',
    xpEarned: 'Pending'
  }
];



const initialExercises = [
  { name: 'Two Sum', difficulty: 'Easy', difficultyClass: 'bg-green-50 text-brand-green border border-green-150', submissions: '1,245', completed: true },
  { name: 'Reverse Linked List', difficulty: 'Easy', difficultyClass: 'bg-green-50 text-brand-green border border-green-150', submissions: '850', completed: false },
  { name: 'Spring Context Hierarchy Solver', difficulty: 'Medium', difficultyClass: 'bg-primary-light/50 text-primary border border-primary/20', submissions: '420', completed: false }
];

interface ProblemDetail {
  difficulty: string;
  difficultyClass: string;
  description: string;
  code: Record<string, string>;
}

const problemData: Record<string, ProblemDetail> = {
  "Two Sum": {
    difficulty: "Easy",
    difficultyClass: "bg-green-50 text-brand-green border border-green-150",
    description: `
      <p class="mb-4">Given an array of integers <code class="bg-surface-gray px-1.5 py-0.5 rounded border border-gray-200 font-mono text-xs">nums</code> and an integer <code class="bg-surface-gray px-1.5 py-0.5 rounded border border-gray-200 font-mono text-xs">target</code>, return <em>indices of the two numbers such that they add up to <code class="bg-surface-gray px-1.5 py-0.5 rounded border border-gray-200 font-mono text-xs">target</code></em>.</p>
      <p class="mb-4">You may assume that each input would have <strong>exactly one solution</strong>, and you may not use the same element twice.</p>
      <p class="mb-4">You can return the answer in any order.</p>
      <div class="grid md:grid-cols-2 gap-4 my-4">
          <div class="bg-surface-gray border border-gray-200 p-4 rounded-xl">
              <p class="font-bold text-xs text-text-main mb-2">Example 1:</p>
              <div class="font-mono text-xs text-text-muted space-y-1">
                  <p><span class="text-text-main font-semibold">Input:</span> nums = [2,7,11,15], target = 9</p>
                  <p><span class="text-text-main font-semibold">Output:</span> [0,1]</p>
                  <p><span class="text-text-main font-semibold">Explanation:</span> Because nums[0] + nums[1] == 9, we return [0, 1].</p>
              </div>
          </div>
          <div class="bg-surface-gray border border-gray-200 p-4 rounded-xl">
              <p class="font-bold text-xs text-text-main mb-2">Example 2:</p>
              <div class="font-mono text-xs text-text-muted space-y-1">
                  <p><span class="text-text-main font-semibold">Input:</span> nums = [3,2,4], target = 6</p>
                  <p><span class="text-text-main font-semibold">Output:</span> [1,2]</p>
              </div>
          </div>
      </div>
      <div class="space-y-2 mb-4">
          <h4 class="font-bold text-xs text-text-main">Constraints:</h4>
          <ul class="list-disc pl-5 text-xs text-text-muted space-y-1">
              <li><code class="bg-surface-gray px-1 rounded font-mono text-[11px]">2 &lt;= nums.length &lt;= 10<sup>4</sup></code></li>
              <li><code class="bg-surface-gray px-1 rounded font-mono text-[11px]">-10<sup>9</sup> &lt;= nums[i] &lt;= 10<sup>9</sup></code></li>
              <li><code class="bg-surface-gray px-1 rounded font-mono text-[11px]">-10<sup>9</sup> &lt;= target &lt;= 10<sup>9</sup></code></li>
              <li>Only one valid answer exists.</li>
          </ul>
      </div>
    `,
    code: {
      "Java": `class Solution {\n    public int[] twoSum(int[] nums, int target) {\n        // Write your Java code here\n        return new int[] {};\n    }\n}`,
      "C++": `class Solution {\npublic:\n    vector<int> twoSum(vector<int>& nums, int target) {\n        // Write your C++ code here\n        return {};\n    }\n};`,
      "Python": `class Solution:\n    def twoSum(self, nums: List[int], target: int) -> List[int]:\n        # Write your Python code here\n        pass`
    }
  },
  "Reverse Linked List": {
    difficulty: "Easy",
    difficultyClass: "bg-green-50 text-brand-green border border-green-150",
    description: `
      <p class="mb-4">Given the <code class="bg-surface-gray px-1.5 py-0.5 rounded border border-gray-200 font-mono text-xs">head</code> of a singly linked list, reverse the list, and return <em>its reversed list</em>.</p>
      <div class="grid md:grid-cols-2 gap-4 my-4">
          <div class="bg-surface-gray border border-gray-200 p-4 rounded-xl">
              <p class="font-bold text-xs text-text-main mb-2">Example 1:</p>
              <div class="font-mono text-xs text-text-muted space-y-1">
                  <p><span class="text-text-main font-semibold">Input:</span> head = [1,2,3,4,5]</p>
                  <p><span class="text-text-main font-semibold">Output:</span> [5,4,3,2,1]</p>
              </div>
          </div>
          <div class="bg-surface-gray border border-gray-200 p-4 rounded-xl">
              <p class="font-bold text-xs text-text-main mb-2">Example 2:</p>
              <div class="font-mono text-xs text-text-muted space-y-1">
                  <p><span class="text-text-main font-semibold">Input:</span> head = [1,2]</p>
                  <p><span class="text-text-main font-semibold">Output:</span> [2,1]</p>
              </div>
          </div>
      </div>
      <div class="space-y-2 mb-4">
          <h4 class="font-bold text-xs text-text-main">Constraints:</h4>
          <ul class="list-disc pl-5 text-xs text-text-muted space-y-1">
              <li>The number of nodes in the list is the range <code class="bg-surface-gray px-1 rounded font-mono text-[11px]">[0, 5000]</code>.</li>
              <li><code class="bg-surface-gray px-1 rounded font-mono text-[11px]">-5000 &lt;= Node.val &lt;= 5000</code></li>
          </ul>
      </div>
    `,
    code: {
      "Java": `/**\n * Definition for singly-linked list.\n * public class ListNode {\n *     int val;\n *     ListNode next;\n *     ListNode() {}\n *     ListNode(int val) { this.val = val; }\n *     ListNode(int val, ListNode next) { this.val = val; this.next = next; }\n * }\n */\nclass Solution {\n    public ListNode reverseList(ListNode head) {\n        // Write your Java code here\n        return null;\n    }\n}`,
      "C++": `/**\n * Definition for singly-linked list.\n * struct ListNode {\n *     int val;\n *     ListNode *next;\n *     ListNode() : val(0), next(nullptr) {}\n *     ListNode(x) : val(x), next(nullptr) {}\n *     ListNode(x, ListNode *next) : val(x), next(next) {}\n * };\n */\nclass Solution {\npublic:\n    ListNode* reverseList(ListNode* head) {\n        // Write your C++ code here\n        return nullptr;\n    }\n};`,
      "Python": `# Definition for singly-linked list.\n# class ListNode:\n#     def __init__(self, val=0, next=None):\n#         self.val = val\n#         self.next = next\nclass Solution:\n    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        # Write your Python code here\n        pass`
    }
  },
  "Spring Context Hierarchy Solver": {
    difficulty: "Medium",
    difficultyClass: "bg-primary-light/50 text-primary border border-primary/20",
    description: `
      <p class="mb-4">Given a hierarchical relationship of Spring ApplicationContext names and their respective registered beans, resolve if a child context can correctly lookup a bean defined in its parent context or its own context, following standard hierarchical bean lookup rules.</p>
      <div class="grid md:grid-cols-2 gap-4 my-4">
          <div class="bg-surface-gray border border-gray-200 p-4 rounded-xl">
              <p class="font-bold text-xs text-text-main mb-2">Example 1:</p>
              <div class="font-mono text-xs text-text-muted space-y-1">
                  <p><span class="text-text-main font-semibold">Input:</span> contextParents = { "child": "parent" }, contextBeans = { "parent": ["userService"], "child": ["orderService"] }, lookupContext = "child", beanName = "userService"</p>
                  <p><span class="text-text-main font-semibold">Output:</span> true</p>
                  <p><span class="text-text-main font-semibold">Explanation:</span> The child context can find the "userService" bean because it is defined in its parent context.</p>
              </div>
          </div>
          <div class="bg-surface-gray border border-gray-200 p-4 rounded-xl">
              <p class="font-bold text-xs text-text-main mb-2">Example 2:</p>
              <div class="font-mono text-xs text-text-muted space-y-1">
                  <p><span class="text-text-main font-semibold">Input:</span> contextParents = { "child": "parent" }, contextBeans = { "parent": ["userService"], "child": ["orderService"] }, lookupContext = "parent", beanName = "orderService"</p>
                  <p><span class="text-text-main font-semibold">Output:</span> false</p>
                  <p><span class="text-text-main font-semibold">Explanation:</span> The parent context cannot see beans defined in the child context.</p>
              </div>
          </div>
      </div>
      <div class="space-y-2 mb-4">
          <h4 class="font-bold text-xs text-text-main">Constraints:</h4>
          <ul class="list-disc pl-5 text-xs text-text-muted space-y-1">
              <li>Lookups must trace parents recursively until the root context is reached.</li>
              <li>Context names and Bean names are case-sensitive.</li>
          </ul>
      </div>
    `,
    code: {
      "Java": `class Solution {\n    public boolean resolveBeanLookup(Map<String, String> contextParents, Map<String, List<String>> contextBeans, String lookupContext, String beanName) {\n        // Write your Java code here\n        return false;\n    }\n}`,
      "C++": `class Solution {\npublic:\n    bool resolveBeanLookup(unordered_map<string, string>& contextParents, unordered_map<string, vector<string>>& contextBeans, string lookupContext, string beanName) {\n        // Write your C++ code here\n        return false;\n    }\n};`,
      "Python": `class Solution:\n    def resolveBeanLookup(self, contextParents: Dict[str, str], contextBeans: Dict[str, List[str]], lookupContext: str, beanName: str) -> bool:\n        # Write your Python code here\n        return False`
    }
  }
};

export const StudentDashboard: React.FC = () => {
  const { user, refreshBalance } = useApp();
  const location = useLocation();
  const navigate = useNavigate();

  // Navigation states
  const [activeTab, setActiveTab] = useState<string>('dashboard');
  const [isWalletOpen, setIsWalletOpen] = useState<boolean>(false);
  const [dashboardStats, setDashboardStats] = useState<DashboardStatsResponse | null>(null);

  // Activity tracking
  const [activeDates, setActiveDates] = useState<string[]>([]);
  const [activityYear, setActivityYear] = useState<number>(2026);
  const [currentStreak, setCurrentStreak] = useState<number>(0);
  const [maxStreak, setMaxStreak] = useState<number>(0);

  // My Courses tab states
  const [myCourses, setMyCourses] = useState<CourseListItemResponse[]>([]);
  const [myCoursesFilter, setMyCoursesFilter] = useState<'all' | 'ongoing' | 'completed'>('all');

  // Submission Statistics states
  const [submissionStats, setSubmissionStats] = useState<SubmissionStatisticResponse | null>(null);

  // Contest History tab states
  const [contestFilter, setContestFilter] = useState<'all' | 'ongoing' | 'upcoming' | 'ended'>('all');

  // Course Player (Learning View) States
  const [playerCourseTitle, setPlayerCourseTitle] = useState<string>('Java Fundamentals to Advanced');
  const [playerCourseAuthor, setPlayerCourseAuthor] = useState<string>('Dr. Alan Turing • Java Level');
  const [playerCourseProgress, setPlayerCourseProgress] = useState<string>('65%');
  const [playerLectureTitle, setPlayerLectureTitle] = useState<string>('1.2 Setting up Environment');
  const [playerVideoThumbnail, setPlayerVideoThumbnail] = useState<string>('https://lh3.googleusercontent.com/aida-public/AB6AXuBgy50UMGsrfiNlaMOGS5hIFfEB9ALLj2hHwL19FjiPxHtPdmdzDshyKCd9cxUE55L1IPGibJJ8XxYWvIOtq6nCmPgaCFoPxxlN64_OwyPrZocxC4bEzFtpL_km1YmpuA-CN4fUVjD5gO2NI7mdCoim7_CAT7njSdYphWceJpEIiRp5PAaZrqeglhZ4z73HAhMVJI5rSTTAUK3BmjBzHCR2ivCNvmKAvTRSv0bZDvGjfSB2GENwq1duU8S0jsS3Bgtxt-P5YEUi6M8');
  
  const [playerActiveTab, setPlayerActiveTab] = useState<'overview' | 'qa' | 'exercises' | 'source-code' | 'quiz'>('overview');
  const [curriculumSections, setCurriculumSections] = useState<Record<string, boolean>>({
    sec1: true,
    sec2: false,
    sec3: false
  });

  // Exercises panel inside Course Player
  const [playerExercises, setPlayerExercises] = useState(initialExercises);
  const [currentProblemName, setCurrentProblemName] = useState<string | null>(null);
  const [solveLang, setSolveLang] = useState<string>('Java');
  const [solveCode, setSolveCode] = useState<string>('');
  const [solveResult, setSolveResult] = useState<{ status: string; statusClass: string; time: string; output: string } | null>(null);
  const [isSubmitting, setIsSubmitting] = useState<boolean>(false);
  const [editorToast, setEditorToast] = useState<{ message: string; type: 'success' | 'info' | 'error' } | null>(null);

  // Deposit Tab States
  const [depositAmount, setDepositAmount] = useState<string>('');

  const formatAmount = (val: string) => {
    const clean = val.replace(/\D/g, '');
    if (!clean) return '';
    return clean.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
  };

  const handleAmountChange = (val: string) => {
    setDepositAmount(formatAmount(val));
  };
  const [qrGenerated, setQrGenerated] = useState<boolean>(false);
  const [paymentStatus, setPaymentStatus] = useState<string>('');
  const [paymentDetails, setPaymentDetails] = useState<{transactionCode?: string, accountNumber: string, accountName: string, bin: string} | null>(null);
  const [paymentStatusClass, setPaymentStatusClass] = useState<string>('hidden');
  const [qrCodeUrl, setQrCodeUrl] = useState<string | null>(null);
  const [_checkoutUrl, setCheckoutUrl] = useState<string | null>(null);
  const [initialBalance, setInitialBalance] = useState<number | null>(null);
  const [showDepositToast, _setShowDepositToast] = useState<boolean>(false);

  // Wallet Transactions States
  const [walletTransactions, setWalletTransactions] = useState<any[]>([]);
  const [walletTxPage, setWalletTxPage] = useState<number>(0);
  const [walletTxTotalPages, setWalletTxTotalPages] = useState<number>(1);
  const [walletTxTotalElements, setWalletTxTotalElements] = useState<number>(0);
  const [isWalletTxLoading, setIsWalletTxLoading] = useState<boolean>(false);
  const [selectedTxType, setSelectedTxType] = useState<string>('');

  // Payment Transactions States
  const [paymentTransactions, setPaymentTransactions] = useState<any[]>([]);
  const [paymentTxPage, setPaymentTxPage] = useState<number>(0);
  const [paymentTxTotalPages, setPaymentTxTotalPages] = useState<number>(1);
  const [paymentTxTotalElements, setPaymentTxTotalElements] = useState<number>(0);
  const [isPaymentTxLoading, setIsPaymentTxLoading] = useState<boolean>(false);

  // Purchase History States
  const [purchaseHistory, setPurchaseHistory] = useState<PurchaseHistoryResponse[]>([]);
  const [purchaseHistoryPage, setPurchaseHistoryPage] = useState<number>(0);
  const [purchaseHistoryTotalPages, setPurchaseHistoryTotalPages] = useState<number>(1);
  const [purchaseHistoryTotalElements, setPurchaseHistoryTotalElements] = useState<number>(0);
  const [isPurchaseHistoryLoading, setIsPurchaseHistoryLoading] = useState<boolean>(false);

  const [txSubTab, setTxSubTab] = useState<'internal' | 'banking'>('internal');

  const [isTxTypeDropdownOpen, setIsTxTypeDropdownOpen] = useState(false);
  const txTypeDropdownRef = useRef<HTMLDivElement>(null);

  useEffect(() => {
    function handleClickOutside(event: MouseEvent) {
      if (txTypeDropdownRef.current && !txTypeDropdownRef.current.contains(event.target as Node)) {
        setIsTxTypeDropdownOpen(false);
      }
    }
    document.addEventListener('mousedown', handleClickOutside);
    return () => {
      document.removeEventListener('mousedown', handleClickOutside);
    };
  }, []);

  // Fetch Wallet Transactions
  useEffect(() => {
    if (user && activeTab === 'wallet-transaction' && txSubTab === 'internal') {
      setIsWalletTxLoading(true);
      paymentService.getWalletTransactions(walletTxPage, 10, selectedTxType)
        .then(res => {
          setWalletTransactions(res.content || []);
          setWalletTxTotalPages(res.totalPages || 1);
          setWalletTxTotalElements(res.totalElements || 0);
          window.scrollTo({ top: 0, behavior: 'smooth' });
        })
        .catch(console.error)
        .finally(() => setIsWalletTxLoading(false));
    }
  }, [user, activeTab, walletTxPage, selectedTxType, txSubTab]);

  // Fetch Payment Transactions
  useEffect(() => {
    if (user && activeTab === 'wallet-transaction' && txSubTab === 'banking') {
      setIsPaymentTxLoading(true);
      paymentService.getPaymentTransactions(paymentTxPage, 10, '')
        .then(res => {
          setPaymentTransactions(res.content || []);
          setPaymentTxTotalPages(res.totalPages || 1);
          setPaymentTxTotalElements(res.totalElements || 0);
          window.scrollTo({ top: 0, behavior: 'smooth' });
        })
        .catch(console.error)
        .finally(() => setIsPaymentTxLoading(false));
    }
  }, [user, activeTab, paymentTxPage, txSubTab]);

  // Fetch Purchase History
  useEffect(() => {
    if (user && activeTab === 'purchase-history') {
      setIsPurchaseHistoryLoading(true);
      getPurchaseHistory(purchaseHistoryPage, 10)
        .then(res => {
          setPurchaseHistory(res.content || []);
          setPurchaseHistoryTotalPages(res.totalPages || 1);
          setPurchaseHistoryTotalElements(res.totalElements || 0);
          window.scrollTo({ top: 0, behavior: 'smooth' });
        })
        .catch(console.error)
        .finally(() => setIsPurchaseHistoryLoading(false));
    }
  }, [user, activeTab, purchaseHistoryPage]);

  // Fetch Payment Transactions
  useEffect(() => {
    if (user && activeTab === 'payment-transaction') {
      setIsPaymentTxLoading(true);
      paymentService.getPaymentTransactions(paymentTxPage, 10, '')
        .then(res => {
          setPaymentTransactions(res.content || []);
          setPaymentTxTotalPages(res.totalPages || 1);
          setPaymentTxTotalElements(res.totalElements || 0);
          window.scrollTo({ top: 0, behavior: 'smooth' });
        })
        .catch(console.error)
        .finally(() => setIsPaymentTxLoading(false));
    }
  }, [user, activeTab, paymentTxPage]);

  // Synchronize Tab with Location Hash
  useEffect(() => {
    const hash = location.hash.replace('#', '');
    const validTabs = ['dashboard', 'my-courses', 'learning-view', 'comments', 'wallet-transaction', 'deposit', 'payment-transaction', 'purchase-history', 'contest-history'];
    if (hash && validTabs.includes(hash)) {
      if (hash === 'payment-transaction') {
        setActiveTab('wallet-transaction');
        setTxSubTab('banking');
      } else {
        setActiveTab(hash);
        if (hash === 'wallet-transaction') {
          setTxSubTab('internal');
        }
      }
      if (['wallet-transaction', 'deposit', 'payment-transaction'].includes(hash)) {
        setIsWalletOpen(true);
        refreshBalance().catch(console.error);
      }
    } else {
      setActiveTab('dashboard');
    }
  }, [location.hash]);

  // Poll balance if QR code is displayed
  useEffect(() => {
    let intervalId: any;
    if (qrCodeUrl && initialBalance !== null) {
       intervalId = setInterval(async () => {
         try {
           const newBalance = await paymentService.getBalance();
           if (newBalance > initialBalance) {
             setPaymentStatus('Payment Successful! Your balance has been updated.');
             setPaymentStatusClass('bg-green-50 text-green-700 block border border-green-200');
             setQrCodeUrl(null);
             await refreshBalance(); // Sync context with new balance
             clearInterval(intervalId);
           }
         } catch(e) {}
       }, 3000);
    }
    return () => clearInterval(intervalId);
  }, [qrCodeUrl, initialBalance, refreshBalance]);

  // Handle PayOS Payment Redirect Callback (in case user opens web portal)
  useEffect(() => {
    const queryParams = new URLSearchParams(location.search);
    const code = queryParams.get('code');
    const cancel = queryParams.get('cancel');

    if (code) {
      setActiveTab('deposit');
      setIsWalletOpen(true);
      setQrGenerated(true);

      if (cancel === 'true' || code !== '00') {
        setPaymentStatus('Payment Cancelled or Failed.');
        setPaymentStatusClass('bg-error-container text-on-error-container block');
      } else {
        setPaymentStatus('Payment Successful: Transaction recorded!');
        setPaymentStatusClass('bg-green-50 text-green-700 block border border-green-200');
        refreshBalance(); // Fetch new balance from backend after deposit
      }

      // Clear query params and restore the hash to #deposit
      navigate('#deposit', { replace: true });
    }
  }, [location.search, navigate]);

  // Fetch Dashboard Stats
  useEffect(() => {
    if (user && activeTab === 'dashboard') {
      dashboardService.getDashboardStats()
        .then(setDashboardStats)
        .catch(console.error);
    }
  }, [user, activeTab]);

  // Fetch Activity Graph Data
  useEffect(() => {
    if (user && activeTab === 'dashboard') {
      dashboardService.getUserActivities(activityYear)
        .then((res) => {
           setActiveDates(res.activeDates || []);
           setMaxStreak(res.maxStreak || 0);
           setCurrentStreak(res.currentStreak || 0);
        })
        .catch(console.error);
    }
  }, [user, activeTab, activityYear]);

  // Fetch Enrolled Courses
  useEffect(() => {
    if (user && (activeTab === 'dashboard' || activeTab === 'my-courses')) {
      dashboardService.getEnrolledCourses()
        .then(setMyCourses)
        .catch(console.error);
    }
  }, [user, activeTab]);

  // Fetch Submission Statistics
  useEffect(() => {
    if (user && activeTab === 'dashboard') {
      dashboardService.getSubmissionStatistics()
        .then(data => {
          setSubmissionStats(data);
        })
        .catch(console.error);
    }
  }, [user, activeTab]);

  const ongoingScrollRef = useRef<HTMLDivElement>(null);
  const completedScrollRef = useRef<HTMLDivElement>(null);

  const scrollLeft = (ref: React.RefObject<HTMLDivElement | null>) => {
    if (ref.current) {
      ref.current.scrollBy({ left: -ref.current.offsetWidth, behavior: 'smooth' });
    }
  };

  const scrollRight = (ref: React.RefObject<HTMLDivElement | null>) => {
    if (ref.current) {
      ref.current.scrollBy({ left: ref.current.offsetWidth, behavior: 'smooth' });
    }
  };

  const renderLevelBadge = (price: number) => {
    if (price === 0) {
      return <span className="inline-block bg-[#fce2d3] text-primary font-bold text-[10px] px-2.5 py-1 rounded-lg">Beginner</span>;
    } else if (price < 250000) {
      return <span className="inline-block bg-blue-100 text-blue-800 font-bold text-[10px] px-2.5 py-1 rounded-lg">Intermediate</span>;
    } else {
      return <span className="inline-block bg-[#ba1a1a]/10 text-[#ba1a1a] font-bold text-[10px] px-2.5 py-1 rounded-lg">Advanced</span>;
    }
  };

  const renderCourseCard = (course: CourseListItemResponse, isCompleted: boolean) => {
    
    return (
      <article 
        key={course.id} 
        onClick={() => handleOpenCoursePlayer(course.title, course.instructorName, 'Java', `${isCompleted ? 100 : course.progressPercentage}%`, course.thumbnailUrl)}
        className="w-[calc(100vw-32px)] sm:w-[calc(50vw-24px)] lg:w-[calc(25%-18px)] flex-shrink-0 snap-start bg-surface rounded-2xl overflow-hidden border border-gray-200 hover:-translate-y-1.5 hover:shadow-xl transition-all duration-300 flex flex-col cursor-pointer group shadow-sm text-left"
      >
        <div className="h-[160px] relative overflow-hidden flex items-center justify-center bg-brand-blue">
          <img src={course.thumbnailUrl} alt={course.title} className="absolute inset-0 w-full h-full object-cover opacity-80 group-hover:scale-105 transition-transform duration-500" />
        </div>
        <div className="p-5 flex-1 flex flex-col gap-3">
          <div className="flex items-center justify-between">
            <span className="inline-block bg-surface-gray text-text-muted font-bold text-[10px] px-2.5 py-1 rounded-lg border border-gray-200">
              General
            </span>
            {renderLevelBadge(course.price)}
          </div>
          <div>
            <h3 className="font-display font-extrabold text-base text-brand-blue line-clamp-2 leading-snug group-hover:text-primary transition-colors min-h-[44px]">{course.title}</h3>
            <p className="text-xs text-text-muted mt-1">{course.instructorName}</p>
          </div>
          <div className="flex items-center gap-1.5 mt-1 flex-wrap">
            <span className="material-symbols-outlined text-yellow-400 text-[16px] icon-fill" style={{ fontVariationSettings: "'FILL' 1" }}>star</span>
            <span className="text-xs font-extrabold text-brand-blue">{course.averageRating}</span>
            <span className="text-[10px] text-text-muted">({(course.totalReviews || 0).toLocaleString('en-US')} reviews)</span>
            <span className="text-[10px] text-text-muted">•</span>
            <span className="inline-flex items-center gap-0.5 text-[10px] text-text-muted">
              <span className="material-symbols-outlined text-[12px] opacity-75">group</span>
              {(course.totalEnrolled || 0).toLocaleString('en-US')} enrolled
            </span>
          </div>
          
          <div className="mt-auto pt-3 border-t border-gray-100 flex flex-col gap-2">
            <div className="w-full flex flex-col gap-1 text-left">
              <div className="flex justify-between text-[10px] font-bold text-brand-blue">
                <span>Progress</span>
                <span className={isCompleted ? "text-brand-green" : "text-primary"}>{isCompleted ? "100%" : `${course.progressPercentage}%`}</span>
              </div>
              <div className="w-full bg-gray-200 h-1.5 rounded-full overflow-hidden">
                <div 
                  className={`${isCompleted ? 'bg-brand-green' : 'bg-primary'} h-full transition-all duration-300`}
                  style={{ width: `${isCompleted ? 100 : course.progressPercentage}%` }}
                ></div>
              </div>
            </div>
          </div>
        </div>
      </article>
    );
  };

  const handleTabChange = (tab: string) => {
    navigate(`#${tab}`);
  };

  // Activity Graph helper (12 months list)
  const isLeapYear = (year: number) => (year % 4 === 0 && year % 100 !== 0) || (year % 400 === 0);
  const months = [
    { name: 'Jan', days: 31 },
    { name: 'Feb', days: isLeapYear(activityYear) ? 29 : 28 },
    { name: 'Mar', days: 31 },
    { name: 'Apr', days: 30 },
    { name: 'May', days: 31 },
    { name: 'Jun', days: 30 },
    { name: 'Jul', days: 31 },
    { name: 'Aug', days: 31 },
    { name: 'Sep', days: 30 },
    { name: 'Oct', days: 31 },
    { name: 'Nov', days: 30 },
    { name: 'Dec', days: 31 }
  ];

  // Course player triggers
  const handleOpenCoursePlayer = (title: string, author: string, category: string, progress: string, thumbnail: string) => {
    setPlayerCourseTitle(title);
    setPlayerCourseAuthor(`${author} • ${category} Level`);
    setPlayerCourseProgress(progress);
    setPlayerVideoThumbnail(thumbnail);

    if (title.includes('Java')) {
      setPlayerLectureTitle('1.2 Setting up Environment');
    } else if (title.includes('Algorithms')) {
      setPlayerLectureTitle('2.1 Introduction to Time Complexity');
    } else {
      setPlayerLectureTitle('1.1 Introduction and Course Scope');
    }

    setPlayerActiveTab('overview');
    setCurrentProblemName(null);
    handleTabChange('learning-view');
  };

  // Exercises actions
  const handleStartSolveProblem = (problemName: string) => {
    const problem = problemData[problemName];
    if (!problem) return;

    setCurrentProblemName(problemName);
    setSolveLang('Java');
    setSolveCode(problem.code['Java']);
    setSolveResult(null);
  };

  const handleLanguageChange = (lang: string) => {
    setSolveLang(lang);
    if (currentProblemName && problemData[currentProblemName]) {
      setSolveCode(problemData[currentProblemName].code[lang]);
    }
  };

  const handleResetCode = () => {
    if (currentProblemName && problemData[currentProblemName]) {
      setSolveCode(problemData[currentProblemName].code[solveLang]);
    }
  };

  const triggerEditorToast = (message: string, type: 'success' | 'info' | 'error') => {
    setEditorToast({ message, type });
    if (type !== 'info') {
      setTimeout(() => setEditorToast(null), 3000);
    }
  };

  const handleCodeSubmit = () => {
    if (!currentProblemName) return;

    setIsSubmitting(true);
    setSolveResult(null);
    triggerEditorToast('Submitting solution...', 'info');

    setTimeout(() => {
      setIsSubmitting(false);
      const codeText = solveCode.trim();
      
      // Determine if default template is unchanged
      let isDefault = false;
      if (currentProblemName === "Two Sum") {
        isDefault = codeText.includes("return new int[] {};") || codeText.includes("return {};") || codeText.includes("pass") || codeText.includes("// Write your");
      } else if (currentProblemName === "Reverse Linked List") {
        isDefault = codeText.includes("return null;") || codeText.includes("return nullptr;") || codeText.includes("pass") || codeText.includes("// Write your");
      } else if (currentProblemName === "Spring Context Hierarchy Solver") {
        isDefault = codeText.includes("return false;") || codeText.includes("return False;") || codeText.includes("pass") || codeText.includes("// Write your");
      }

      if (isDefault) {
        setSolveResult({
          status: 'Wrong Answer',
          statusClass: 'bg-red-900/30 text-red-400 border border-red-800/30',
          time: 'Runtime: N/A',
          output: currentProblemName === "Two Sum" 
            ? "Output: []\nExpected: [0, 1]\n\nTest case 1/3 failed for Input: nums = [2,7,11,15], target = 9"
            : currentProblemName === "Reverse Linked List"
            ? "Output: null\nExpected: [5,4,3,2,1]\n\nTest case 1/3 failed for Input: head = [1,2,3,4,5]"
            : "Output: false\nExpected: true\n\nTest case 1/3 failed for Input: contextParents = {\"child\": \"parent\"}, lookupContext = \"child\", beanName = \"userService\""
        });
        triggerEditorToast("Wrong Answer: Some test cases failed.", "error");
      } else {
        setSolveResult({
          status: 'Accepted',
          statusClass: 'bg-green-900/30 text-green-400 border border-green-800/30',
          time: 'Runtime: 2 ms',
          output: 'All test cases passed (3/3).\nYour solution has been accepted and submitted successfully!'
        });
        
        // Mark as completed
        setPlayerExercises(prev => 
          prev.map(ex => ex.name === currentProblemName ? { ...ex, completed: true } : ex)
        );
        triggerEditorToast("Accepted! Solution submitted successfully.", "success");
      }
    }, 1200);
  };

  const getLineNumbersText = () => {
    const lineCount = solveCode.split('\n').length;
    const items = [];
    for (let i = 1; i <= Math.max(lineCount, 12); i++) {
      items.push(i);
    }
    return items.map(n => <div key={n}>{n}</div>);
  };

  // Deposit Actions
  const handleGenerateQR = async () => {
    const rawAmount = depositAmount.replace(/\./g, '');
    const amountNum = Number(rawAmount);
    if (!depositAmount || isNaN(amountNum) || amountNum < 2000) {
      alert("Vui lòng nhập số tiền hợp lệ. Số tiền nạp tối thiểu là 2.000 VND.");
      const input = document.getElementById('deposit-amount');
      if (input) input.focus();
      return;
    }

    try {
      setPaymentStatus('Generating payment link...');
      setPaymentStatusClass('bg-surface-variant text-surface-navy block');
      setQrGenerated(true); // Show a loading visual placeholder
      setInitialBalance(user?.walletBalance || 0);

      const result = await paymentService.createDepositLink(amountNum);
      
      if (result && result.qrCode) {
        setQrCodeUrl(`https://api.qrserver.com/v1/create-qr-code/?size=300x300&data=${encodeURIComponent(result.qrCode)}`);
        setCheckoutUrl(result.checkoutUrl);
        setPaymentDetails({ 
          transactionCode: result.transactionCode,
          accountNumber: result.accountNumber, 
          accountName: result.accountName, 
          bin: result.bin 
        });
        setPaymentStatus('PLEASE SCAN THE QR CODE USING YOUR BANKING APP');
        setPaymentStatusClass('bg-red-50 text-red-700 block border border-red-200');
      } else if (result && result.checkoutUrl) {
        // Fallback to redirect if qrCode is missing
        window.location.href = result.checkoutUrl;
      }
    } catch (error) {
      console.error("Payment error:", error);
      setPaymentStatus('Failed to connect to payment gateway.');
      setPaymentStatusClass('bg-error-container text-on-error-container block');
    }
  };

  const handleCancelQR = async () => {
    if (paymentDetails?.transactionCode) {
      try {
        await paymentService.cancelPayment(paymentDetails.transactionCode);
      } catch (error) {
        console.error("Failed to cancel payment via API", error);
      }
    }
    setQrGenerated(false);
    setQrCodeUrl(null);
    setCheckoutUrl(null);
    setPaymentStatus('');
    setPaymentStatusClass('hidden');
    setPaymentDetails(null);
    setDepositAmount('');
  };

  const handleCopyAccountNumber = () => {
    const acctNum = paymentDetails?.accountNumber;
    if (acctNum) {
      navigator.clipboard.writeText(acctNum)
        .then(() => {
          _setShowDepositToast(true);
          setTimeout(() => _setShowDepositToast(false), 2000);
        })
        .catch(console.error);
    }
  };


  // Restrict Dashboard Access if not logged in
  if (!user) {
    return (
      <div className="bg-surface rounded-2xl border border-gray-150 p-12 text-center shadow-sm max-w-md mx-auto my-12">
        <span className="material-symbols-outlined text-red-500 text-5xl mb-4">lock</span>
        <h3 className="font-display font-black text-xl text-brand-blue mb-2">Access Denied</h3>
        <p className="font-body text-sm text-text-muted mb-6">Please log in to view your learning dashboard.</p>
        <Link to="/login" className="bg-primary hover:bg-primary-hover text-white font-bold text-sm px-6 py-3 rounded-xl transition-all shadow-md">
          Sign In
        </Link>
      </div>
    );
  }

  return (
    <div className="flex-grow w-full flex flex-row relative bg-[#f0f4f9]/40 text-text-main font-body min-h-screen">
      
      {/* Left Sidebar Navbar */}
      <aside className="w-16 md:w-64 shrink-0 sticky top-16 self-start flex flex-col gap-2 py-6 px-3 bg-surface border-r border-gray-100 h-[calc(100vh-4rem)] overflow-y-auto z-20">
        <button
          onClick={() => handleTabChange('dashboard')}
          className={`flex items-center gap-3 px-4 py-3 rounded-lg transition-colors font-medium text-left ${
            activeTab === 'dashboard'
              ? 'bg-primary-light/20 text-primary font-bold border border-primary/10'
              : 'text-text-main hover:bg-surface-gray hover:text-primary'
          }`}
        >
          <span className="material-symbols-outlined">dashboard</span>
          <span className="sidebar-text hidden md:inline">Dashboard</span>
        </button>

        <button
          onClick={() => handleTabChange('my-courses')}
          className={`flex items-center gap-3 px-4 py-3 rounded-lg transition-colors font-medium text-left ${
            activeTab === 'my-courses' || activeTab === 'learning-view'
              ? 'bg-primary-light/20 text-primary font-bold border border-primary/10'
              : 'text-text-main hover:bg-surface-gray hover:text-primary'
          }`}
        >
          <span className="material-symbols-outlined">library_books</span>
          <span className="sidebar-text hidden md:inline">My Courses</span>
        </button>

        <button
          onClick={() => handleTabChange('contest-history')}
          className={`flex items-center gap-3 px-4 py-3 rounded-lg transition-colors font-medium text-left ${
            activeTab === 'contest-history'
              ? 'bg-primary-light/20 text-primary font-bold border border-primary/10'
              : 'text-text-main hover:bg-surface-gray hover:text-primary'
          }`}
        >
          <span className="material-symbols-outlined">emoji_events</span>
          <span className="sidebar-text hidden md:inline">Contest History</span>
        </button>

        <a href="#" className="flex items-center gap-3 px-4 py-3 rounded-lg text-text-main hover:bg-surface-gray hover:text-primary transition-colors font-medium">
          <span className="material-symbols-outlined">menu_book</span>
          <span className="sidebar-text hidden md:inline">Learning Journal</span>
        </a>

        <button
          onClick={() => handleTabChange('comments')}
          className={`flex items-center gap-3 px-4 py-3 rounded-lg transition-colors font-medium text-left ${
            activeTab === 'comments'
              ? 'bg-primary-light/20 text-primary font-bold border border-primary/10'
              : 'text-text-main hover:bg-surface-gray hover:text-primary'
          }`}
        >
          <span className="material-symbols-outlined">forum</span>
          <span className="sidebar-text hidden md:inline">Comments</span>
        </button>

        {/* Collapsible My Wallet Menu */}
        <div className="flex flex-col gap-1">
          <button 
            onClick={() => {
              setIsWalletOpen(!isWalletOpen);
              handleTabChange('wallet-transaction');
            }} 
            className="w-full flex items-center justify-between px-4 py-3 rounded-lg text-text-main hover:bg-surface-gray hover:text-primary transition-colors font-medium text-left"
          >
            <span className="flex items-center gap-3">
              <span className="material-symbols-outlined">account_balance_wallet</span>
              <span className="sidebar-text hidden md:inline">My Wallet</span>
            </span>
            <span className={`material-symbols-outlined hidden md:inline transition-transform duration-200 ${isWalletOpen ? 'rotate-180' : ''}`}>
              keyboard_arrow_down
            </span>
          </button>
          
          <div className={`${isWalletOpen ? 'flex' : 'hidden'} flex-col gap-1 pl-0 md:pl-8 overflow-hidden transition-all duration-200`}>
            <button 
              onClick={() => handleTabChange('wallet-transaction')} 
              className={`flex items-center gap-2 px-3 py-2 text-sm rounded-lg font-medium text-left transition-colors ${
                activeTab === 'wallet-transaction'
                  ? 'text-primary font-bold bg-primary-light/20 border border-primary/10'
                  : 'text-text-muted hover:text-primary hover:bg-surface-gray/50'
              }`}
            >
              <span className="material-symbols-outlined text-[18px]">receipt_long</span>
              <span className="sidebar-text hidden md:inline">Transaction History</span>
            </button>
            <button 
              onClick={() => handleTabChange('deposit')} 
              className={`flex items-center gap-2 px-3 py-2 text-sm rounded-lg font-medium text-left transition-colors ${
                activeTab === 'deposit'
                  ? 'text-primary font-bold bg-primary-light/20 border border-primary/10'
                  : 'text-text-muted hover:text-primary hover:bg-surface-gray/50'
              }`}
            >
              <span className="material-symbols-outlined text-[18px]">download</span>
              <span className="sidebar-text hidden md:inline">Deposit</span>
            </button>
          </div>
        </div>

        <button 
          onClick={() => handleTabChange('purchase-history')} 
          className={`flex items-center gap-3 px-4 py-3 rounded-lg transition-colors font-medium text-left ${
            activeTab === 'purchase-history'
              ? 'bg-primary-light/20 text-primary font-bold border border-primary/10'
              : 'text-text-main hover:bg-surface-gray hover:text-primary'
          }`}
        >
          <span className="material-symbols-outlined">shopping_bag</span>
          <span className="sidebar-text hidden md:inline">Purchase History</span>
        </button>
      </aside>

      {/* Main Content Dashboard Layout Container */}
      <div className="relative z-10 flex-1 flex flex-col gap-10 min-w-0 px-4 md:px-8 lg:px-12 py-8">
        
        {/* Tab: Dashboard */}
        {activeTab === 'dashboard' && (
          <div className="flex flex-col gap-10 min-w-0 animate-fade-in">
            {/* Welcome & Stats */}
            <section>
              <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 mb-6">
                <div>
                  {/* Decorative Badge */}
                  <div className="inline-flex items-center gap-1.5 bg-[#fce2d3] border border-primary/20 px-3 py-1 rounded-full text-primary font-bold text-xs uppercase tracking-wider mb-3 shadow-sm relative z-10">
                    <span className="material-symbols-outlined text-xs icon-fill" style={{ fontVariationSettings: "'FILL' 1" }}>dashboard</span> Dashboard Arena
                  </div>
                  <h1 className="text-3xl md:text-4xl font-display font-black leading-tight relative z-10 flex items-center gap-3 flex-wrap">
                    <span className="bg-gradient-to-r from-[#12284C] to-[#1c3d73] bg-clip-text text-transparent">Welcome back,</span> 
                    <div className="flex items-center gap-3">
                      <img 
                        src={user.avatar} 
                        alt="User Avatar" 
                        className="w-10 h-10 md:w-12 md:h-12 rounded-full border-2 border-primary/20 shadow-sm object-cover"
                        onError={(e) => {
                          (e.target as HTMLImageElement).src = 'https://ui-avatars.com/api/?name=User&background=12284C&color=fff';
                        }}
                      />
                      <span className="bg-gradient-to-r from-primary to-primary-hover bg-clip-text text-transparent"> {user.name}! 👋</span>
                    </div>
                  </h1>
                  <p className="text-text-muted mt-1">Here is your learning progress and recent activities.</p>
                </div>
                {/* User Balance Display */}
                <div className="bg-surface py-2 px-4 rounded-xl shadow-[0_2px_12px_rgba(26,54,93,0.06)] flex items-center gap-3 min-w-[200px] shrink-0 border border-gray-100 relative z-10">
                  <div className="w-9 h-9 rounded-full bg-green-50 flex items-center justify-center text-brand-green">
                    <span className="material-symbols-outlined text-xl" style={{ fontVariationSettings: "'FILL' 1" }}>account_balance_wallet</span>
                  </div>
                  <div>
                    <p className="text-[11px] text-text-muted uppercase tracking-wider font-semibold">Current Balance</p>
                    <p className="text-[17px] font-bold text-green-600 leading-none mt-0.5 font-mono">
                      {dashboardStats?.currentBalance !== undefined 
                        ? new Intl.NumberFormat('vi-VN', { style: 'currency', currency: 'VND' }).format(dashboardStats.currentBalance)
                        : '0 ₫'}
                    </p>
                  </div>
                </div>
              </div>

              {/* Stats & Activity Row */}
              <div className="w-full grid grid-cols-1 lg:grid-cols-12 gap-5">
                {/* Left side: 4 Stats Cards (2x2 Grid) */}
                <div className="xl:col-span-3 lg:col-span-4 grid grid-cols-2 gap-2 w-full">
                  {/* Card 1: Enrolled */}
                  <div className="bg-surface rounded-xl p-2 lg:p-2.5 flex flex-col justify-between gap-1 border border-gray-100 hover:shadow-md transition-shadow shadow-[0_4px_20px_rgba(18,40,76,0.05)]">
                    <div className="flex items-center justify-between gap-1">
                      <span className="material-symbols-outlined text-primary bg-primary-light/50 p-1 rounded-md text-base">library_books</span>
                      <span className="text-[10px] md:text-xs font-semibold text-text-muted">Enrolled</span>
                    </div>
                    <div className="flex flex-col">
                      <span className="text-base lg:text-lg font-bold text-text-main">
                        {dashboardStats?.completedCourses || 0} <span className="text-[10px] font-medium text-text-muted">/ {dashboardStats?.enrolled || 0}</span>
                      </span>
                    </div>
                  </div>

                  {/* Card 2: Solved */}
                  <div className="bg-surface rounded-xl p-2 lg:p-2.5 flex flex-col justify-between gap-1 border border-gray-100 hover:shadow-md transition-shadow shadow-[0_4px_20px_rgba(18,40,76,0.05)]">
                    <div className="flex items-center justify-between gap-1">
                      <span className="material-symbols-outlined text-brand-green bg-green-50 p-1 rounded-md text-base">task_alt</span>
                      <span className="text-[10px] md:text-xs font-semibold text-text-muted">Solved</span>
                    </div>
                    <div className="flex flex-col">
                      <span className="text-base lg:text-lg font-bold text-text-main">
                        {dashboardStats?.solvedPractice || 0} <span className="text-[10px] font-medium text-text-muted">/ {dashboardStats?.totalPracticeProblems || 0}</span>
                      </span>
                    </div>
                  </div>

                  {/* Card 3: Ranking */}
                  <div className="bg-surface rounded-xl p-2 lg:p-2.5 flex flex-col justify-between gap-1 border border-gray-100 hover:shadow-md transition-shadow shadow-[0_4px_20px_rgba(18,40,76,0.05)]">
                    <div className="flex items-center justify-between gap-1">
                      <span className="material-symbols-outlined text-brand-blue-light bg-slate-100 p-1 rounded-md text-base">emoji_events</span>
                      <span className="text-[10px] md:text-xs font-semibold text-text-muted">Ranking</span>
                    </div>
                    <div className="flex flex-col">
                      <span className="text-base lg:text-lg font-bold text-text-main">
                        #{dashboardStats?.ranking || 0} <span className="text-[10px] font-medium text-text-muted">/ {dashboardStats?.totalUsers || 0}</span>
                      </span>
                    </div>
                  </div>

                  {/* Card 4: Streak */}
                  <div className="bg-surface rounded-xl p-2 lg:p-2.5 flex flex-col justify-between gap-1 border border-gray-100 hover:shadow-md transition-shadow shadow-[0_4px_20px_rgba(18,40,76,0.05)]">
                    <div className="flex items-center justify-between gap-1">
                      <span className="material-symbols-outlined text-red-500 bg-red-50 p-1 rounded-md text-base">local_fire_department</span>
                      <span className="text-[10px] md:text-xs font-semibold text-text-muted">Streak</span>
                    </div>
                    <div className="flex flex-col">
                      <span className="text-base lg:text-lg font-bold text-text-main">{currentStreak || 0} <span className="text-[10px] font-medium text-text-muted">Days</span></span>
                    </div>
                  </div>
                </div>

                {/* Right side: Your Activity */}
                <div className="xl:col-span-9 lg:col-span-8 w-full">
                  <div className="bg-surface rounded-xl p-2.5 lg:p-3 flex flex-col justify-center gap-2 border border-gray-100 h-full shadow-[0_4px_20px_rgba(18,40,76,0.05)]">
                    <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center mb-2 gap-2">
                      <div className="flex items-center gap-1.5">
                        <h3 className="text-sm lg:text-base font-bold text-text-main">Your Activity</h3>
                        <span className="material-symbols-outlined text-text-muted text-[13px] cursor-help" title="Learn more about activity">info</span>
                      </div>
                      <div className="flex items-center gap-3 text-[10px] lg:text-xs font-medium text-text-muted">
                        <span>Current streak: <strong className="text-text-main">{currentStreak}</strong></span>
                        <span>Max streak: <strong className="text-text-main">{maxStreak}</strong></span>
                        <select 
                          value={activityYear}
                          onChange={(e) => setActivityYear(Number(e.target.value))}
                          className="bg-surface-gray border-none text-text-main rounded-md py-0.5 pl-2 pr-6 text-[10px] lg:text-xs focus:ring-primary outline-none cursor-pointer"
                        >
                          <option value={new Date().getFullYear()}>Current</option>
                          <option value="2026">2026</option>
                          <option value="2025">2025</option>
                          <option value="2024">2024</option>
                        </select>
                      </div>
                    </div>
                    {/* Activity Graph */}
                    <div className="w-full">
                      <div className="w-full flex justify-between gap-[2px] sm:gap-[4px] md:gap-[6px]">
                        {months.map((month, mIdx) => {
                          const blocks = [];
                          for (let i = 0; i < 35; i++) {
                            if (i < month.days) {
                              const monthStr = String(mIdx + 1).padStart(2, '0');
                              const dayStr = String(i + 1).padStart(2, '0');
                              const dateString = `${activityYear}-${monthStr}-${dayStr}`;
                              const isActive = activeDates.includes(dateString);
                              
                              blocks.push({ key: i, active: isActive, visible: true, date: dateString });
                            } else {
                              blocks.push({ key: i, active: false, visible: false });
                            }
                          }
                          return (
                            <div key={month.name} className="flex flex-col gap-0.5 flex-1 min-w-0">
                              <span className="text-[8px] md:text-[9px] lg:text-[10px] text-text-muted font-semibold mb-0.5 text-center">{month.name}</span>
                              <div className="grid grid-cols-5 grid-flow-col gap-[1px] md:gap-[2px] w-full" style={{ gridTemplateRows: 'repeat(7, minmax(0, 1fr))' }}>
                                {blocks.map((block) => (
                                  block.visible ? (
                                    <div
                                      key={block.key}
                                      className={`w-full aspect-square rounded-[1px] ${block.active ? 'bg-primary' : 'bg-gray-100'}`}
                                      title={block.active ? `Active on ${block.date}` : `No activity on ${block.date}`}
                                    />
                                  ) : (
                                    <div key={block.key} className="w-full aspect-square opacity-0" />
                                  )
                                ))}
                              </div>
                            </div>
                          );
                        })}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </section>

            {/* Submission Statistics */}
            <section className="flex flex-col gap-6 w-full">
              <div className="flex justify-between items-center border-b border-gray-200 pb-2">
                <h2 className="text-xl font-bold text-text-main flex items-center gap-2">
                  <span className="material-symbols-outlined text-primary">bar_chart</span>
                  Practice Submission Statistics
                </h2>
                <Link className="text-sm font-semibold text-primary hover:text-primary-hover transition-colors flex items-center gap-1" to="/problems">
                  Go to Practice <span className="material-symbols-outlined text-[16px]">arrow_forward</span>
                </Link>
              </div>
              
              <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-5 gap-4">
                <div className="bg-surface rounded-xl border border-gray-100 p-5 shadow-sm flex flex-col gap-2 hover:shadow-md transition-shadow relative overflow-hidden group">
                  <div className="absolute top-0 right-0 w-24 h-24 bg-primary/5 rounded-bl-full -mr-4 -mt-4 transition-transform group-hover:scale-110"></div>
                  <div className="text-text-muted text-sm font-semibold flex items-center gap-1.5 z-10">
                    <span className="material-symbols-outlined text-[18px]">publish</span>
                    Total Submissions
                  </div>
                  <div className="text-3xl font-display font-black text-brand-blue z-10">
                    {submissionStats?.totalSubmissions || 0}
                  </div>
                </div>
                
                <div className="bg-surface rounded-xl border border-green-100 p-5 shadow-sm flex flex-col gap-2 hover:shadow-md transition-shadow relative overflow-hidden group">
                  <div className="absolute top-0 right-0 w-24 h-24 bg-green-500/5 rounded-bl-full -mr-4 -mt-4 transition-transform group-hover:scale-110"></div>
                  <div className="text-green-600 text-sm font-semibold flex items-center gap-1.5 z-10">
                    <span className="material-symbols-outlined text-[18px]">check_circle</span>
                    Accepted
                  </div>
                  <div className="flex items-baseline gap-2 z-10">
                    <div className="text-3xl font-display font-black text-green-600">
                      {submissionStats?.totalAccepted || 0}
                    </div>
                    {submissionStats && submissionStats.totalSubmissions > 0 && (
                      <div className="text-xs font-bold px-2 py-0.5 rounded-md bg-green-100 text-green-700">
                        {((submissionStats.totalAccepted * 100) / submissionStats.totalSubmissions).toFixed(1)}% Rate
                      </div>
                    )}
                  </div>
                </div>

                <div className="bg-surface rounded-xl border border-red-100 p-5 shadow-sm flex flex-col gap-2 hover:shadow-md transition-shadow relative overflow-hidden group">
                  <div className="absolute top-0 right-0 w-24 h-24 bg-red-500/5 rounded-bl-full -mr-4 -mt-4 transition-transform group-hover:scale-110"></div>
                  <div className="text-red-500 text-sm font-semibold flex items-center gap-1.5 z-10">
                    <span className="material-symbols-outlined text-[18px]">cancel</span>
                    Wrong Answer
                  </div>
                  <div className="flex items-baseline gap-2 z-10">
                    <div className="text-3xl font-display font-black text-red-500">
                      {submissionStats?.totalWrongAnswer || 0}
                    </div>
                    {submissionStats && submissionStats.totalSubmissions > 0 && (
                      <div className="text-xs font-bold px-2 py-0.5 rounded-md bg-red-100 text-red-700">
                        {((submissionStats.totalWrongAnswer * 100) / submissionStats.totalSubmissions).toFixed(1)}% Rate
                      </div>
                    )}
                  </div>
                </div>

                <div className="bg-surface rounded-xl border border-orange-100 p-5 shadow-sm flex flex-col gap-2 hover:shadow-md transition-shadow relative overflow-hidden group">
                  <div className="absolute top-0 right-0 w-24 h-24 bg-orange-500/5 rounded-bl-full -mr-4 -mt-4 transition-transform group-hover:scale-110"></div>
                  <div className="text-orange-500 text-sm font-semibold flex items-center gap-1.5 z-10">
                    <span className="material-symbols-outlined text-[18px]">timer</span>
                    Time Limit (TLE)
                  </div>
                  <div className="flex items-baseline gap-2 z-10">
                    <div className="text-3xl font-display font-black text-orange-500">
                      {submissionStats?.totalTimeLimitExceeded || 0}
                    </div>
                    {submissionStats && submissionStats.totalSubmissions > 0 && (
                      <div className="text-xs font-bold px-2 py-0.5 rounded-md bg-orange-100 text-orange-700">
                        {((submissionStats.totalTimeLimitExceeded * 100) / submissionStats.totalSubmissions).toFixed(1)}% Rate
                      </div>
                    )}
                  </div>
                </div>

                <div className="bg-surface rounded-xl border border-purple-100 p-5 shadow-sm flex flex-col gap-2 hover:shadow-md transition-shadow relative overflow-hidden group">
                  <div className="absolute top-0 right-0 w-24 h-24 bg-purple-500/5 rounded-bl-full -mr-4 -mt-4 transition-transform group-hover:scale-110"></div>
                  <div className="text-purple-600 text-sm font-semibold flex items-center gap-1.5 z-10">
                    <span className="material-symbols-outlined text-[18px]">memory</span>
                    Memory Limit (MLE)
                  </div>
                  <div className="flex items-baseline gap-2 z-10">
                    <div className="text-3xl font-display font-black text-purple-600">
                      {submissionStats?.totalMemoryLimitExceeded || 0}
                    </div>
                    {submissionStats && submissionStats.totalSubmissions > 0 && (
                      <div className="text-xs font-bold px-2 py-0.5 rounded-md bg-purple-100 text-purple-700">
                        {((submissionStats.totalMemoryLimitExceeded * 100) / submissionStats.totalSubmissions).toFixed(1)}% Rate
                      </div>
                    )}
                  </div>
                </div>
              </div>
            </section>

            {/* Ongoing Courses */}
            <section className="relative">
              <div className="flex items-center justify-between mb-4">
                <h2 className="text-xl font-bold text-text-main flex items-center gap-2">
                  <span className="material-symbols-outlined text-primary">play_circle</span>
                  Ongoing Courses
                </h2>
                <div className="flex items-center gap-2">
                  <button onClick={() => scrollLeft(ongoingScrollRef)} className="w-8 h-8 rounded-full border border-gray-200 flex items-center justify-center text-text-muted hover:text-primary hover:border-primary transition-colors bg-surface shadow-sm">
                    <span className="material-symbols-outlined text-[18px]">chevron_left</span>
                  </button>
                  <button onClick={() => scrollRight(ongoingScrollRef)} className="w-8 h-8 rounded-full border border-gray-200 flex items-center justify-center text-text-muted hover:text-primary hover:border-primary transition-colors bg-surface shadow-sm">
                    <span className="material-symbols-outlined text-[18px]">chevron_right</span>
                  </button>
                  <button onClick={() => { setMyCoursesFilter('ongoing'); handleTabChange('my-courses'); }} className="text-sm text-primary font-semibold hover:underline bg-transparent border-none cursor-pointer ml-2">View All</button>
                </div>
              </div>
              <div ref={ongoingScrollRef} className="flex gap-6 overflow-x-auto snap-x snap-mandatory hide-scrollbar pb-4 -mx-4 px-4 sm:mx-0 sm:px-0">
                {myCourses.filter(c => c.progressPercentage < 100).map(course => renderCourseCard(course, false))}
              </div>
            </section>

            {/* Completed Courses */}
            <section className="relative">
              <div className="flex items-center justify-between mb-4">
                <h2 className="text-xl font-bold text-text-main flex items-center gap-2">
                  <span className="material-symbols-outlined text-brand-green">check_circle</span>
                  Completed Courses
                </h2>
                <div className="flex items-center gap-2">
                  <button onClick={() => scrollLeft(completedScrollRef)} className="w-8 h-8 rounded-full border border-gray-200 flex items-center justify-center text-text-muted hover:text-primary hover:border-primary transition-colors bg-surface shadow-sm">
                    <span className="material-symbols-outlined text-[18px]">chevron_left</span>
                  </button>
                  <button onClick={() => scrollRight(completedScrollRef)} className="w-8 h-8 rounded-full border border-gray-200 flex items-center justify-center text-text-muted hover:text-primary hover:border-primary transition-colors bg-surface shadow-sm">
                    <span className="material-symbols-outlined text-[18px]">chevron_right</span>
                  </button>
                </div>
              </div>
              <div ref={completedScrollRef} className="flex gap-6 overflow-x-auto snap-x snap-mandatory hide-scrollbar pb-4 -mx-4 px-4 sm:mx-0 sm:px-0">
                {myCourses.filter(c => c.progressPercentage === 100).map(course => renderCourseCard(course, true))}
              </div>
            </section>

            {/* Participated Contests */}
            <section className="pb-10">
              <div className="flex items-center justify-between mb-4">
                <h2 className="text-xl font-bold text-text-main flex items-center gap-2">
                  <span className="material-symbols-outlined text-brand-blue-light">emoji_events</span>
                  Participated Contests
                </h2>
                <button onClick={() => handleTabChange('contest-history')} className="text-sm text-primary font-semibold hover:underline bg-transparent border-none cursor-pointer">View History</button>
              </div>
              <div className="bg-surface rounded-xl border border-gray-100 shadow-sm overflow-hidden">
                <div className="overflow-x-auto">
                  <table className="w-full text-left whitespace-nowrap border-collapse">
                    <thead className="bg-surface-gray border-b border-gray-100 text-text-muted text-xs font-bold uppercase">
                      <tr>
                        <th className="px-6 py-4">Contest Name</th>
                        <th className="px-6 py-4">Date</th>
                        <th className="px-6 py-4">Rank</th>
                        <th className="px-6 py-4 text-right">Score</th>
                      </tr>
                    </thead>
                    <tbody className="divide-y divide-gray-100 text-sm font-medium text-text-main">
                      {participatedContests.map((c, idx) => (
                        <tr key={idx} className="hover:bg-surface-gray/50 transition-colors">
                          <td className="px-6 py-4 flex items-center gap-2">
                            <span className="material-symbols-outlined text-primary text-[18px]">
                              {idx === 0 ? 'trophy' : 'workspace_premium'}
                            </span>
                            {c.name}
                          </td>
                          <td className="px-6 py-4 text-text-muted">{c.date}</td>
                          <td className="px-6 py-4">
                            <span className={`px-3 py-1 rounded-md text-sm font-bold ${
                              idx === 0 ? 'bg-primary-light/30 text-primary' : 
                              idx === 1 ? 'bg-brand-blue/10 text-brand-blue' : 'bg-gray-100 text-text-main'
                            }`}>
                              {c.rank}
                            </span>
                          </td>
                          <td className="px-6 py-4 text-right">{c.score.split(' ')[0]} <span className="text-text-muted">pts</span></td>
                        </tr>
                      ))}
                    </tbody>
                  </table>
                </div>
              </div>
            </section>
          </div>
        )}

        {/* Tab: My Courses */}
        {activeTab === 'my-courses' && (
          <div className="flex flex-col gap-8 animate-fade-in">
            <div className="mb-2">
              <div className="inline-flex items-center gap-1.5 bg-[#fce2d3] border border-primary/20 px-3 py-1 rounded-full text-primary font-bold text-xs uppercase tracking-wider mb-3 shadow-sm">
                <span className="material-symbols-outlined text-xs icon-fill" style={{ fontVariationSettings: "'FILL' 1" }}>library_books</span> My Courses
              </div>
              <h1 className="text-3xl md:text-4xl font-display font-black leading-tight">
                <span className="bg-gradient-to-r from-[#12284C] to-[#1c3d73] bg-clip-text text-transparent">Registered</span> 
                <span className="bg-gradient-to-r from-primary to-primary-hover bg-clip-text text-transparent"> Courses</span>
              </h1>
              <p className="text-text-muted mt-1">Track your progress, manage your certifications, and continue learning.</p>
            </div>

            {/* Filter Tabs */}
            <div className="flex border-b border-gray-200 gap-2 overflow-x-auto hide-scrollbar pb-px">
              <button 
                onClick={() => setMyCoursesFilter('all')}
                className={`px-5 py-3 text-sm font-semibold border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${
                  myCoursesFilter === 'all' ? 'border-primary text-primary' : 'border-transparent text-text-muted hover:text-primary'
                }`}
              >
                <span className="material-symbols-outlined text-[20px]">menu_book</span>
                All Courses
                <span className={`text-xs px-2 py-0.5 rounded-full font-bold ${
                  myCoursesFilter === 'all' ? 'bg-primary/10 text-primary' : 'bg-gray-100 text-text-muted'
                }`}>{myCourses.length}</span>
              </button>
              <button 
                onClick={() => setMyCoursesFilter('ongoing')}
                className={`px-5 py-3 text-sm font-semibold border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${
                  myCoursesFilter === 'ongoing' ? 'border-primary text-primary' : 'border-transparent text-text-muted hover:text-primary'
                }`}
              >
                <span className="material-symbols-outlined text-[20px] text-primary">play_circle</span>
                In Progress
                <span className={`text-xs px-2 py-0.5 rounded-full font-bold ${
                  myCoursesFilter === 'ongoing' ? 'bg-primary/10 text-primary' : 'bg-gray-100 text-text-muted'
                }`}>{myCourses.filter(c => c.progressPercentage < 100).length}</span>
              </button>
              <button 
                onClick={() => setMyCoursesFilter('completed')}
                className={`px-5 py-3 text-sm font-semibold border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${
                  myCoursesFilter === 'completed' ? 'border-primary text-primary' : 'border-transparent text-text-muted hover:text-primary'
                }`}
              >
                <span className="material-symbols-outlined text-[20px] text-brand-green">check_circle</span>
                Completed
                <span className={`text-xs px-2 py-0.5 rounded-full font-bold ${
                  myCoursesFilter === 'completed' ? 'bg-primary/10 text-primary' : 'bg-gray-100 text-text-muted'
                }`}>{myCourses.filter(c => c.progressPercentage === 100).length}</span>
              </button>
            </div>

            {/* Courses Grid */}
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
              {myCourses
                .filter(course => 
                  myCoursesFilter === 'all' || 
                  (myCoursesFilter === 'ongoing' && course.progressPercentage < 100) || 
                  (myCoursesFilter === 'completed' && course.progressPercentage === 100)
                )
                .map(course => (
                  <article 
                    key={course.id} 
                    onClick={() => handleOpenCoursePlayer(course.title, course.instructorName, 'Java', `${course.progressPercentage}%`, course.thumbnailUrl)}
                    className="bg-surface rounded-xl overflow-hidden border border-gray-200 hover:-translate-y-1.5 hover:shadow-xl transition-all duration-300 flex flex-col cursor-pointer group relative"
                  >
                    <div className="absolute top-3 left-3 z-10 flex gap-1.5">
                      <span className="bg-brand-blue/80 backdrop-blur-sm text-white text-[10px] font-bold px-2 py-0.5 rounded-md">Course</span>
                    </div>
                    <div className="h-[140px] bg-brand-blue relative overflow-hidden flex items-center justify-center">
                      <img src={course.thumbnailUrl} alt={course.title} className="absolute inset-0 w-full h-full object-cover opacity-80 group-hover:scale-105 transition-transform duration-500" />
                    </div>
                    <div className="p-4 flex-1 flex flex-col">
                      <h3 className="font-bold text-text-main text-base line-clamp-2 mb-1 group-hover:text-primary transition-colors leading-tight">{course.title}</h3>
                      <p className="text-xs text-text-muted mb-2 flex items-center gap-1">
                        <span className="material-symbols-outlined text-[14px]">person</span> {course.instructorName}
                      </p>
                      <div className="flex items-center gap-1.5 mb-4">
                        <div className="flex items-center">
                          <span className="material-symbols-outlined text-yellow-400 text-[16px] icon-fill" style={{ fontVariationSettings: "'FILL' 1" }}>star</span>
                          <span className="text-xs font-bold text-text-main ml-0.5">{course.averageRating}</span>
                        </div>
                        <span className="text-gray-300">•</span>
                        <span className="text-[10px] text-text-muted">{course.totalReviews} ratings</span>
                      </div>
                      
                      <div className="mt-auto pt-3 border-t border-gray-50 space-y-1.5">
                        {course.progressPercentage === 100 ? (
                          <>
                            <div className="flex justify-between items-center text-[11px] font-semibold">
                              <span className="text-brand-green flex items-center gap-1 font-bold">
                                <span className="material-symbols-outlined text-[14px]">check_circle</span>
                                100% Completed
                              </span>
                            </div>
                            <div className="w-full bg-gray-100 rounded-full h-1.5">
                              <div className="bg-brand-green h-1.5 rounded-full" style={{ width: '100%' }}></div>
                            </div>
                          </>
                        ) : (
                          <>
                            <div className="flex justify-between items-center text-[11px] font-semibold">
                              <span className="text-text-muted flex items-center gap-1">
                                <span className="material-symbols-outlined text-[14px] text-primary">pending</span>
                                In Progress
                              </span>
                              <span className="text-primary font-bold">{course.progressPercentage}%</span>
                            </div>
                            <div className="w-full bg-gray-100 rounded-full h-1.5">
                              <div className="bg-primary h-1.5 rounded-full" style={{ width: `${course.progressPercentage}%` }}></div>
                            </div>
                          </>
                        )}
                      </div>
                    </div>
                  </article>
                ))}
            </div>
          </div>
        )}

        {/* Tab: Learning View (Course Player) */}
        {activeTab === 'learning-view' && (
          <div className="flex flex-col gap-6 animate-fade-in">
            {/* Back to Courses */}
            <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 border-b border-gray-200 pb-4">
              <div className="flex flex-col gap-1">
                <button 
                  onClick={() => handleTabChange('my-courses')} 
                  className="flex items-center gap-1.5 text-sm text-primary font-bold hover:underline mb-2 self-start bg-transparent border-none cursor-pointer"
                >
                  <span className="material-symbols-outlined text-[18px]">arrow_back</span>
                  Back to My Courses
                </button>
                <h1 className="text-2xl md:text-3xl font-display font-black text-brand-blue leading-tight">{playerCourseTitle}</h1>
                <p className="text-sm text-text-muted">{playerCourseAuthor}</p>
              </div>
              {/* Dynamic Progress Badge */}
              <div className="bg-surface py-2 px-4 rounded-xl shadow-[0_2px_12px_rgba(26,54,93,0.04)] border border-gray-100 flex items-center gap-3 shrink-0">
                <span className="material-symbols-outlined text-primary bg-primary-light/40 p-1.5 rounded-lg text-lg">donut_large</span>
                <div>
                  <p className="text-[10px] text-text-muted uppercase tracking-wider font-semibold">Your Progress</p>
                  <p className="text-[15px] font-extrabold text-primary leading-none mt-0.5">{playerCourseProgress} Completed</p>
                </div>
              </div>
            </div>

            {/* Two Column Layout: Main Player vs Curriculum Sidebar */}
            <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
              
              {/* Left Column (Video Player + Tabs) */}
              <div className="lg:col-span-9 flex flex-col gap-6">
                
                {/* Video Player Area */}
                <div className="w-full bg-[#0a0f1d] rounded-2xl overflow-hidden shadow-lg border border-gray-800 aspect-video relative flex items-center justify-center group" style={{ maxHeight: '520px' }}>
                  <img src={playerVideoThumbnail} alt="Thumbnail" className="absolute inset-0 w-full h-full object-cover opacity-30" />
                  
                  {/* Overlay Play Button */}
                  <div className="absolute inset-0 flex flex-col items-center justify-center z-10 bg-black/40 group-hover:bg-black/50 transition-colors">
                    <button className="bg-primary hover:bg-primary-hover hover:scale-105 text-white rounded-full p-5 shadow-2xl transition-all duration-300 flex items-center justify-center">
                      <span className="material-symbols-outlined text-[48px] icon-fill" style={{ fontVariationSettings: "'FILL' 1" }}>play_arrow</span>
                    </button>
                    <p className="text-white/80 text-sm font-semibold mt-3 bg-black/40 backdrop-blur-md px-3 py-1 rounded-full border border-white/10">{playerLectureTitle}</p>
                  </div>

                  {/* Video Controls Mockup */}
                  <div className="absolute bottom-0 inset-x-0 bg-gradient-to-t from-black/90 to-transparent p-4 flex items-center gap-4 z-20">
                    <span className="material-symbols-outlined text-white hover:text-primary cursor-pointer transition-colors" style={{ fontVariationSettings: "'FILL' 1" }}>play_arrow</span>
                    <div className="flex-grow h-1 bg-white/20 rounded-full cursor-pointer relative group-timeline">
                      <div className="absolute left-0 top-0 h-full bg-primary rounded-full" style={{ width: '30%' }}></div>
                      <div className="absolute w-3 h-3 bg-white rounded-full top-1/2 -translate-y-1/2 shadow opacity-0 group-hover:opacity-100 transition-opacity" style={{ left: '30%' }}></div>
                    </div>
                    <span className="font-mono text-xs text-white/90">03:45 / 12:45</span>
                    <span className="material-symbols-outlined text-white hover:text-primary cursor-pointer transition-colors">volume_up</span>
                    <span className="material-symbols-outlined text-white hover:text-primary cursor-pointer transition-colors">fullscreen</span>
                  </div>
                </div>

                {/* Sub-tabs Navigation */}
                <div className="flex border-b border-gray-200 gap-6 overflow-x-auto hide-scrollbar pb-px">
                  <button 
                    onClick={() => { setPlayerActiveTab('overview'); setCurrentProblemName(null); }}
                    className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${
                      playerActiveTab === 'overview' ? 'border-primary text-primary' : 'border-transparent text-text-muted hover:text-primary'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[18px]">info</span> Theory Content
                  </button>
                  <button 
                    onClick={() => { setPlayerActiveTab('qa'); setCurrentProblemName(null); }}
                    className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${
                      playerActiveTab === 'qa' ? 'border-primary text-primary' : 'border-transparent text-text-muted hover:text-primary'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[18px]">forum</span> Q&A
                  </button>
                  <button 
                    onClick={() => { setPlayerActiveTab('exercises'); setCurrentProblemName(null); }}
                    className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${
                      playerActiveTab === 'exercises' ? 'border-primary text-primary' : 'border-transparent text-text-muted hover:text-primary'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[18px]">terminal</span> Exercises
                  </button>
                  <button 
                    onClick={() => { setPlayerActiveTab('source-code'); setCurrentProblemName(null); }}
                    className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${
                      playerActiveTab === 'source-code' ? 'border-primary text-primary' : 'border-transparent text-text-muted hover:text-primary'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[18px]">code</span> Source Code
                  </button>
                  <button 
                    onClick={() => { setPlayerActiveTab('quiz'); setCurrentProblemName(null); }}
                    className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${
                      playerActiveTab === 'quiz' ? 'border-primary text-primary' : 'border-transparent text-text-muted hover:text-primary'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[18px]">quiz</span> Quiz
                  </button>
                </div>

                {/* Sub-tab Panels */}
                <div className="bg-surface rounded-2xl border border-gray-200 p-6 min-h-[300px]">
                  
                  {/* Overview */}
                  {playerActiveTab === 'overview' && (
                    <div className="space-y-4 animate-fade-in">
                      <h2 className="text-xl font-bold text-text-main">{playerLectureTitle}</h2>
                      <div className="prose max-w-none text-sm text-text-muted space-y-4 leading-relaxed">
                        <p>In this lesson, we will cover the essential tools required to build robust Spring Boot applications. A properly configured environment is crucial for avoiding initial setup hurdles and ensuring a smooth development experience.</p>
                        <h3 className="font-bold text-text-main text-base mt-6">Prerequisites</h3>
                        <ul className="list-disc pl-5 space-y-2">
                          <li>Java Development Kit (JDK) 17 or higher installed on your path.</li>
                          <li>An Integrated Development Environment (IDE) such as IntelliJ IDEA (recommended), Eclipse, or VS Code.</li>
                          <li>Maven or Gradle build tools (we will focus on Maven).</li>
                        </ul>
                        <div className="bg-primary-light/35 p-5 rounded-xl border border-primary/10 flex gap-4 mt-6">
                          <span className="material-symbols-outlined text-primary text-[24px]">lightbulb</span>
                          <div>
                            <p className="font-bold text-text-main text-sm">Pro Tip</p>
                            <p className="text-xs text-text-muted mt-1 leading-normal">Make sure your JAVA_HOME environment variable is correctly set to your JDK installation path, and verified using "java -version" in your terminal.</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  )}

                  {/* Q&A */}
                  {playerActiveTab === 'qa' && (
                    <div className="animate-fade-in">
                      <h2 className="text-lg font-bold text-text-main mb-4">Questions & Answers in this lesson</h2>
                      <div className="flex gap-3 mb-6">
                        <div className="relative flex-1">
                          <span className="material-symbols-outlined absolute left-3 top-1/2 -translate-y-1/2 text-text-muted text-[20px]">search</span>
                          <input className="w-full bg-surface-gray border border-gray-200 rounded-xl pl-10 pr-4 py-2 text-sm focus:outline-none focus:border-primary transition-colors text-text-main" placeholder="Search questions..." type="text" />
                        </div>
                        <button className="bg-primary hover:bg-primary-hover text-white px-5 py-2 rounded-xl font-bold text-xs transition-colors whitespace-nowrap">Ask a new question</button>
                      </div>
                      
                      <div className="space-y-6">
                        <div className="border-b border-gray-100 pb-4 last:border-0 last:pb-0">
                          <div className="flex gap-3">
                            <div className="w-9 h-9 rounded-full bg-slate-100 border border-gray-200 flex items-center justify-center shrink-0">
                              <span className="material-symbols-outlined text-text-muted text-[18px]">person</span>
                            </div>
                            <div className="flex-1">
                              <div className="flex items-center gap-2 mb-1 flex-wrap">
                                <span className="font-bold text-sm text-text-main">Alex Chen</span>
                                <span className="text-[10px] text-text-muted">2 hours ago</span>
                              </div>
                              <p className="text-sm font-semibold text-text-main mb-1">Error initializing Spring Boot application template</p>
                              <p className="text-xs text-text-muted leading-relaxed line-clamp-2">Getting 'java: error: invalid source release: 17' when compiling. What could be wrong with my JDK configurations?</p>
                              <div className="flex items-center gap-3 mt-2 text-[11px] text-text-muted font-semibold">
                                <span className="flex items-center gap-1"><span className="material-symbols-outlined text-brand-green text-[14px]">thumb_up</span> 4 likes</span>
                                <span className="flex items-center gap-1"><span className="material-symbols-outlined text-primary text-[14px]">comment</span> 2 replies</span>
                              </div>
                            </div>
                          </div>
                        </div>

                        <div className="border-b border-gray-100 pb-4 last:border-0 last:pb-0">
                          <div className="flex gap-3">
                            <div className="w-9 h-9 rounded-full bg-slate-100 border border-gray-200 flex items-center justify-center shrink-0">
                              <span className="material-symbols-outlined text-text-muted text-[18px]">person</span>
                            </div>
                            <div className="flex-1">
                              <div className="flex items-center gap-2 mb-1 flex-wrap">
                                <span className="font-bold text-sm text-text-main">Sarah Jenkins</span>
                                <span className="text-[10px] text-text-muted">1 day ago</span>
                              </div>
                              <p className="text-sm font-semibold text-text-main mb-1">IntelliJ Ultimate vs Community</p>
                              <p className="text-xs text-text-muted leading-relaxed line-clamp-2">Is IntelliJ Ultimate strictly necessary for Spring Boot projects, or is Community Edition sufficient for general microservice development?</p>
                              <div className="flex items-center gap-3 mt-2 text-[11px] text-text-muted font-semibold">
                                <span className="flex items-center gap-1"><span className="material-symbols-outlined text-[14px]">thumb_up</span> 0 likes</span>
                                <span className="flex items-center gap-1"><span className="material-symbols-outlined text-[14px]">comment</span> 1 reply</span>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  )}

                  {/* Exercises */}
                  {playerActiveTab === 'exercises' && (
                    <div className="animate-fade-in">
                      {currentProblemName === null ? (
                        <div>
                          <h2 className="text-lg font-bold text-text-main mb-1">Practice Problems</h2>
                          <p className="text-xs text-text-muted mb-4">Solve these algorithmic challenges to solidify your understanding of the lesson.</p>
                          <div className="overflow-x-auto border border-gray-200 rounded-xl">
                            <table className="w-full text-left border-collapse">
                              <thead>
                                <tr className="bg-surface-gray border-b border-gray-200">
                                  <th className="p-3 text-[11px] font-bold uppercase tracking-wider text-text-muted text-center w-16">Status</th>
                                  <th className="p-3 text-[11px] font-bold uppercase tracking-wider text-text-muted">Title</th>
                                  <th className="p-3 text-[11px] font-bold uppercase tracking-wider text-text-muted w-24">Difficulty</th>
                                  <th className="p-3 text-[11px] font-bold uppercase tracking-wider text-text-muted text-right w-28">Submissions</th>
                                  <th className="p-3 text-[11px] font-bold uppercase tracking-wider text-text-muted text-center w-24">Action</th>
                                </tr>
                              </thead>
                              <tbody className="divide-y divide-gray-150">
                                {playerExercises.map((ex, idx) => (
                                  <tr key={idx} className="hover:bg-surface-gray/50 transition-colors">
                                    <td className="p-3 text-center">
                                      {ex.completed ? (
                                        <span className="material-symbols-outlined text-brand-green text-[18px] icon-fill" style={{ fontVariationSettings: "'FILL' 1" }}>check_circle</span>
                                      ) : (
                                        <span className="material-symbols-outlined text-text-muted text-[18px]">radio_button_unchecked</span>
                                      )}
                                    </td>
                                    <td className="p-3 text-sm font-semibold text-text-main">{ex.name}</td>
                                    <td className="p-3"><span className={`border px-2 py-0.5 rounded text-[10px] font-bold ${ex.difficultyClass}`}>{ex.difficulty}</span></td>
                                    <td className="p-3 text-right text-xs text-text-muted font-mono">{ex.submissions}</td>
                                    <td className="p-3 text-center">
                                      <button 
                                        onClick={() => handleStartSolveProblem(ex.name)}
                                        className="border border-gray-200 hover:border-primary hover:text-primary bg-white text-text-main px-3 py-1 rounded font-bold text-xs transition-all"
                                      >
                                        Solve
                                      </button>
                                    </td>
                                  </tr>
                                ))}
                              </tbody>
                            </table>
                          </div>
                        </div>
                      ) : (
                        // Problem Solver View
                        <div className="flex flex-col gap-6 animate-fade-in">
                          <div className="flex items-center justify-between border-b border-gray-200 pb-4">
                            <button 
                              onClick={() => setCurrentProblemName(null)}
                              className="flex items-center gap-1.5 text-xs font-bold text-text-muted hover:text-primary transition-all bg-transparent border-none cursor-pointer"
                            >
                              <span className="material-symbols-outlined text-[16px]">arrow_back</span> Back to Problems
                            </button>
                            <div className="flex items-center gap-3">
                              <h3 className="text-base font-bold text-text-main">{currentProblemName}</h3>
                              <span className={`px-2 py-0.5 rounded text-[10px] font-bold ${problemData[currentProblemName]?.difficultyClass}`}>
                                {problemData[currentProblemName]?.difficulty}
                              </span>
                            </div>
                          </div>

                          {/* Description Panel */}
                          <div 
                            className="prose max-w-none text-sm text-text-muted leading-relaxed"
                            dangerouslySetInnerHTML={{ __html: problemData[currentProblemName]?.description }}
                          />

                          {/* Dark Editor Canvas */}
                          <div className="border border-gray-200 rounded-xl overflow-hidden bg-[#1e1e1e] shadow-lg flex flex-col">
                            {/* Editor Header Actions */}
                            <div className="bg-[#252526] border-b border-[#333333] px-4 py-2 flex justify-between items-center">
                              <select 
                                value={solveLang}
                                onChange={(e) => handleLanguageChange(e.target.value)}
                                className="bg-[#2d2d2d] text-white border-none rounded px-3 py-1 text-sm focus:ring-0 cursor-pointer outline-none"
                              >
                                <option value="Java">Java</option>
                                <option value="C++">C++</option>
                                <option value="Python">Python</option>
                              </select>
                              <button 
                                onClick={handleResetCode}
                                className="text-[#cccccc] hover:text-white transition-colors bg-transparent border-none cursor-pointer" 
                                title="Reset Template"
                              >
                                <span className="material-symbols-outlined text-xl">restart_alt</span>
                              </button>
                            </div>
                            
                            {/* Code Area */}
                            <div className="flex font-mono text-sm leading-6 p-4">
                              {/* Numbers */}
                              <div className="w-10 text-[#858585] text-right pr-4 select-none">
                                {getLineNumbersText()}
                              </div>
                              {/* Textarea */}
                              <div className="flex-1">
                                <textarea 
                                  value={solveCode}
                                  onChange={(e) => setSolveCode(e.target.value)}
                                  className="w-full bg-transparent text-[#d4d4d4] border-none p-0 focus:ring-0 resize-none font-mono text-sm leading-6 focus:outline-none focus:ring-offset-0 focus:border-transparent outline-none shadow-none"
                                  rows={12}
                                  spellCheck={false}
                                />
                              </div>
                            </div>

                            {/* Result Panel */}
                            {solveResult && (
                              <div className="border-t border-[#333333] px-4 py-3 bg-[#181818] font-mono text-xs">
                                <div className="flex items-center gap-3 mb-2">
                                  <span className={`px-2 py-0.5 rounded font-bold text-[10px] ${solveResult.statusClass}`}>
                                    {solveResult.status}
                                  </span>
                                  <span className="text-[#858585] text-[10px]">{solveResult.time}</span>
                                </div>
                                <pre className="text-[#d4d4d4] whitespace-pre-wrap leading-relaxed font-mono text-xs">
                                  {solveResult.output}
                                </pre>
                              </div>
                            )}

                            {/* Submit Actions Bar */}
                            <div className="bg-[#252526] border-t border-[#333333] px-4 py-3 flex justify-end gap-3">
                              <button 
                                onClick={handleCodeSubmit}
                                disabled={isSubmitting}
                                className="bg-primary hover:bg-primary-hover text-white px-8 py-2 rounded-lg font-bold text-sm transition-all shadow-md disabled:opacity-50"
                              >
                                {isSubmitting ? 'Submitting...' : 'Submit'}
                              </button>
                            </div>
                          </div>

                          {/* Feedback Toast inside panel */}
                          {editorToast && (
                            <div className={`fixed bottom-6 right-6 text-white px-4 py-3 rounded-lg shadow-lg flex items-center gap-2 z-50 animate-fade-in ${
                              editorToast.type === 'success' ? 'bg-brand-green border border-brand-green/20' : 
                              editorToast.type === 'info' ? 'bg-brand-blue border border-brand-blue/20' : 'bg-red-600 border border-red-700/20'
                            }`}>
                              <span className="material-symbols-outlined text-[20px]">
                                {editorToast.type === 'success' ? 'check_circle' : editorToast.type === 'info' ? 'hourglass_empty' : 'error'}
                              </span>
                              <span className="text-sm font-semibold">{editorToast.message}</span>
                            </div>
                          )}
                        </div>
                      )}
                    </div>
                  )}

                  {/* Source Code */}
                  {playerActiveTab === 'source-code' && (
                    <div className="animate-fade-in">
                      <h2 className="text-lg font-bold text-text-main mb-1">Lesson Resources</h2>
                      <p className="text-xs text-text-muted mb-4">Download the starting templates and completed source code for this lesson.</p>
                      <div className="flex flex-col gap-3">
                        <div className="bg-surface border border-gray-200 p-4 rounded-xl flex items-center justify-between gap-4 hover:border-primary transition-all group">
                          <div className="flex items-center gap-3">
                            <span className="material-symbols-outlined text-brand-blue text-[28px] bg-slate-100 p-2 rounded-lg">folder_zip</span>
                            <div>
                              <p className="font-bold text-sm text-text-main">lesson-1-2-starter-template.zip</p>
                              <p className="text-[11px] text-text-muted">15.2 MB</p>
                            </div>
                          </div>
                          <button className="bg-primary hover:bg-primary-hover text-white px-4 py-2 rounded-lg font-bold text-xs flex items-center gap-1.5 transition-all">
                            <span className="material-symbols-outlined text-[16px]">download</span> Download
                          </button>
                        </div>
                        <div className="bg-surface border border-gray-200 p-4 rounded-xl flex items-center justify-between gap-4 hover:border-primary transition-all group">
                          <div className="flex items-center gap-3">
                            <span className="material-symbols-outlined text-brand-blue text-[28px] bg-slate-100 p-2 rounded-lg">description</span>
                            <div>
                              <p className="font-bold text-sm text-text-main">database-schema-init.sql</p>
                              <p className="text-[11px] text-text-muted">2.1 MB</p>
                            </div>
                          </div>
                          <button className="bg-primary hover:bg-primary-hover text-white px-4 py-2 rounded-lg font-bold text-xs flex items-center gap-1.5 transition-all">
                            <span className="material-symbols-outlined text-[16px]">download</span> Download
                          </button>
                        </div>
                      </div>
                    </div>
                  )}

                  {/* Quiz */}
                  {playerActiveTab === 'quiz' && (
                    <div className="animate-fade-in">
                      <div className="flex justify-between items-center mb-4 border-b border-gray-100 pb-3">
                        <h2 className="text-lg font-bold text-text-main">Knowledge Check</h2>
                        <span className="bg-slate-100 text-text-muted border border-gray-200 px-3 py-1 rounded-full text-xs font-bold">Question 1 of 5</span>
                      </div>
                      <div className="bg-surface p-2">
                        <h3 className="text-base font-bold text-text-main mb-4 leading-snug">In Spring Boot, which annotation is used to map HTTP GET requests onto specific handler methods?</h3>
                        <div className="space-y-3">
                          <label className="flex items-center gap-3 p-3.5 border border-gray-200 rounded-xl hover:bg-surface-gray hover:border-primary cursor-pointer transition-all">
                            <input className="w-4.5 h-4.5 text-primary border-gray-300 focus:ring-primary" name="quiz1" type="radio" />
                            <span className="text-sm font-medium text-text-main">@PostMapping</span>
                          </label>
                          <label className="flex items-center gap-3 p-3.5 border border-gray-200 rounded-xl hover:bg-surface-gray hover:border-primary cursor-pointer transition-all">
                            <input className="w-4.5 h-4.5 text-primary border-gray-300 focus:ring-primary" name="quiz1" type="radio" />
                            <span className="text-sm font-medium text-text-main">@GetMapping</span>
                          </label>
                          <label className="flex items-center gap-3 p-3.5 border border-gray-200 rounded-xl hover:bg-surface-gray hover:border-primary cursor-pointer transition-all">
                            <input className="w-4.5 h-4.5 text-primary border-gray-300 focus:ring-primary" name="quiz1" type="radio" />
                            <span className="text-sm font-medium text-text-main">@RequestMapping</span>
                          </label>
                          <label className="flex items-center gap-3 p-3.5 border border-gray-200 rounded-xl hover:bg-surface-gray hover:border-primary cursor-pointer transition-all">
                            <input className="w-4.5 h-4.5 text-primary border-gray-300 focus:ring-primary" name="quiz1" type="radio" />
                            <span className="text-sm font-medium text-text-main">@PathMapping</span>
                          </label>
                        </div>
                        <div className="border-t border-gray-100 mt-6 pt-4 flex justify-between items-center">
                          <a className="text-text-muted hover:text-primary font-bold text-xs transition-colors" href="#">Skip Question</a>
                          <button className="bg-primary hover:bg-primary-hover text-white px-5 py-2 rounded-xl font-bold text-xs transition-colors">Submit Answer</button>
                        </div>
                      </div>
                    </div>
                  )}

                </div>
              </div>

              {/* Right Column (Curriculum Sidebar) */}
              <div className="lg:col-span-3 bg-surface rounded-2xl border border-gray-200 shadow-sm overflow-hidden flex flex-col sticky top-24 max-h-[calc(100vh-8rem)]">
                <div className="p-4 bg-slate-50 border-b border-gray-200 flex flex-col gap-2">
                  <h2 className="font-bold text-sm text-text-main flex items-center gap-2">
                    <span className="material-symbols-outlined text-primary text-[18px]">toc</span>
                    Curriculum
                  </h2>
                  <div className="w-full bg-gray-200 h-2 rounded-full mt-1.5 relative overflow-hidden">
                    <div className="bg-primary h-2 rounded-full transition-all duration-500" style={{ width: playerCourseProgress }}></div>
                  </div>
                  <p className="text-[11px] font-semibold text-text-muted text-right">{playerCourseProgress.toLowerCase()} completed</p>
                </div>

                <div className="flex-grow overflow-y-auto divide-y divide-gray-150 max-h-[450px]">
                  {/* Section 1 */}
                  <div className="flex flex-col">
                    <button 
                      onClick={() => setCurriculumSections({ ...curriculumSections, sec1: !curriculumSections.sec1 })}
                      className="w-full flex items-center justify-between p-3.5 hover:bg-surface-gray transition-colors text-left bg-white border-none cursor-pointer"
                    >
                      <span className="font-semibold text-xs text-text-main line-clamp-1">1. Course Introduction</span>
                      <span className={`material-symbols-outlined text-text-muted text-[18px] transition-transform duration-200 ${curriculumSections.sec1 ? 'rotate-180' : ''}`}>expand_more</span>
                    </button>
                    
                    <div className={`${curriculumSections.sec1 ? 'flex' : 'hidden'} flex-col bg-slate-50`}>
                      <div className="flex items-center gap-2.5 px-4 py-2.5 hover:bg-slate-100 cursor-pointer border-l-2 border-transparent transition-colors group">
                        <span className="material-symbols-outlined text-brand-green text-[16px] icon-fill" style={{ fontVariationSettings: "'FILL' 1" }}>check_circle</span>
                        <span className="text-xs text-text-main group-hover:text-primary transition-colors flex-1 truncate font-medium">1.1 What is Spring Boot?</span>
                        <span className="text-[10px] text-text-muted font-mono">05:20</span>
                      </div>
                      <div className="flex items-center gap-2.5 px-4 py-2.5 bg-primary-light/30 border-l-2 border-primary cursor-pointer transition-colors group">
                        <span className="material-symbols-outlined text-primary text-[16px]">radio_button_unchecked</span>
                        <span className="text-xs text-primary font-bold flex-1 truncate">1.2 Setting up Environment</span>
                        <span className="text-[10px] text-primary/80 font-mono">12:45</span>
                      </div>
                    </div>
                  </div>

                  {/* Section 2 */}
                  <div className="flex flex-col">
                    <button 
                      onClick={() => setCurriculumSections({ ...curriculumSections, sec2: !curriculumSections.sec2 })}
                      className="w-full flex items-center justify-between p-3.5 hover:bg-surface-gray transition-colors text-left bg-white border-none cursor-pointer"
                    >
                      <span className="font-semibold text-xs text-text-main line-clamp-1">2. REST API & Controller</span>
                      <span className={`material-symbols-outlined text-text-muted text-[18px] transition-transform duration-200 ${curriculumSections.sec2 ? 'rotate-180' : ''}`}>expand_more</span>
                    </button>
                    
                    <div className={`${curriculumSections.sec2 ? 'flex' : 'hidden'} flex-col bg-slate-50`}>
                      <div className="flex items-center gap-2.5 px-4 py-2.5 hover:bg-slate-100 cursor-pointer border-l-2 border-transparent transition-colors group">
                        <span className="material-symbols-outlined text-text-muted text-[16px]">radio_button_unchecked</span>
                        <span className="text-xs text-text-main group-hover:text-primary transition-colors flex-1 truncate">2.1 REST Controller Basics</span>
                        <span className="text-[10px] text-text-muted font-mono">15:30</span>
                      </div>
                      <div className="flex items-center gap-2.5 px-4 py-2.5 hover:bg-slate-100 cursor-pointer border-l-2 border-transparent transition-colors group">
                        <span className="material-symbols-outlined text-text-muted text-[16px]">radio_button_unchecked</span>
                        <span className="text-xs text-text-main group-hover:text-primary transition-colors flex-1 truncate">2.2 Request/Response</span>
                        <span className="text-[10px] text-text-muted font-mono">18:45</span>
                      </div>
                    </div>
                  </div>

                  {/* Section 3 */}
                  <div className="flex flex-col">
                    <button 
                      onClick={() => setCurriculumSections({ ...curriculumSections, sec3: !curriculumSections.sec3 })}
                      className="w-full flex items-center justify-between p-3.5 hover:bg-surface-gray transition-colors text-left bg-white border-none cursor-pointer"
                    >
                      <span className="font-semibold text-xs text-text-main line-clamp-1">3. Spring Data JPA</span>
                      <span className={`material-symbols-outlined text-text-muted text-[18px] transition-transform duration-200 ${curriculumSections.sec3 ? 'rotate-180' : ''}`}>expand_more</span>
                    </button>
                    
                    <div className={`${curriculumSections.sec3 ? 'flex' : 'hidden'} flex-col bg-slate-50`}>
                      <div className="flex items-center gap-2.5 px-4 py-2.5 hover:bg-slate-100 cursor-pointer border-l-2 border-transparent transition-colors group">
                        <span className="material-symbols-outlined text-text-muted text-[16px]">radio_button_unchecked</span>
                        <span className="text-xs text-text-main group-hover:text-primary transition-colors flex-1 truncate">3.1 Entities & Repositories</span>
                        <span className="text-[10px] text-text-muted font-mono">22:15</span>
                      </div>
                      <div className="flex items-center gap-2.5 px-4 py-2.5 hover:bg-slate-100 cursor-pointer border-l-2 border-transparent transition-colors group">
                        <span className="material-symbols-outlined text-text-muted text-[16px]">radio_button_unchecked</span>
                        <span className="text-xs text-text-main group-hover:text-primary transition-colors flex-1 truncate">3.2 JPA Query Methods</span>
                        <span className="text-[10px] text-text-muted font-mono">16:40</span>
                      </div>
                    </div>
                  </div>

                </div>
              </div>

            </div>
          </div>
        )}

        {/* Tab: Comments */}
        {activeTab === 'comments' && (
          <div className="flex flex-col gap-8 animate-fade-in">
            <div className="mb-2">
              <div className="inline-flex items-center gap-1.5 bg-[#fce2d3] border border-primary/20 px-3 py-1 rounded-full text-primary font-bold text-xs uppercase tracking-wider mb-3 shadow-sm">
                <span className="material-symbols-outlined text-xs icon-fill" style={{ fontVariationSettings: "'FILL' 1" }}>forum</span> My Comments
              </div>
              <h1 className="text-3xl md:text-4xl font-display font-black leading-tight">
                <span className="bg-gradient-to-r from-[#12284C] to-[#1c3d73] bg-clip-text text-transparent">My</span>
                <span className="bg-gradient-to-r from-primary to-primary-hover bg-clip-text text-transparent"> Comments 💬</span>
              </h1>
              <p className="text-text-muted mt-1">Track all your Q&amp;A interactions across courses and problem discussions.</p>
            </div>

            {/* Course Comments */}
            <section>
              <div className="mb-4">
                <h2 className="text-xl font-bold text-text-main flex items-center gap-2">
                  <span className="material-symbols-outlined text-primary">school</span>
                  Course Q&amp;A Comments
                </h2>
              </div>
              
              <div className="bg-surface rounded-xl border border-gray-100 shadow-sm overflow-hidden">
                <div className="overflow-x-auto">
                  <table className="w-full text-left border-collapse min-w-[700px]">
                    <thead>
                      <tr className="bg-surface-gray border-b border-gray-100 text-text-muted text-xs font-bold uppercase tracking-wider">
                        <th className="px-5 py-3.5 font-semibold w-80">Course</th>
                        <th className="px-5 py-3.5 font-semibold">Comment</th>
                        <th className="px-5 py-3.5 font-semibold w-36">Time</th>
                        <th className="px-5 py-3.5 font-semibold w-28 text-center">Status</th>
                      </tr>
                    </thead>
                    <tbody className="text-sm text-text-main divide-y divide-gray-100 font-semibold">
                      {/* Comment 1 */}
                      <tr className="transition-colors hover:bg-orange-50/60 bg-orange-50/30" style={{ boxShadow: 'inset 3px 0 0 #F36F21' }}>
                        <td className="px-5 py-4">
                          <div className="flex items-center gap-2">
                            <span className="material-symbols-outlined text-primary text-[18px] shrink-0">school</span>
                            <span className="line-clamp-2">Java Fundamentals to Advanced</span>
                          </div>
                        </td>
                        <td className="px-5 py-4 font-medium">
                          <p className="line-clamp-2">Can you explain the difference between abstract class and interface in Java? I'm confused about when to use each one.</p>
                        </td>
                        <td className="px-5 py-4 text-text-muted text-xs whitespace-nowrap font-normal">May 22, 2026<br />10:45 AM</td>
                        <td className="px-5 py-4 text-center">
                          <span className="inline-flex items-center gap-1 bg-orange-100 text-orange-700 text-xs font-bold px-2.5 py-1 rounded-full">
                            <span className="material-symbols-outlined text-[13px]">mark_unread_chat_alt</span> Replied
                          </span>
                        </td>
                      </tr>

                      {/* Comment 2 */}
                      <tr className="transition-colors hover:bg-orange-50/60 bg-orange-50/30" style={{ boxShadow: 'inset 3px 0 0 #F36F21' }}>
                        <td className="px-5 py-4">
                          <div className="flex items-center gap-2">
                            <span className="material-symbols-outlined text-primary text-[18px] shrink-0">school</span>
                            <span className="line-clamp-2">Data Structures &amp; Algorithms</span>
                          </div>
                        </td>
                        <td className="px-5 py-4 font-medium">
                          <p className="line-clamp-2">What is the time complexity for searching in a balanced BST? Is it always O(log n)?</p>
                        </td>
                        <td className="px-5 py-4 text-text-muted text-xs whitespace-nowrap font-normal">May 20, 2026<br />03:12 PM</td>
                        <td className="px-5 py-4 text-center">
                          <span className="inline-flex items-center gap-1 bg-orange-100 text-orange-700 text-xs font-bold px-2.5 py-1 rounded-full">
                            <span className="material-symbols-outlined text-[13px]">mark_unread_chat_alt</span> Replied
                          </span>
                        </td>
                      </tr>

                      {/* Comment 3 */}
                      <tr className="transition-colors hover:bg-surface-gray/50">
                        <td className="px-5 py-4">
                          <div className="flex items-center gap-2">
                            <span className="material-symbols-outlined text-primary text-[18px] shrink-0">school</span>
                            <span className="line-clamp-2">UI/UX Fundamentals</span>
                          </div>
                        </td>
                        <td className="px-5 py-4 font-medium">
                          <p className="line-clamp-2">How do I choose accessible color pairs? Are there any tools that can help check contrast ratios automatically?</p>
                        </td>
                        <td className="px-5 py-4 text-text-muted text-xs whitespace-nowrap font-normal">May 18, 2026<br />09:30 AM</td>
                        <td className="px-5 py-4 text-center">
                          <span className="inline-flex items-center gap-1 bg-gray-100 text-gray-500 text-xs font-medium px-2.5 py-1 rounded-full">
                            <span className="material-symbols-outlined text-[13px]">hourglass_empty</span> Pending
                          </span>
                        </td>
                      </tr>

                      {/* Comment 4 */}
                      <tr className="transition-colors hover:bg-orange-50/60 bg-orange-50/30" style={{ boxShadow: 'inset 3px 0 0 #F36F21' }}>
                        <td className="px-5 py-4">
                          <div className="flex items-center gap-2">
                            <span className="material-symbols-outlined text-primary text-[18px] shrink-0">school</span>
                            <span className="line-clamp-2">React Masterclass</span>
                          </div>
                        </td>
                        <td className="px-5 py-4 font-medium">
                          <p className="line-clamp-2">When should I use useCallback vs useMemo? They seem to do similar things but I'm not sure which one to pick.</p>
                        </td>
                        <td className="px-5 py-4 text-text-muted text-xs whitespace-nowrap font-normal">May 15, 2026<br />11:55 AM</td>
                        <td className="px-5 py-4 text-center">
                          <span className="inline-flex items-center gap-1 bg-orange-100 text-orange-700 text-xs font-bold px-2.5 py-1 rounded-full">
                            <span className="material-symbols-outlined text-[13px]">mark_unread_chat_alt</span> Replied
                          </span>
                        </td>
                      </tr>

                      {/* Comment 5 */}
                      <tr className="transition-colors hover:bg-surface-gray/50">
                        <td className="px-5 py-4">
                          <div className="flex items-center gap-2">
                            <span className="material-symbols-outlined text-primary text-[18px] shrink-0">school</span>
                            <span className="line-clamp-2">Data Structures &amp; Algorithms</span>
                          </div>
                        </td>
                        <td className="px-5 py-4 font-medium">
                          <p className="line-clamp-2">In Dijkstra's algorithm, can it handle negative weights? What algorithm should I use if there are negative edges?</p>
                        </td>
                        <td className="px-5 py-4 text-text-muted text-xs whitespace-nowrap font-normal">May 12, 2026<br />02:20 PM</td>
                        <td className="px-5 py-4 text-center">
                          <span className="inline-flex items-center gap-1 bg-gray-100 text-gray-500 text-xs font-medium px-2.5 py-1 rounded-full">
                            <span className="material-symbols-outlined text-[13px]">hourglass_empty</span> Pending
                          </span>
                        </td>
                      </tr>

                      {/* Comment 6 */}
                      <tr className="transition-colors hover:bg-orange-50/60 bg-orange-50/30" style={{ boxShadow: 'inset 3px 0 0 #F36F21' }}>
                        <td className="px-5 py-4">
                          <div className="flex items-center gap-2">
                            <span className="material-symbols-outlined text-primary text-[18px] shrink-0">school</span>
                            <span className="line-clamp-2">Java Fundamentals to Advanced</span>
                          </div>
                        </td>
                        <td className="px-5 py-4 font-medium">
                          <p className="line-clamp-2">How do bounded type parameters work with generics? I keep getting compiler errors when I try to use &lt;T extends Comparable&gt;.</p>
                        </td>
                        <td className="px-5 py-4 text-text-muted text-xs whitespace-nowrap font-normal">May 10, 2026<br />04:45 PM</td>
                        <td className="px-5 py-4 text-center">
                          <span className="inline-flex items-center gap-1 bg-orange-100 text-orange-700 text-xs font-bold px-2.5 py-1 rounded-full">
                            <span className="material-symbols-outlined text-[13px]">mark_unread_chat_alt</span> Replied
                          </span>
                        </td>
                      </tr>

                    </tbody>
                  </table>
                </div>

                {/* Pagination mockup */}
                <div className="p-4 border-t border-gray-100 flex items-center justify-between">
                  <span className="text-sm text-text-muted">Showing 1 to 6 of 18 entries</span>
                  <div className="flex gap-1">
                    <button className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-surface-gray"><span className="material-symbols-outlined text-sm">chevron_left</span></button>
                    <button className="w-8 h-8 rounded bg-primary text-white flex items-center justify-center text-sm font-medium">1</button>
                    <button className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-surface-gray hover:text-primary text-sm font-medium">2</button>
                    <button className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-surface-gray hover:text-primary text-sm font-medium">3</button>
                    <button className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-surface-gray"><span className="material-symbols-outlined text-sm">chevron_right</span></button>
                  </div>
                </div>
              </div>
            </section>

            {/* Problem Comments */}
            <section className="pb-10">
              <div className="mb-4">
                <h2 className="text-xl font-bold text-text-main flex items-center gap-2">
                  <span className="material-symbols-outlined text-brand-blue-light">code</span>
                  Problem Comments
                </h2>
              </div>

              <div className="bg-surface rounded-xl border border-gray-100 shadow-sm overflow-hidden">
                <div className="overflow-x-auto">
                  <table className="w-full text-left border-collapse min-w-[700px]">
                    <thead>
                      <tr className="bg-surface-gray border-b border-gray-100 text-text-muted text-xs font-bold uppercase tracking-wider">
                        <th className="px-5 py-3.5 font-semibold w-72">Problem</th>
                        <th className="px-5 py-3.5 font-semibold">Comment</th>
                        <th className="px-5 py-3.5 font-semibold w-36">Time</th>
                        <th className="px-5 py-3.5 font-semibold w-28 text-center">Status</th>
                      </tr>
                    </thead>
                    <tbody className="text-sm text-text-main divide-y divide-gray-100 font-semibold">
                      
                      {/* Problem comment 1 */}
                      <tr className="transition-colors hover:bg-orange-50/60 bg-orange-50/30" style={{ boxShadow: 'inset 3px 0 0 #F36F21' }}>
                        <td className="px-5 py-4">
                          <div className="flex items-center gap-2">
                            <span className="material-symbols-outlined text-brand-blue text-[18px] shrink-0">code</span>
                            <div>
                              <span className="block">2. Add Two Numbers</span>
                              <Link to="/problems/2" className="text-xs text-primary hover:underline">View problem</Link>
                            </div>
                          </div>
                        </td>
                        <td className="px-5 py-4 font-medium">
                          <p className="line-clamp-2">My solution passes most test cases but fails at overflow. How do I handle integer overflow in Java without using BigInteger?</p>
                        </td>
                        <td className="px-5 py-4 text-text-muted text-xs whitespace-nowrap font-normal">May 23, 2026<br />08:15 AM</td>
                        <td className="px-5 py-4 text-center">
                          <span className="inline-flex items-center gap-1 bg-orange-100 text-orange-700 text-xs font-bold px-2.5 py-1 rounded-full">
                            <span className="material-symbols-outlined text-[13px]">mark_unread_chat_alt</span> Replied
                          </span>
                        </td>
                      </tr>

                      {/* Problem comment 2 */}
                      <tr className="transition-colors hover:bg-surface-gray/50">
                        <td className="px-5 py-4">
                          <div className="flex items-center gap-2">
                            <span className="material-symbols-outlined text-brand-blue text-[18px] shrink-0">code</span>
                            <div>
                              <span className="block">4. Median of Two Sorted Arrays</span>
                              <Link to="/problems/4" className="text-xs text-primary hover:underline">View problem</Link>
                            </div>
                          </div>
                        </td>
                        <td className="px-5 py-4 font-medium">
                          <p className="line-clamp-2">Why does the binary search approach work here? I understand the concept but can't figure out how to set up the partition correctly.</p>
                        </td>
                        <td className="px-5 py-4 text-text-muted text-xs whitespace-nowrap font-normal">May 21, 2026<br />01:30 PM</td>
                        <td className="px-5 py-4 text-center">
                          <span className="inline-flex items-center gap-1 bg-gray-100 text-gray-500 text-xs font-medium px-2.5 py-1 rounded-full">
                            <span className="material-symbols-outlined text-[13px]">hourglass_empty</span> Pending
                          </span>
                        </td>
                      </tr>

                      {/* Problem comment 3 */}
                      <tr className="transition-colors hover:bg-orange-50/60 bg-orange-50/30" style={{ boxShadow: 'inset 3px 0 0 #F36F21' }}>
                        <td className="px-5 py-4">
                          <div className="flex items-center gap-2">
                            <span className="material-symbols-outlined text-brand-blue text-[18px] shrink-0">code</span>
                            <div>
                              <span className="block">7. Reverse Integer</span>
                              <Link to="/problems/7" className="text-xs text-primary hover:underline">View problem</Link>
                            </div>
                          </div>
                        </td>
                        <td className="px-5 py-4 font-medium">
                          <p className="line-clamp-2">Is there a way to solve this in O(1) space? My current approach uses a string conversion which feels inefficient.</p>
                        </td>
                        <td className="px-5 py-4 text-text-muted text-xs whitespace-nowrap font-normal">May 19, 2026<br />10:00 AM</td>
                        <td className="px-5 py-4 text-center">
                          <span className="inline-flex items-center gap-1 bg-orange-100 text-orange-700 text-xs font-bold px-2.5 py-1 rounded-full">
                            <span className="material-symbols-outlined text-[13px]">mark_unread_chat_alt</span> Replied
                          </span>
                        </td>
                      </tr>

                      {/* Problem comment 4 */}
                      <tr className="transition-colors hover:bg-surface-gray/50">
                        <td className="px-5 py-4">
                          <div className="flex items-center gap-2">
                            <span className="material-symbols-outlined text-brand-blue text-[18px] shrink-0">code</span>
                            <div>
                              <span className="block">8. String to Integer (atoi)</span>
                              <Link to="/problems/8" className="text-xs text-primary hover:underline">View problem</Link>
                            </div>
                          </div>
                        </td>
                        <td className="px-5 py-4 font-medium">
                          <p className="line-clamp-2">What edge cases do I need to handle for this problem? My solution handles basic numbers but keeps failing at weird inputs.</p>
                        </td>
                        <td className="px-5 py-4 text-text-muted text-xs whitespace-nowrap font-normal">May 17, 2026<br />05:10 PM</td>
                        <td className="px-5 py-4 text-center">
                          <span className="inline-flex items-center gap-1 bg-gray-100 text-gray-500 text-xs font-medium px-2.5 py-1 rounded-full">
                            <span className="material-symbols-outlined text-[13px]">hourglass_empty</span> Pending
                          </span>
                        </td>
                      </tr>

                      {/* Problem comment 5 */}
                      <tr className="transition-colors hover:bg-orange-50/60 bg-orange-50/30" style={{ boxShadow: 'inset 3px 0 0 #F36F21' }}>
                        <td className="px-5 py-4">
                          <div className="flex items-center gap-2">
                            <span className="material-symbols-outlined text-brand-blue text-[18px] shrink-0">code</span>
                            <div>
                              <span className="block">15. 3Sum</span>
                              <Link to="/problems/15" className="text-xs text-primary hover:underline">View problem</Link>
                            </div>
                          </div>
                        </td>
                        <td className="px-5 py-4 font-medium">
                          <p className="line-clamp-2">My two-pointer approach gives duplicates. How do I efficiently skip them without using a HashSet?</p>
                        </td>
                        <td className="px-5 py-4 text-text-muted text-xs whitespace-nowrap font-normal">May 14, 2026<br />12:00 PM</td>
                        <td className="px-5 py-4 text-center">
                          <span className="inline-flex items-center gap-1 bg-orange-100 text-orange-700 text-xs font-bold px-2.5 py-1 rounded-full">
                            <span className="material-symbols-outlined text-[13px]">mark_unread_chat_alt</span> Replied
                          </span>
                        </td>
                      </tr>

                    </tbody>
                  </table>
                </div>

                {/* Pagination */}
                <div className="p-4 border-t border-gray-100 flex items-center justify-between">
                  <span className="text-sm text-text-muted">Showing 1 to 5 of 11 entries</span>
                  <div className="flex gap-1">
                    <button className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-surface-gray"><span className="material-symbols-outlined text-sm">chevron_left</span></button>
                    <button className="w-8 h-8 rounded bg-primary text-white flex items-center justify-center text-sm font-medium">1</button>
                    <button className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-surface-gray hover:text-primary text-sm font-medium">2</button>
                    <button className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-surface-gray"><span className="material-symbols-outlined text-sm">chevron_right</span></button>
                  </div>
                </div>
              </div>
            </section>
          </div>
        )}

        {/* Tab: Wallet Transaction */}
        {activeTab === 'wallet-transaction' && (
          <div className="flex flex-col gap-6 animate-fade-in">
            {/* Header subnavs & Balance */}
            <div className="flex flex-col md:flex-row justify-between items-center border-b border-surface-container mb-2 pb-2 md:pb-0 gap-4">
              <div className="flex h-12 gap-6 overflow-x-auto hide-scrollbar whitespace-nowrap w-full md:w-auto">
                <button onClick={() => handleTabChange('wallet-transaction')} className="text-primary font-bold border-b-2 border-primary h-full flex items-center font-label-md text-label-md bg-transparent cursor-pointer">Transaction History</button>
                <button onClick={() => handleTabChange('deposit')} className="text-text-muted hover:text-primary transition-colors h-full flex items-center font-label-md text-label-md bg-transparent cursor-pointer border-none">Deposit</button>
              </div>
              <div className="bg-surface-container-lowest py-2 px-4 rounded-xl shadow-[0_2px_12px_rgba(26,54,93,0.06)] flex items-center gap-3 min-w-[250px] mb-2 md:mb-0 shrink-0 border border-surface-container">
                <div className="w-9 h-9 rounded-full bg-green-50 flex items-center justify-center text-green-600">
                  <span className="material-symbols-outlined text-xl" style={{ fontVariationSettings: "'FILL' 1" }}>account_balance_wallet</span>
                </div>
                <div>
                  <p className="text-[11px] text-text-muted uppercase tracking-wider font-semibold">Current Balance</p>
                  <p className="text-[17px] font-bold text-green-600 font-mono leading-none mt-0.5">{user?.walletBalance?.toLocaleString('vi-VN') || 0} ₫</p>
                </div>
              </div>
            </div>

            {/* Segmented Control for Internal vs Banking */}
            <div className="flex justify-start">
              <div className="flex bg-surface-gray/50 p-1 rounded-xl border border-surface-container">
                <button
                  onClick={() => setTxSubTab('internal')}
                  className={`px-4 py-2 rounded-lg text-sm font-semibold transition-all duration-200 cursor-pointer ${
                    txSubTab === 'internal'
                      ? 'bg-white text-primary shadow-sm'
                      : 'text-text-muted hover:text-text-main'
                  }`}
                >
                  Internal Ledger
                </button>
                <button
                  onClick={() => setTxSubTab('banking')}
                  className={`px-4 py-2 rounded-lg text-sm font-semibold transition-all duration-200 cursor-pointer ${
                    txSubTab === 'banking'
                      ? 'bg-white text-primary shadow-sm'
                      : 'text-text-muted hover:text-text-main'
                  }`}
                >
                  Banking/Gateways
                </button>
              </div>
            </div>

            {txSubTab === 'internal' ? (
              /* Wallet Transactions Table (Internal Ledger) */
              <div className="bg-surface rounded-xl shadow-[0_4px_20px_rgba(26,54,93,0.08)] overflow-hidden border border-surface-container mb-12">
                <div className="p-6 border-b border-surface-container flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4">
                  <div>
                    <h2 className="font-headline-md text-headline-md text-surface-navy">Internal Transactions</h2>
                    <p className="font-body-md text-body-md text-text-muted mt-1">History of course purchases, contest rewards, and other platform activities.</p>
                  </div>
                  <div className="flex items-center gap-2 shrink-0 relative" ref={txTypeDropdownRef}>
                    <span className="text-sm font-semibold text-text-muted">Filter Type:</span>
                    <button
                      type="button"
                      onClick={() => setIsTxTypeDropdownOpen(!isTxTypeDropdownOpen)}
                      className="flex items-center justify-between gap-2 bg-white border border-gray-300 rounded-lg px-3 py-2 min-w-[170px] hover:border-primary transition-all text-sm font-semibold text-text-main shadow-sm cursor-pointer outline-none"
                    >
                      <span className={`text-xs px-2.5 py-1 rounded-full font-semibold ${TX_TYPE_OPTIONS.find(o => o.value === selectedTxType)?.bg || 'bg-gray-100 text-gray-700'}`}>
                        {TX_TYPE_OPTIONS.find(o => o.value === selectedTxType)?.label || 'All Types'}
                      </span>
                      <span className="material-symbols-outlined text-text-muted text-lg transition-transform duration-200" style={{ transform: isTxTypeDropdownOpen ? 'rotate(180deg)' : 'none' }}>
                        keyboard_arrow_down
                      </span>
                    </button>

                    {isTxTypeDropdownOpen && (
                      <div className="absolute right-0 top-full mt-1.5 w-48 bg-white border border-gray-200 rounded-lg shadow-lg py-1.5 z-50 animate-fade-in flex flex-col gap-1">
                        {TX_TYPE_OPTIONS.map((opt) => (
                          <button
                            key={opt.value}
                            type="button"
                            onClick={() => {
                              setSelectedTxType(opt.value);
                              setWalletTxPage(0);
                              setIsTxTypeDropdownOpen(false);
                            }}
                            className="w-full flex items-center px-3 py-1.5 hover:bg-gray-50 transition-colors text-left border-none cursor-pointer bg-transparent"
                          >
                            <span className={`text-xs px-2.5 py-1 rounded-full font-semibold ${opt.bg}`}>
                              {opt.label}
                            </span>
                          </button>
                        ))}
                      </div>
                    )}
                  </div>
                </div>
                <div className="overflow-x-auto min-h-[530px]">
                  <table className="w-full text-left border-collapse min-w-[800px]">
                    <thead>
                      <tr className="bg-surface-gray border-b border-surface-container text-text-muted font-label-md text-label-md uppercase tracking-wider">
                        <th className="p-4 pl-6 font-semibold">Date</th>
                        <th className="p-4 font-semibold">Type</th>
                        <th className="p-4 font-semibold text-right">Amount</th>
                        <th className="p-4 font-semibold text-right">Status</th>
                      </tr>
                    </thead>
                    <tbody className="text-body-md font-body-md text-text-main divide-y divide-surface-container font-semibold">
                      {isWalletTxLoading ? (
                        <tr>
                          <td colSpan={4} className="p-8 text-center text-text-muted font-normal">
                            Loading transactions...
                          </td>
                        </tr>
                      ) : walletTransactions.length === 0 ? (
                        <tr>
                          <td colSpan={4} className="p-8 text-center text-text-muted font-normal">
                            No transactions found.
                          </td>
                        </tr>
                      ) : (
                        walletTransactions.map((tx, index) => {
                          const isAddition = ['DEPOSIT', 'AWARD', 'REFUND'].includes(tx.type);
                          
                          const renderTypeBadge = (type: string) => {
                            switch (type) {
                              case 'DEPOSIT':
                                return <span className="bg-blue-100 text-blue-700 font-label-md text-xs px-2.5 py-1 rounded-full whitespace-nowrap font-bold">Deposit</span>;
                              case 'BUY_COURSE':
                                return <span className="bg-red-100 text-red-700 font-label-md text-xs px-2.5 py-1 rounded-full whitespace-nowrap font-bold">Buy Course</span>;
                              case 'REFUND':
                                return <span className="bg-purple-100 text-purple-700 font-label-md text-xs px-2.5 py-1 rounded-full whitespace-nowrap font-bold">Refund</span>;
                              case 'AWARD':
                                return <span className="bg-amber-100 text-amber-700 font-label-md text-xs px-2.5 py-1 rounded-full whitespace-nowrap font-bold">Award</span>;
                              default:
                                return <span className="bg-gray-100 text-gray-700 font-label-md text-xs px-2.5 py-1 rounded-full whitespace-nowrap font-bold">{type}</span>;
                            }
                          };

                          const renderStatus = (status: string) => {
                            switch (status) {
                              case 'SUCCESS':
                                return <span className="text-text-muted text-sm flex items-center justify-end gap-1 font-normal"><span className="material-symbols-outlined text-[16px] text-green-600">check_circle</span> Completed</span>;
                              case 'FAILED':
                                return <span className="text-text-muted text-sm flex items-center justify-end gap-1 font-normal"><span className="material-symbols-outlined text-[16px] text-red-600">cancel</span> Failed</span>;
                              case 'PENDING':
                              default:
                                return <span className="text-text-muted text-sm flex items-center justify-end gap-1 font-normal"><span className="material-symbols-outlined text-[16px] text-yellow-600">hourglass_empty</span> Pending</span>;
                            }
                          };

                          return (
                            <tr key={index} className="hover:bg-surface-gray/50 transition-colors">
                              <td className="p-4 pl-6 whitespace-nowrap text-text-muted font-normal">
                                {new Date(tx.date).toLocaleString('en-US', { day: 'numeric', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit' })}
                              </td>
                              <td className="p-4">{renderTypeBadge(tx.type)}</td>
                              <td className={`p-4 text-right font-bold ${isAddition ? 'text-brand-green' : 'text-red-600'}`}>
                                {isAddition ? '+' : '-'}{tx.amount.toLocaleString('vi-VN')} ₫
                              </td>
                              <td className="p-4 text-right">{renderStatus(tx.status)}</td>
                            </tr>
                          );
                        })
                      )}
                    </tbody>
                  </table>
                </div>
                <div className="p-4 border-t border-surface-container flex items-center justify-between">
                  <span className="text-sm text-text-muted font-medium">
                    Showing {walletTransactions.length > 0 ? walletTxPage * 10 + 1 : 0} to {walletTxPage * 10 + walletTransactions.length} of {walletTxTotalElements} entries
                  </span>
                  <div className="flex gap-1">
                    <button 
                      type="button"
                      disabled={walletTxPage === 0}
                      onClick={(e) => {
                        e.preventDefault();
                        setWalletTxPage(prev => Math.max(prev - 1, 0));
                      }}
                      className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-surface-gray disabled:opacity-50 disabled:pointer-events-none"
                    >
                      <span className="material-symbols-outlined text-sm">chevron_left</span>
                    </button>
                    {Array.from({ length: walletTxTotalPages }, (_, i) => (
                      <button 
                        type="button"
                        key={i}
                        onClick={(e) => {
                          e.preventDefault();
                          setWalletTxPage(i);
                        }}
                        className={`w-8 h-8 rounded flex items-center justify-center text-sm font-medium ${walletTxPage === i ? 'bg-primary text-white' : 'border border-gray-200 text-text-muted hover:bg-surface-gray hover:text-primary'}`}
                      >
                        {i + 1}
                      </button>
                    ))}
                    <button 
                      type="button"
                      disabled={walletTxPage >= walletTxTotalPages - 1}
                      onClick={(e) => {
                        e.preventDefault();
                        setWalletTxPage(prev => Math.min(prev + 1, walletTxTotalPages - 1));
                      }}
                      className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-surface-gray disabled:opacity-50 disabled:pointer-events-none"
                    >
                      <span className="material-symbols-outlined text-sm">chevron_right</span>
                    </button>
                  </div>
                </div>
              </div>
            ) : (
              /* Payment Transactions Table (Banking Ledger) */
              <div className="bg-surface rounded-xl shadow-[0_4px_20px_rgba(26,54,93,0.08)] overflow-hidden border border-surface-container mb-12">
                <div className="p-6 border-b border-surface-container">
                  <h2 className="font-headline-md text-headline-md text-surface-navy">Banking Transactions</h2>
                  <p className="font-body-md text-body-md text-text-muted mt-1">Fiat deposits and withdrawals records.</p>
                </div>
                <div className="overflow-x-auto min-h-[530px]">
                  <table className="w-full text-left border-collapse min-w-[800px]">
                    <thead>
                      <tr className="bg-surface-gray border-b border-surface-container text-text-muted font-label-md text-label-md uppercase tracking-wider">
                        <th className="p-4 pl-6 font-semibold">Date</th>
                        <th className="p-4 font-semibold">Transaction Code</th>
                        <th className="p-4 font-semibold">Type</th>
                        <th className="p-4 font-semibold text-right">Amount</th>
                        <th className="p-4 font-semibold text-right">Status</th>
                      </tr>
                    </thead>
                    <tbody className="text-body-md font-body-md text-text-main divide-y divide-surface-container font-semibold">
                      {isPaymentTxLoading ? (
                        <tr>
                          <td colSpan={5} className="p-8 text-center text-text-muted">Loading transactions...</td>
                        </tr>
                      ) : paymentTransactions.length === 0 ? (
                        <tr>
                          <td colSpan={5} className="p-8 text-center text-text-muted">No payment transactions found.</td>
                        </tr>
                      ) : (
                        paymentTransactions.map((tx, index) => (
                          <tr key={index} className="hover:bg-surface-gray/50 transition-colors">
                            <td className="p-4 pl-6 whitespace-nowrap text-text-muted font-normal font-mono text-sm">
                              {new Date(tx.date).toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit' })}
                            </td>
                            <td className="p-4 font-mono text-sm">{tx.transactionCode}</td>
                            <td className="p-4">
                              <span className="bg-blue-100 text-blue-700 font-label-md text-xs px-2.5 py-1 rounded-full whitespace-nowrap font-bold">
                                {tx.type}
                              </span>
                            </td>
                            <td className="p-4 text-right text-brand-green font-bold">+{tx.amount.toLocaleString('vi-VN')} ₫</td>
                            <td className="p-4 text-right">
                              {tx.status === 'SUCCESS' && <span className="text-text-muted text-sm flex items-center justify-end gap-1 font-normal"><span className="material-symbols-outlined text-[16px] text-green-600">check_circle</span> Success</span>}
                              {tx.status === 'PENDING' && <span className="text-orange-500 text-sm flex items-center justify-end gap-1 font-normal"><span className="material-symbols-outlined text-[16px]">schedule</span> Pending</span>}
                              {tx.status === 'FAILED' && <span className="text-red-600 text-sm flex items-center justify-end gap-1 font-normal"><span className="material-symbols-outlined text-[16px]">cancel</span> Failed</span>}
                              {tx.status === 'CANCELLED' && <span className="text-red-600 text-sm flex items-center justify-end gap-1 font-normal"><span className="material-symbols-outlined text-[16px]">do_not_disturb_on</span> Cancelled</span>}
                            </td>
                          </tr>
                        ))
                      )}
                    </tbody>
                  </table>
                </div>
                {paymentTxTotalPages > 0 && (
                  <div className="p-4 border-t border-surface-container flex items-center justify-between bg-surface">
                    <span className="text-sm text-text-muted font-medium">
                      Showing {paymentTxPage * 10 + 1} to {Math.min((paymentTxPage + 1) * 10, paymentTxTotalElements)} of {paymentTxTotalElements} entries
                    </span>
                    <div className="flex gap-1">
                      <button 
                        onClick={() => setPaymentTxPage(p => Math.max(0, p - 1))}
                        disabled={paymentTxPage === 0}
                        className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-surface-gray disabled:opacity-50"
                      >
                        <span className="material-symbols-outlined text-sm">chevron_left</span>
                      </button>
                      {Array.from({ length: paymentTxTotalPages }, (_, i) => i).map(pageNum => (
                        <button
                          key={pageNum}
                          onClick={() => setPaymentTxPage(pageNum)}
                          className={`w-8 h-8 rounded flex items-center justify-center text-sm font-medium ${
                            paymentTxPage === pageNum 
                              ? 'bg-primary text-white' 
                              : 'border border-gray-200 text-text-muted hover:bg-surface-gray hover:text-primary'
                          }`}
                        >
                          {pageNum + 1}
                        </button>
                      ))}
                      <button 
                        onClick={() => setPaymentTxPage(p => Math.min(paymentTxTotalPages - 1, p + 1))}
                        disabled={paymentTxPage >= paymentTxTotalPages - 1}
                        className="w-8 h-8 rounded border border-gray-200 flex items-center justify-center text-text-muted hover:bg-surface-gray disabled:opacity-50"
                      >
                        <span className="material-symbols-outlined text-sm">chevron_right</span>
                      </button>
                    </div>
                  </div>
                )}
              </div>
            )}
          </div>
        )}

        {/* Tab: Deposit */}
        {activeTab === 'deposit' && (
          <div className="flex flex-col gap-6 animate-fade-in">
            {/* Header subnavs & Balance */}
            <div className="flex flex-col md:flex-row justify-between items-center border-b border-surface-container mb-2 pb-2 md:pb-0 gap-4">
              <div className="flex h-12 gap-6 overflow-x-auto hide-scrollbar whitespace-nowrap w-full md:w-auto">
                <button onClick={() => handleTabChange('wallet-transaction')} className="text-text-muted hover:text-primary transition-colors h-full flex items-center font-label-md text-label-md bg-transparent border-none cursor-pointer">Transaction History</button>
                <button onClick={() => handleTabChange('deposit')} className="text-primary font-bold border-b-2 border-primary h-full flex items-center font-label-md text-label-md bg-transparent cursor-pointer">Deposit</button>
              </div>
              <div className="bg-surface-container-lowest py-2 px-4 rounded-xl shadow-[0_2px_12px_rgba(26,54,93,0.06)] flex items-center gap-3 min-w-[250px] mb-2 md:mb-0 shrink-0 border border-surface-container">
                <div className="w-9 h-9 rounded-full bg-green-50 flex items-center justify-center text-green-600">
                  <span className="material-symbols-outlined text-xl" style={{ fontVariationSettings: "'FILL' 1" }}>account_balance_wallet</span>
                </div>
                <div>
                  <p className="text-[11px] text-text-muted uppercase tracking-wider font-semibold">Current Balance</p>
                  <p className="text-[17px] font-bold text-green-600 font-mono leading-none mt-0.5">{user?.walletBalance?.toLocaleString('vi-VN') || 0} ₫</p>
                </div>
              </div>
            </div>

            {/* Deposit Grid */}
            <div className="grid grid-cols-1 md:grid-cols-12 gap-gutter mb-12">
              {/* Transfer details */}
              <div className="md:col-span-6 lg:col-span-6 bg-surface-container-lowest shadow-[0_6px_24px_rgba(26,54,93,0.06)] rounded-2xl p-6 md:p-8 flex flex-col gap-6 hover:shadow-[0_8px_30px_rgba(26,54,93,0.12)] transition-all duration-300 border border-surface-container">
                <div className="flex items-center gap-3 border-b border-surface-container pb-4">
                  <div className="w-10 h-10 rounded-xl bg-primary-light/35 flex items-center justify-center text-primary">
                    <span className="material-symbols-outlined text-2xl">account_balance</span>
                  </div>
                  <div>
                    <h2 className="font-display font-black text-xl text-[#12284C]">Transfer Details</h2>
                    <p className="text-xs text-text-muted mt-0.5">Please transfer matching resources using details below.</p>
                  </div>
                </div>

                <div className="flex flex-col gap-6">
                  {/* Virtual Bank Card */}
                  <div className="relative bg-gradient-to-br from-[#12284C] via-[#1A365D] to-[#F36F21]/20 p-8 rounded-2xl shadow-md overflow-hidden text-white flex flex-col justify-between min-h-[220px] border border-white/10">
                    {/* Background overlay design */}
                    <div className="absolute -right-10 -bottom-10 w-40 h-40 bg-primary/15 rounded-full blur-2xl pointer-events-none"></div>
                    <div className="absolute -left-10 -top-10 w-32 h-32 bg-blue-500/10 rounded-full blur-xl pointer-events-none"></div>

                    {/* Card Top */}
                    <div className="flex justify-between items-start relative z-10">
                      <div className="flex items-center gap-2">
                        <span className="material-symbols-outlined text-white/80 text-2xl">account_balance</span>
                        <span className="font-display font-black tracking-wider text-sm">MB BANK</span>
                      </div>
                      <span className="text-[10px] font-bold bg-white/20 px-2 py-0.5 rounded uppercase tracking-wider backdrop-blur-sm">Fast 24/7</span>
                    </div>

                    {/* Card Middle (Monospace Account Number) */}
                    <div className="flex items-center justify-between bg-white/10 backdrop-blur-md border border-white/20 p-3.5 rounded-xl mt-3 relative z-10">
                      <div>
                        <span className="text-[9px] uppercase tracking-wider text-white/60 font-semibold block mb-0.5">Account Number</span>
                        <span className="font-mono text-lg font-bold tracking-widest text-white block">
                          {paymentDetails?.accountNumber || '•••• •••• ••••'}
                        </span>
                      </div>
                      {paymentDetails?.accountNumber && (
                        <button 
                          type="button"
                          onClick={handleCopyAccountNumber}
                          className="w-9 h-9 rounded-lg bg-white/10 hover:bg-white/25 border border-white/20 flex items-center justify-center transition-colors cursor-pointer text-white shadow-sm"
                          title="Copy Account Number"
                        >
                          <span className="material-symbols-outlined text-[18px]">content_copy</span>
                        </button>
                      )}
                    </div>

                    {/* Card Bottom */}
                    <div className="flex justify-between items-end mt-3 relative z-10">
                      <div>
                        <span className="text-[9px] uppercase tracking-wider text-white/60 font-semibold block mb-0.5">Account Holder</span>
                        <span className="text-base font-bold tracking-wide text-white uppercase">
                          {paymentDetails?.accountName || 'VO NGOC THANH'}
                        </span>
                      </div>
                      <div className="w-8 h-6 bg-white/10 rounded-md border border-white/10 flex items-center justify-center backdrop-blur-sm">
                        <span className="material-symbols-outlined text-white/40 text-sm">contactless</span>
                      </div>
                    </div>
                  </div>

                  {/* Input form */}
                  <div className="flex flex-col gap-4 mt-2">
                    <div className="flex flex-col gap-1.5">
                      <label className="text-sm font-semibold text-text-main" htmlFor="deposit-amount">Amount to Deposit (VND)</label>
                      <div className="relative">
                        <span className="absolute left-4 top-1/2 -translate-y-1/2 text-text-muted font-bold text-sm">₫</span>
                        <input 
                          value={depositAmount}
                          onChange={(e) => handleAmountChange(e.target.value)}
                          className="w-full pl-8 pr-4 py-3 rounded-xl border border-outline-variant bg-surface focus:border-primary focus:ring-2 focus:ring-primary-light focus:outline-none transition-all font-mono text-base font-bold text-[#12284C]" 
                          id="deposit-amount" 
                          placeholder="500.000" 
                          type="text" 
                          inputMode="numeric"
                        />
                      </div>
                    </div>

                    {/* Quick Amount Selector */}
                    <div className="flex flex-col gap-1.5">
                      <span className="text-xs text-text-muted font-medium">Quick Select Amount:</span>
                      <div className="flex flex-wrap gap-2">
                        {[50000, 100000, 200000, 500000, 1000000].map((amount) => (
                          <button
                            key={amount}
                            type="button"
                            onClick={() => handleAmountChange(amount.toString())}
                            className="px-3 py-1.5 rounded-lg text-xs font-bold border border-surface-container bg-surface-gray/50 text-[#12284C] hover:border-primary hover:text-primary transition-all duration-200 cursor-pointer"
                          >
                            +{amount.toLocaleString('vi-VN')} ₫
                          </button>
                        ))}
                      </div>
                    </div>

                    <button 
                      onClick={handleGenerateQR}
                      className="w-full mt-2 bg-primary hover:bg-primary-hover text-white rounded-xl py-3.5 font-bold shadow-md hover:shadow-lg active:scale-[0.98] transition-all duration-200 cursor-pointer flex items-center justify-center gap-2 border-none"
                    >
                      <span className="material-symbols-outlined text-[20px]">qr_code_2</span>
                      Generate Payment QR
                    </button>
                  </div>
                </div>
              </div>

              {/* QR Code Column */}
              <div className="md:col-span-6 lg:col-span-6 bg-surface-container-lowest shadow-[0_6px_24px_rgba(26,54,93,0.06)] rounded-2xl p-6 md:p-8 flex flex-col items-center justify-center gap-6 hover:shadow-[0_8px_30px_rgba(26,54,93,0.12)] transition-all duration-300 relative border border-surface-container">
                {!qrGenerated ? (
                  <div className="text-center px-4 py-16 flex flex-col items-center justify-center w-full h-full border-2 border-dashed border-surface-container rounded-2xl bg-surface-container-lowest/50">
                    <span className="material-symbols-outlined text-text-muted opacity-25 text-[72px] mb-4">qr_code_2</span>
                    <p className="font-semibold text-text-main text-base mb-1">QR Code Display</p>
                    <p className="text-sm text-text-muted max-w-[280px] font-normal leading-relaxed">Enter an amount on the left and generate a QR code to scan and complete payment.</p>
                  </div>
                ) : (
                  <div className="flex flex-col items-center justify-center gap-6 w-full animate-fade-in">
                    {/* Laser Scanner Style Style Tag */}
                    <style dangerouslySetInnerHTML={{__html: `
                      @keyframes laser-sweep {
                        0% { top: 0%; opacity: 0; }
                        10% { opacity: 1; }
                        90% { opacity: 1; }
                        100% { top: 100%; opacity: 0; }
                      }
                      .animate-laser {
                        animation: laser-sweep 2.5s infinite linear;
                      }
                    `}} />

                    <div className="w-64 h-64 border border-surface-container rounded-2xl flex items-center justify-center bg-white shadow-inner relative overflow-hidden group p-3">
                      {qrCodeUrl ? (
                        <>
                          {/* Laser line overlay */}
                          <div className="absolute left-0 right-0 h-0.5 bg-primary/80 shadow-[0_0_8px_#F36F21] animate-laser z-10 pointer-events-none"></div>
                          <img src={qrCodeUrl} alt="Payment QR Code" className="w-full h-full object-contain" />
                        </>
                      ) : paymentStatus.includes('Successful') ? (
                        <div className="w-full h-full flex flex-col items-center justify-center bg-white rounded-2xl animate-fade-in">
                          <span className="material-symbols-outlined text-green-500 text-[80px]" style={{ fontVariationSettings: "'FILL' 1" }}>check_circle</span>
                          <span className="text-sm font-bold text-green-600 mt-2">Success!</span>
                        </div>
                      ) : (
                        <div className="flex flex-col items-center justify-center gap-2">
                          <span className="material-symbols-outlined text-text-muted animate-spin text-[36px]">sync</span>
                          <span className="text-xs text-text-muted font-semibold">Generating QR...</span>
                        </div>
                      )}
                    </div>
                    {!paymentStatus.includes('Successful') && (
                      <div className="text-center px-4">
                        <div className="flex items-center justify-center gap-2 text-primary font-bold text-sm tracking-wide uppercase mb-1">
                          <span className="material-symbols-outlined text-[18px] animate-pulse">qr_code_scanner</span>
                          Scan with your banking app
                        </div>
                        <p className="text-xs text-text-muted max-w-[280px] mx-auto font-normal leading-relaxed">
                          Scan the QR code to auto-fill payment details and complete your deposit instantly.
                        </p>
                        <button 
                          onClick={handleCancelQR} 
                          className="mt-6 px-6 py-2 rounded-xl font-bold text-red-600 bg-red-50 hover:bg-red-100 transition-colors border border-red-150 cursor-pointer flex items-center justify-center gap-1.5 mx-auto text-sm shadow-sm"
                        >
                          <span className="material-symbols-outlined text-[18px]">cancel</span>
                          Cancel Deposit
                        </button>
                      </div>
                    )}
                    {paymentStatus && (
                      <div className={`mt-4 py-3 px-4 rounded-xl font-bold text-xs tracking-wider text-center w-full uppercase shadow-sm border ${paymentStatusClass}`}>
                        {paymentStatus}
                      </div>
                    )}
                  </div>
                )}
              </div>
            </div>

            {/* Toast for Deposit */}
            {showDepositToast && (
              <div className="fixed bottom-6 left-1/2 -translate-x-1/2 bg-inverse-surface text-inverse-on-surface px-6 py-3 rounded-lg shadow-lg flex items-center gap-2 z-50 animate-fade-in">
                <span className="material-symbols-outlined text-green-500 icon-fill" style={{ fontVariationSettings: "'FILL' 1" }}>check_circle</span>
                <span className="font-body-md text-body-md font-bold">Copied!</span>
              </div>
            )}
          </div>
        )}

        {/* Tab: Purchase History */}
        {activeTab === 'purchase-history' && (
          <div className="flex flex-col gap-6 animate-fade-in">
            {/* Header Title */}
            <div className="mb-4">
              <div className="inline-flex items-center gap-1.5 bg-[#fce2d3] border border-primary/20 px-3 py-1 rounded-full text-primary font-bold text-xs uppercase tracking-wider mb-3 shadow-sm relative z-10">
                <span className="material-symbols-outlined text-xs">shopping_bag</span> Order Center
              </div>
              <h1 className="text-3xl font-display font-black leading-tight text-[#12284C]">
                Purchase History
              </h1>
              <p className="font-body-md text-body-md text-text-muted mt-1">Keep track of your course investments, invoices and payments.</p>
            </div>

            {/* Purchase History Table */}
            <div className="bg-surface rounded-xl shadow-[0_4px_20px_rgba(26,54,93,0.08)] overflow-hidden border border-surface-container mb-12">
              <div className="p-6 border-b border-surface-container">
                <h2 className="font-headline-md text-headline-md text-surface-navy">Course Purchases</h2>
                <p className="font-body-md text-body-md text-text-muted mt-1">View all the courses you have purchased and their details.</p>
              </div>
              <div className="overflow-x-auto min-h-[530px]">
                <table className="w-full text-left border-collapse min-w-[700px]">
                  <thead>
                    <tr className="bg-surface-gray border-b border-surface-container text-text-muted font-label-md text-label-md uppercase tracking-wider">
                      <th className="p-4 pl-6 font-semibold w-[40%]">Order Details</th>
                      <th className="p-4 pl-12 font-semibold text-left w-[20%]">Total Amount</th>
                      <th className="p-4 font-semibold text-left w-[20%]">Date</th>
                      <th className="p-4 pr-6 font-semibold text-left w-[20%]">Status</th>
                    </tr>
                  </thead>
                  <tbody className="text-body-md font-body-md text-text-main divide-y divide-surface-container font-semibold">
                    {isPurchaseHistoryLoading ? (
                      <tr>
                        <td colSpan={4} className="p-8 text-center text-text-muted">Loading purchases...</td>
                      </tr>
                    ) : purchaseHistory.length === 0 ? (
                      <tr>
                        <td colSpan={4} className="p-8 text-center text-text-muted">No purchases found.</td>
                      </tr>
                    ) : (
                      purchaseHistory.map((order, index) => (
                        <tr key={index} className="hover:bg-surface-gray/30 transition-colors duration-150 group">
                          <td className="p-4 pl-6 transition-shadow duration-75 group-hover:shadow-[inset_0_2px_0_#F36F21,inset_0_-2px_0_#F36F21,inset_2px_0_0_#F36F21]">
                            <div className="flex flex-col gap-2 my-1">
                              {order.items.map(item => (
                                <div key={item.courseId} className="flex items-center justify-between p-3 bg-white border border-gray-100 rounded-xl shadow-sm transition-colors">
                                  <div className="flex flex-col gap-1.5">
                                    <span className="font-bold text-primary text-sm line-clamp-2">{item.courseTitle}</span>
                                    <div className="flex items-center gap-2 text-xs text-text-muted font-medium">
                                      <span className="inline-flex items-center gap-1 bg-surface-gray px-2 py-0.5 rounded-md">
                                        <span className="material-symbols-outlined text-[13px]">person</span>
                                        {item.instructorName}
                                      </span>
                                    </div>
                                  </div>
                                  <div className="text-right shrink-0 ml-4">
                                    <span className="font-bold text-brand-blue text-sm">{item.priceAtPurchase.toLocaleString('vi-VN')} ₫</span>
                                  </div>
                                </div>
                              ))}
                            </div>
                          </td>
                          <td className="p-4 pl-12 text-left transition-shadow duration-75 group-hover:shadow-[inset_0_2px_0_#F36F21,inset_0_-2px_0_#F36F21]">
                            <div className="flex flex-col items-start">
                              <span className="text-lg font-black text-green-600">{order.totalAmount.toLocaleString('vi-VN')} ₫</span>
                              <span className="text-[11px] text-text-muted font-medium mt-0.5 uppercase tracking-wider">{order.items.length} item{order.items.length > 1 ? 's' : ''}</span>
                            </div>
                          </td>
                          <td className="p-4 text-left transition-shadow duration-75 group-hover:shadow-[inset_0_2px_0_#F36F21,inset_0_-2px_0_#F36F21]">
                            <div className="inline-flex items-center gap-1.5 bg-gray-50 border border-gray-100 px-3 py-1.5 rounded-lg">
                              <span className="material-symbols-outlined text-text-muted text-[18px]">calendar_month</span>
                              <span className="text-text-main font-semibold text-sm whitespace-nowrap">
                                {new Date(order.purchaseDate).toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' })}
                              </span>
                            </div>
                          </td>
                          <td className="p-4 pr-6 text-left transition-shadow duration-75 group-hover:shadow-[inset_0_2px_0_#F36F21,inset_0_-2px_0_#F36F21,inset_-2px_0_0_#F36F21]">
                            {order.status === 'COMPLETED' && (
                              <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-semibold bg-green-50 text-green-700 border border-green-200">
                                <span className="material-symbols-outlined text-[14px]">check_circle</span>
                                Completed
                              </span>
                            )}
                            {order.status === 'PENDING' && (
                              <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-semibold bg-orange-50 text-orange-700 border border-orange-200">
                                <span className="material-symbols-outlined text-[14px]">schedule</span>
                                Pending
                              </span>
                            )}
                            {order.status === 'FAILED' && (
                              <span className="inline-flex items-center gap-1.5 px-2.5 py-1 rounded-full text-xs font-semibold bg-red-50 text-red-700 border border-red-200">
                                <span className="material-symbols-outlined text-[14px]">cancel</span>
                                Failed
                              </span>
                            )}
                          </td>
                        </tr>
                      ))
                    )}
                  </tbody>
                </table>
              </div>

              {/* Pagination */}
              {purchaseHistoryTotalPages > 1 && (
                <div className="p-4 border-t border-surface-container flex items-center justify-between">
                  <span className="text-sm text-text-muted">
                    Showing {purchaseHistory.length > 0 ? purchaseHistoryPage * 10 + 1 : 0} to {purchaseHistoryPage * 10 + purchaseHistory.length} of {purchaseHistoryTotalElements} entries
                  </span>
                  <div className="flex gap-1">
                    <button 
                      onClick={() => setPurchaseHistoryPage(p => Math.max(0, p - 1))}
                      disabled={purchaseHistoryPage === 0}
                      className="w-8 h-8 rounded border border-surface-container flex items-center justify-center text-text-muted hover:bg-surface-gray disabled:opacity-50 cursor-pointer"
                    >
                      <span className="material-symbols-outlined text-sm">chevron_left</span>
                    </button>
                    {Array.from({length: purchaseHistoryTotalPages}).map((_, pageNum) => (
                      <button
                        key={pageNum}
                        onClick={() => setPurchaseHistoryPage(pageNum)}
                        className={`w-8 h-8 rounded flex items-center justify-center text-sm font-medium transition-colors cursor-pointer border ${
                          purchaseHistoryPage === pageNum
                            ? 'bg-primary text-white border-primary'
                            : 'border-surface-container text-text-main hover:bg-surface-gray'
                        }`}
                      >
                        {pageNum + 1}
                      </button>
                    ))}
                    <button 
                      onClick={() => setPurchaseHistoryPage(p => Math.min(purchaseHistoryTotalPages - 1, p + 1))}
                      disabled={purchaseHistoryPage >= purchaseHistoryTotalPages - 1}
                      className="w-8 h-8 rounded border border-surface-container flex items-center justify-center text-text-muted hover:bg-surface-gray disabled:opacity-50 cursor-pointer"
                    >
                      <span className="material-symbols-outlined text-sm">chevron_right</span>
                    </button>
                  </div>
                </div>
              )}
            </div>
          </div>
        )}

        {/* Tab: Contest History */}
        {activeTab === 'contest-history' && (() => {
          const participatedContestsOnly = contestHistoryData.filter(c => c.status.toLowerCase() !== 'upcoming');
          return (
            <div className="flex flex-col gap-8 animate-fade-in text-left">
              {/* Header section */}
              <div>
                <div className="inline-flex items-center gap-1.5 bg-[#fce2d3] border border-primary/20 px-3 py-1 rounded-full text-primary font-bold text-xs uppercase tracking-wider mb-3 shadow-sm w-fit">
                  <span className="material-symbols-outlined text-xs icon-fill" style={{ fontVariationSettings: "'FILL' 1" }}>emoji_events</span> My Performance
                </div>
                <h1 className="text-3xl md:text-4xl font-display font-black leading-tight">
                  <span className="bg-gradient-to-r from-[#12284C] to-[#1c3d73] bg-clip-text text-transparent">Contest</span> 
                  <span className="bg-gradient-to-r from-primary to-primary-hover bg-clip-text text-transparent"> History</span>
                </h1>
                <p className="text-text-muted mt-1 text-sm md:text-base">Track your competitive coding journey, review points, and view past contest standings.</p>
              </div>

              {/* Performance Stats Grid */}
              <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
                <div className="bg-surface rounded-3xl p-6 border border-slate-100 shadow-sm flex flex-col justify-between hover:shadow-[0_8px_30px_rgb(0,0,0,0.04)] hover:border-slate-200/80 transition-all duration-300 relative overflow-hidden group">
                  <div className="absolute top-0 left-0 w-1.5 h-full bg-primary"></div>
                  <div className="flex justify-between items-start">
                    <div>
                      <span className="text-[10px] text-text-muted uppercase tracking-wider font-extrabold">Total Points</span>
                      <p className="text-3xl font-display font-black text-brand-blue mt-1">780 <span className="text-xs font-semibold text-text-muted">pts</span></p>
                    </div>
                    <div className="w-10 h-10 rounded-2xl bg-orange-50 flex items-center justify-center text-primary group-hover:scale-110 transition-transform duration-300">
                      <span className="material-symbols-outlined text-xl icon-fill">trophy</span>
                    </div>
                  </div>
                  <div className="text-[10px] text-brand-green font-bold flex items-center gap-0.5 mt-5">
                    <span className="material-symbols-outlined text-[12px] font-black">trending_up</span> +32 last week
                  </div>
                </div>

                <div className="bg-surface rounded-3xl p-6 border border-slate-100 shadow-sm flex flex-col justify-between hover:shadow-[0_8px_30px_rgb(0,0,0,0.04)] hover:border-slate-200/80 transition-all duration-300 relative overflow-hidden group">
                  <div className="absolute top-0 left-0 w-1.5 h-full bg-brand-blue"></div>
                  <div className="flex justify-between items-start">
                    <div>
                      <span className="text-[10px] text-text-muted uppercase tracking-wider font-extrabold">Global Rank</span>
                      <p className="text-3xl font-display font-black text-brand-blue mt-1">#458</p>
                    </div>
                    <div className="w-10 h-10 rounded-2xl bg-blue-50 flex items-center justify-center text-brand-blue group-hover:scale-110 transition-transform duration-300">
                      <span className="material-symbols-outlined text-xl">leaderboard</span>
                    </div>
                  </div>
                  <div className="text-[10px] text-text-muted font-bold mt-5">
                    Top 4.2% among active players
                  </div>
                </div>

                <div className="bg-surface rounded-3xl p-6 border border-slate-100 shadow-sm flex flex-col justify-between hover:shadow-[0_8px_30px_rgb(0,0,0,0.04)] hover:border-slate-200/80 transition-all duration-300 relative overflow-hidden group">
                  <div className="absolute top-0 left-0 w-1.5 h-full bg-brand-green"></div>
                  <div className="flex justify-between items-start">
                    <div>
                      <span className="text-[10px] text-text-muted uppercase tracking-wider font-extrabold">Contests Attended</span>
                      <p className="text-3xl font-display font-black text-brand-blue mt-1">3</p>
                    </div>
                    <div className="w-10 h-10 rounded-2xl bg-green-50 flex items-center justify-center text-brand-green group-hover:scale-110 transition-transform duration-300">
                      <span className="material-symbols-outlined text-xl">calendar_today</span>
                    </div>
                  </div>
                  <div className="text-[10px] text-text-muted font-bold mt-5">
                    Completed & ongoing matches
                  </div>
                </div>

                <div className="bg-surface rounded-3xl p-6 border border-slate-100 shadow-sm flex flex-col justify-between hover:shadow-[0_8px_30px_rgb(0,0,0,0.04)] hover:border-slate-200/80 transition-all duration-300 relative overflow-hidden group">
                  <div className="absolute top-0 left-0 w-1.5 h-full bg-indigo-500"></div>
                  <div className="flex justify-between items-start">
                    <div>
                      <span className="text-[10px] text-text-muted uppercase tracking-wider font-extrabold">Top Placements</span>
                      <div className="flex items-center gap-2.5 mt-2">
                        <span className="inline-flex items-center bg-amber-50 text-amber-700 border border-amber-250/20 rounded-full px-3 py-1 text-sm font-black shadow-sm transition-transform hover:scale-105" title="Top 1">
                          <span className="text-base mr-1">🥇</span> 1
                        </span>
                        <span className="inline-flex items-center bg-slate-50 text-slate-700 border border-slate-250/20 rounded-full px-3 py-1 text-sm font-black shadow-sm transition-transform hover:scale-105" title="Top 2">
                          <span className="text-base mr-1">🥈</span> 1
                        </span>
                        <span className="inline-flex items-center bg-orange-50 text-orange-700 border border-orange-250/20 rounded-full px-3 py-1 text-sm font-black shadow-sm transition-transform hover:scale-105" title="Top 3">
                          <span className="text-base mr-1">🥉</span> 0
                        </span>
                      </div>
                    </div>
                    <div className="w-10 h-10 rounded-2xl bg-indigo-50 flex items-center justify-center text-indigo-600 group-hover:scale-110 transition-transform duration-300">
                      <span className="material-symbols-outlined text-xl">military_tech</span>
                    </div>
                  </div>
                  <div className="text-[10px] text-text-muted font-bold mt-5">
                    Podium finish counts
                  </div>
                </div>
              </div>

              {/* Filter Navigation & Search */}
              <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 border-b border-slate-200 pb-3">
                <div className="flex flex-wrap gap-2.5">
                  {(['all', 'ongoing', 'ended'] as const).map((tab) => {
                    const count = tab === 'all' 
                      ? participatedContestsOnly.length 
                      : participatedContestsOnly.filter(c => c.status.toLowerCase() === tab).length;
                    const isActive = contestFilter === tab || (tab === 'all' && contestFilter === 'upcoming'); // Fallback if filter state was 'upcoming'
                    
                    return (
                      <button
                        key={tab}
                        onClick={() => setContestFilter(tab === 'all' ? 'all' : tab)}
                        className={`px-4 py-2.5 text-xs md:text-sm font-bold rounded-2xl transition-all duration-200 cursor-pointer flex items-center gap-2 border ${
                          isActive
                            ? 'bg-primary text-white shadow-sm border-primary/20 scale-[1.02]'
                            : 'bg-slate-100 hover:bg-slate-200/80 text-text-muted hover:text-brand-blue hover:scale-[1.01] border-transparent'
                        }`}
                      >
                        <span className="capitalize">{tab === 'all' ? 'All Contests' : `${tab} matches`}</span>
                        <span className={`px-2 py-0.5 rounded-full text-[10px] font-black ${
                          isActive ? 'bg-white/20 text-white' : 'bg-slate-200 text-text-muted'
                        }`}>
                          {count}
                        </span>
                      </button>
                    );
                  })}
                </div>
                <span className="text-xs font-bold text-text-muted tracking-wide">
                  Showing {participatedContestsOnly.filter(c => contestFilter === 'all' || contestFilter === 'upcoming' || c.status.toLowerCase() === contestFilter).length} matches
                </span>
              </div>

              {/* List of Contests */}
              <div className="flex flex-col gap-6">
                {participatedContestsOnly
                  .filter(c => contestFilter === 'all' || contestFilter === 'upcoming' || c.status.toLowerCase() === contestFilter)
                  .map((contest, index) => {
                    const isOngoing = contest.status === 'Ongoing';
                    const isEnded = contest.status === 'Ended';

                    return (
                      <article
                        key={index}
                        className={`bg-surface rounded-3xl border border-slate-150 p-6 md:p-7 flex flex-col lg:flex-row lg:items-center justify-between gap-6 transition-all duration-300 hover:shadow-[0_12px_40px_rgba(26,54,93,0.05)] hover:border-slate-350 relative overflow-hidden group ${
                          isOngoing ? 'border-l-4 border-l-brand-green bg-gradient-to-r from-emerald-50/10 to-white hover:from-emerald-50/20' : 
                          'border-l-4 border-l-slate-400 bg-gradient-to-r from-slate-50/20 to-white hover:from-slate-50/30'
                        }`}
                      >
                        {/* Left: Info */}
                        <div className="flex-1 flex flex-col gap-4">
                          <div className="flex flex-wrap items-center gap-2">
                            {isOngoing && (
                              <span className="inline-flex items-center gap-1.5 bg-brand-green/10 text-brand-green font-extrabold text-[10px] px-3 py-1 rounded-full uppercase tracking-wider border border-brand-green/20">
                                <span className="w-1.5 h-1.5 rounded-full bg-brand-green animate-ping"></span> Ongoing
                              </span>
                            )}
                            {isEnded && (
                              <span className="inline-flex items-center gap-1.5 bg-error/10 text-error font-extrabold text-[10px] px-3 py-1 rounded-full uppercase tracking-wider border border-error/10">
                                <span className="material-symbols-outlined text-[12px] font-black">done</span> Ended
                              </span>
                            )}
                          </div>

                          <div>
                            <h3 className="font-display font-black text-lg md:text-xl text-brand-blue group-hover:text-primary transition-colors tracking-tight leading-snug duration-200">
                              {contest.name}
                            </h3>
                            <div className="flex flex-wrap items-center gap-x-4 gap-y-1.5 text-text-muted text-xs mt-2.5 font-semibold">
                              <div className="flex items-center gap-1.5 bg-slate-50 border border-slate-100 rounded-lg px-2.5 py-1">
                                <span className="material-symbols-outlined text-[16px] text-brand-green font-black">play_circle</span>
                                <span>Start Date: <strong className="text-brand-blue font-bold">{contest.startDate}</strong></span>
                              </div>
                              <span className="text-gray-300/80 hidden sm:inline">•</span>
                              <div className="flex items-center gap-1.5 bg-slate-50 border border-slate-100 rounded-lg px-2.5 py-1">
                                <span className="material-symbols-outlined text-[16px] text-error font-black">stop_circle</span>
                                <span>End Date: <strong className="text-brand-blue font-bold">{contest.endDate}</strong></span>
                              </div>
                            </div>
                          </div>

                          {/* Middle Section: Performance stats box */}
                          <div className="grid grid-cols-1 sm:grid-cols-3 gap-4 border border-slate-100/70 bg-slate-50/60 rounded-2xl p-4.5 mt-1 relative overflow-hidden">
                            <div className="flex items-center gap-3 relative z-10">
                              <div className="w-9 h-9 rounded-xl bg-blue-50/80 flex items-center justify-center text-brand-blue shrink-0">
                                <span className="material-symbols-outlined text-lg opacity-90">leaderboard</span>
                              </div>
                              <div>
                                <p className="text-[10px] text-text-muted uppercase font-bold tracking-wider">Your Rank</p>
                                <p className="text-sm font-black text-brand-blue mt-0.5">{contest.rank}</p>
                              </div>
                            </div>
                            <div className="flex items-center gap-3 relative z-10 sm:border-l sm:border-slate-200/50 sm:pl-4">
                              <div className="w-9 h-9 rounded-xl bg-orange-50/80 flex items-center justify-center text-primary shrink-0">
                                <span className="material-symbols-outlined text-lg opacity-90">stars</span>
                              </div>
                              <div>
                                <p className="text-[10px] text-text-muted uppercase font-bold tracking-wider">Contest Score</p>
                                <p className="text-sm font-black text-brand-blue mt-0.5">{contest.score}</p>
                              </div>
                            </div>
                            <div className="flex items-center gap-3 relative z-10 sm:border-l sm:border-slate-200/50 sm:pl-4">
                              <div className="w-9 h-9 rounded-xl bg-green-50/80 flex items-center justify-center text-brand-green shrink-0">
                                <span className="material-symbols-outlined text-lg opacity-90">task_alt</span>
                              </div>
                              <div>
                                <p className="text-[10px] text-text-muted uppercase font-bold tracking-wider">Problems Solved</p>
                                <p className="text-sm font-black text-brand-blue mt-0.5">{contest.problemsSolved}</p>
                              </div>
                            </div>
                          </div>
                        </div>

                        {/* Right: Actions */}
                        <div className="flex flex-col items-start lg:items-end justify-center shrink-0 min-w-[150px] gap-2.5 lg:border-l lg:border-slate-100 lg:pl-6">
                          {isOngoing && (
                            <>
                              <Link 
                                to="/contests/1" 
                                className="w-full text-center px-6 py-3 bg-gradient-to-r from-brand-green to-emerald-600 hover:from-brand-green-hover hover:to-emerald-700 text-white font-extrabold text-xs rounded-2xl shadow-md hover:shadow-lg transition-all duration-200 active:scale-[0.98] transform"
                              >
                                Enter Arena
                              </Link>
                              <span className="text-[10px] text-text-muted font-bold text-center w-full block">Time Remaining: 3 days</span>
                            </>
                          )}
                          {isEnded && (
                            <>
                              <Link 
                                to="/contests/1" 
                                className="w-full text-center px-6 py-3 bg-slate-50 hover:bg-slate-100 text-brand-blue border border-slate-200/80 font-extrabold text-xs rounded-2xl shadow-sm hover:border-slate-300 transition-all duration-200 active:scale-[0.98] transform"
                              >
                                View Standings
                              </Link>
                              <div className="text-[10px] text-brand-green font-bold text-center w-full flex items-center justify-center gap-1 mt-1">
                                <span className="material-symbols-outlined text-[14px] icon-fill">check_circle</span> Participated
                              </div>
                            </>
                          )}
                        </div>
                      </article>
                    );
                  })}

                {participatedContestsOnly.filter(c => contestFilter === 'all' || contestFilter === 'upcoming' || c.status.toLowerCase() === contestFilter).length === 0 && (
                  <div className="flex flex-col items-center justify-center text-center p-16 bg-white rounded-3xl border border-slate-200/60 shadow-sm">
                    <div className="w-16 h-16 rounded-3xl bg-slate-50 flex items-center justify-center text-text-muted mb-4">
                      <span className="material-symbols-outlined text-3xl">emoji_events</span>
                    </div>
                    <h3 className="text-lg font-headline font-black text-brand-blue">No Contests Found</h3>
                    <p className="text-xs text-text-muted max-w-xs mt-1 leading-relaxed">
                      We couldn't find any contests matching the selected category. Explore the active contests catalog to participate!
                    </p>
                    <Link to="/contests" className="mt-4 px-5 py-2 bg-primary hover:bg-primary-hover text-white text-xs font-black rounded-xl transition-all shadow-sm">
                      Browse Contests
                    </Link>
                  </div>
                )}
              </div>
            </div>
          );
        })()}

      </div>
    </div>
  );
};
