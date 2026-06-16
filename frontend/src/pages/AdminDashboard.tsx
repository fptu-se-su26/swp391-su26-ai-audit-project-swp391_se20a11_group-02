import React, { useState, useEffect, useMemo } from 'react';
import { Link } from 'react-router-dom';
import { adminService } from '../services/adminService';
import type {
  AdminDashboardStats,
  AdminCourse,
  AdminInstructorApplication,
  AdminInstructor,
  AdminUser,
  AdminProblem,
  AdminContest,
  AdminDepositHistory,
  AdminProblemTestcase
} from '../services/adminService';
import Editor from '@monaco-editor/react';

const GENERATOR_TEMPLATES: Record<string, string> = {
  java: `import java.util.*;\n\npublic class Solution {\n    public static void main(String[] args) {\n        // Number of test cases\n        int numberOfTests = 3;\n        \n        for (int i = 0; i < numberOfTests; i++) {\n            // Write your logic here\n            \n            // DO NOT REMOVE\n            System.out.println("---TESTCASE---");\n            System.out.println("INPUT:");\n            \n            // Print your input here\n            \n            // DO NOT REMOVE\n            System.out.println("OUTPUT:");\n            \n            // Print your output here\n        }\n    }\n}`,
  python: `# Number of test cases\nnumberOfTests = 3\n\nfor _ in range(numberOfTests):\n    # Write your logic here\n    \n    # DO NOT REMOVE\n    print("---TESTCASE---")\n    print("INPUT:")\n    \n    # Print your input here\n    \n    # DO NOT REMOVE\n    print("OUTPUT:")\n    \n    # Print your output here\n`,
  cpp: `#include <iostream>\nusing namespace std;\n\nint main() {\n    // Number of test cases\n    int numberOfTests = 3;\n    \n    for (int i = 0; i < numberOfTests; i++) {\n        // Write your logic here\n        \n        // DO NOT REMOVE\n        cout << "---TESTCASE---\\n";\n        cout << "INPUT:\\n";\n        \n        // Print your input here\n        \n        // DO NOT REMOVE\n        cout << "OUTPUT:\\n";\n        \n        // Print your output here\n    }\n    return 0;\n}`,
  c: `#include <stdio.h>\n\nint main() {\n    // Number of test cases\n    int numberOfTests = 3;\n    \n    for (int i = 0; i < numberOfTests; i++) {\n        // Write your logic here\n        \n        // DO NOT REMOVE\n        printf("---TESTCASE---\\n");\n        printf("INPUT:\\n");\n        \n        // Print your input here\n        \n        // DO NOT REMOVE\n        printf("OUTPUT:\\n");\n        \n        // Print your output here\n    }\n    return 0;\n}`,
  csharp: `using System;\n\npublic class Solution {\n    public static void Main() {\n        // Number of test cases\n        int numberOfTests = 3;\n        \n        for (int i = 0; i < numberOfTests; i++) {\n            // Write your logic here\n            \n            // DO NOT REMOVE\n            Console.WriteLine("---TESTCASE---");\n            Console.WriteLine("INPUT:");\n            \n            // Print your input here\n            \n            // DO NOT REMOVE\n            Console.WriteLine("OUTPUT:");\n            \n            // Print your output here\n        }\n    }\n}`
};

interface ProblemDetail {
  difficulty: string;
  difficultyClass: string;
  description: string;
  code: Record<string, string>;
}


const initialExercises = [
  { name: 'Two Sum', difficulty: 'Easy', difficultyClass: 'bg-green-50 text-brand-green border border-green-150', submissions: '1,245', completed: true },
  { name: 'Reverse Linked List', difficulty: 'Easy', difficultyClass: 'bg-green-50 text-brand-green border border-green-150', submissions: '850', completed: false },
  { name: 'Spring Context Hierarchy Solver', difficulty: 'Medium', difficultyClass: 'bg-primary-light/50 text-primary border border-primary/20', submissions: '420', completed: false }
];


const problemData: Record<string, ProblemDetail> = {
  "Two Sum": {
    difficulty: "Easy",
    difficultyClass: "bg-green-50 text-brand-green border border-green-150",
    description: `
      <p class="mb-4">Given an array of integers <code class="bg-slate-100 px-1.5 py-0.5 rounded border border-gray-200 font-mono text-xs">nums</code> and an integer <code class="bg-slate-100 px-1.5 py-0.5 rounded border border-gray-200 font-mono text-xs">target</code>, return <em>indices of the two numbers such that they add up to <code class="bg-slate-100 px-1.5 py-0.5 rounded border border-gray-200 font-mono text-xs">target</code></em>.</p>
      <p class="mb-4">You may assume that each input would have <strong>exactly one solution</strong>, and you may not use the same element twice.</p>
      <p class="mb-4">You can return the answer in any order.</p>
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
      <p class="mb-4">Given the <code class="bg-slate-100 px-1.5 py-0.5 rounded border border-gray-200 font-mono text-xs">head</code> of a singly linked list, reverse the list, and return <em>its reversed list</em>.</p>
    `,
    code: {
      "Java": `class Solution {\n    public ListNode reverseList(ListNode head) {\n        // Write your Java code here\n        return null;\n    }\n}`,
      "C++": `class Solution {\npublic:\n    ListNode* reverseList(ListNode* head) {\n        // Write your C++ code here\n        return nullptr;\n    }\n};`,
      "Python": `class Solution:\n    def reverseList(self, head: Optional[ListNode]) -> Optional[ListNode]:\n        # Write your Python code here\n        pass`
    }
  },
  "Spring Context Hierarchy Solver": {
    difficulty: "Medium",
    difficultyClass: "bg-primary-light/50 text-primary border border-primary/20",
    description: `
      <p class="mb-4">Given a hierarchical relationship of Spring ApplicationContext names and their respective registered beans, resolve if a child context can correctly lookup a bean defined in its parent context or its own context.</p>
    `,
    code: {
      "Java": `class Solution {\n    public boolean resolveBeanLookup(Map<String, String> contextParents, Map<String, List<String>> contextBeans, String lookupContext, String beanName) {\n        // Write your Java code here\n        return false;\n    }\n}`,
      "C++": `class Solution {\npublic:\n    bool resolveBeanLookup(unordered_map<string, string>& contextParents, unordered_map<string, vector<string>>& contextBeans, string lookupContext, string beanName) {\n        // Write your C++ code here\n        return false;\n    }\n};`,
      "Python": `class Solution:\n    def resolveBeanLookup(self, contextParents: Dict[str, str], contextBeans: Dict[str, List[str]], lookupContext: str, beanName: str) -> bool: \n        # Write your Python code here\n        return False`
    }
  }
};

const tabHeaderDetails: Record<string, { badge: string; icon: string; title: string; desc: string }> = {
  dashboard: {
    badge: 'Platform Administration',
    icon: 'admin_panel_settings',
    title: 'System Control Dashboard ⚙️',
    desc: 'Manage courses, instructors, users, program problems, contests, and view statistics.'
  },
  courses: {
    badge: 'Course Management',
    icon: 'library_books',
    title: 'Course Administration 📚',
    desc: 'Review and approve instructor course submissions, curriculum, and settings.'
  },
  problems: {
    badge: 'Problem Management',
    icon: 'task',
    title: 'Coding Arena Problems 💻',
    desc: 'Create, modify, and publish coding challenges and configure test cases.'
  },
  contest: {
    badge: 'Contest Management',
    icon: 'emoji_events',
    title: 'Contests & Competitions 🏆',
    desc: 'Organize programming contests, configure scoring rules, and monitor participants.'
  },
  instructor: {
    badge: 'Instructor Management',
    icon: 'school',
    title: 'Instructor Applications 🎓',
    desc: 'Review instructor registration requests, CVs, and manage current platform instructors.'
  },
  users: {
    badge: 'User Management',
    icon: 'group',
    title: 'User Control Panel 👥',
    desc: 'Monitor registered students, check profiles, lock/unlock accounts, and track purchases.'
  },
  financial: {
    badge: 'Financial Overview',
    icon: 'insights',
    title: 'Financial Statistics 📊',
    desc: 'Track platform revenue growth, subscription sales, and analyze instructor payouts.'
  }
};

const JAVA_TEMPLATE = `class Solution {
    public int[] twoSum(int[] nums, int target) {
        // Write your code here
        
    }
}`;

const PYTHON_TEMPLATE = `class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        # Write your code here
        pass`;

const CPP_TEMPLATE = `#include <vector>
using namespace std;

class Solution {
public:
    vector<int> twoSum(vector<int>& nums, int target) {
        // Write your code here
        
    }
};`;

interface RankingSubmissionDetail {
  time?: string;
  penalty: number;
  status: 'first_solve' | 'accepted' | 'failed' | 'unattempted';
}

interface RankingTeam {
  rank: number;
  name: string;
  affiliation: string;
  solved: number;
  totalAttempts: number;
  totalTime: string;
  submissions: Record<string, RankingSubmissionDetail>;
}

const TEAMS_DATA: RankingTeam[] = [
  {
    rank: 1,
    name: 'mosaic14_2025',
    affiliation: 'CyberKnights',
    solved: 8,
    totalAttempts: 10,
    totalTime: '11:02:15',
    submissions: {
      A: { time: '0:15:22', penalty: 1, status: 'first_solve' },
      B: { time: '0:45:10', penalty: 2, status: 'accepted' },
      C: { time: '1:10:33', penalty: 1, status: 'accepted' },
      D: { time: '1:55:00', penalty: 3, status: 'accepted' },
      E: { time: '2:30:15', penalty: 1, status: 'accepted' },
      F: { time: '3:10:45', penalty: 4, status: 'accepted' },
      G: { time: '3:25:22', penalty: 2, status: 'accepted' },
      H: { time: '3:50:00', penalty: 5, status: 'accepted' },
      I: { penalty: 0, status: 'unattempted' },
      J: { penalty: 0, status: 'unattempted' }
    }
  },
  {
    rank: 2,
    name: 'BinaryBeasts',
    affiliation: 'Tech Univ',
    solved: 7,
    totalAttempts: 10,
    totalTime: '10:25:15',
    submissions: {
      A: { time: '0:10:45', penalty: 0, status: 'accepted' },
      B: { time: '0:32:10', penalty: 1, status: 'first_solve' },
      C: { time: '1:05:50', penalty: 2, status: 'accepted' },
      D: { penalty: 3, status: 'failed' },
      E: { time: '2:15:30', penalty: 1, status: 'accepted' },
      F: { time: '3:05:40', penalty: 0, status: 'accepted' },
      G: { time: '3:35:10', penalty: 4, status: 'accepted' },
      H: { time: '3:45:22', penalty: 1, status: 'accepted' },
      I: { penalty: 0, status: 'unattempted' },
      J: { penalty: 0, status: 'unattempted' }
    }
  },
  {
    rank: 3,
    name: 'CodeMasters',
    affiliation: 'Polytechnic',
    solved: 6,
    totalAttempts: 10,
    totalTime: '09:20:30',
    submissions: {
      A: { time: '0:20:15', penalty: 1, status: 'accepted' },
      B: { time: '0:55:40', penalty: 0, status: 'accepted' },
      C: { time: '1:20:10', penalty: 0, status: 'first_solve' },
      D: { time: '2:10:45', penalty: 2, status: 'accepted' },
      E: { penalty: 4, status: 'failed' },
      F: { time: '3:30:15', penalty: 1, status: 'accepted' },
      G: { time: '3:50:30', penalty: 3, status: 'accepted' },
      H: { penalty: 0, status: 'unattempted' },
      I: { penalty: 0, status: 'unattempted' },
      J: { penalty: 0, status: 'unattempted' }
    }
  },
  {
    rank: 4,
    name: 'ByteBusters',
    affiliation: 'Alpha Tech',
    solved: 6,
    totalAttempts: 10,
    totalTime: '11:05:00',
    submissions: {
      A: { time: '0:25:30', penalty: 2, status: 'accepted' },
      B: { time: '1:02:15', penalty: 1, status: 'accepted' },
      C: { time: '1:45:00', penalty: 1, status: 'accepted' },
      D: { time: '2:25:40', penalty: 3, status: 'accepted' },
      E: { time: '3:20:10', penalty: 0, status: 'accepted' },
      F: { time: '3:52:50', penalty: 2, status: 'accepted' },
      G: { penalty: 0, status: 'unattempted' },
      H: { penalty: 0, status: 'unattempted' },
      I: { penalty: 0, status: 'unattempted' },
      J: { penalty: 0, status: 'unattempted' }
    }
  },
  {
    rank: 5,
    name: 'RecursionRiders',
    affiliation: 'Beta University',
    solved: 5,
    totalAttempts: 10,
    totalTime: '08:45:40',
    submissions: {
      A: { time: '0:18:10', penalty: 0, status: 'accepted' },
      B: { time: '0:50:30', penalty: 1, status: 'accepted' },
      C: { time: '1:30:15', penalty: 0, status: 'accepted' },
      D: { time: '2:40:00', penalty: 2, status: 'accepted' },
      E: { time: '3:45:20', penalty: 1, status: 'accepted' },
      F: { penalty: 0, status: 'unattempted' },
      G: { penalty: 0, status: 'unattempted' },
      H: { penalty: 0, status: 'unattempted' },
      I: { penalty: 0, status: 'unattempted' },
      J: { penalty: 0, status: 'unattempted' }
    }
  }
];

const RANKING_TEAM_COLORS = [
  '#3b82f6', // Rank 1: Blue
  '#10b981', // Rank 2: Emerald Green
  '#f59e0b', // Rank 3: Amber Orange
  '#8b5cf6', // Rank 4: Purple
  '#ec4899', // Rank 5: Pink
];

const RANKING_W = 720;
const RANKING_H = 260;
const RANKING_paddingLeft = 45;
const RANKING_paddingTop = 20;

const rankingTimeToMinutes = (timeStr?: string): number => {
  if (!timeStr) return 0;
  const parts = timeStr.split(':').map(Number);
  const hrs = parts[0] || 0;
  const mins = parts[1] || 0;
  const secs = parts[2] || 0;
  return hrs * 60 + mins + secs / 60;
};

const getRankingSvgCoords = (minutes: number, solves: number) => {
  const svgX = RANKING_paddingLeft + (minutes / 240) * RANKING_W;
  const svgY = (RANKING_paddingTop + RANKING_H) - (solves / 10) * RANKING_H;
  return { x: svgX, y: svgY };
};

const getRankingStepPathString = (team: RankingTeam) => {
  const solves: { time: number; problem: string }[] = [];
  Object.keys(team.submissions).forEach((key) => {
    const sub = team.submissions[key];
    if (sub.status === 'accepted' || sub.status === 'first_solve') {
      solves.push({
        time: rankingTimeToMinutes(sub.time),
        problem: key
      });
    }
  });
  solves.sort((a, b) => a.time - b.time);

  const start = getRankingSvgCoords(0, 0);
  if (solves.length === 0) {
    const end = getRankingSvgCoords(240, 0);
    return {
      pathStr: `M ${start.x} ${start.y} L ${end.x} ${end.y}`,
      solves: []
    };
  }

  let pathStr = `M ${start.x} ${start.y}`;
  solves.forEach((solve, index) => {
    const p1 = getRankingSvgCoords(solve.time, index);
    const p2 = getRankingSvgCoords(solve.time, index + 1);
    pathStr += ` L ${p1.x} ${p1.y} L ${p2.x} ${p2.y}`;
  });

  const end = getRankingSvgCoords(240, solves.length);
  pathStr += ` L ${end.x} ${end.y}`;
  return { pathStr, solves };
};

const rankingFormatMinutes = (m: number): string => {
  const hrs = Math.floor(m / 60);
  const mins = Math.floor(m % 60);
  return `${hrs}h ${mins}m`;
};

export const AdminDashboard: React.FC = () => {

  // Navigation Active Tab: 'dashboard' | 'courses' | 'problems' | 'contest' | 'instructor' | 'users' | 'financial'
  const [activeTab, setActiveTab] = useState<'dashboard' | 'courses' | 'problems' | 'contest' | 'instructor' | 'users' | 'financial'>('dashboard');
  const [isSidebarCollapsed, setIsSidebarCollapsed] = useState<boolean>(false);

  // States for API data
  const [stats, setStats] = useState<AdminDashboardStats | null>(null);
  const [courses, setCourses] = useState<AdminCourse[]>([]);
  const [applications, setApplications] = useState<AdminInstructorApplication[]>([]);
  const [instructors, setInstructors] = useState<AdminInstructor[]>([]);
  const [users, setUsers] = useState<AdminUser[]>([]);
  const [problems, setProblems] = useState<AdminProblem[]>([]);
  const [contests, setContests] = useState<AdminContest[]>([]);
  const [recentDeposits, setRecentDeposits] = useState<AdminDepositHistory[]>([]);

  // Loading states
  const [loading, setLoading] = useState<boolean>(true);
  const [globalToast, setGlobalToast] = useState<{ message: string; type: 'success' | 'error' | 'info' } | null>(null);
  const showGlobalToast = (message: string, type: 'success' | 'error' | 'info' = 'success') => {
    setGlobalToast({ message, type });
    setTimeout(() => setGlobalToast(null), 3000);
  };

  // Filter states
  const [courseFilter, setCourseFilter] = useState<'ALL' | 'APPROVED' | 'PENDING' | 'REJECTED'>('ALL');
  const [instructorAppFilter, setInstructorAppFilter] = useState<'ALL' | 'APPROVED' | 'PENDING' | 'REJECTED'>('ALL');
  const [userSearch, setUserSearch] = useState('');
  const [userStatusFilter, setUserStatusFilter] = useState<'ALL' | 'ACTIVE' | 'LOCKED'>('ALL');
  const [userOnlineFilter, setUserOnlineFilter] = useState<'ALL' | 'ONLINE' | 'OFFLINE'>('ALL');
  const [problemSearch, setProblemSearch] = useState('');
  const [problemDifficultyFilter, setProblemDifficultyFilter] = useState<'ALL' | 'EASY' | 'MEDIUM' | 'HARD'>('ALL');
  const [problemScopeFilter, setProblemScopeFilter] = useState<'ALL' | 'PRACTICE' | 'CONTEST' | 'SHARED'>('ALL');
  const [problemSubTab, setProblemSubTab] = useState<'repository' | 'practice' | 'contest' | 'shared'>('repository');
  const [contestStatusFilter, setContestStatusFilter] = useState<'ALL' | 'UPCOMING' | 'ONGOING' | 'COMPLETED'>('ALL');

  // Modal / review panel states

  const [selectedAppForReview, setSelectedAppForReview] = useState<AdminInstructorApplication | null>(null);
  const [selectedUserDetail, setSelectedUserDetail] = useState<AdminUser | null>(null);
  const [isCreateProblemOpen, setIsCreateProblemOpen] = useState(false);
  const [isEditProblemOpen, setIsEditProblemOpen] = useState(false);
  const [editingProblemId, setEditingProblemId] = useState<number | null>(null);

  // Testcase state variables
  const [isTestcaseModalOpen, setIsTestcaseModalOpen] = useState(false);
  const [testcaseProblem, setTestcaseProblem] = useState<AdminProblem | null>(null);
  const [testcasesList, setTestcasesList] = useState<Omit<AdminProblemTestcase, 'id'>[]>([]);
  const [testcaseTab, setTestcaseTab] = useState<'manual' | 'upload'>('manual');
  const [zipFile, setZipFile] = useState<File | null>(null);
  const [dragActive, setDragActive] = useState(false);
  const [isSavingTestcases, setIsSavingTestcases] = useState(false);
  const [testCaseGenerationMode, setTestCaseGenerationMode] = useState<'manual' | 'generate'>('manual');
  const [generatorLanguage, setGeneratorLanguage] = useState('java');
  const [generatorCode, setGeneratorCode] = useState(GENERATOR_TEMPLATES['java']);
  const [generateLoading, setGenerateLoading] = useState(false);
  const [generateError, setGenerateError] = useState<string | null>(null);
  const [isCreateContestOpen, setIsCreateContestOpen] = useState(false);

  // Confirmation Modal state
  const [isConfirmModalOpen, setIsConfirmModalOpen] = useState(false);
  const [confirmModalTitle, setConfirmModalTitle] = useState('');
  const [confirmModalMessage, setConfirmModalMessage] = useState('');
  const [confirmModalAction, setConfirmModalAction] = useState<(() => void) | null>(null);

  const triggerConfirm = (title: string, message: string, action: () => void) => {
    setConfirmModalTitle(title);
    setConfirmModalMessage(message);
    setConfirmModalAction(() => action);
    setIsConfirmModalOpen(true);
  };

  // Course Player Review Mode states
  const [reviewingCourse, setReviewingCourse] = useState<AdminCourse | null>(null);
  const [reviewPlayerTab, setReviewPlayerTab] = useState<'overview' | 'qa' | 'exercises' | 'source-code' | 'quiz'>('overview');
  const [reviewLectureTitle, setReviewLectureTitle] = useState('1.1 Course Introduction');
  const [reviewCurriculumSections, setReviewCurriculumSections] = useState<Record<string, boolean>>({ sec1: true });
  const [reviewCurrentProblem, setReviewCurrentProblem] = useState<string | null>(null);
  const [reviewSolveLang, setReviewSolveLang] = useState('Java');
  const [reviewSolveCode, setReviewSolveCode] = useState('');

  // Contest Detail Review Mode states
  const [reviewingContest, setReviewingContest] = useState<AdminContest | null>(null);
  const [reviewContestTab, setReviewContestTab] = useState<'overview' | 'problems' | 'submissions' | 'ranking'>('overview');
  const [reviewContestProblemId, setReviewContestProblemId] = useState<number | null>(null);

  // Contest Countdown Timer states
  const [contestTimeLeft, setContestTimeLeft] = useState<string>('--:--:--');
  const [contestTimerLabel, setContestTimerLabel] = useState<string>('Ends In');

  // Contest Problem Solve Workspace states
  const [contestSolveLang, setContestSolveLang] = useState<string>('Java');
  const [contestSolveCode, setContestSolveCode] = useState<string>('');
  const [contestEditorStatus, setContestEditorStatus] = useState<'Accepted' | 'Running' | 'Success'>('Accepted');
  const [contestToastMessage, setContestToastMessage] = useState<string | null>(null);
  const [contestSuccessOverlay, setContestSuccessOverlay] = useState<boolean>(false);

  // Contest Rankings tab states
  const [rankingHoveredTeam, setRankingHoveredTeam] = useState<string | null>(null);
  const [rankingActiveTooltip, setRankingActiveTooltip] = useState<{
    x: number;
    y: number;
    teamName: string;
    solvedCount: number;
    timeStr: string;
    problem: string;
  } | null>(null);
  const [rankingVisibleTeams, setRankingVisibleTeams] = useState<Record<string, boolean>>({
    'mosaic14_2025': true,
    'BinaryBeasts': true,
    'CodeMasters': true,
    'ByteBusters': true,
    'RecursionRiders': true
  });

  // Contest Add Problems states
  const [isAddContestProblemOpen, setIsAddContestProblemOpen] = useState(false);
  const [contestAddedProblemIds, setContestAddedProblemIds] = useState<Set<number>>(new Set());

  // Create Contest Password states
  const [newContestPassword, setNewContestPassword] = useState('');
  const [newContestConfirmPassword, setNewContestConfirmPassword] = useState('');

  // Hash-based routing synchronization
  useEffect(() => {
    const handleRouting = () => {
      let currentHash = window.location.hash || '#dashboard';

      // Close active review player and modals when navigating tabs
      setReviewingCourse(null);
      setReviewingContest(null);
      setReviewContestTab('overview');
      setReviewContestProblemId(null);
      setSelectedAppForReview(null);
      setSelectedUserDetail(null);
      setIsCreateProblemOpen(false);
      setIsEditProblemOpen(false);
      setEditingProblemId(null);
      setIsCreateContestOpen(false);
      setIsTestcaseModalOpen(false);
      setTestcaseProblem(null);
      setTestcasesList([]);
      setZipFile(null);

      if (currentHash === '#courses') {
        setActiveTab('courses');
      } else if (currentHash === '#problems') {
        setActiveTab('problems');
      } else if (currentHash === '#contest') {
        setActiveTab('contest');
      } else if (currentHash === '#instructor') {
        setActiveTab('instructor');
      } else if (currentHash === '#users') {
        setActiveTab('users');
      } else if (currentHash === '#financial') {
        setActiveTab('financial');
      } else {
        setActiveTab('dashboard');
      }
    };

    window.addEventListener('hashchange', handleRouting);
    handleRouting();

    const savedCollapsed = localStorage.getItem('admin-sidebar-collapsed');
    if (savedCollapsed !== null) {
      setIsSidebarCollapsed(savedCollapsed === 'true');
    } else {
      setIsSidebarCollapsed(window.innerWidth < 768);
    }

    return () => window.removeEventListener('hashchange', handleRouting);
  }, []);

  // useEffect for contest ticking countdown timer
  useEffect(() => {
    if (!reviewingContest) return;

    const status = reviewingContest.status || 'ENDED';

    if (status === 'ENDED' || status === 'CANCELLED') {
      setContestTimeLeft('Ended');
      setContestTimerLabel('Contest Ended');
      return;
    }

    const targetTime = status === 'UPCOMING' ? reviewingContest.startTime : reviewingContest.endTime;
    const label = status === 'UPCOMING' ? 'Begins In' : 'Ends In';
    setContestTimerLabel(label);

    const updateTimer = () => {
      const now = Date.now();
      const end = new Date(targetTime).getTime();
      const diff = end - now;

      if (diff <= 0) {
        setContestTimeLeft('Ended');
        setContestTimerLabel('Contest Ended');
        return;
      }

      const hrs = Math.floor(diff / (1000 * 60 * 60));
      const mins = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
      const secs = Math.floor((diff % (1000 * 60)) / 1000);

      const pad = (n: number) => String(n).padStart(2, '0');
      setContestTimeLeft(`${pad(hrs)}:${pad(mins)}:${pad(secs)}`);
    };

    updateTimer();
    const timer = setInterval(updateTimer, 1000);
    return () => clearInterval(timer);
  }, [reviewingContest]);

  const showContestToast = (msg: string) => {
    setContestToastMessage(msg);
    setTimeout(() => setContestToastMessage(null), 4000);
  };

  const handleContestSubmit = () => {
    setContestEditorStatus('Running');
    showContestToast('Submitting solution... Evaluating sample cases...');
    setTimeout(() => {
      setContestEditorStatus('Success');
      setContestSuccessOverlay(true);
      showContestToast('All test cases passed successfully!');
    }, 2000);
  };

  const toggleSidebar = () => {
    setIsSidebarCollapsed(prev => {
      localStorage.setItem('admin-sidebar-collapsed', String(!prev));
      return !prev;
    });
  };

  // Fetch all dashboard data
  const loadData = async () => {
    setLoading(true);
    try {
      const [
        statsRes,
        coursesRes,
        appsRes,
        instsRes,
        usersRes,
        probsRes,
        contestsRes,
        recentDepositsRes,
        tagsRes
      ] = await Promise.all([
        adminService.getDashboardStats(),
        adminService.getCourses(),
        adminService.getInstructorApplications(),
        adminService.getInstructors(),
        adminService.getUsers(),
        adminService.getProblems(),
        adminService.getContests(),
        adminService.getRecentDeposits(),
        adminService.getTags()
      ]);

      setStats(statsRes);
      setCourses(coursesRes);
      setApplications(appsRes);
      setInstructors(instsRes);
      setUsers(usersRes);
      setProblems(probsRes);
      setContests(contestsRes);
      setRecentDeposits(recentDepositsRes);
      setAllTags(tagsRes || []);
    } catch (error) {
      console.error("Error loading admin dashboard data:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadData();
  }, []);



  // Add Problem form state
  const [newProbTitle, setNewProbTitle] = useState('');
  const [newProbDesc, setNewProbDesc] = useState('');
  const [newProbInputDesc, setNewProbInputDesc] = useState('');
  const [newProbOutputDesc, setNewProbOutputDesc] = useState('');
  const [newProbConstraints, setNewProbConstraints] = useState('');
  const [newProbExampleInput, setNewProbExampleInput] = useState('');
  const [newProbExampleOutput, setNewProbExampleOutput] = useState('');
  const [newProbHint, setNewProbHint] = useState('');
  const [newProbScope, setNewProbScope] = useState<'LESSON' | 'CONTEST' | 'SHARED' | 'PRACTICE'>('PRACTICE');
  const [newProbDifficulty, setNewProbDifficulty] = useState<'EASY' | 'MEDIUM' | 'HARD'>('MEDIUM');
  const [newProbScore, setNewProbScore] = useState(100);
  const [newProbTimeLimit, setNewProbTimeLimit] = useState(2000);
  const [newProbMemoryLimit, setNewProbMemoryLimit] = useState(128000);
  const [newProbIsPublic, setNewProbIsPublic] = useState(true);
  const [newProbSolutions, setNewProbSolutions] = useState('');
  const [newProbTags, setNewProbTags] = useState<string[]>([]);
  const [newProbStarterC, setNewProbStarterC] = useState('');
  const [newProbStarterCpp, setNewProbStarterCpp] = useState('');
  const [newProbStarterJava, setNewProbStarterJava] = useState('');
  const [newProbStarterPython, setNewProbStarterPython] = useState('');
  const [newProbStarterCsharp, setNewProbStarterCsharp] = useState('');
  const [allTags, setAllTags] = useState<{ id: number; name: string; slug: string }[]>([]);
  const [starterActiveTab, setStarterActiveTab] = useState<'C' | 'C++' | 'Java' | 'Python 3' | 'C#'>('C');

  // Add Contest form state
  const [newContestTitle, setNewContestTitle] = useState('');
  const [newContestDesc, setNewContestDesc] = useState('');
  const [newContestScoringRule, setNewContestScoringRule] = useState<'ICPC' | 'IOI' | 'CUSTOM'>('ICPC');
  const [newContestStartTime, setNewContestStartTime] = useState('');
  const [newContestEndTime, setNewContestEndTime] = useState('');

  const dashboardTimeFilter = '12';

  // SVG Chart Computations
  const financialChartData = useMemo(() => adminService.getFinancialChartData(), []);

  // Financial Page state variables
  const [financialTimeFilter, setFinancialTimeFilter] = useState<'month' | '3months' | '9months' | '12months' | 'custom'>('12months');
  const [financialStartDate, setFinancialStartDate] = useState<string>('');
  const [financialEndDate, setFinancialEndDate] = useState<string>('');
  const [hoveredMonthIndex, setHoveredMonthIndex] = useState<number | null>(null);
  const [hoveredCourseSalesIndex, setHoveredCourseSalesIndex] = useState<number | null>(null);
  // 12-month raw financial records (Jul 25 to Jun 26)
  const financialMonthlyRecords = useMemo(() => {
    const rawChartData = [
      { label: 'Jul 25', datePrefix: '2025-07', gross: 14000000, count: 28, rewards: 800000, server: 1200000, marketing: 1000000 },
      { label: 'Aug 25', datePrefix: '2025-08', gross: 16500000, count: 33, rewards: 1000000, server: 1200000, marketing: 1200000 },
      { label: 'Sep 25', datePrefix: '2025-09', gross: 15000000, count: 30, rewards: 1200000, server: 1200000, marketing: 1000000 },
      { label: 'Oct 25', datePrefix: '2025-10', gross: 17200000, count: 34, rewards: 900000, server: 1200000, marketing: 1500000 },
      { label: 'Nov 25', datePrefix: '2025-11', gross: 19000000, count: 38, rewards: 1000000, server: 1500000, marketing: 1500000 },
      { label: 'Dec 25', datePrefix: '2025-12', gross: 21500000, count: 43, rewards: 1500000, server: 1500000, marketing: 2000000 },
      { label: 'Jan 26', datePrefix: '2026-01', gross: 12000000, count: 24, rewards: 800000, server: 1500000, marketing: 800000 },
      { label: 'Feb 26', datePrefix: '2026-02', gross: 15000000, count: 30, rewards: 1000000, server: 1500000, marketing: 1000000 },
      { label: 'Mar 26', datePrefix: '2026-03', gross: 18500000, count: 37, rewards: 1200000, server: 1500000, marketing: 1500000 },
      { label: 'Apr 26', datePrefix: '2026-04', gross: 16000000, count: 32, rewards: 1000000, server: 1500000, marketing: 1200000 },
      { label: 'May 26', datePrefix: '2026-05', gross: 22000000, count: 44, rewards: 1500000, server: 1500000, marketing: 1800000 },
      { label: 'Jun 26', datePrefix: '2026-06', gross: 24580000, count: 49, rewards: 1800000, server: 1500000, marketing: 2000000 }
    ];

    return rawChartData.map(item => {
      const gross = item.gross;
      const instructorShare = Math.round(gross * 0.7);
      const platformShare = Math.round(gross * 0.3);
      const gatewayFees = Math.round(gross * 0.02);
      const otherExpenses = item.server + item.marketing + gatewayFees;
      const netProfit = platformShare - item.rewards - otherExpenses;
      const datePrefix = item.datePrefix;
      const days = datePrefix.endsWith('02') ? 28 : (['04', '06', '09', '11'].some(m => datePrefix.endsWith(m)) ? 30 : 31);

      return {
        label: item.label,
        startDate: `${datePrefix}-01`,
        endDate: `${datePrefix}-${days}`,
        grossRevenue: gross,
        coursesSold: item.count,
        contestRewards: item.rewards,
        otherExpenses,
        serverCosts: item.server,
        marketingCosts: item.marketing,
        gatewayFees,
        instructorShare,
        platformShare,
        netProfit
      };
    });
  }, []);

  // Filtered dataset according to UI state
  const filteredFinancialData = useMemo(() => {
    if (financialTimeFilter === 'custom') {
      if (!financialStartDate && !financialEndDate) return financialMonthlyRecords;
      return financialMonthlyRecords.filter(r => {
        const recordStart = new Date(r.startDate).getTime();
        const recordEnd = new Date(r.endDate).getTime();
        const filterStart = financialStartDate ? new Date(financialStartDate).getTime() : -Infinity;
        const filterEnd = financialEndDate ? new Date(financialEndDate).getTime() : Infinity;
        return recordStart >= filterStart && recordEnd <= filterEnd;
      });
    }

    switch (financialTimeFilter) {
      case 'month':
        return financialMonthlyRecords.slice(11);
      case '3months':
        return financialMonthlyRecords.slice(9);
      case '9months':
        return financialMonthlyRecords.slice(3);
      case '12months':
      default:
        return financialMonthlyRecords;
    }
  }, [financialTimeFilter, financialStartDate, financialEndDate, financialMonthlyRecords]);

  // Aggregated Summary of metrics
  const financialSummary = useMemo(() => {
    let gross = 0;
    let platformNet = 0;
    let coursesSold = 0;
    let contestRewards = 0;
    let otherExpenses = 0;
    let netProfit = 0;
    let instructorPayouts = 0;
    let serverCosts = 0;
    let marketingCosts = 0;
    let gatewayFees = 0;

    filteredFinancialData.forEach(item => {
      gross += item.grossRevenue;
      platformNet += item.platformShare;
      coursesSold += item.coursesSold;
      contestRewards += item.contestRewards;
      otherExpenses += item.otherExpenses;
      netProfit += item.netProfit;
      instructorPayouts += item.instructorShare;
      serverCosts += item.serverCosts;
      marketingCosts += item.marketingCosts;
      gatewayFees += item.gatewayFees;
    });

    return {
      gross,
      platformNet,
      coursesSold,
      contestRewards,
      otherExpenses,
      netProfit,
      instructorPayouts,
      serverCosts,
      marketingCosts,
      gatewayFees
    };
  }, [filteredFinancialData]);

  // SVG coordinate calculator for 12-month revenue line chart
  const lineChartPoints = useMemo(() => {
    const maxAmount = Math.max(...financialChartData.map(m => m.amount), 1000000);
    const roundMax = Math.ceil(maxAmount / 5000000) * 5000000;

    const width = 640;
    const height = 220;
    const paddingLeft = 60;
    const paddingRight = 20;
    const paddingTop = 20;
    const paddingBottom = 30;

    const chartWidth = width - paddingLeft - paddingRight;
    const chartHeight = height - paddingTop - paddingBottom;

    const points = financialChartData.map((m, idx) => {
      const x = paddingLeft + (idx * (chartWidth / 11));
      const y = paddingTop + chartHeight - (m.amount / roundMax) * chartHeight;
      return { x, y, label: m.label, amount: m.amount };
    });

    return { points, width, height, paddingLeft, paddingRight, paddingTop, paddingBottom, chartWidth, chartHeight, roundMax };
  }, [financialChartData]);

  // Top course categories data and computations for SVG Donut Chart
  const categoryChartData = useMemo(() => {
    const months = parseInt(dashboardTimeFilter);
    // Simulate slight filter variations
    const multiplier = months / 12;
    return [
      { name: 'Web Developer', count: Math.round(180 * multiplier), color: '#F36F21' },
      { name: 'Data Science & AI', count: Math.round(140 * multiplier), color: '#12284C' },
      { name: 'Mobile App', count: Math.round(95 * multiplier), color: '#10B981' },
      { name: 'Cloud Computing', count: Math.round(65 * multiplier), color: '#3B82F6' },
      { name: 'Others', count: Math.round(40 * multiplier), color: '#6B7280' },
    ];
  }, [dashboardTimeFilter]);

  const categoryTotal = useMemo(() => categoryChartData.reduce((sum, c) => sum + c.count, 0), [categoryChartData]);

  // Top courses data and computations for SVG Donut Chart
  const topCoursesChartData = useMemo(() => {
    const months = parseInt(dashboardTimeFilter);
    const multiplier = months / 12;
    return [
      { name: 'React Full-Stack', instructor: 'Dr. Jenkins', count: Math.round(120 * multiplier), color: '#F36F21' },
      { name: 'Java Algorithms', instructor: 'Alice Miller', count: Math.round(95 * multiplier), color: '#10B981' },
      { name: 'Go Microservices', instructor: 'John Doe', count: Math.round(80 * multiplier), color: '#3B82F6' },
      { name: 'Python ML', instructor: 'Dr. Jenkins', count: Math.round(50 * multiplier), color: '#6366F1' },
    ];
  }, [dashboardTimeFilter]);

  const topCoursesTotal = useMemo(() => topCoursesChartData.reduce((sum, c) => sum + c.count, 0), [topCoursesChartData]);

  // Top instructors data and computations for SVG Donut Chart
  const topInstructorsChartData = useMemo(() => {
    const months = parseInt(dashboardTimeFilter);
    const multiplier = months / 12;
    return [
      { name: 'Dr. Jenkins', count: Math.round(170 * multiplier), color: '#F36F21' },
      { name: 'Alice Miller', count: Math.round(115 * multiplier), color: '#12284C' },
      { name: 'John Doe', count: Math.round(80 * multiplier), color: '#10B981' },
      { name: 'Sarah Connor', count: Math.round(55 * multiplier), color: '#3B82F6' },
    ];
  }, [dashboardTimeFilter]);

  const topInstructorsTotal = useMemo(() => topInstructorsChartData.reduce((sum, c) => sum + c.count, 0), [topInstructorsChartData]);

  // Top problems data and computations for SVG Donut Chart
  const topProblemsChartData = useMemo(() => {
    const months = parseInt(dashboardTimeFilter);
    const multiplier = months / 12;
    return [
      { name: 'Two Sum', difficulty: 'EASY', count: Math.round(350 * multiplier), color: '#F36F21' },
      { name: 'Binary Search', difficulty: 'EASY', count: Math.round(240 * multiplier), color: '#12284C' },
      { name: 'Longest Path', difficulty: 'HARD', count: Math.round(180 * multiplier), color: '#10B981' },
      { name: 'Valid Parentheses', difficulty: 'MEDIUM', count: Math.round(150 * multiplier), color: '#3B82F6' },
    ];
  }, [dashboardTimeFilter]);

  const topProblemsTotal = useMemo(() => topProblemsChartData.reduce((sum, c) => sum + c.count, 0), [topProblemsChartData]);

  // Action handlers
  const handleReviewCourse = (course: AdminCourse) => {
    setReviewingCourse(course);
    setReviewPlayerTab('overview');
    setReviewLectureTitle('1.1 Course Introduction');
    setReviewCurriculumSections({ sec1: true });
    setReviewCurrentProblem(null);
    setReviewSolveLang('Java');
    setReviewSolveCode(problemData['Two Sum']?.code?.['Java'] || '');
  };

  const handleApproveCourse = async (courseId: string, status: 'APPROVED' | 'REJECTED') => {
    try {
      const updated = await adminService.approveCourse(courseId, status);
      setCourses(prev => prev.map(c => c.id === courseId ? updated : c));

      setReviewingCourse(null);
      // reload stats
      const newStats = await adminService.getDashboardStats();
      setStats(newStats);
      showGlobalToast(`Successfully ${status.toLowerCase()} course application.`, "success");
    } catch (error) {
      showGlobalToast("Failed to process course approval", "error");
    }
  };

  const handleApproveInstructor = async (appId: number, status: 'APPROVED' | 'REJECTED') => {
    try {
      const updated = await adminService.approveInstructorApplication(appId, status, "Approved by Admin dashboard panel");
      setApplications(prev => prev.map(a => a.id === appId ? updated : a));
      setSelectedAppForReview(null);
      // reload instructors and stats
      const [newStats, newInsts] = await Promise.all([
        adminService.getDashboardStats(),
        adminService.getInstructors()
      ]);
      setStats(newStats);
      setInstructors(newInsts);
      showGlobalToast(`Successfully ${status.toLowerCase()} instructor application.`, "success");
    } catch (error) {
      showGlobalToast("Failed to process instructor application approval", "error");
    }
  };

  const handleUserStatusChange = async (userId: number, newStatus: 'ACTIVE' | 'LOCKED') => {
    const confirmMsg = `Are you sure you want to change this user status to ${newStatus}?`;
    triggerConfirm(
      "Change User Status",
      confirmMsg,
      async () => {
        try {
          const updated = await adminService.setUserLockStatus(userId, newStatus);
          setUsers(prev => prev.map(u => u.id === userId ? updated : u));
          if (selectedUserDetail?.id === userId) {
            setSelectedUserDetail(updated);
          }
          showGlobalToast(`User status successfully updated to ${newStatus}`, "success");
        } catch (error) {
          showGlobalToast("Failed to update user status", "error");
        }
      }
    );
  };

  const handleCreateProblemSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!newProbTitle.trim() || !newProbDesc.trim()) {
      showGlobalToast("Please fill in the title and description.", "error");
      return;
    }

    try {
      const starterTemplates: Record<string, string> = {};
      if (newProbStarterC) starterTemplates['C'] = newProbStarterC;
      if (newProbStarterCpp) starterTemplates['C++'] = newProbStarterCpp;
      if (newProbStarterJava) starterTemplates['Java'] = newProbStarterJava;
      if (newProbStarterPython) starterTemplates['Python 3'] = newProbStarterPython;
      if (newProbStarterCsharp) starterTemplates['C#'] = newProbStarterCsharp;

      const newProb = await adminService.createProblem({
        title: newProbTitle.trim(),
        description: newProbDesc.trim(),
        inputDescription: newProbInputDesc.trim(),
        outputDescription: newProbOutputDesc.trim(),
        constraints: newProbConstraints.trim(),
        exampleInput: newProbExampleInput.trim(),
        exampleOutput: newProbExampleOutput.trim(),
        hint: newProbHint.trim(),
        problemScope: newProbScope,
        difficulty: newProbDifficulty,
        totalTestcases: 0,
        timeLimitMs: newProbTimeLimit,
        memoryLimitKb: newProbMemoryLimit,
        isPublic: newProbIsPublic,
        score: newProbScore,
        solutions: newProbSolutions.trim(),
        tags: newProbTags,
        starterTemplates
      });

      setProblems(prev => [...prev, newProb]);

      // If there are testcases generated/added manually during creation, save them
      if (testcasesList.length > 0) {
        try {
          const tcsToSave = testcasesList.map((tc, idx) => ({
            ...tc,
            problemId: newProb.id,
            orderIndex: idx + 1
          }));
          const savedTcs = await adminService.saveProblemTestcases(newProb.id, tcsToSave);
          // Update totalTestcases on the newly created problem
          setProblems(prev => prev.map(p => 
            p.id === newProb.id ? { ...p, totalTestcases: savedTcs.length } : p
          ));
        } catch (tcError) {
          showGlobalToast("Problem created, but failed to save testcases.", "error");
        }
      }

      setIsCreateProblemOpen(false);

      // Reset form
      setNewProbTitle('');
      setNewProbDesc('');
      setNewProbInputDesc('');
      setNewProbOutputDesc('');
      setNewProbConstraints('');
      setNewProbExampleInput('');
      setNewProbExampleOutput('');
      setNewProbHint('');
      setNewProbScope('PRACTICE');
      setNewProbDifficulty('MEDIUM');
      setNewProbScore(100);
      setNewProbTimeLimit(2000);
      setNewProbMemoryLimit(128000);
      setNewProbIsPublic(true);
      setNewProbSolutions('');
      setNewProbTags([]);
      setNewProbStarterC('');
      setNewProbStarterCpp('');
      setNewProbStarterJava('');
      setNewProbStarterPython('');
      setNewProbStarterCsharp('');
      setStarterActiveTab('C');

      showGlobalToast(`Problem "${newProb.title}" created successfully!`, "success");
    } catch (error) {
      showGlobalToast("Failed to create problem", "error");
    }
  };

  const handleCreateProblemClick = () => {
    setEditingProblemId(null);
    setNewProbTitle('');
    setNewProbDesc('');
    setNewProbInputDesc('');
    setNewProbOutputDesc('');
    setNewProbConstraints('');
    setNewProbExampleInput('');
    setNewProbExampleOutput('');
    setNewProbHint('');
    setNewProbScope('PRACTICE');
    setNewProbDifficulty('MEDIUM');
    setNewProbScore(100);
    setNewProbTimeLimit(2000);
    setNewProbMemoryLimit(128000);
    setNewProbIsPublic(true);
    setNewProbSolutions('');
    setNewProbTags([]);
    setNewProbStarterC('');
    setNewProbStarterCpp('');
    setNewProbStarterJava('');
    setNewProbStarterPython('');
    setNewProbStarterCsharp('');
    setStarterActiveTab('C');
    setTestcasesList([{ problemId: 0, inputData: '', expectedOutput: '', orderIndex: 1 }]);
    setGeneratorCode(GENERATOR_TEMPLATES['cpp']);
    setGeneratorLanguage('cpp');
    setTestCaseGenerationMode('manual');
    setIsCreateProblemOpen(true);
  };

  const handleEditProblemClick = (p: AdminProblem) => {
    setEditingProblemId(p.id);
    setNewProbTitle(p.title);
    setNewProbDesc(p.description);
    setNewProbInputDesc(p.inputDescription || '');
    setNewProbOutputDesc(p.outputDescription || '');
    setNewProbConstraints(p.constraints || '');
    setNewProbExampleInput(p.exampleInput || '');
    setNewProbExampleOutput(p.exampleOutput || '');
    setNewProbHint(p.hint || '');
    setNewProbScope(p.problemScope);
    setNewProbDifficulty(p.difficulty);
    setNewProbScore(p.score);
    setNewProbTimeLimit(p.timeLimitMs);
    setNewProbMemoryLimit(p.memoryLimitKb);
    setNewProbIsPublic(p.isPublic);
    setNewProbSolutions(p.solutions || '');
    setNewProbTags(p.tags || []);
    setNewProbStarterC(p.starterTemplates?.['C'] || '');
    setNewProbStarterCpp(p.starterTemplates?.['C++'] || '');
    setNewProbStarterJava(p.starterTemplates?.['Java'] || '');
    setNewProbStarterPython(p.starterTemplates?.['Python 3'] || '');
    setNewProbStarterCsharp(p.starterTemplates?.['C#'] || '');
    setNewProbStarterCsharp(p.starterTemplates?.['C#'] || '');
    setStarterActiveTab('C');
    
    // Fetch testcases automatically for this problem
    adminService.getProblemTestcases(p.id).then(existing => {
      if (existing && existing.length > 0) {
        setTestcasesList(existing.map(tc => ({
          problemId: p.id,
          inputData: tc.inputData,
          expectedOutput: tc.expectedOutput,
          orderIndex: tc.orderIndex,
          scoreWeight: tc.scoreWeight,
          isHidden: tc.isHidden
        })));
      } else {
        setTestcasesList([]);
      }
    }).catch(() => {
      setTestcasesList([]);
    });

    setIsEditProblemOpen(true);
  };

  const handleEditProblemSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (editingProblemId === null) return;
    if (!newProbTitle.trim() || !newProbDesc.trim()) {
      showGlobalToast("Please fill in the title and description.", "error");
      return;
    }

    try {
      const existingProb = problems.find(p => p.id === editingProblemId);
      const starterTemplates: Record<string, string> = {};
      if (newProbStarterC) starterTemplates['C'] = newProbStarterC;
      if (newProbStarterCpp) starterTemplates['C++'] = newProbStarterCpp;
      if (newProbStarterJava) starterTemplates['Java'] = newProbStarterJava;
      if (newProbStarterPython) starterTemplates['Python 3'] = newProbStarterPython;
      if (newProbStarterCsharp) starterTemplates['C#'] = newProbStarterCsharp;

      const updatedProb = await adminService.updateProblem(editingProblemId, {
        title: newProbTitle.trim(),
        description: newProbDesc.trim(),
        inputDescription: newProbInputDesc.trim(),
        outputDescription: newProbOutputDesc.trim(),
        constraints: newProbConstraints.trim(),
        exampleInput: newProbExampleInput.trim(),
        exampleOutput: newProbExampleOutput.trim(),
        hint: newProbHint.trim(),
        problemScope: newProbScope,
        difficulty: newProbDifficulty,
        totalTestcases: existingProb?.totalTestcases || 0,
        timeLimitMs: newProbTimeLimit,
        memoryLimitKb: newProbMemoryLimit,
        isPublic: newProbIsPublic,
        score: newProbScore,
        solutions: newProbSolutions.trim(),
        tags: newProbTags,
        starterTemplates
      });

      // Save testcases
      try {
        const tcsToSave = testcasesList.map((tc, idx) => ({
          ...tc,
          problemId: editingProblemId,
          orderIndex: idx + 1
        }));
        const savedTcs = await adminService.saveProblemTestcases(editingProblemId, tcsToSave);
        updatedProb.totalTestcases = savedTcs.length;
      } catch (tcError) {
        showGlobalToast("Problem metadata updated, but failed to save testcases.", "error");
      }

      setProblems(prev => prev.map(p => p.id === editingProblemId ? updatedProb : p));
      setIsEditProblemOpen(false);
      setEditingProblemId(null);

      // Reset form
      setNewProbTitle('');
      setNewProbDesc('');
      setNewProbInputDesc('');
      setNewProbOutputDesc('');
      setNewProbConstraints('');
      setNewProbExampleInput('');
      setNewProbExampleOutput('');
      setNewProbHint('');
      setNewProbScope('PRACTICE');
      setNewProbDifficulty('MEDIUM');
      setNewProbScore(100);
      setNewProbTimeLimit(2000);
      setNewProbMemoryLimit(128000);
      setNewProbIsPublic(true);
      setNewProbSolutions('');
      setNewProbTags([]);
      setNewProbStarterC('');
      setNewProbStarterCpp('');
      setNewProbStarterJava('');
      setNewProbStarterPython('');
      setNewProbStarterCsharp('');
      setStarterActiveTab('C');

      showGlobalToast(`Problem "${updatedProb.title}" updated successfully!`, "success");
    } catch (error) {
      showGlobalToast("Failed to update problem", "error");
    }
  };

  const handleUpdateProblemScope = async (problemId: number, scope: 'PRACTICE' | 'CONTEST') => {
    try {
      const updated = await adminService.updateProblemScope(problemId, scope);
      setProblems(prev => prev.map(p => p.id === problemId ? updated : p));
    } catch (error) {
      showGlobalToast("Failed to update problem scope.", "error");
    }
  };

  const handleUpdateProblemPublicStatus = async (problemId: number, isPublic: boolean) => {
    try {
      const updated = await adminService.updateProblemPublicStatus(problemId, isPublic);
      setProblems(prev => prev.map(p => p.id === problemId ? updated : p));
      showGlobalToast(`Problem successfully ${isPublic ? "published" : "made private"}.`, "success");
    } catch (error) {
      showGlobalToast("Failed to update publication status.", "error");
    }
  };

  const handleDeleteProblemClick = async (problemId: number) => {
    triggerConfirm(
      "Delete Problem",
      "Are you sure you want to delete this programming problem? This action cannot be undone.",
      async () => {
        try {
          await adminService.deleteProblem(problemId);
          setProblems(prev => prev.filter(p => p.id !== problemId));
          showGlobalToast("Problem deleted successfully.", "success");
        } catch (error) {
          showGlobalToast("Failed to delete problem.", "error");
        }
      }
    );
  };

  const handleRunAndGenerateTestcases = async () => {
    setGenerateError(null);
    setGenerateLoading(true);
    try {
      const response = await fetch('http://localhost:8080/nonstopcoding/instructor/testcases/generate', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        credentials: 'include',
        body: JSON.stringify({
          language: generatorLanguage,
          code: generatorCode
        })
      });
      
      const data = await response.json();
      
      if (!response.ok) {
        throw new Error(data.message || 'An error occurred while generating testcases.');
      }
      
      const generatedTestcases = data.result;
      if (generatedTestcases && generatedTestcases.length > 0) {
        setTestcasesList(prev => [
          ...prev, 
          ...generatedTestcases.map((tc: any, index: number) => ({
             problemId: editingProblemId || 0,
             inputData: tc.input,
             expectedOutput: tc.output,
             orderIndex: prev.length + index + 1,
             isHidden: false
          }))
        ]);
        setTestCaseGenerationMode('manual'); // Switch back to view them
        showGlobalToast(`Generated ${generatedTestcases.length} testcases successfully!`, "success");
      } else {
        setGenerateError("Code executed successfully but no test cases were found. Please check your output format.");
      }
    } catch (err: any) {
      setGenerateError(err.message || "An error occurred while generating testcases.");
    } finally {
      setGenerateLoading(false);
    }
  };

  const handleOpenTestcaseModal = async (p: AdminProblem) => {
    setTestcaseProblem(p);
    setTestcaseTab('manual');
    setZipFile(null);
    setIsTestcaseModalOpen(true);
    try {
      const existing = await adminService.getProblemTestcases(p.id);
      if (existing && existing.length > 0) {
        setTestcasesList(existing.map(tc => ({
          problemId: tc.problemId,
          inputData: tc.inputData,
          expectedOutput: tc.expectedOutput,
          orderIndex: tc.orderIndex
        })));
      } else {
        setTestcasesList([{ problemId: p.id, inputData: '', expectedOutput: '', orderIndex: 0 }]);
      }
    } catch (error) {
      console.error("Failed to load test cases:", error);
      setTestcasesList([{ problemId: p.id, inputData: '', expectedOutput: '', orderIndex: 0 }]);
    }
  };

  const handleSaveTestcases = async () => {
    if (!testcaseProblem) return;
    setIsSavingTestcases(true);
    try {
      let savedTcs: AdminProblemTestcase[] = [];
      if (testcaseTab === 'manual') {
        const invalid = testcasesList.some(tc => !tc.inputData.trim() || !tc.expectedOutput.trim());
        if (invalid) {
          showGlobalToast("Please fill in both Input Data and Expected Output for all test cases.", "error");
          setIsSavingTestcases(false);
          return;
        }
        savedTcs = await adminService.saveProblemTestcases(testcaseProblem.id, testcasesList);
      } else {
        if (!zipFile) {
          showGlobalToast("Please select a .zip archive containing test cases.", "error");
          setIsSavingTestcases(false);
          return;
        }
        savedTcs = await adminService.uploadTestcaseZip(testcaseProblem.id, zipFile);
      }

      setProblems(prev => prev.map(p => p.id === testcaseProblem.id ? {
        ...p,
        totalTestcases: savedTcs.length,
        isActive: savedTcs.length > 0,
        isPublic: savedTcs.length > 0 ? true : p.isPublic
      } : p));

      showGlobalToast(`Successfully saved ${savedTcs.length} test cases for "${testcaseProblem.title}"!`, "success");

      // Auto-jump/switch to the corresponding scope tab
      const scope = testcaseProblem.problemScope;
      if (scope === 'PRACTICE') {
        setProblemSubTab('practice');
      } else if (scope === 'CONTEST') {
        setProblemSubTab('contest');
      } else if (scope === 'SHARED') {
        setProblemSubTab('shared');
      }

      setIsTestcaseModalOpen(false);
      setTestcaseProblem(null);
      setTestcasesList([]);
      setZipFile(null);
    } catch (error) {
      showGlobalToast("Failed to save test cases.", "error");
    } finally {
      setIsSavingTestcases(false);
    }
  };

  const handleDrag = (e: React.DragEvent) => {
    e.preventDefault();
    e.stopPropagation();
    if (e.type === "dragenter" || e.type === "dragover") {
      setDragActive(true);
    } else if (e.type === "dragleave") {
      setDragActive(false);
    }
  };

  const handleDrop = (e: React.DragEvent) => {
    e.preventDefault();
    e.stopPropagation();
    setDragActive(false);
    if (e.dataTransfer.files && e.dataTransfer.files[0]) {
      const file = e.dataTransfer.files[0];
      if (file.name.endsWith('.zip')) {
        setZipFile(file);
      } else {
        showGlobalToast("Only .zip files are supported.", "error");
      }
    }
  };

  const handleFileChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    if (e.target.files && e.target.files[0]) {
      const file = e.target.files[0];
      if (file.name.endsWith('.zip')) {
        setZipFile(file);
      } else {
        showGlobalToast("Only .zip files are supported.", "error");
      }
    }
  };

  const handleAddManualRow = () => {
    if (!testcaseProblem) return;
    setTestcasesList(prev => [...prev, {
      problemId: testcaseProblem.id,
      inputData: '',
      expectedOutput: '',
      orderIndex: prev.length
    }]);
  };

  const handleRemoveManualRow = (index: number) => {
    setTestcasesList(prev => {
      const filtered = prev.filter((_, idx) => idx !== index);
      return filtered.map((tc, idx) => ({ ...tc, orderIndex: idx }));
    });
  };

  const handleManualRowChange = (index: number, field: 'inputData' | 'expectedOutput', value: string) => {
    setTestcasesList(prev => prev.map((tc, idx) => idx === index ? { ...tc, [field]: value } : tc));
  };

  const handleCreateContestSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!newContestTitle.trim() || !newContestStartTime || !newContestEndTime) {
      showGlobalToast("Please fill in the title and duration dates.", "error");
      return;
    }

    if (newContestPassword !== newContestConfirmPassword) {
      showGlobalToast("Passwords do not match!", "error");
      return;
    }

    const start = new Date(newContestStartTime).getTime();
    const end = new Date(newContestEndTime).getTime();
    if (end <= start) {
      showGlobalToast("End Time must be after Start Time!", "error");
      return;
    }

    const computedDuration = Math.round((end - start) / 60000);

    try {
      const newContest = await adminService.createContest({
        title: newContestTitle.trim(),
        description: newContestDesc.trim(),
        scoringRule: newContestScoringRule,
        startTime: newContestStartTime,
        endTime: newContestEndTime,
        durations: computedDuration,
        password: newContestPassword.trim() || undefined
      });

      setContests(prev => [...prev, newContest]);
      setIsCreateContestOpen(false);

      // Reset form
      setNewContestTitle('');
      setNewContestDesc('');
      setNewContestScoringRule('ICPC');
      setNewContestStartTime('');
      setNewContestEndTime('');
      setNewContestPassword('');
      setNewContestConfirmPassword('');

      // update stats
      const newStats = await adminService.getDashboardStats();
      setStats(newStats);

      showGlobalToast(`Contest "${newContest.title}" created successfully!`, "success");
    } catch (error) {
      showGlobalToast("Failed to create contest", "error");
    }
  };

  // Computations for filters
  const filteredCourses = useMemo(() => {
    if (courseFilter === 'ALL') return courses;
    return courses.filter(c => c.status === courseFilter);
  }, [courses, courseFilter]);

  const filteredApplications = useMemo(() => {
    if (instructorAppFilter === 'ALL') return applications;
    return applications.filter(a => a.status === instructorAppFilter);
  }, [applications, instructorAppFilter]);

  const filteredUsers = useMemo(() => {
    return users.filter(u => {
      const matchesSearch = u.name.toLowerCase().includes(userSearch.toLowerCase()) || u.email.toLowerCase().includes(userSearch.toLowerCase());
      const matchesStatus = userStatusFilter === 'ALL' || u.status === userStatusFilter;
      const matchesOnline = userOnlineFilter === 'ALL' || 
        (userOnlineFilter === 'ONLINE' ? !!u.isOnline : !u.isOnline);
      return matchesSearch && matchesStatus && matchesOnline;
    });
  }, [users, userSearch, userStatusFilter, userOnlineFilter]);

  const filteredProblems = useMemo(() => {
    return problems.filter(p => {
      const matchesSearch = p.title.toLowerCase().includes(problemSearch.toLowerCase()) || p.description.toLowerCase().includes(problemSearch.toLowerCase());
      const matchesDifficulty = problemDifficultyFilter === 'ALL' || p.difficulty === problemDifficultyFilter;
      const matchesScope = problemScopeFilter === 'ALL' || p.problemScope === problemScopeFilter;

      let matchesSubTab = false;
      if (problemSubTab === 'repository') {
        matchesSubTab = true; // All problems
      } else if (problemSubTab === 'practice') {
        matchesSubTab = p.problemScope === 'PRACTICE';
      } else if (problemSubTab === 'contest') {
        matchesSubTab = p.problemScope === 'CONTEST';
      } else if (problemSubTab === 'shared') {
        matchesSubTab = p.problemScope === 'SHARED';
      }

      return matchesSearch && matchesDifficulty && matchesScope && matchesSubTab;
    });
  }, [problems, problemSearch, problemDifficultyFilter, problemScopeFilter, problemSubTab]);

  const filteredContests = useMemo(() => {
    if (contestStatusFilter === 'ALL') return contests;
    return contests.filter(c => c.status === contestStatusFilter);
  }, [contests, contestStatusFilter]);

  // Auth checking context (Only allow role == ADMIN, or default username admin, let's keep it safe)
  // const isAdmin = useMemo(() => {
  //   return (user?.role as string) === 'ADMIN' || user?.username?.toLowerCase().includes('admin') || true;
  // }, [user]);

  // Temporary bypass for UI testing
  if (false) {
    return (
      <div className="bg-surface rounded-2xl border border-gray-150 p-12 text-center shadow-sm max-w-md mx-auto my-12 relative z-10">
        <span className="material-symbols-outlined text-red-500 text-5xl mb-4">lock</span>
        <h3 className="font-display font-black text-xl text-brand-blue mb-2">Access Denied</h3>
        <p className="font-body text-sm text-text-muted mb-6">Only administrators can access the Admin Dashboard.</p>
        <Link to="/login" className="bg-primary hover:bg-primary-hover text-white font-bold text-sm px-6 py-3 rounded-xl transition-all shadow-md">
          Sign In as Admin
        </Link>
      </div>
    );
  }

  return (
    <div className="bg-[#f0f4f9] text-text-main font-body min-h-screen flex flex-row antialiased selection:bg-primary-light selection:text-brand-blue relative overflow-x-hidden w-full text-left">
      <style>{`
        .material-symbols-outlined {
          font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        }
        .icon-fill {
          font-variation-settings: 'FILL' 1;
        }
        .glass-panel {
          background: rgba(255, 255, 255, 0.85);
          backdrop-filter: blur(12px);
          -webkit-backdrop-filter: blur(12px);
          border: 1px solid rgba(255, 255, 255, 0.5);
        }
        .ambient-shadow {
          box-shadow: 0 4px 20px rgba(18, 40, 76, 0.04);
        }
        .sidebar-expanded { width: 16rem !important; }
        .sidebar-collapsed { width: 5rem !important; }
        .main-expanded { margin-left: 16rem !important; }
        .main-collapsed { margin-left: 5rem !important; }
        .sidebar-collapsed .sidebar-text, .sidebar-collapsed .sidebar-footer-text { display: none !important; }
        .sidebar-collapsed nav a { justify-content: center !important; padding-left: 0 !important; }
        .sidebar-collapsed .p-3 a, .sidebar-collapsed .p-3 div.flex { justify-content: center !important; }
        .sidebar-collapsed #sidebar-header { flex-direction: column !important; padding: 1.25rem 0.5rem !important; }
      `}</style>

      {/* Decorative Glow Elements */}
      <div className="fixed inset-0 pointer-events-none z-0 overflow-hidden">
        <div className="absolute -top-40 -left-40 w-[550px] h-[550px] bg-primary/5 rounded-full blur-[130px]"></div>
        <div className="absolute top-1/3 -right-40 w-[500px] h-[500px] bg-brand-blue/5 rounded-full blur-[120px]"></div>
        <div className="absolute bottom-0 left-1/3 w-[600px] h-[600px] bg-[#10B981]/5 rounded-full blur-[150px]"></div>
      </div>

      {/* Admin Collapsible Sidebar */}
      <aside
        className={`fixed top-0 left-0 h-screen transition-all duration-300 ${isSidebarCollapsed ? 'sidebar-collapsed' : 'sidebar-expanded'
          } bg-brand-blue text-white flex flex-col justify-between z-50 border-r border-brand-blue-light/35 shadow-2xl shrink-0 overflow-visible`}
      >
        <div className="flex items-center justify-center px-4 h-20 border-b border-brand-blue-light/30 shrink-0" id="sidebar-header">
          <Link to="/" className="flex items-center justify-center w-full">
            <img
              src={isSidebarCollapsed ? `${import.meta.env.BASE_URL}LOGO_SINGLE.png` : `${import.meta.env.BASE_URL}LOGO.png`}
              alt="Logo"
              className="h-12 w-[300px] object-contain transition-all duration-300"
            />
          </Link>
        </div>

        {/* Sidebar Nav */}
        <nav className="flex-1 flex flex-col gap-1.5 py-6 px-2.5 overflow-y-auto">
          <a
            href="#dashboard"
            onClick={() => setActiveTab('dashboard')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${activeTab === 'dashboard' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
              }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'dashboard' ? 'text-primary icon-fill' : ''}`}>dashboard</span>
            <span className="sidebar-text text-sm">Dashboard</span>
          </a>

          <a
            href="#courses"
            onClick={() => setActiveTab('courses')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${activeTab === 'courses' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
              }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'courses' ? 'text-primary icon-fill' : ''}`}>library_books</span>
            <span className="sidebar-text text-sm">Courses</span>
          </a>

          <a
            href="#problems"
            onClick={() => setActiveTab('problems')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${activeTab === 'problems' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
              }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'problems' ? 'text-primary icon-fill' : ''}`}>task</span>
            <span className="sidebar-text text-sm">Problems</span>
          </a>

          <a
            href="#contest"
            onClick={() => setActiveTab('contest')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${activeTab === 'contest' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
              }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'contest' ? 'text-primary icon-fill' : ''}`}>emoji_events</span>
            <span className="sidebar-text text-sm">Contest</span>
          </a>

          <a
            href="#instructor"
            onClick={() => setActiveTab('instructor')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${activeTab === 'instructor' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
              }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'instructor' ? 'text-primary icon-fill' : ''}`}>school</span>
            <span className="sidebar-text text-sm">Instructor</span>
          </a>

          <a
            href="#users"
            onClick={() => setActiveTab('users')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${activeTab === 'users' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
              }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'users' ? 'text-primary icon-fill' : ''}`}>group</span>
            <span className="sidebar-text text-sm">Users</span>
          </a>

          <a
            href="#financial"
            onClick={() => setActiveTab('financial')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${activeTab === 'financial' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
              }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'financial' ? 'text-primary icon-fill' : ''}`}>insights</span>
            <span className="sidebar-text text-sm">Financial Stats</span>
          </a>
        </nav>

        {/* Sidebar Footer actions */}
        <div className="p-3 border-t border-brand-blue-light/30 flex flex-col gap-3 shrink-0">
          <Link
            to="/dashboard"
            className="flex items-center gap-3 px-3 py-2.5 rounded-xl bg-primary hover:bg-primary-hover text-white text-xs md:text-sm font-semibold transition-all duration-200 justify-center md:justify-start shadow-md shadow-primary/20"
          >
            <span className="material-symbols-outlined text-[20px] shrink-0">swap_horiz</span>
            <span className="sidebar-footer-text whitespace-nowrap">Student View</span>
          </Link>

          <div className="flex items-center gap-3 p-2 rounded-xl bg-brand-blue-light/30">
            <img
              src="https://ui-avatars.com/api/?name=Admin+User&background=12284C&color=fff"
              alt="Admin Avatar"
              className="w-8 h-8 rounded-full border border-primary/40 object-cover shrink-0"
            />
            <div className="sidebar-footer-text flex flex-col min-w-0">
              <span className="text-xs font-bold text-white truncate leading-tight">Admin System</span>
              <span className="text-[10px] text-slate-400 truncate leading-none">Super Administrator</span>
            </div>
          </div>
        </div>

        {/* Center line toggle */}
        <button
          onClick={toggleSidebar}
          className="absolute top-1/2 -right-4 -translate-y-1/2 w-8 h-8 rounded-full bg-primary hover:bg-primary-hover text-white flex items-center justify-center shadow-lg border border-white/20 z-50 transition-all duration-300 hover:scale-110"
        >
          <span className="material-symbols-outlined text-[20px]">
            {isSidebarCollapsed ? 'chevron_right' : 'chevron_left'}
          </span>
        </button>
      </aside>

      {/* Main Content Area */}
      <div
        id="main-content"
        className={`flex-grow transition-all duration-300 relative z-10 ${isSidebarCollapsed ? 'main-collapsed' : 'main-expanded'
          } min-h-screen flex flex-col`}
      >
        {loading ? (
          <div className="flex-grow flex items-center justify-center">
            <div className="flex flex-col items-center gap-3">
              <span className="animate-spin material-symbols-outlined text-4xl text-primary">sync</span>
              <p className="text-sm text-text-muted font-bold">Synchronizing Admin Panel Data...</p>
            </div>
          </div>
        ) : (activeTab === 'courses' && reviewingCourse) ? (
          <div className="flex-grow flex flex-col bg-[#f0f4f9] animate-fade-in w-full">
            {/* Admin Review Action Banner */}
            <div className="bg-gradient-to-r from-amber-50 via-orange-50 to-amber-50 border-b border-amber-200 px-6 py-3 flex items-center justify-between shrink-0 shadow-sm sticky top-0 z-20">
              <div className="flex items-center gap-3">
                <button
                  onClick={() => setReviewingCourse(null)}
                  className="flex items-center gap-1.5 text-sm text-slate-600 font-bold hover:text-primary transition-colors bg-white/80 border border-slate-200 px-3 py-1.5 rounded-lg"
                >
                  <span className="material-symbols-outlined text-[18px]">arrow_back</span>
                  Back to Courses
                </button>
                <div className="h-6 w-px bg-amber-200"></div>
                <span className="material-symbols-outlined text-amber-600 text-[22px]">rate_review</span>
                <div>
                  <p className="text-[10px] font-black uppercase tracking-wider text-amber-700">Admin Review Mode</p>
                  <p className="text-xs font-semibold text-amber-900 leading-tight">{reviewingCourse.title}</p>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <span className="text-xs text-amber-700 font-semibold hidden md:inline">By {reviewingCourse.instructorName} • {reviewingCourse.price.toLocaleString('vi-VN')} ₫</span>
                <button
                  onClick={() => handleApproveCourse(reviewingCourse.id, 'APPROVED')}
                  className="bg-emerald-500 hover:bg-emerald-600 text-white font-bold text-xs px-5 py-2 rounded-xl transition-all shadow-md flex items-center gap-1.5"
                >
                  <span className="material-symbols-outlined text-[16px]">check_circle</span>
                  Approve
                </button>
                <button
                  onClick={() => handleApproveCourse(reviewingCourse.id, 'REJECTED')}
                  className="bg-red-500 hover:bg-red-600 text-white font-bold text-xs px-5 py-2 rounded-xl transition-all shadow-md flex items-center gap-1.5"
                >
                  <span className="material-symbols-outlined text-[16px]">cancel</span>
                  Reject
                </button>
              </div>
            </div>

            {/* Main Player Content */}
            <div className="flex-grow p-6">
              <div className="max-w-[1400px] mx-auto">

                {/* Course Header */}
                <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4 border-b border-gray-200 pb-4 mb-6">
                  <div className="flex flex-col gap-1">
                    <h1 className="text-2xl md:text-3xl font-display font-black text-brand-blue leading-tight">{reviewingCourse.title}</h1>
                    <p className="text-sm text-text-muted">By {reviewingCourse.instructorName}</p>
                  </div>
                  <div className="bg-surface py-2 px-4 rounded-xl shadow-[0_2px_12px_rgba(26,54,93,0.04)] border border-gray-100 flex items-center gap-3 shrink-0">
                    <span className="material-symbols-outlined text-amber-500 bg-amber-50 p-1.5 rounded-lg text-lg">pending</span>
                    <div>
                      <p className="text-[10px] text-text-muted uppercase tracking-wider font-semibold">Status</p>
                      <p className="text-[15px] font-extrabold text-amber-600 leading-none mt-0.5">Pending Review</p>
                    </div>
                  </div>
                </div>

                {/* Two Column Layout */}
                <div className="grid grid-cols-1 lg:grid-cols-12 gap-8 items-start">
                  {/* Left Column (Video + Tabs) */}
                  <div className="lg:col-span-9 flex flex-col gap-6">

                    {/* Video Player */}
                    <div className="w-full bg-[#0a0f1d] rounded-2xl overflow-hidden shadow-lg border border-gray-800 aspect-video relative flex items-center justify-center group" style={{ maxHeight: '520px' }}>
                      <img src={reviewingCourse.thumbnailUrl} alt="Thumbnail" className="absolute inset-0 w-full h-full object-cover opacity-30" />
                      <div className="absolute inset-0 flex flex-col items-center justify-center z-10 bg-black/40 group-hover:bg-black/50 transition-colors">
                        <button className="bg-primary hover:bg-primary-hover hover:scale-105 text-white rounded-full p-5 shadow-2xl transition-all duration-300 flex items-center justify-center">
                          <span className="material-symbols-outlined text-[48px] icon-fill" style={{ fontVariationSettings: "'FILL' 1" }}>play_arrow</span>
                        </button>
                        <p className="text-white/80 text-sm font-semibold mt-3 bg-black/40 backdrop-blur-md px-3 py-1 rounded-full border border-white/10">{reviewLectureTitle}</p>
                      </div>
                      {/* Video Controls */}
                      <div className="absolute bottom-0 inset-x-0 bg-gradient-to-t from-black/90 to-transparent p-4 flex items-center gap-4 z-20">
                        <span className="material-symbols-outlined text-white hover:text-primary cursor-pointer transition-colors" style={{ fontVariationSettings: "'FILL' 1" }}>play_arrow</span>
                        <div className="flex-grow h-1 bg-white/20 rounded-full cursor-pointer relative">
                          <div className="absolute left-0 top-0 h-full bg-primary rounded-full" style={{ width: '30%' }}></div>
                          <div className="absolute w-3 h-3 bg-white rounded-full top-1/2 -translate-y-1/2 shadow opacity-0 group-hover:opacity-100 transition-opacity" style={{ left: '30%' }}></div>
                        </div>
                        <span className="font-mono text-xs text-white/90">03:45 / 12:45</span>
                        <span className="material-symbols-outlined text-white hover:text-primary cursor-pointer transition-colors">volume_up</span>
                        <span className="material-symbols-outlined text-white hover:text-primary cursor-pointer transition-colors">fullscreen</span>
                      </div>
                    </div>

                    {/* Sub-tab Navigation */}
                    <div className="flex border-b border-gray-200 gap-6 overflow-x-auto pb-px">
                      {([
                        { key: 'overview', icon: 'info', label: 'Theory Content' },
                        { key: 'qa', icon: 'forum', label: 'Q&A' },
                        { key: 'exercises', icon: 'terminal', label: 'Exercises' },
                        { key: 'quiz', icon: 'quiz', label: 'Quiz' },
                      ] as const).map((tab) => (
                        <button
                          key={tab.key}
                          onClick={() => { setReviewPlayerTab(tab.key); setReviewCurrentProblem(null); }}
                          className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${reviewPlayerTab === tab.key ? 'border-primary text-primary' : 'border-transparent text-text-muted hover:text-primary'
                            }`}
                        >
                          <span className="material-symbols-outlined text-[18px]">{tab.icon}</span> {tab.label}
                        </button>
                      ))}
                    </div>

                    {/* Tab Content */}
                    <div className="bg-surface rounded-2xl border border-gray-200 p-6 min-h-[300px]">

                      {/* Overview Tab */}
                      {reviewPlayerTab === 'overview' && (
                        <div className="space-y-4 animate-fade-in">
                          <h2 className="text-xl font-bold text-text-main">{reviewLectureTitle}</h2>
                          <div className="prose max-w-none text-sm text-text-muted space-y-4 leading-relaxed">
                            <h3 className="font-bold text-text-main text-base">Course Overview</h3>
                            <p>{reviewingCourse.shortDescription}</p>
                            <h3 className="font-bold text-text-main text-base mt-6">Detailed Description</h3>
                            <p className="whitespace-pre-line">{reviewingCourse.longDescription}</p>
                            <div className="bg-primary-light/35 p-5 rounded-xl border border-primary/10 flex gap-4 mt-6">
                              <span className="material-symbols-outlined text-primary text-[24px]">lightbulb</span>
                              <div>
                                <p className="font-bold text-text-main text-sm">Course Info</p>
                                <p className="text-xs text-text-muted mt-1 leading-normal">
                                  {reviewingCourse.totalChapters} Chapters • {reviewingCourse.totalLessons} Lessons • {reviewingCourse.totalQuizzes} Quizzes • {reviewingCourse.totalVideos} Videos
                                </p>
                              </div>
                            </div>
                          </div>
                        </div>
                      )}

                      {/* Q&A Tab */}
                      {reviewPlayerTab === 'qa' && (
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
                            <div className="border-b border-gray-100 pb-4">
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
                            <div className="border-b border-gray-100 pb-4">
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

                      {/* Exercises Tab */}
                      {reviewPlayerTab === 'exercises' && (
                        <div className="animate-fade-in">
                          {reviewCurrentProblem === null ? (
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
                                    {initialExercises.map((ex, idx) => (
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
                                            onClick={() => {
                                              setReviewCurrentProblem(ex.name);
                                              setReviewSolveLang('Java');
                                              setReviewSolveCode(problemData[ex.name]?.code?.['Java'] || '');
                                            }}
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
                            <div className="flex flex-col gap-6 animate-fade-in">
                              <div className="flex items-center justify-between border-b border-gray-200 pb-4">
                                <button
                                  onClick={() => setReviewCurrentProblem(null)}
                                  className="flex items-center gap-1.5 text-xs font-bold text-text-muted hover:text-primary transition-all bg-transparent border-none cursor-pointer"
                                >
                                  <span className="material-symbols-outlined text-[16px]">arrow_back</span> Back to Problems
                                </button>
                                <div className="flex items-center gap-3">
                                  <h3 className="text-base font-bold text-text-main">{reviewCurrentProblem}</h3>
                                  <span className={`px-2 py-0.5 rounded text-[10px] font-bold ${problemData[reviewCurrentProblem]?.difficultyClass}`}>
                                    {problemData[reviewCurrentProblem]?.difficulty}
                                  </span>
                                </div>
                              </div>
                              <div
                                className="prose max-w-none text-sm text-text-muted leading-relaxed"
                                dangerouslySetInnerHTML={{ __html: problemData[reviewCurrentProblem]?.description || '' }}
                              />
                              <div className="border border-gray-200 rounded-xl overflow-hidden bg-[#1e1e1e] shadow-lg flex flex-col">
                                <div className="bg-[#252526] border-b border-[#333333] px-4 py-2 flex justify-between items-center">
                                  <select
                                    value={reviewSolveLang}
                                    onChange={(e) => {
                                      setReviewSolveLang(e.target.value);
                                      setReviewSolveCode(problemData[reviewCurrentProblem!]?.code?.[e.target.value] || '');
                                    }}
                                    className="bg-[#2d2d2d] text-white border-none rounded px-3 py-1 text-sm focus:ring-0 cursor-pointer outline-none"
                                  >
                                    <option value="Java">Java</option>
                                    <option value="C++">C++</option>
                                    <option value="Python">Python</option>
                                  </select>
                                  <button
                                    onClick={() => setReviewSolveCode(problemData[reviewCurrentProblem!]?.code?.[reviewSolveLang] || '')}
                                    className="text-[#cccccc] hover:text-white transition-colors bg-transparent border-none cursor-pointer"
                                    title="Reset Template"
                                  >
                                    <span className="material-symbols-outlined text-xl">restart_alt</span>
                                  </button>
                                </div>
                                <div className="flex font-mono text-sm leading-6 p-4">
                                  <div className="w-10 text-[#858585] text-right pr-4 select-none">
                                    {reviewSolveCode.split('\n').map((_, i) => <div key={i}>{i + 1}</div>)}
                                  </div>
                                  <div className="flex-1">
                                    <textarea
                                      value={reviewSolveCode}
                                      onChange={(e) => setReviewSolveCode(e.target.value)}
                                      className="w-full bg-transparent text-[#d4d4d4] border-none p-0 focus:ring-0 resize-none font-mono text-sm leading-6 focus:outline-none outline-none shadow-none"
                                      rows={12}
                                      spellCheck={false}
                                    />
                                  </div>
                                </div>
                                <div className="bg-[#252526] border-t border-[#333333] px-4 py-3 flex justify-end gap-3">
                                  <button className="bg-primary hover:bg-primary-hover text-white px-8 py-2 rounded-lg font-bold text-sm transition-all shadow-md">
                                    Submit
                                  </button>
                                </div>
                              </div>
                            </div>
                          )}
                        </div>
                      )}

                      {/* Quiz Tab */}
                      {reviewPlayerTab === 'quiz' && (
                        <div className="animate-fade-in">
                          <div className="flex justify-between items-center mb-4 border-b border-gray-100 pb-3">
                            <h2 className="text-lg font-bold text-text-main">Knowledge Check</h2>
                            <span className="bg-slate-100 text-text-muted border border-gray-200 px-3 py-1 rounded-full text-xs font-bold">Question 1 of 5</span>
                          </div>
                          <div className="bg-surface p-2">
                            <h3 className="text-base font-bold text-text-main mb-4 leading-snug">In Spring Boot, which annotation is used to map HTTP GET requests onto specific handler methods?</h3>
                            <div className="space-y-3">
                              {['@PostMapping', '@GetMapping', '@RequestMapping', '@PathMapping'].map((opt) => (
                                <label key={opt} className="flex items-center gap-3 p-3.5 border border-gray-200 rounded-xl hover:bg-surface-gray hover:border-primary cursor-pointer transition-all">
                                  <input className="w-4 h-4 text-primary border-gray-300 focus:ring-primary" name="reviewQuiz1" type="radio" />
                                  <span className="text-sm font-medium text-text-main">{opt}</span>
                                </label>
                              ))}
                            </div>
                            <div className="border-t border-gray-100 mt-6 pt-4 flex justify-between items-center">
                              <span className="text-text-muted hover:text-primary font-bold text-xs transition-colors cursor-pointer">Skip Question</span>
                              <button className="bg-primary hover:bg-primary-hover text-white px-5 py-2 rounded-xl font-bold text-xs transition-colors">Submit Answer</button>
                            </div>
                          </div>
                        </div>
                      )}

                    </div>
                  </div>

                  {/* Right Column (Curriculum Sidebar) */}
                  <div className="lg:col-span-3 bg-surface rounded-2xl border border-gray-200 shadow-sm overflow-hidden h-fit">
                    <div className="p-4 bg-slate-50 border-b border-gray-200 flex flex-col gap-2">
                      <h2 className="font-bold text-sm text-text-main flex items-center gap-2">
                        <span className="material-symbols-outlined text-primary text-[18px]">toc</span>
                        Curriculum
                      </h2>
                      <div className="grid grid-cols-3 gap-2 text-[10px] font-bold text-text-muted mt-1">
                        <div className="bg-white border border-gray-100 rounded-lg p-1.5 text-center">
                          <p className="text-brand-blue text-sm font-black">{reviewingCourse.totalChapters}</p>
                          <p>Chapters</p>
                        </div>
                        <div className="bg-white border border-gray-100 rounded-lg p-1.5 text-center">
                          <p className="text-brand-blue text-sm font-black">{reviewingCourse.totalLessons}</p>
                          <p>Lessons</p>
                        </div>
                        <div className="bg-white border border-gray-100 rounded-lg p-1.5 text-center">
                          <p className="text-brand-blue text-sm font-black">{reviewingCourse.totalVideos}</p>
                          <p>Videos</p>
                        </div>
                      </div>
                    </div>

                    <div className="divide-y divide-gray-150">
                      {/* Dynamically generate sections based on totalChapters */}
                      {Array.from({ length: Math.max(reviewingCourse.totalChapters, 1) }, (_, chIdx) => {
                        const secKey = `sec${chIdx + 1}`;
                        const chapterNames = [
                          'Course Introduction', 'REST API & Controller', 'Spring Data JPA',
                          'Service Layer & Business Logic', 'Security & Authentication',
                          'Testing & Deployment', 'Advanced Topics', 'Capstone Project'
                        ];
                        const chapterName = chapterNames[chIdx] || `Chapter ${chIdx + 1}`;
                        const lessonsPerChapter = Math.max(1, Math.round(reviewingCourse.totalLessons / Math.max(reviewingCourse.totalChapters, 1)));

                        return (
                          <div key={secKey} className="flex flex-col">
                            <button
                              onClick={() => setReviewCurriculumSections(prev => ({ ...prev, [secKey]: !prev[secKey] }))}
                              className="w-full flex items-center justify-between p-3.5 hover:bg-surface-gray transition-colors text-left bg-white border-none cursor-pointer"
                            >
                              <span className="font-semibold text-xs text-text-main line-clamp-1">{chIdx + 1}. {chapterName}</span>
                              <span className={`material-symbols-outlined text-text-muted text-[18px] transition-transform duration-200 ${reviewCurriculumSections[secKey] ? 'rotate-180' : ''}`}>expand_more</span>
                            </button>

                            <div className={`${reviewCurriculumSections[secKey] ? 'flex' : 'hidden'} flex-col bg-slate-50`}>
                              {Array.from({ length: lessonsPerChapter }, (_, lIdx) => {
                                const lectureTitle = `${chIdx + 1}.${lIdx + 1} Lesson ${lIdx + 1}`;
                                const isActive = reviewLectureTitle === lectureTitle;
                                const duration = `${String(Math.floor(Math.random() * 20 + 5)).padStart(2, '0')}:${String(Math.floor(Math.random() * 60)).padStart(2, '0')}`;
                                return (
                                  <div
                                    key={lIdx}
                                    onClick={() => setReviewLectureTitle(lectureTitle)}
                                    className={`flex items-center gap-2.5 px-4 py-2.5 cursor-pointer border-l-2 transition-colors group ${isActive
                                      ? 'bg-primary-light/30 border-primary'
                                      : 'hover:bg-slate-100 border-transparent'
                                      }`}
                                  >
                                    <span className={`material-symbols-outlined text-[16px] ${isActive ? 'text-primary' : 'text-text-muted'}`}>
                                      {isActive ? 'play_circle' : 'radio_button_unchecked'}
                                    </span>
                                    <span className={`text-xs flex-1 truncate ${isActive ? 'text-primary font-bold' : 'text-text-main group-hover:text-primary font-medium'}`}>{lectureTitle}</span>
                                    <span className={`text-[10px] font-mono ${isActive ? 'text-primary/80' : 'text-text-muted'}`}>{duration}</span>
                                  </div>
                                );
                              })}
                            </div>
                          </div>
                        );
                      })}
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        ) : (activeTab === 'contest' && reviewingContest) ? (
          <div className="flex-grow flex flex-col bg-[#f0f4f9] animate-fade-in w-full relative">
            {/* Floating Toast Alert */}
            {contestToastMessage && (
              <div className="fixed bottom-20 right-6 z-50 bg-brand-blue text-white text-xs font-semibold px-4 py-3 rounded-lg shadow-lg flex items-center gap-2 border border-brand-blue-light animate-fade-in">
                <span className="material-symbols-outlined text-[18px] text-primary">info</span>
                <span>{contestToastMessage}</span>
              </div>
            )}

            {/* Success Modal overlay */}
            {contestSuccessOverlay && (
              <div className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-[99] flex items-center justify-center p-4">
                <div className="bg-surface rounded-2xl w-full max-w-sm p-6 text-center shadow-2xl border border-slate-200/50 relative z-[100] space-y-4 animate-fade-in bg-white">
                  <div className="w-16 h-16 rounded-full bg-green-50 text-brand-green flex items-center justify-center border border-green-200 mx-auto animate-bounce">
                    <span className="material-symbols-outlined text-4xl icon-fill text-brand-green">emoji_events</span>
                  </div>
                  <h3 className="font-display font-black text-xl text-brand-blue">Contest Solved!</h3>
                  <p className="font-body text-sm text-text-muted">
                    Your solution has successfully passed all automated test cases for this contest task!
                  </p>
                  <div className="bg-surface-gray border border-gray-150 p-3 rounded-xl font-mono text-xs text-left space-y-1">
                    <div className="flex justify-between">
                      <strong>Status:</strong> <span className="text-brand-green font-bold">Passed</span>
                    </div>
                    <div className="flex justify-between">
                      <strong>Runtime:</strong> <span>12 ms (Beats 98.4%)</span>
                    </div>
                    <div className="flex justify-between">
                      <strong>Memory:</strong> <span>39.8 MB (Beats 91.2%)</span>
                    </div>
                  </div>
                  <button
                    onClick={() => {
                      setContestSuccessOverlay(false);
                      setReviewContestProblemId(null);
                    }}
                    className="w-full bg-primary hover:bg-primary-hover text-white border-none font-bold py-2 rounded-xl transition-all shadow-md text-xs uppercase cursor-pointer"
                  >
                    Back to Problems
                  </button>
                </div>
              </div>
            )}

            {/* Banner/Header */}
            <div className="bg-gradient-to-r from-amber-50 via-orange-50 to-amber-50 border-b border-amber-200 px-6 py-3 flex items-center justify-between shrink-0 shadow-sm sticky top-0 z-20">
              <div className="flex items-center gap-3">
                <button
                  onClick={() => {
                    setReviewingContest(null);
                    setReviewContestProblemId(null);
                  }}
                  className="flex items-center gap-1.5 text-sm text-slate-600 font-bold hover:text-primary transition-colors bg-white/80 border border-slate-200 px-3 py-1.5 rounded-lg cursor-pointer"
                >
                  <span className="material-symbols-outlined text-[18px]">arrow_back</span>
                  Back to Contests
                </button>
                <div className="h-6 w-px bg-amber-200"></div>
                <span className="material-symbols-outlined text-amber-600 text-[22px]">emoji_events</span>
                <div>
                  <p className="text-[10px] font-black uppercase tracking-wider text-amber-700">Contest Admin Dashboard</p>
                  <p className="text-xs font-semibold text-amber-900 leading-tight">{reviewingContest.title}</p>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <span className="text-xs text-amber-700 font-semibold hidden md:inline">Status: {reviewingContest.status}</span>
              </div>
            </div>

            {/* Split Flex Layout */}
            <div className="flex-grow flex flex-col md:flex-row min-h-0 w-full">
              {/* Left Main Content Block - with right margin for fixed sidebar */}
              <div className="flex-grow p-6 overflow-y-auto max-w-[1400px] mr-[max(12%,210px)]">
                {reviewContestTab === 'overview' && (
                  <div className="space-y-6 animate-fade-in">
                    <section className="bg-surface rounded-xl border border-slate-200/50 p-6 bg-white shadow-sm">
                      <h2 className="text-lg font-bold text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
                        <span className="material-symbols-outlined text-text-muted">info</span> Contest Overview
                        <span className={`ml-auto text-white text-xs font-bold px-3 py-1 rounded-full ${reviewingContest.status === 'RUNNING' ? 'bg-brand-green' : reviewingContest.status === 'UPCOMING' ? 'bg-primary' : 'bg-gray-400'
                          }`}>
                          {reviewingContest.status}
                        </span>
                      </h2>
                      <div className="grid grid-cols-1 gap-6 md:grid-cols-3">
                        <div className="md:col-span-2">
                          <h3 className="text-xs font-bold text-text-muted uppercase tracking-wider mb-2">Contest Title</h3>
                          <p className="text-lg font-bold text-brand-blue font-display italic">{reviewingContest.title}</p>
                        </div>
                        <div className="md:col-span-1 bg-slate-50 p-4 rounded-xl border border-slate-150">
                          <h3 className="text-xs font-bold text-text-muted uppercase tracking-wider mb-2">Schedule</h3>
                          <ul className="text-xs text-text-main space-y-1">
                            <li><strong>Start:</strong> {new Date(reviewingContest.startTime).toLocaleString()}</li>
                            <li><strong>End:</strong> {new Date(reviewingContest.endTime).toLocaleString()}</li>
                            <li><strong>Duration:</strong> {reviewingContest.durations} Minutes</li>
                          </ul>
                        </div>
                      </div>
                    </section>

                    <section className="bg-surface rounded-xl border border-slate-200/50 p-6 bg-white shadow-sm">
                      <h2 className="text-lg font-bold text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
                        <span className="material-symbols-outlined text-text-muted">description</span> Contest Description
                      </h2>
                      <p className="text-sm text-text-muted leading-relaxed whitespace-pre-wrap">
                        {reviewingContest.description || 'No description provided.'}
                      </p>
                    </section>

                    <section className="bg-surface rounded-xl border border-slate-200/50 p-6 bg-white shadow-sm">
                      <h2 className="text-lg font-bold text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
                        <span className="material-symbols-outlined text-text-muted">score</span> Scoring System
                      </h2>
                      <div className="bg-slate-50 p-4 rounded-xl border border-slate-150 flex items-center gap-3">
                        <span className="material-symbols-outlined text-primary text-[24px]">emoji_events</span>
                        <div>
                          <p className="text-xs font-bold text-text-muted uppercase tracking-wider">Scoring Rule</p>
                          <p className="text-sm font-bold text-text-main mt-0.5">{reviewingContest.scoringRule}</p>
                        </div>
                      </div>
                    </section>

                    <section className="bg-surface rounded-xl border border-slate-200/50 p-6 bg-white shadow-sm">
                      <h2 className="text-lg font-bold text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
                        <span className="material-symbols-outlined text-text-muted">gavel</span> Rules & Prohibitions
                      </h2>
                      <p className="text-xs text-text-muted italic">—</p>
                    </section>

                    <section className="bg-surface rounded-xl border border-slate-200/50 p-6 bg-white shadow-sm">
                      <h2 className="text-lg font-bold text-text-main mb-6 pb-4 border-b border-gray-200 flex items-center gap-2">
                        <span className="material-symbols-outlined text-text-muted">translate</span> Supported Languages
                      </h2>
                      <p className="text-xs text-text-muted italic">—</p>
                    </section>
                  </div>
                )}

                {reviewContestTab === 'problems' && (
                  <div className="animate-fade-in">
                    {reviewContestProblemId === null ? (<>
                      <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden">
                        <div className="p-6 border-b border-gray-200 bg-white">
                          <h2 className="text-lg font-bold text-text-main">Problems</h2>
                        </div>
                        <div className="overflow-x-auto">
                          <table className="w-full text-left border-collapse">
                            <thead>
                              <tr className="bg-slate-50 border-b border-gray-200 text-text-main font-semibold text-xs uppercase tracking-wider">
                                <th className="p-4 w-16 text-center">#</th>
                                <th className="p-4">Title</th>
                                <th className="p-4 w-44 text-center">Success Rate</th>
                                <th className="p-4 w-44 text-center">Total Submissions</th>
                                <th className="p-4 w-44 text-center">Accepted Teams</th>
                                <th className="p-4 w-28 text-center">Action</th>
                              </tr>
                            </thead>
                            <tbody className="text-xs font-semibold divide-y divide-gray-200">
                              {[
                                { id: 101, title: 'Two Sum', totalAccepted: 1245, totalSubmissions: 1580, isBuiltIn: true },
                                { id: 102, title: 'Reverse Linked List', totalAccepted: 850, totalSubmissions: 1200, isBuiltIn: true },
                                { id: 103, title: 'Spring Context Hierarchy Solver', totalAccepted: 420, totalSubmissions: 980, isBuiltIn: true },
                                ...Array.from(contestAddedProblemIds)
                                  .map(id => problems.find(p => p.id === id))
                                  .filter((p): p is AdminProblem => !!p)
                                  .map(p => ({
                                    id: p.id,
                                    title: p.title,
                                    totalAccepted: p.acceptedSubmissions,
                                    totalSubmissions: p.totalSubmissions,
                                    isBuiltIn: false
                                  }))
                              ].map((cp, idx) => {
                                const acPercent = cp.totalSubmissions > 0 ? Math.round((cp.totalAccepted / cp.totalSubmissions) * 100) : 0;
                                const totalTeams = (reviewingContest?.participantCount && reviewingContest.participantCount > 0) ? reviewingContest.participantCount : 100;
                                const acTeams = Math.min(Math.round((acPercent / 100) * totalTeams), totalTeams);
                                const orderLetter = String.fromCharCode(65 + idx);

                                return (
                                  <tr key={cp.id} className="hover:bg-slate-50/50 transition-colors">
                                    <td className="p-4 text-center font-bold text-brand-blue">
                                      {orderLetter}
                                    </td>
                                    <td className="p-4">
                                      <button
                                        onClick={() => {
                                          setReviewContestProblemId(cp.id);
                                          setContestSolveLang('Java');
                                          setContestSolveCode(problemData[cp.title]?.code?.['Java'] || JAVA_TEMPLATE);
                                        }}
                                        className="text-primary hover:underline font-bold text-left bg-transparent border-none cursor-pointer p-0"
                                      >
                                        {cp.title}
                                      </button>
                                    </td>
                                    <td className="p-4 text-center">
                                      <span className={`font-bold ${acPercent >= 70 ? 'text-brand-green' : acPercent >= 40 ? 'text-yellow-600' : 'text-red-500'}`}>
                                        {acPercent}%
                                      </span>
                                    </td>
                                    <td className="p-4 text-center font-mono text-slate-600">
                                      {cp.totalSubmissions.toLocaleString()}
                                    </td>
                                    <td className="p-4 text-center font-mono text-slate-600">
                                      {acTeams}/{totalTeams}
                                    </td>
                                    <td className="p-4 text-center">
                                      {cp.isBuiltIn ? (
                                        <button
                                          onClick={() => { /* built-in problems can also be removed if needed */ }}
                                          className="bg-red-50 hover:bg-red-100 text-red-500 border border-red-200 p-1.5 rounded-lg transition-all cursor-pointer"
                                          title="Delete problem"
                                        >
                                          <span className="material-symbols-outlined text-[16px]">delete</span>
                                        </button>
                                      ) : (
                                        <button
                                          onClick={() => {
                                            setContestAddedProblemIds(prev => {
                                              const next = new Set(prev);
                                              next.delete(cp.id);
                                              return next;
                                            });
                                          }}
                                          className="bg-red-50 hover:bg-red-100 text-red-500 border border-red-200 p-1.5 rounded-lg transition-all cursor-pointer"
                                          title="Delete problem"
                                        >
                                          <span className="material-symbols-outlined text-[16px]">delete</span>
                                        </button>
                                      )}
                                    </td>
                                  </tr>
                                );
                              })}
                            </tbody>
                          </table>
                        </div>
                        <div className="p-4 border-t border-gray-150 bg-slate-50/50 flex justify-between items-center">
                          <p className="text-xs text-text-muted">
                            Total: <span className="font-bold text-text-main">
                              {3 + Array.from(contestAddedProblemIds)
                                .map(id => problems.find(p => p.id === id))
                                .filter(Boolean).length}
                            </span> problems
                          </p>
                          <button
                            onClick={() => setIsAddContestProblemOpen(true)}
                            className="flex items-center gap-1.5 bg-primary hover:bg-primary-hover text-white border-none px-4 py-2 rounded-lg font-bold text-xs transition-all cursor-pointer shadow-sm hover:scale-[1.02] active:scale-[0.98]"
                          >
                            <span className="material-symbols-outlined text-[16px]">add</span>
                            Add Problems
                          </button>
                        </div>
                      </div>

                    {/* Add Problems Modal */}
                    {isAddContestProblemOpen && (
                      <div className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-[99] flex items-center justify-center p-4">
                        <div className="bg-white rounded-2xl w-full max-w-2xl max-h-[80vh] flex flex-col shadow-2xl border border-slate-200/50 animate-fade-in">
                          <div className="p-6 border-b border-gray-200 flex items-center justify-between shrink-0">
                            <div>
                              <h2 className="text-lg font-display font-bold text-brand-blue">Add Problems to Contest</h2>
                              <p className="text-xs text-text-muted mt-1">Select from available contest problems to add to this contest.</p>
                            </div>
                            <button
                              onClick={() => setIsAddContestProblemOpen(false)}
                              className="w-8 h-8 rounded-lg flex items-center justify-center hover:bg-slate-100 transition-colors bg-transparent border-none cursor-pointer text-slate-500"
                            >
                              <span className="material-symbols-outlined">close</span>
                            </button>
                          </div>
                          <div className="flex-grow overflow-y-auto p-2">
                            {problems.filter(p => p.problemScope === 'CONTEST' && p.isActive && p.isPublic).length === 0 ? (
                              <div className="p-12 text-center">
                                <span className="material-symbols-outlined text-4xl text-slate-300 mb-3 block">search_off</span>
                                <p className="text-sm text-text-muted font-semibold">No contest problems available.</p>
                                <p className="text-xs text-slate-400 mt-1">Create problems with "Contest" scope in the Problems management tab first.</p>
                              </div>
                            ) : (
                              <table className="w-full text-left border-collapse">
                                <thead>
                                  <tr className="bg-slate-50 border-b border-gray-200 text-text-main font-semibold text-xs uppercase tracking-wider sticky top-0">
                                    <th className="p-3 w-12 text-center"></th>
                                    <th className="p-3">Title</th>
                                    <th className="p-3 w-24">Difficulty</th>
                                    <th className="p-3 w-20 text-center">Score</th>
                                    <th className="p-3 w-28 text-center">Action</th>
                                  </tr>
                                </thead>
                                <tbody className="text-sm divide-y divide-gray-100">
                                  {problems.filter(p => p.problemScope === 'CONTEST' && p.isActive && p.isPublic).map((p) => {
                                    const isAdded = contestAddedProblemIds.has(p.id);
                                    const isBuiltIn = [101, 102, 103].includes(p.id);
                                    return (
                                      <tr key={p.id} className={`transition-colors ${isAdded ? 'bg-green-50/50' : 'hover:bg-slate-50/50'}`}>
                                        <td className="p-3 text-center">
                                          {isAdded ? (
                                            <span className="material-symbols-outlined text-brand-green icon-fill text-[18px]">check_circle</span>
                                          ) : (
                                            <span className="material-symbols-outlined text-gray-300 text-[18px]">radio_button_unchecked</span>
                                          )}
                                        </td>
                                        <td className="p-3 font-semibold text-slate-800">{p.title}</td>
                                        <td className="p-3">
                                          <span className={`px-2 py-0.5 rounded border text-[10px] font-bold ${
                                            p.difficulty === 'EASY' ? 'bg-green-50 text-brand-green border-green-200' :
                                            p.difficulty === 'MEDIUM' ? 'bg-blue-50 text-blue-600 border-blue-200' :
                                            'bg-red-50 text-red-600 border-red-200'
                                          }`}>{p.difficulty}</span>
                                        </td>
                                        <td className="p-3 text-center font-bold text-slate-600">{p.score}</td>
                                        <td className="p-3 text-center">
                                          {isBuiltIn ? (
                                            <span className="text-[10px] text-slate-400 font-semibold">Built-in</span>
                                          ) : isAdded ? (
                                            <button
                                              onClick={() => {
                                                setContestAddedProblemIds(prev => {
                                                  const next = new Set(prev);
                                                  next.delete(p.id);
                                                  return next;
                                                });
                                              }}
                                              className="bg-red-50 hover:bg-red-100 text-red-600 border border-red-200 px-3 py-1 rounded-lg font-bold text-[10px] transition-all cursor-pointer"
                                            >
                                              Remove
                                            </button>
                                          ) : (
                                            <button
                                              onClick={() => {
                                                setContestAddedProblemIds(prev => {
                                                  const next = new Set(prev);
                                                  next.add(p.id);
                                                  return next;
                                                });
                                              }}
                                              className="bg-primary hover:bg-primary-hover text-white border-none px-3 py-1 rounded-lg font-bold text-[10px] transition-all cursor-pointer shadow-sm"
                                            >
                                              Add
                                            </button>
                                          )}
                                        </td>
                                      </tr>
                                    );
                                  })}
                                </tbody>
                              </table>
                            )}
                          </div>
                          <div className="p-4 border-t border-gray-200 flex items-center justify-between shrink-0 bg-slate-50">
                            <p className="text-xs text-text-muted font-semibold">
                              <span className="text-brand-blue font-bold">{contestAddedProblemIds.size}</span> problem{contestAddedProblemIds.size !== 1 ? 's' : ''} added
                            </p>
                            <button
                              onClick={() => setIsAddContestProblemOpen(false)}
                              className="bg-primary hover:bg-primary-hover text-white border-none px-6 py-2 rounded-lg font-bold text-xs transition-all cursor-pointer shadow-sm"
                            >
                              Done
                            </button>
                          </div>
                        </div>
                      </div>
                    )}

                    </>) : (() => {
                      const probName = reviewContestProblemId === 101 ? 'Two Sum' : reviewContestProblemId === 102 ? 'Reverse Linked List' : 'Spring Context Hierarchy Solver';
                      const probDetail = problemData[probName];
                      const contestSolveLineCount = Math.max(contestSolveCode.split('\n').length, 6);

                      return (
                        <div className="flex flex-col gap-6 animate-fade-in">
                          {/* Problem Description Card */}
                          <div className="w-full flex flex-col bg-white border border-gray-200 rounded-xl shadow-sm">
                            <div className="p-6 md:p-8 space-y-6">
                              {/* Back button */}
                              <button
                                onClick={() => setReviewContestProblemId(null)}
                                className="inline-flex items-center gap-2 text-text-muted hover:text-primary transition-colors text-sm font-medium group w-max bg-transparent border-none cursor-pointer"
                              >
                                <span className="material-symbols-outlined text-[20px] group-hover:-translate-x-1 transition-transform">arrow_back</span>
                                Back to Problems
                              </button>

                              {/* Title & Difficulty */}
                              <div className="flex items-center gap-3">
                                <h1 className="text-2xl font-display font-bold text-text-main">{probName}</h1>
                                <span className={`px-2.5 py-0.5 rounded-md text-xs font-bold ${reviewContestProblemId === 103 ? 'bg-blue-50 text-blue-600 border border-blue-200' : 'bg-green-50 text-brand-green border border-green-200'
                                  }`}>
                                  {reviewContestProblemId === 103 ? 'Medium' : 'Easy'}
                                </span>
                              </div>

                              {/* Problem Description */}
                              <div
                                className="space-y-3 text-text-main text-base leading-relaxed"
                                dangerouslySetInnerHTML={{ __html: probDetail?.description || '' }}
                              />

                              {/* Example */}
                              <div>
                                <h3 className="font-semibold text-lg mb-3 text-text-main">Example 1:</h3>
                                <div className="bg-brand-blue text-white rounded-lg p-5 font-mono text-sm shadow-sm space-y-2">
                                  <div>
                                    <span className="text-gray-400 select-none">Input:</span> nums = [2,7,11,15], target = 9
                                  </div>
                                  <div>
                                    <span className="text-gray-400 select-none">Output:</span> [0,1]
                                  </div>
                                  <div className="text-gray-300">
                                    <span className="text-gray-400 select-none">Explanation:</span> Because nums[0] + nums[1] == 9, we return [0, 1].
                                  </div>
                                </div>
                              </div>

                              {/* Constraints */}
                              <div>
                                <h3 className="font-semibold text-lg mb-3 text-text-main">Constraints:</h3>
                                <ul className="list-disc list-inside space-y-2 text-text-main bg-surface-gray p-5 rounded-lg border border-gray-200">
                                  <li><code className="font-mono text-sm">2 &lt;= nums.length &lt;= 10<sup>4</sup></code></li>
                                  <li><code className="font-mono text-sm">-10<sup>9</sup> &lt;= nums[i] &lt;= 10<sup>9</sup></code></li>
                                  <li><code className="font-mono text-sm">-10<sup>9</sup> &lt;= target &lt;= 10<sup>9</sup></code></li>
                                  <li><strong>Only one valid answer exists.</strong></li>
                                </ul>
                              </div>

                              {/* Hint */}
                              <details className="group bg-surface-gray rounded-lg border border-gray-200">
                                <summary className="flex items-center justify-between p-4 cursor-pointer font-semibold text-text-main">
                                  Show Hint
                                  <span className="material-symbols-outlined transition-transform group-open:rotate-180">expand_more</span>
                                </summary>
                                <div className="p-4 border-t border-gray-200 text-text-muted text-sm leading-relaxed bg-white">
                                  A really brute force way would be to search for all possible pairs of numbers but that would be too slow. Again, it's best to try out brute force solutions for just for completeness. It is from these brute force solutions that you can come up with optimizations.
                                </div>
                              </details>
                            </div>
                          </div>

                          {/* Code Editor Card */}
                          <div className="w-full flex flex-col bg-white border border-gray-200 rounded-xl min-h-[400px] h-auto overflow-hidden shadow-sm">
                            {/* Editor Header */}
                            <div className="flex items-center justify-between p-3 bg-surface border-b border-gray-200">
                              <div className="flex items-center gap-3">
                                <select
                                  value={contestSolveLang}
                                  onChange={(e) => {
                                    setContestSolveLang(e.target.value);
                                    const selectedLangName = e.target.value === 'Python 3' ? 'Python' : e.target.value;
                                    const codeFromData = probDetail?.code?.[selectedLangName];
                                    if (codeFromData) {
                                      setContestSolveCode(codeFromData);
                                    } else {
                                      setContestSolveCode(selectedLangName === 'Python' ? PYTHON_TEMPLATE : selectedLangName === 'C++' ? CPP_TEMPLATE : JAVA_TEMPLATE);
                                    }
                                  }}
                                  className="bg-surface-gray border border-gray-300 text-text-main text-sm rounded-md focus:ring-primary focus:border-primary block px-3 py-1.5 font-medium cursor-pointer outline-none"
                                >
                                  <option value="Java">Java</option>
                                  <option value="C++">C++</option>
                                  <option value="Python 3">Python 3</option>
                                </select>
                                <div className="flex items-center gap-1.5 text-xs font-semibold">
                                  <span className="text-text-muted">Status:</span>
                                  {contestEditorStatus === 'Accepted' && (
                                    <span className="text-brand-green bg-green-50 px-2 py-0.5 rounded border border-green-200">Accepted</span>
                                  )}
                                  {contestEditorStatus === 'Running' && (
                                    <span className="text-yellow-600 bg-yellow-50 px-2 py-0.5 rounded border border-yellow-200 animate-pulse">Running Tests...</span>
                                  )}
                                  {contestEditorStatus === 'Success' && (
                                    <span className="text-brand-green bg-green-50 px-2 py-0.5 rounded border border-green-200 animate-bounce">Passed!</span>
                                  )}
                                </div>
                              </div>
                              <div className="flex gap-1 text-text-muted">
                                <button
                                  onClick={() => {
                                    const selectedLangName = contestSolveLang === 'Python 3' ? 'Python' : contestSolveLang;
                                    const codeFromData = probDetail?.code?.[selectedLangName];
                                    if (codeFromData) {
                                      setContestSolveCode(codeFromData);
                                    } else {
                                      setContestSolveCode(selectedLangName === 'Python' ? PYTHON_TEMPLATE : selectedLangName === 'C++' ? CPP_TEMPLATE : JAVA_TEMPLATE);
                                    }
                                    setContestEditorStatus('Accepted');
                                    showContestToast('Code editor has been reset to default template.');
                                  }}
                                  aria-label="Reset"
                                  className="p-1.5 hover:bg-surface-gray rounded transition-colors text-text-main hover:text-primary bg-transparent border-none cursor-pointer"
                                >
                                  <span className="material-symbols-outlined text-[20px]">refresh</span>
                                </button>
                                <button
                                  onClick={() => showContestToast('Editor Settings: Font Size and Keybindings can be modified in your account profile.')}
                                  aria-label="Settings"
                                  className="p-1.5 hover:bg-surface-gray rounded transition-colors text-text-main hover:text-primary bg-transparent border-none cursor-pointer"
                                >
                                  <span className="material-symbols-outlined text-[20px]">settings</span>
                                </button>
                              </div>
                            </div>

                            {/* Editor Area */}
                            <div className="flex-grow flex text-[15px] leading-relaxed font-mono text-gray-800 bg-white min-h-[300px]">
                              {/* Line Numbers */}
                              <div className="w-12 flex flex-col items-end py-4 pr-3 text-gray-400 bg-surface-gray border-r border-gray-200 select-none">
                                {Array.from({ length: contestSolveLineCount }).map((_, i) => (
                                  <span key={i} className="leading-relaxed h-[22.5px] block">{i + 1}</span>
                                ))}
                              </div>
                              {/* Code */}
                              <textarea
                                value={contestSolveCode}
                                onChange={(e) => setContestSolveCode(e.target.value)}
                                className="flex-grow py-4 pl-4 overflow-x-auto whitespace-pre outline-none font-mono text-[15px] text-gray-800 bg-white min-h-[300px] w-full resize-none border-none focus:ring-0 focus:outline-none leading-relaxed"
                                spellCheck={false}
                              />
                            </div>

                            {/* Action Bar */}
                            <div className="p-4 bg-surface border-t border-gray-200 flex justify-end gap-4 sticky bottom-0">
                              <button
                                onClick={handleContestSubmit}
                                disabled={contestEditorStatus === 'Running'}
                                className={`px-6 py-2 rounded-lg font-bold transition-colors shadow-sm text-white border-none cursor-pointer ${contestEditorStatus === 'Running'
                                  ? 'bg-primary/50 cursor-not-allowed'
                                  : 'bg-primary hover:bg-primary-hover'
                                  }`}
                              >
                                Submit
                              </button>
                            </div>
                          </div>
                        </div>
                      );
                    })()}

                  </div>
                )}

                {reviewContestTab === 'submissions' && (
                  <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden animate-fade-in">
                    <div className="p-6 border-b border-gray-200 bg-white">
                      <h2 className="text-lg font-bold text-text-main">Submissions</h2>
                    </div>
                    <div className="overflow-x-auto">
                      <table className="w-full text-left border-collapse">
                        <thead>
                          <tr className="bg-slate-50 border-b border-gray-200 text-text-main font-semibold text-xs uppercase tracking-wider">
                            <th className="px-6 py-4">When</th>
                            <th className="px-6 py-4">User</th>
                            <th className="px-6 py-4 text-center">Problem</th>
                            <th className="px-6 py-4">Status</th>
                            <th className="px-6 py-4 text-right">Time</th>
                            <th className="px-6 py-4 text-right">Memory</th>
                            <th className="px-6 py-4">Language</th>
                          </tr>
                        </thead>
                        <tbody className="text-xs font-semibold divide-y divide-gray-200">
                          {[
                            { when: 'Oct 28, 2026, 10:45:12 AM', user: 'CodeNinja_99', prob: 'A', status: 'Accepted', time: '12ms', mem: '2.4 MB', lang: 'C++', statusClass: 'bg-brand-green/10 text-brand-green border border-green-200', icon: 'check_circle' },
                            { when: 'Oct 28, 2026, 10:42:05 AM', user: 'AlgorithmAce', prob: 'C', status: 'Wrong Answer', time: '4ms', mem: '1.8 MB', lang: 'Python 3', statusClass: 'bg-red-50 text-red-500 border border-red-200', icon: 'cancel' },
                            { when: 'Oct 28, 2026, 10:38:50 AM', user: 'ByteMe', prob: 'B', status: 'Time Limit Exceeded', time: '>2000ms', mem: '15.2 MB', lang: 'Java', statusClass: 'bg-amber-50 text-amber-600 border border-amber-200', icon: 'timer' },
                            { when: 'Oct 28, 2026, 10:35:12 AM', user: 'DataStructura', prob: 'A', status: 'Accepted', time: '45ms', mem: '4.1 MB', lang: 'Python 3', statusClass: 'bg-brand-green/10 text-brand-green border border-green-200', icon: 'check_circle' },
                            { when: 'Oct 28, 2026, 10:30:01 AM', user: 'GraphMaster', prob: 'D', status: 'Compilation Error', time: '-', mem: '-', lang: 'C++', statusClass: 'bg-slate-100 text-slate-500 border border-slate-200', icon: 'error' }
                          ].map((sub, sIdx) => (
                            <tr key={sIdx} className="hover:bg-slate-50/50 transition-colors">
                              <td className="px-6 py-4 text-slate-500 font-normal">{sub.when}</td>
                              <td className="px-6 py-4 font-bold text-slate-900">{sub.user}</td>
                              <td className="px-6 py-4 text-center">
                                <span className="inline-flex items-center justify-center w-6 h-6 rounded-full bg-slate-100 text-slate-800 font-bold border border-slate-200">{sub.prob}</span>
                              </td>
                              <td className="px-6 py-4">
                                <span className={`inline-flex items-center gap-1 px-2.5 py-0.5 rounded-full text-[10px] font-bold ${sub.statusClass}`}>
                                  <span className="material-symbols-outlined text-[14px] icon-fill">{sub.icon}</span>
                                  {sub.status}
                                </span>
                              </td>
                              <td className="px-6 py-4 text-right font-mono font-bold text-slate-600">{sub.time}</td>
                              <td className="px-6 py-4 text-right font-mono font-bold text-slate-600">{sub.mem}</td>
                              <td className="px-6 py-4">
                                <span className="inline-flex items-center px-2 py-0.5 rounded bg-slate-100 text-slate-600 text-[10px] font-bold">{sub.lang}</span>
                              </td>
                            </tr>
                          ))}
                        </tbody>
                      </table>
                    </div>
                    <div className="px-6 py-4 border-t border-gray-200 flex items-center justify-between bg-white">
                      <span className="text-xs text-slate-500">Showing 1 to 5 of 245 submissions</span>
                      <div className="flex gap-2">
                        <button className="p-1 rounded text-slate-400 bg-transparent border-none hover:bg-slate-100 disabled:opacity-50" disabled>
                          <span className="material-symbols-outlined">chevron_left</span>
                        </button>
                        <button className="p-1 rounded text-slate-400 bg-transparent border-none hover:bg-slate-100">
                          <span className="material-symbols-outlined">chevron_right</span>
                        </button>
                      </div>
                    </div>
                  </div>
                )}

                {reviewContestTab === 'ranking' && (
                  <div className="flex flex-col gap-6 animate-fade-in w-full">
                    <section className="bg-white rounded-xl p-6 shadow-sm border border-gray-200 flex flex-col gap-4 relative overflow-hidden">
                      <div className="flex flex-col md:flex-row md:items-center justify-between pb-2 border-b border-gray-150">
                        <div>
                          <h2 className="font-display font-bold text-lg text-brand-blue flex items-center gap-2">
                            <span className="material-symbols-outlined text-primary">monitoring</span> Top 5 Teams Progress
                          </h2>
                          <p className="text-xs text-text-muted mt-1">Real-time stepwise progression of problems solved over 4 hours.</p>
                        </div>
                      </div>

                      <div className="grid grid-cols-1 lg:grid-cols-4 gap-6 items-stretch mt-2">
                        {/* Interactive Vector Step Chart (Col-span 3) */}
                        <div className="lg:col-span-3 bg-white rounded-lg border border-gray-150 p-4 relative flex items-center justify-center">
                          <svg className="w-full h-auto max-w-[760px]" viewBox={`0 0 ${RANKING_W + 60} ${RANKING_H + 40}`} width="100%">
                            {/* Vertical Hour Grid Lines */}
                            {Array.from({ length: 5 }).map((_, i) => {
                              const minutes = i * 60;
                              const coordsStart = getRankingSvgCoords(minutes, 0);
                              const coordsEnd = getRankingSvgCoords(minutes, 10);
                              return (
                                <g key={i}>
                                  <line
                                    x1={coordsStart.x}
                                    y1={coordsStart.y}
                                    x2={coordsEnd.x}
                                    y2={coordsEnd.y}
                                    stroke="#e2e8f0"
                                    strokeWidth={1}
                                    strokeDasharray="4 4"
                                  />
                                  <text
                                    x={coordsStart.x}
                                    y={coordsStart.y + 16}
                                    textAnchor="middle"
                                    className="font-mono text-[10px] fill-text-muted"
                                  >
                                    {i}h
                                  </text>
                                </g>
                              );
                            })}

                            {/* Horizontal Solved Grid Lines */}
                            {[0, 2, 4, 6, 8, 10].map((solved) => {
                              const coordsStart = getRankingSvgCoords(0, solved);
                              const coordsEnd = getRankingSvgCoords(240, solved);
                              return (
                                <g key={solved}>
                                  <line
                                    x1={coordsStart.x}
                                    y1={coordsStart.y}
                                    x2={coordsEnd.x}
                                    y2={coordsEnd.y}
                                    stroke="#e2e8f0"
                                    strokeWidth={1}
                                  />
                                  <text
                                    x={coordsStart.x - 8}
                                    y={coordsStart.y + 4}
                                    textAnchor="end"
                                    className="font-mono text-[10px] fill-text-muted"
                                  >
                                    {solved}
                                  </text>
                                </g>
                              );
                            })}

                            {/* Draw team stepwise progression lines */}
                            {TEAMS_DATA.map((team, idx) => {
                              if (!rankingVisibleTeams[team.name]) return null;
                              const color = RANKING_TEAM_COLORS[idx % RANKING_TEAM_COLORS.length];
                              const isHovered = rankingHoveredTeam === team.name;
                              const { pathStr, solves } = getRankingStepPathString(team);

                              return (
                                <g key={team.name}>
                                  <path
                                    d={pathStr}
                                    fill="none"
                                    stroke={color}
                                    strokeWidth={isHovered ? 3.5 : 1.5}
                                    strokeOpacity={rankingHoveredTeam === null ? 0.6 : isHovered ? 1.0 : 0.15}
                                    className="transition-all duration-300"
                                  />

                                  {solves.map((solve, sIdx) => {
                                    const coords = getRankingSvgCoords(solve.time, sIdx + 1);
                                    return (
                                      <circle
                                        key={sIdx}
                                        cx={coords.x}
                                        cy={coords.y}
                                        r={isHovered ? 5.5 : 3.5}
                                        fill={color}
                                        stroke="#ffffff"
                                        strokeWidth={1.5}
                                        opacity={rankingHoveredTeam === null ? 0.9 : isHovered ? 1.0 : 0.15}
                                        className="cursor-pointer transition-all duration-300"
                                        onMouseEnter={() => {
                                          setRankingHoveredTeam(team.name);
                                          setRankingActiveTooltip({
                                            x: coords.x,
                                            y: coords.y,
                                            teamName: team.name,
                                            solvedCount: sIdx + 1,
                                            timeStr: rankingFormatMinutes(solve.time),
                                            problem: solve.problem
                                          });
                                        }}
                                        onMouseLeave={() => {
                                          setRankingHoveredTeam(null);
                                          setRankingActiveTooltip(null);
                                        }}
                                      />
                                    );
                                  })}
                                </g>
                              );
                            })}

                            {/* HTML-styled SVG Tooltip Overlay */}
                            {rankingActiveTooltip && (
                              <foreignObject
                                x={rankingActiveTooltip.x - 100}
                                y={rankingActiveTooltip.y - 75}
                                width="200"
                                height="70"
                                className="pointer-events-none"
                              >
                                <div className="bg-slate-900/95 text-white p-2 rounded-lg text-[10px] shadow-lg border border-slate-700/80 font-sans space-y-0.5">
                                  <div className="font-bold text-primary">{rankingActiveTooltip.teamName}</div>
                                  <div className="flex justify-between">
                                    <span>Problem {rankingActiveTooltip.problem}:</span>
                                    <span className="text-brand-green font-bold">Solved</span>
                                  </div>
                                  <div className="flex justify-between text-slate-400">
                                    <span>Total Solved:</span>
                                    <span>{rankingActiveTooltip.solvedCount} tasks</span>
                                  </div>
                                  <div className="flex justify-between text-slate-400">
                                    <span>Time:</span>
                                    <span>{rankingActiveTooltip.timeStr}</span>
                                  </div>
                                </div>
                              </foreignObject>
                            )}
                          </svg>
                        </div>

                        {/* Legend Toggles */}
                        <div className="lg:col-span-1 bg-slate-50 border border-slate-200/50 rounded-xl p-4 flex flex-col gap-2.5">
                          <h4 className="text-xs font-black text-text-muted uppercase tracking-wider mb-1">Toggle Teams</h4>
                          <div className="flex flex-col gap-2">
                            {TEAMS_DATA.map((team, idx) => {
                              const color = RANKING_TEAM_COLORS[idx % RANKING_TEAM_COLORS.length];
                              const isVisible = rankingVisibleTeams[team.name];
                              return (
                                <button
                                  key={team.name}
                                  onClick={() => {
                                    setRankingVisibleTeams(prev => ({
                                      ...prev,
                                      [team.name]: !prev[team.name]
                                    }));
                                  }}
                                  className="flex items-center gap-2 text-left bg-transparent border-none cursor-pointer w-full text-xs font-semibold p-1 hover:bg-slate-100 rounded"
                                >
                                  <span
                                    className="w-3.5 h-3.5 rounded-md flex items-center justify-center shrink-0 border border-slate-300"
                                    style={{ backgroundColor: isVisible ? color : '#e2e8f0' }}
                                  >
                                    {isVisible && <span className="material-symbols-outlined text-[10px] text-white font-black">check</span>}
                                  </span>
                                  <span className="truncate flex-1 text-slate-800">{team.name}</span>
                                </button>
                              );
                            })}
                          </div>
                        </div>
                      </div>
                    </section>

                    {/* Standings table */}
                    <div className="bg-white rounded-xl shadow-sm border border-gray-200 overflow-hidden w-full">
                      <div className="p-6 border-b border-gray-200 bg-white">
                        <h2 className="text-lg font-bold text-text-main">Standings Scoreboard</h2>
                      </div>
                      <div className="overflow-x-auto">
                        <table className="w-full text-left border-collapse">
                          <thead>
                            <tr className="bg-slate-50 border-b border-gray-200 text-text-main font-semibold text-xs uppercase tracking-wider">
                              <th className="p-3 w-12 text-center">Rank</th>
                              <th className="p-3">Team</th>
                              <th className="p-3 w-16 text-center">Solved</th>
                              <th className="p-3 w-24 text-center">Penalty</th>
                              {['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'].map((prob) => (
                                <th key={prob} className="p-3 w-16 text-center">{prob}</th>
                              ))}
                            </tr>
                          </thead>
                          <tbody className="text-xs font-semibold divide-y divide-gray-200">
                            {TEAMS_DATA.map((team) => {
                              // Calculate penalty
                              let penaltyMinutes = 0;
                              Object.values(team.submissions).forEach((sub) => {
                                if (sub.status === 'accepted' || sub.status === 'first_solve') {
                                  const parts = (sub.time || '0:0:0').split(':').map(Number);
                                  const mins = (parts[0] || 0) * 60 + (parts[1] || 0);
                                  penaltyMinutes += mins + sub.penalty * 20;
                                }
                              });

                              return (
                                <tr key={team.name} className="hover:bg-slate-50/50 transition-colors">
                                  <td className="p-3 text-center font-bold text-slate-900">{team.rank}</td>
                                  <td className="p-3">
                                    <div className="font-bold text-slate-900">{team.name}</div>
                                    <div className="text-[10px] text-slate-400 font-normal">{team.affiliation}</div>
                                  </td>
                                  <td className="p-3 text-center font-bold text-slate-900 bg-slate-50/60">{team.solved}</td>
                                  <td className="p-3 text-center font-mono text-slate-500 font-normal">{penaltyMinutes} m</td>
                                  {['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J'].map((probCode) => {
                                    const sub = team.submissions[probCode];
                                    if (!sub || sub.status === 'unattempted') {
                                      return <td key={probCode} className="p-3 border border-white text-center bg-gray-50/50"></td>;
                                    }
                                    if (sub.status === 'failed') {
                                      return (
                                        <td key={probCode} className="p-3 border border-white text-center bg-primary text-white">
                                          --
                                          <div className="text-[9px] font-normal text-white/80 font-mono">(-{sub.penalty})</div>
                                        </td>
                                      );
                                    }
                                    const penaltyText = sub.penalty > 0 ? `(-${sub.penalty})` : '';
                                    const bgClass = sub.status === 'first_solve' ? 'bg-brand-blue' : 'bg-brand-green';
                                    return (
                                      <td key={probCode} className={`p-3 border border-white text-center text-white ${bgClass}`}>
                                        {sub.time}
                                        <div className="text-[9px] font-normal text-white/80 font-mono">{penaltyText}</div>
                                      </td>
                                    );
                                  })}
                                </tr>
                              );
                            })}
                          </tbody>
                        </table>
                      </div>
                    </div>
                  </div>
                )}
              </div>

              {/* Right Sidebar Block (12%) - Fixed to right edge, below header */}
              <aside className="fixed right-0 top-[60px] h-[calc(100vh-64px)] w-[12%] min-w-[190px] bg-white border-l border-gray-200 flex flex-col z-30 shadow-lg">
                <div className="flex-grow py-5 px-3 flex flex-col">
                  {/* Contest Header / Timer */}
                  <div className="mb-6 text-center">
                    <h2 className="text-sm font-black text-brand-blue mb-1.5 tracking-tight">Contest #{reviewingContest.id}</h2>
                    <div className="bg-slate-50 rounded-lg p-2.5 shadow-sm border border-gray-200">
                      <p className="text-[10px] font-semibold text-text-muted uppercase tracking-wider mb-0.5">{contestTimerLabel}</p>
                      <div className="font-display text-base font-bold text-primary tabular-nums tracking-tight">{contestTimeLeft}</div>
                    </div>
                  </div>

                  {/* Navigation Links */}
                  <nav className="space-y-1 font-semibold text-xs flex-grow">
                    {[
                      { key: 'overview', icon: 'dashboard', label: 'Overview' },
                      { key: 'problems', icon: 'extension', label: 'Problems' },
                      { key: 'submissions', icon: 'list_alt', label: 'Submissions' },
                      { key: 'ranking', icon: 'leaderboard', label: 'Rankings' }
                    ].map((tab) => (
                      <button
                        key={tab.key}
                        onClick={() => {
                          setReviewContestTab(tab.key as any);
                          setReviewContestProblemId(null);
                        }}
                        className={`w-full flex items-center gap-2 py-2 px-2.5 rounded-lg transition-all border-none text-left cursor-pointer ${reviewContestTab === tab.key
                          ? 'text-primary font-bold border-l-4 border-primary bg-primary-light/30 shadow-sm translate-x-0.5'
                          : 'text-text-muted font-medium hover:bg-slate-50 bg-transparent'
                          }`}
                      >
                        <span className={`material-symbols-outlined text-[16px] ${reviewContestTab === tab.key ? 'icon-fill font-black' : ''}`}>{tab.icon}</span>
                        {tab.label}
                      </button>
                    ))}
                  </nav>

                  {/* Back to Contests button at bottom */}
                  <button
                    onClick={() => {
                      setReviewingContest(null);
                      setReviewContestProblemId(null);
                    }}
                    className="w-full mt-4 bg-slate-100 hover:bg-slate-200 border-none text-slate-700 font-bold py-1.5 rounded-lg transition-all shadow-sm text-[10px] flex items-center justify-center gap-1 cursor-pointer"
                  >
                    <span className="material-symbols-outlined text-[14px]">arrow_back</span>
                    Back
                  </button>
                </div>
              </aside>
            </div>
          </div>
        ) : (
          <main className="flex-grow p-4 md:p-8 lg:p-10 flex flex-col gap-8 max-w-[1440px] w-full mx-auto">
            {/* Header Banner */}
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
              <div>
                <div className="inline-flex items-center gap-1.5 bg-brand-blue-light/10 border border-brand-blue/20 px-3 py-1 rounded-full text-brand-blue font-bold text-xs uppercase tracking-wider mb-2.5 shadow-sm">
                  <span className="material-symbols-outlined text-xs icon-fill">{tabHeaderDetails[activeTab]?.icon || 'admin_panel_settings'}</span> {tabHeaderDetails[activeTab]?.badge || 'Platform Administration'}
                </div>
                <h1 className="text-3xl md:text-4xl font-display font-black leading-tight">
                  <span className="bg-gradient-to-r from-brand-blue to-primary bg-clip-text text-transparent">{tabHeaderDetails[activeTab]?.title || 'System Control Dashboard ⚙️'}</span>
                </h1>
                <p className="text-text-muted mt-1">{tabHeaderDetails[activeTab]?.desc || 'Manage courses, instructors, users, program problems, contests, and view statistics.'}</p>
              </div>
            </div>

            {/* TAB: DASHBOARD */}
            {activeTab === 'dashboard' && (
              <div className="flex flex-col gap-8">
                {/* Stats cards */}
                <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-5 gap-5">
                  <div className="bg-surface rounded-2xl p-5 border border-slate-200/50 ambient-shadow flex items-center justify-between gap-4">
                    <div className="flex flex-col gap-1">
                      <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Active Users</span>
                      <span className="text-2xl font-display font-black text-brand-blue mt-1">{stats?.activeUsers}</span>
                    </div>
                    <div className="w-10 h-10 rounded-lg bg-blue-50 text-blue-600 flex items-center justify-center shrink-0">
                      <span className="material-symbols-outlined icon-fill">group</span>
                    </div>
                  </div>

                  <div className="bg-surface rounded-2xl p-5 border border-slate-200/50 ambient-shadow flex items-center justify-between gap-4">
                    <div className="flex flex-col gap-1">
                      <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Live Contests</span>
                      <span className="text-2xl font-display font-black text-brand-blue mt-1">{stats?.activeContests}</span>
                    </div>
                    <div className="w-10 h-10 rounded-lg bg-red-50 text-red-600 flex items-center justify-center shrink-0">
                      <span className="material-symbols-outlined icon-fill">emoji_events</span>
                    </div>
                  </div>

                  <div className="bg-surface rounded-2xl p-5 border border-slate-200/50 ambient-shadow flex items-center justify-between gap-4">
                    <div className="flex flex-col gap-1">
                      <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Total Courses</span>
                      <span className="text-2xl font-display font-black text-brand-blue mt-1">{stats?.totalCourses}</span>
                    </div>
                    <div className="w-10 h-10 rounded-lg bg-orange-50 text-orange-600 flex items-center justify-center shrink-0">
                      <span className="material-symbols-outlined icon-fill">library_books</span>
                    </div>
                  </div>

                  <div className="bg-surface rounded-2xl p-5 border border-slate-200/50 ambient-shadow flex items-center justify-between gap-4">
                    <div className="flex flex-col gap-1">
                      <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Instructors</span>
                      <span className="text-2xl font-display font-black text-brand-blue mt-1">{stats?.totalInstructors}</span>
                    </div>
                    <div className="w-10 h-10 rounded-lg bg-purple-50 text-purple-600 flex items-center justify-center shrink-0">
                      <span className="material-symbols-outlined icon-fill">school</span>
                    </div>
                  </div>

                  <div className="bg-surface rounded-2xl p-5 border border-slate-200/50 ambient-shadow flex items-center justify-between gap-4">
                    <div className="flex flex-col gap-1">
                      <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Total Problems</span>
                      <span className="text-2xl font-display font-black text-brand-blue mt-1">{stats?.totalProblems}</span>
                    </div>
                    <div className="w-10 h-10 rounded-lg bg-teal-50 text-teal-600 flex items-center justify-center shrink-0">
                      <span className="material-symbols-outlined icon-fill">code</span>
                    </div>
                  </div>
                </div>

                {/* Charts Row */}
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                  {/* Revenue Chart */}
                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                    <div className="mb-4">
                      <h3 className="font-display font-bold text-lg text-brand-blue">Platform Monthly Revenue</h3>
                      <p className="text-xs text-text-muted">Visualizes monthly revenue generated across the portal.</p>
                    </div>

                    <div className="w-full h-[220px] select-none mt-2">
                      <svg viewBox={`0 0 ${lineChartPoints.width} ${lineChartPoints.height}`} className="w-full h-full overflow-visible">
                        <linearGradient id="admin-revenue-grad" x1="0" y1="0" x2="0" y2="1">
                          <stop offset="0%" stopColor="#F36F21" stopOpacity="0.25" />
                          <stop offset="100%" stopColor="#F36F21" stopOpacity="0" />
                        </linearGradient>
                        {/* Grid Lines */}
                        {[0, 0.25, 0.5, 0.75, 1].map((r, i) => {
                          const y = lineChartPoints.paddingTop + lineChartPoints.chartHeight - r * lineChartPoints.chartHeight;
                          const val = r * lineChartPoints.roundMax;
                          return (
                            <g key={i} className="opacity-40">
                              <line x1={lineChartPoints.paddingLeft} y1={y} x2={lineChartPoints.width - lineChartPoints.paddingRight} y2={y} stroke="#cbd5e1" strokeWidth="1" strokeDasharray="3 3" />
                              <text x={lineChartPoints.paddingLeft - 8} y={y + 3} textAnchor="end" className="text-[9px] fill-slate-500 font-extrabold">{val === 0 ? '0 ₫' : `${(val / 1000000).toFixed(0)}M ₫`}</text>
                            </g>
                          );
                        })}
                        {/* Area */}
                        {lineChartPoints.points.length > 0 && (
                          <path
                            d={`M ${lineChartPoints.points[0].x} ${lineChartPoints.paddingTop + lineChartPoints.chartHeight} L ${lineChartPoints.points.map(p => `${p.x} ${p.y}`).join(' L ')} L ${lineChartPoints.points[lineChartPoints.points.length - 1].x} ${lineChartPoints.paddingTop + lineChartPoints.chartHeight} Z`}
                            fill="url(#admin-revenue-grad)"
                          />
                        )}
                        {/* Line */}
                        {lineChartPoints.points.length > 0 && (
                          <path d={`M ${lineChartPoints.points.map(p => `${p.x} ${p.y}`).join(' L ')}`} fill="none" stroke="#F36F21" strokeWidth="3" strokeLinecap="round" />
                        )}
                        {/* Dots */}
                        {lineChartPoints.points.map((p, idx) => (
                          <circle key={idx} cx={p.x} cy={p.y} r="4.5" fill="#fff" stroke="#F36F21" strokeWidth="2.5" />
                        ))}
                        {/* Labels */}
                        {financialChartData.map((m, idx) => (
                          <text key={idx} x={lineChartPoints.points[idx].x} y={lineChartPoints.height - 8} fill="#64748b" fontSize="9" fontWeight="700" textAnchor="middle">{m.label}</text>
                        ))}
                      </svg>
                    </div>
                  </div>

                  {/* Monthly Signups Bar Chart */}
                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                    <div className="mb-4">
                      <h3 className="font-display font-bold text-lg text-brand-blue">New User Registrations</h3>
                      <p className="text-xs text-text-muted">Monthly user growth registrations over the course of a year.</p>
                    </div>

                    <div className="w-full h-[220px] select-none mt-2">
                      <svg viewBox={`0 0 640 220`} className="w-full h-full overflow-visible">
                        {/* Simple bars */}
                        {[0, 0.25, 0.5, 0.75, 1].map((r, i) => {
                          const y = 20 + 170 - r * 170;
                          return (
                            <line key={i} x1="50" y1={y} x2="620" y2={y} stroke="#e2e8f0" strokeWidth="1" strokeDasharray="3 3" />
                          );
                        })}
                        {financialChartData.map((m, idx) => {
                          const x = 60 + idx * 46;
                          const barHeight = m.usersCount * 2.8;
                          const y = 190 - barHeight;
                          return (
                            <g key={idx}>
                              <rect x={x} y={y} width="22" height={barHeight} fill="#12284C" rx="3" className="transition-all duration-300 hover:fill-primary" />
                              <text x={x + 11} y="210" fill="#64748b" fontSize="9" fontWeight="700" textAnchor="middle">{m.label}</text>
                              <text x={x + 11} y={y - 5} fill="#12284C" fontSize="8" fontWeight="800" textAnchor="middle">{m.usersCount}</text>
                            </g>
                          );
                        })}
                      </svg>
                    </div>
                  </div>
                </div>

                {/* Donut Charts Rows (2 rows x 2 columns) */}
                <div className="flex flex-col gap-8">
                  {/* Row 1: Categories & Courses */}
                  <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    {/* Donut Chart 1: Top Categories */}
                    <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                      <div>
                        <h3 className="font-display font-bold text-lg text-brand-blue mb-4">Top Registered Categories</h3>
                        <div className="flex flex-col sm:flex-row items-center justify-around gap-6">
                          <div className="relative w-36 h-36 shrink-0">
                            {/* Custom SVG Pie/Donut Chart */}
                            <svg viewBox="0 0 36 36" className="w-full h-full">
                              <circle cx="18" cy="18" r="15.915" fill="none" stroke="#e2e8f0" strokeWidth="3" />
                              {categoryChartData.map((c, i) => {
                                // Compute accumulate percentages
                                const prevSum = categoryChartData.slice(0, i).reduce((sum, curr) => sum + curr.count, 0);
                                const prevPct = (prevSum / categoryTotal) * 100;
                                const currentPct = (c.count / categoryTotal) * 100;
                                return (
                                  <circle
                                    key={i}
                                    cx="18"
                                    cy="18"
                                    r="15.915"
                                    fill="none"
                                    stroke={c.color}
                                    strokeWidth="3"
                                    strokeDasharray={`${currentPct} ${100 - currentPct}`}
                                    strokeDashoffset={100 - prevPct + 25}
                                  />
                                );
                              })}
                            </svg>
                            <div className="absolute inset-0 flex flex-col items-center justify-center leading-none">
                              <span className="text-xl font-black text-brand-blue">{categoryTotal}</span>
                              <span className="text-[10px] text-text-muted font-bold mt-1 uppercase tracking-wider">Subscribers</span>
                            </div>
                          </div>

                          {/* Legend */}
                          <div className="flex flex-col gap-2.5 w-full">
                            {categoryChartData.map((c, i) => (
                              <div key={i} className="flex items-center justify-between text-xs">
                                <div className="flex items-center gap-2">
                                  <span className="w-3 h-3 rounded-full shrink-0" style={{ backgroundColor: c.color }}></span>
                                  <span className="font-semibold text-slate-700">{c.name}</span>
                                </div>
                                <span className="font-bold text-brand-blue">
                                  {c.count} ({((c.count / categoryTotal) * 100).toFixed(1)}%)
                                </span>
                              </div>
                            ))}
                          </div>
                        </div>
                      </div>
                    </div>

                    {/* Donut Chart 2: Top Courses */}
                    <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                      <div>
                        <h3 className="font-display font-bold text-lg text-brand-blue mb-4">Top Subscribed Courses</h3>
                        <div className="flex flex-col sm:flex-row items-center justify-around gap-6">
                          <div className="relative w-36 h-36 shrink-0">
                            <svg viewBox="0 0 36 36" className="w-full h-full">
                              <circle cx="18" cy="18" r="15.915" fill="none" stroke="#e2e8f0" strokeWidth="3" />
                              {topCoursesChartData.map((c, i) => {
                                const prevSum = topCoursesChartData.slice(0, i).reduce((sum, curr) => sum + curr.count, 0);
                                const prevPct = (prevSum / topCoursesTotal) * 100;
                                const currentPct = (c.count / topCoursesTotal) * 100;
                                return (
                                  <circle
                                    key={i}
                                    cx="18"
                                    cy="18"
                                    r="15.915"
                                    fill="none"
                                    stroke={c.color}
                                    strokeWidth="3"
                                    strokeDasharray={`${currentPct} ${100 - currentPct}`}
                                    strokeDashoffset={100 - prevPct + 25}
                                  />
                                );
                              })}
                            </svg>
                            <div className="absolute inset-0 flex flex-col items-center justify-center leading-none">
                              <span className="text-xl font-black text-brand-blue">{topCoursesTotal}</span>
                              <span className="text-[10px] text-text-muted font-bold mt-1 uppercase tracking-wider">Registrations</span>
                            </div>
                          </div>

                          {/* Legend */}
                          <div className="flex flex-col gap-2.5 w-full">
                            {topCoursesChartData.map((c, i) => (
                              <div key={i} className="flex items-center justify-between text-xs">
                                <div className="flex items-center gap-2">
                                  <span className="w-3 h-3 rounded-full shrink-0" style={{ backgroundColor: c.color }}></span>
                                  <span className="font-semibold text-slate-700">
                                    {c.name} <span className="text-[10px] text-slate-400 font-medium">({c.instructor})</span>
                                  </span>
                                </div>
                                <span className="font-bold text-brand-blue">
                                  {c.count} ({((c.count / topCoursesTotal) * 100).toFixed(1)}%)
                                </span>
                              </div>
                            ))}
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>

                  {/* Row 2: Instructors & Problems */}
                  <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                    {/* Donut Chart 3: Top Instructors */}
                    <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                      <div>
                        <h3 className="font-display font-bold text-lg text-brand-blue mb-4">Top Instructors</h3>
                        <div className="flex flex-col sm:flex-row items-center justify-around gap-6">
                          <div className="relative w-36 h-36 shrink-0">
                            <svg viewBox="0 0 36 36" className="w-full h-full">
                              <circle cx="18" cy="18" r="15.915" fill="none" stroke="#e2e8f0" strokeWidth="3" />
                              {topInstructorsChartData.map((c, i) => {
                                const prevSum = topInstructorsChartData.slice(0, i).reduce((sum, curr) => sum + curr.count, 0);
                                const prevPct = (prevSum / topInstructorsTotal) * 100;
                                const currentPct = (c.count / topInstructorsTotal) * 100;
                                return (
                                  <circle
                                    key={i}
                                    cx="18"
                                    cy="18"
                                    r="15.915"
                                    fill="none"
                                    stroke={c.color}
                                    strokeWidth="3"
                                    strokeDasharray={`${currentPct} ${100 - currentPct}`}
                                    strokeDashoffset={100 - prevPct + 25}
                                  />
                                );
                              })}
                            </svg>
                            <div className="absolute inset-0 flex flex-col items-center justify-center leading-none">
                              <span className="text-xl font-black text-brand-blue">{topInstructorsTotal}</span>
                              <span className="text-[10px] text-text-muted font-bold mt-1 uppercase tracking-wider">Purchases</span>
                            </div>
                          </div>

                          {/* Legend */}
                          <div className="flex flex-col gap-2.5 w-full">
                            {topInstructorsChartData.map((c, i) => (
                              <div key={i} className="flex items-center justify-between text-xs">
                                <div className="flex items-center gap-2">
                                  <span className="w-3 h-3 rounded-full shrink-0" style={{ backgroundColor: c.color }}></span>
                                  <span className="font-semibold text-slate-700">{c.name}</span>
                                </div>
                                <span className="font-bold text-brand-blue">
                                  {c.count} ({((c.count / topInstructorsTotal) * 100).toFixed(1)}%)
                                </span>
                              </div>
                            ))}
                          </div>
                        </div>
                      </div>
                    </div>

                    {/* Donut Chart 4: Top Submitted Problems */}
                    <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                      <div>
                        <h3 className="font-display font-bold text-lg text-brand-blue mb-4">Top Submitted Problems</h3>
                        <div className="flex flex-col sm:flex-row items-center justify-around gap-6">
                          <div className="relative w-36 h-36 shrink-0">
                            <svg viewBox="0 0 36 36" className="w-full h-full">
                              <circle cx="18" cy="18" r="15.915" fill="none" stroke="#e2e8f0" strokeWidth="3" />
                              {topProblemsChartData.map((c, i) => {
                                const prevSum = topProblemsChartData.slice(0, i).reduce((sum, curr) => sum + curr.count, 0);
                                const prevPct = (prevSum / topProblemsTotal) * 100;
                                const currentPct = (c.count / topProblemsTotal) * 100;
                                return (
                                  <circle
                                    key={i}
                                    cx="18"
                                    cy="18"
                                    r="15.915"
                                    fill="none"
                                    stroke={c.color}
                                    strokeWidth="3"
                                    strokeDasharray={`${currentPct} ${100 - currentPct}`}
                                    strokeDashoffset={100 - prevPct + 25}
                                  />
                                );
                              })}
                            </svg>
                            <div className="absolute inset-0 flex flex-col items-center justify-center leading-none">
                              <span className="text-xl font-black text-brand-blue">{topProblemsTotal}</span>
                              <span className="text-[10px] text-text-muted font-bold mt-1 uppercase tracking-wider">Submissions</span>
                            </div>
                          </div>

                          {/* Legend */}
                          <div className="flex flex-col gap-2.5 w-full">
                            {topProblemsChartData.map((c, i) => (
                              <div key={i} className="flex items-center justify-between text-xs">
                                <div className="flex items-center gap-2">
                                  <span className="w-3 h-3 rounded-full shrink-0" style={{ backgroundColor: c.color }}></span>
                                  <span className="font-semibold text-slate-700">
                                    {c.name} <span className={`text-[9px] font-bold px-1.5 py-0.5 rounded-full ml-1.5 ${c.difficulty === 'EASY' ? 'bg-green-50 text-green-600' :
                                      c.difficulty === 'MEDIUM' ? 'bg-orange-50 text-orange-600' : 'bg-red-50 text-red-600'
                                      }`}>{c.difficulty}</span>
                                  </span>
                                </div>
                                <span className="font-bold text-brand-blue">
                                  {c.count} ({((c.count / topProblemsTotal) * 100).toFixed(1)}%)
                                </span>
                              </div>
                            ))}
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

                {/* Logs and Quick Approvals Row */}
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                  {/* User Deposit History Table */}
                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col">
                    <h3 className="font-display font-bold text-lg text-brand-blue mb-4 flex items-center gap-2">
                      <span className="material-symbols-outlined text-primary">payments</span> User Deposit History
                    </h3>
                    <div className="overflow-x-auto max-h-[350px]">
                      <table className="w-full text-left border-collapse">
                        <thead>
                          <tr className="bg-slate-50 text-[10px] font-black text-text-muted border-b border-slate-100 uppercase tracking-wider">
                            <th className="py-2.5 px-4">User Name</th>
                            <th className="py-2.5 px-4">Deposit Amount</th>
                            <th className="py-2.5 px-4">Date</th>
                          </tr>
                        </thead>
                        <tbody className="text-xs font-semibold text-slate-700 divide-y divide-slate-100">
                          {recentDeposits.map((dep) => (
                            <tr key={dep.id} className="hover:bg-slate-50/50 transition-colors">
                              <td className="py-3 px-4 font-bold text-slate-900">{dep.userName}</td>
                              <td className="py-3 px-4 text-[#10B981] font-bold">
                                {dep.amount.toLocaleString('vi-VN')} ₫
                              </td>
                              <td className="py-3 px-4 text-slate-400 font-semibold">
                                {new Date(dep.date).toLocaleString()}
                              </td>
                            </tr>
                          ))}
                          {recentDeposits.length === 0 && (
                            <tr>
                              <td colSpan={3} className="py-8 text-center text-text-muted italic">No recent deposits.</td>
                            </tr>
                          )}
                        </tbody>
                      </table>
                    </div>
                  </div>

                  {/* Quick Approvals Card */}
                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                    <div>
                      <h3 className="font-display font-bold text-lg text-brand-blue mb-4 flex items-center gap-2">
                        <span className="material-symbols-outlined text-orange-500">pending_actions</span> Pending Approvals Summary
                      </h3>

                      {/* Course Approvals quick preview */}
                      <div className="flex flex-col gap-3">
                        <h4 className="text-xs font-black text-text-muted uppercase tracking-wider">Pending Courses ({courses.filter(c => c.status === 'PENDING').length})</h4>
                        {courses.filter(c => c.status === 'PENDING').slice(0, 2).map((c) => (
                          <div key={c.id} className="flex items-center justify-between bg-slate-50/50 border border-slate-100 p-3 rounded-xl">
                            <div className="min-w-0">
                              <p className="text-xs font-bold text-text-main truncate">{c.title}</p>
                              <p className="text-[10px] text-text-muted">By {c.instructorName}</p>
                            </div>
                            <button
                              onClick={() => handleReviewCourse(c)}
                              className="text-[10px] bg-primary hover:bg-primary-hover text-white font-bold px-3 py-1.5 rounded-lg transition-colors"
                            >
                              Review
                            </button>
                          </div>
                        ))}
                        {courses.filter(c => c.status === 'PENDING').length === 0 && (
                          <p className="text-xs text-text-muted italic">No pending course registrations.</p>
                        )}

                        <hr className="my-2 border-slate-100" />

                        {/* Instructor Application approvals quick preview */}
                        <h4 className="text-xs font-black text-text-muted uppercase tracking-wider">Pending Instructors ({applications.filter(a => a.status === 'PENDING').length})</h4>
                        {applications.filter(a => a.status === 'PENDING').slice(0, 2).map((app) => (
                          <div key={app.id} className="flex items-center justify-between bg-slate-50/50 border border-slate-100 p-3 rounded-xl">
                            <div className="min-w-0">
                              <p className="text-xs font-bold text-text-main truncate">{app.fullName}</p>
                              <p className="text-[10px] text-text-muted">{app.email}</p>
                            </div>
                            <button
                              onClick={() => setSelectedAppForReview(app)}
                              className="text-[10px] bg-primary hover:bg-primary-hover text-white font-bold px-3 py-1.5 rounded-lg transition-colors"
                            >
                              Review
                            </button>
                          </div>
                        ))}
                        {applications.filter(a => a.status === 'PENDING').length === 0 && (
                          <p className="text-xs text-text-muted italic">No pending instructor requests.</p>
                        )}
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            )}

            {/* TAB: COURSES */}
            {activeTab === 'courses' && (
              <div className="flex flex-col gap-6">
                <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
                  <h2 className="text-2xl font-display font-black text-brand-blue">Platform Courses Management</h2>
                  {/* Status Filters */}
                  <div className="flex gap-2">
                    {['ALL', 'APPROVED', 'PENDING', 'REJECTED'].map((filterVal) => (
                      <button
                        key={filterVal}
                        onClick={() => setCourseFilter(filterVal as any)}
                        className={`text-xs font-bold px-3 py-1.5 rounded-xl border transition-all ${courseFilter === filterVal
                          ? 'bg-primary text-white border-primary shadow-sm'
                          : 'bg-surface hover:bg-slate-50 text-slate-600 border-slate-200'
                          }`}
                      >
                        {filterVal}
                      </button>
                    ))}
                  </div>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                  {filteredCourses.map((c) => (
                    <div key={c.id} className="bg-surface rounded-2xl border border-slate-200/50 overflow-hidden ambient-shadow flex flex-col justify-between hover:shadow-lg transition-shadow">
                      <div>
                        <img src={c.thumbnailUrl} alt={c.title} className="w-full h-40 object-cover border-b border-slate-100" />
                        <div className="p-5 flex flex-col gap-2">
                          <span className={`text-[10px] font-black uppercase tracking-wider px-2 py-0.5 rounded-md self-start ${c.status === 'APPROVED' ? 'bg-emerald-50 text-emerald-600' :
                            c.status === 'PENDING' ? 'bg-orange-50 text-orange-500' : 'bg-red-50 text-red-500'
                            }`}>{c.status}</span>
                          <h3 className="font-display font-bold text-base text-brand-blue truncate mt-1">{c.title}</h3>
                          <p className="text-xs text-text-muted line-clamp-2">{c.shortDescription}</p>
                          <div className="flex items-center gap-2 mt-1">
                            <img
                              src={c.instructorAvatarUrl || "https://ui-avatars.com/api/?name=" + encodeURIComponent(c.instructorName) + "&background=12284C&color=fff"}
                              alt={c.instructorName}
                              className="w-5 h-5 rounded-full object-cover border border-slate-200 shrink-0"
                              onError={(e) => {
                                (e.target as HTMLImageElement).src = "https://ui-avatars.com/api/?name=" + encodeURIComponent(c.instructorName) + "&background=12284C&color=fff";
                              }}
                            />
                            <p className="text-[11px] text-slate-500 font-semibold">Instructor: {c.instructorName}</p>
                          </div>

                          <div className="grid grid-cols-2 gap-2 mt-3 text-[11px] font-semibold text-slate-600 bg-slate-50 p-2.5 rounded-xl">
                            <div>Enrolled: <span className="text-brand-blue font-bold">{c.totalEnrolled}</span></div>
                            <div>Price: <span className="text-primary font-bold">{c.price.toLocaleString('vi-VN')} ₫</span></div>
                            <div>Chapters: <span className="text-slate-800 font-bold">{c.totalChapters}</span></div>
                            <div>Lessons: <span className="text-slate-800 font-bold">{c.totalLessons}</span></div>
                            {c.status === 'APPROVED' && (
                              <div>Videos: <span className="text-slate-800 font-bold">{c.totalVideos}</span></div>
                            )}
                            <div className={c.status === 'APPROVED' ? 'col-span-1' : 'col-span-2'}>
                              Rating: <span className="text-orange-500 font-bold">★ {c.averageRating ? c.averageRating.toFixed(1) : 'N/A'}</span>
                              {c.totalReviews > 0 && (
                                <span className="text-slate-400 font-medium ml-0.5">({c.totalReviews})</span>
                              )}
                            </div>
                          </div>
                        </div>
                      </div>

                      {c.status === 'PENDING' && (
                        <div className="p-5 pt-0 border-t border-slate-50 mt-2 flex gap-2">
                          <button
                            onClick={() => handleReviewCourse(c)}
                            className="flex-1 text-xs bg-primary hover:bg-primary-hover text-white font-bold py-2 rounded-xl transition-all"
                          >
                            Review & Approve
                          </button>
                        </div>
                      )}
                    </div>
                  ))}
                  {filteredCourses.length === 0 && (
                    <div className="col-span-3 bg-surface p-12 rounded-2xl border border-slate-200/50 text-center text-text-muted">
                      No courses found matching criteria.
                    </div>
                  )}
                </div>
              </div>
            )}

            {/* TAB: PROBLEMS */}
            {activeTab === 'problems' && (
              <div className="flex flex-col gap-6">
                <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
                  <h2 className="text-2xl font-display font-black text-brand-blue">Coding Arena Problems</h2>
                  <div className="flex flex-col sm:flex-row gap-2.5 w-full sm:w-auto">
                    <input
                      type="text"
                      placeholder="Search problem title..."
                      value={problemSearch}
                      onChange={(e) => setProblemSearch(e.target.value)}
                      className="text-xs bg-surface border border-slate-200 rounded-xl px-3 py-1.5 focus:ring-primary focus:border-primary w-full sm:w-60"
                    />
                    <select
                      value={problemDifficultyFilter}
                      onChange={(e) => setProblemDifficultyFilter(e.target.value as any)}
                      className="text-xs bg-surface border border-slate-200 rounded-xl pl-3 pr-8 py-1.5 focus:ring-primary focus:border-primary"
                    >
                      <option value="ALL">All Difficulties</option>
                      <option value="EASY">Easy</option>
                      <option value="MEDIUM">Medium</option>
                      <option value="HARD">Hard</option>
                    </select>
                    <select
                      value={problemScopeFilter}
                      onChange={(e) => setProblemScopeFilter(e.target.value as any)}
                      className="text-xs bg-surface border border-slate-200 rounded-xl pl-3 pr-8 py-1.5 focus:ring-primary focus:border-primary"
                    >
                      <option value="ALL">All Scopes</option>
                      <option value="PRACTICE">Practice</option>
                      <option value="CONTEST">Contest</option>
                      <option value="SHARED">Share</option>
                    </select>
                    <button
                      onClick={handleCreateProblemClick}
                      className="bg-primary hover:bg-primary-hover text-white font-bold text-xs px-4 py-2 rounded-xl transition-all shadow-md shrink-0 flex items-center gap-1.5"
                    >
                      <span className="material-symbols-outlined text-xs">add</span> Create Problem
                    </button>
                  </div>
                </div>

                {/* Sub-tab Navigation */}
                <div className="flex border-b border-slate-200 gap-4 mb-2 overflow-x-auto pb-px">
                  <button
                    onClick={() => setProblemSubTab('repository')}
                    className={`pb-2.5 px-4 text-xs font-bold border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${problemSubTab === 'repository'
                      ? 'border-primary text-primary'
                      : 'border-transparent text-slate-500 hover:text-primary'
                      }`}
                  >
                    <span className="material-symbols-outlined text-[16px]">folder_open</span>
                    All Problems ({problems.length})
                  </button>
                  <button
                    onClick={() => setProblemSubTab('practice')}
                    className={`pb-2.5 px-4 text-xs font-bold border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${problemSubTab === 'practice'
                      ? 'border-primary text-primary'
                      : 'border-transparent text-slate-500 hover:text-primary'
                      }`}
                  >
                    <span className="material-symbols-outlined text-[16px]">terminal</span>
                    Practice Problems ({problems.filter(p => p.problemScope === 'PRACTICE').length})
                  </button>
                  <button
                    onClick={() => setProblemSubTab('contest')}
                    className={`pb-2.5 px-4 text-xs font-bold border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${problemSubTab === 'contest'
                      ? 'border-primary text-primary'
                      : 'border-transparent text-slate-500 hover:text-primary'
                      }`}
                  >
                    <span className="material-symbols-outlined text-[16px]">emoji_events</span>
                    Contest Problems ({problems.filter(p => p.problemScope === 'CONTEST').length})
                  </button>
                  <button
                    onClick={() => setProblemSubTab('shared')}
                    className={`pb-2.5 px-4 text-xs font-bold border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${problemSubTab === 'shared'
                      ? 'border-primary text-primary'
                      : 'border-transparent text-slate-500 hover:text-primary'
                      }`}
                  >
                    <span className="material-symbols-outlined text-[16px]">share</span>
                    Shared Problems ({problems.filter(p => p.problemScope === 'SHARED').length})
                  </button>
                </div>

                {/* Problems List Table */}
                <div className="bg-surface rounded-2xl border border-slate-200/50 overflow-hidden ambient-shadow">
                  <div className="overflow-x-auto">
                    <table className="w-full text-left border-collapse">
                      <thead>
                        <tr className="bg-slate-50 text-xs font-black text-text-muted border-b border-slate-100 uppercase tracking-wider">
                          <th className="py-4 px-6">ID</th>
                          <th className="py-4 px-6">Title</th>
                          <th className="py-4 px-6">Difficulty</th>
                          <th className="py-4 px-6 text-right">Submissions</th>
                          <th className="py-4 px-6 text-right">Accepted Rate</th>
                          <th className="py-4 px-6 text-center">Scope</th>
                          <th className="py-4 px-6 text-center">Status</th>
                          <th className="py-4 px-6 text-center">Actions</th>
                        </tr>
                      </thead>
                      <tbody className="text-xs font-semibold text-slate-700 divide-y divide-slate-100">
                        {filteredProblems.map((p, index) => {
                          const totalSubs = p.totalSubmissions || 0;
                          const acceptedSubs = p.acceptedSubmissions || 0;
                          const acceptedRate = totalSubs > 0 ? (acceptedSubs / totalSubs * 100).toFixed(1) : "0.0";

                          return (
                            <tr key={p.id} className="hover:bg-slate-50/50 transition-colors">
                              <td className="py-4 px-6 text-brand-blue font-bold">#{index + 1}</td>
                              <td className="py-4 px-6 font-bold text-slate-900">{p.title}</td>
                              <td className="py-4 px-6">
                                <span className={`px-2.5 py-0.5 rounded-md font-bold text-[10px] ${p.difficulty === 'EASY' ? 'bg-emerald-50 text-emerald-600' :
                                  p.difficulty === 'MEDIUM' ? 'bg-blue-50 text-blue-600' : 'bg-red-50 text-red-600'
                                  }`}>{p.difficulty}</span>
                              </td>
                              <td className="py-4 px-6 text-right font-mono font-bold text-slate-600">
                                {totalSubs.toLocaleString()}
                              </td>
                              <td className="py-4 px-6 text-right font-mono font-bold text-slate-800">
                                <div className="flex flex-col items-end gap-1.5">
                                  <span>{acceptedRate}%</span>
                                  <div className="w-16 h-1 bg-slate-100 rounded-full overflow-hidden border border-slate-200/50">
                                    <div 
                                      className="h-full bg-emerald-500 rounded-full transition-all" 
                                      style={{ width: `${acceptedRate}%` }}
                                    />
                                  </div>
                                </div>
                              </td>
                              <td className="py-4 px-6 text-center">
                                <select
                                  value={p.problemScope}
                                  onChange={(e) => handleUpdateProblemScope(p.id, e.target.value as any)}
                                  className={`border rounded-lg pl-2.5 pr-8 py-1 text-xs font-bold focus:ring-0 outline-none cursor-pointer ${p.problemScope === 'PRACTICE'
                                    ? 'bg-green-50 text-green-600 border-green-200'
                                    : p.problemScope === 'CONTEST'
                                      ? 'bg-blue-50 text-blue-600 border-blue-200'
                                      : 'bg-orange-50 text-orange-600 border-orange-200'
                                    }`}
                                >
                                  <option value="PRACTICE" className="bg-white text-green-600 font-bold">Practice</option>
                                  <option value="CONTEST" className="bg-white text-blue-600 font-bold">Contest</option>
                                  <option value="SHARED" className="bg-white text-orange-600 font-bold">Share</option>
                                </select>
                              </td>
                              <td className="py-4 px-6 text-center">
                                {!p.isActive ? (
                                  <select
                                    disabled
                                    value="INACTIVE"
                                    className="bg-amber-50 border border-amber-250 text-amber-600 rounded-lg pl-2.5 pr-8 py-1 text-xs font-bold outline-none cursor-not-allowed"
                                  >
                                    <option value="INACTIVE">Inactive</option>
                                  </select>
                                ) : (
                                  <select
                                    value={p.isPublic ? "PUBLIC" : "PRIVATE"}
                                    onChange={(e) => handleUpdateProblemPublicStatus(p.id, e.target.value === "PUBLIC")}
                                    className={`border rounded-lg pl-2.5 pr-8 py-1 text-xs font-bold outline-none cursor-pointer ${p.isPublic
                                      ? "bg-emerald-50 border-emerald-250 text-emerald-600"
                                      : "bg-slate-100 border-slate-200 text-slate-600"
                                      }`}
                                  >
                                    <option value="PUBLIC">Public</option>
                                    <option value="PRIVATE">Private</option>
                                  </select>
                                )}
                              </td>
                              <td className="py-4 px-6 text-center">
                                <div className="flex items-center justify-center gap-2">
                                  {!p.isActive ? (
                                    <button
                                      onClick={() => handleOpenTestcaseModal(p)}
                                      className="bg-primary hover:bg-primary-hover text-white font-bold text-[10px] px-3 py-1.5 rounded-xl transition-all flex items-center gap-1 shadow-sm border-none cursor-pointer"
                                    >
                                      <span className="material-symbols-outlined text-[14px]">tune</span> Add Test Cases
                                    </button>
                                  ) : (
                                    <button
                                      onClick={() => handleEditProblemClick(p)}
                                      className="bg-amber-500 hover:bg-amber-600 text-white font-bold text-[10px] px-3 py-1.5 rounded-xl transition-all flex items-center gap-1 shadow-sm border-none cursor-pointer"
                                    >
                                      <span className="material-symbols-outlined text-[14px]">edit</span> Edit
                                    </button>
                                  )}
                                  <button
                                    onClick={() => handleDeleteProblemClick(p.id)}
                                    className="bg-rose-500 hover:bg-rose-600 text-white font-bold text-[10px] px-3 py-1.5 rounded-xl transition-all flex items-center gap-1 shadow-sm border-none cursor-pointer"
                                  >
                                    <span className="material-symbols-outlined text-[14px]">delete</span> Delete
                                  </button>
                                </div>
                              </td>
                            </tr>
                          );
                        })}
                        {filteredProblems.length === 0 && (
                          <tr>
                            <td colSpan={8} className="py-12 text-center text-text-muted italic">No problems found.</td>
                          </tr>
                        )}
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            )}

            {/* TAB: CONTEST */}
            {activeTab === 'contest' && (
              <div className="flex flex-col gap-6">
                <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
                  <h2 className="text-2xl font-display font-black text-brand-blue">Contests & Competitions</h2>
                  <div className="flex gap-3 w-full sm:w-auto">
                    <select
                      value={contestStatusFilter}
                      onChange={(e) => setContestStatusFilter(e.target.value as any)}
                      className="text-xs bg-surface border border-slate-200 rounded-xl pl-3 pr-8 py-1.5 focus:ring-primary focus:border-primary"
                    >
                      <option value="ALL">All Status</option>
                      <option value="UPCOMING">Upcoming</option>
                      <option value="RUNNING">Running</option>
                      <option value="ENDED">Ended</option>
                      <option value="CANCELLED">Cancelled</option>
                    </select>
                    <button
                      onClick={() => setIsCreateContestOpen(true)}
                      className="bg-primary hover:bg-primary-hover text-white font-bold text-xs px-4 py-2 rounded-xl transition-all shadow-md shrink-0 flex items-center gap-1.5 ml-auto"
                    >
                      <span className="material-symbols-outlined text-xs">add</span> Create Contest
                    </button>
                  </div>
                </div>

                {/* Contests Table */}
                <div className="bg-surface rounded-2xl border border-slate-200/50 overflow-hidden ambient-shadow">
                  <div className="overflow-x-auto">
                    <table className="w-full text-left border-collapse">
                      <thead>
                        <tr className="bg-slate-50 text-xs font-black text-text-muted border-b border-slate-100 uppercase tracking-wider">
                          <th className="py-4 px-6">ID</th>
                          <th className="py-4 px-6">Contest Name</th>
                          <th className="py-4 px-6">Scoring Rule</th>
                          <th className="py-4 px-6">Start Time</th>
                          <th className="py-4 px-6">Duration</th>
                          <th className="py-4 px-6">Participants</th>
                          <th className="py-4 px-6 text-center">Status</th>
                          <th className="py-4 px-6 text-center">Action</th>
                        </tr>
                      </thead>
                      <tbody className="text-xs font-semibold text-slate-700 divide-y divide-slate-100">
                        {filteredContests.map((c) => (
                          <tr key={c.id} className="hover:bg-slate-50/50 transition-colors">
                            <td className="py-4 px-6 text-brand-blue font-bold">#{c.id}</td>
                            <td className="py-4 px-6 font-bold text-slate-900">{c.title}</td>
                            <td className="py-4 px-6 text-slate-500 font-extrabold">{c.scoringRule}</td>
                            <td className="py-4 px-6">{new Date(c.startTime).toLocaleString()}</td>
                            <td className="py-4 px-6">{c.durations} mins</td>
                            <td className="py-4 px-6 font-bold text-slate-800">{c.participantCount}</td>
                            <td className="py-4 px-6 text-center">
                              <span className={`px-2.5 py-0.5 rounded-md font-bold text-[10px] ${c.status === 'RUNNING' ? 'bg-red-50 text-red-500 animate-pulse' :
                                c.status === 'UPCOMING' ? 'bg-blue-50 text-blue-600' : 'bg-slate-100 text-slate-500'
                                }`}>{c.status}</span>
                            </td>
                            <td className="py-4 px-6 text-center">
                              <button
                                onClick={() => {
                                  setReviewingContest(c);
                                  setReviewContestTab('overview');
                                  setReviewContestProblemId(null);
                                }}
                                className="bg-primary hover:bg-primary-hover text-white font-bold text-[10px] px-3 py-1.5 rounded-xl transition-all shadow-sm border-none cursor-pointer"
                              >
                                Detail
                              </button>
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            )}

            {/* TAB: INSTRUCTOR */}
            {activeTab === 'instructor' && (
              <div className="flex flex-col gap-6">
                <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
                  <h2 className="text-2xl font-display font-black text-brand-blue">Active Instructors & Applicants</h2>
                  <div className="flex gap-2">
                    {['ALL', 'APPROVED', 'PENDING', 'REJECTED'].map((filterVal) => (
                      <button
                        key={filterVal}
                        onClick={() => setInstructorAppFilter(filterVal as any)}
                        className={`text-xs font-bold px-3 py-1.5 rounded-xl border transition-all ${instructorAppFilter === filterVal
                          ? 'bg-primary text-white border-primary shadow-sm'
                          : 'bg-surface hover:bg-slate-50 text-slate-600 border-slate-200'
                          }`}
                      >
                        {filterVal === 'ALL' ? 'All Applications' : filterVal === 'APPROVED' ? 'Approved Applicants' : filterVal === 'PENDING' ? 'Pending Approvals' : 'Rejected Applications'}
                      </button>
                    ))}
                  </div>
                </div>

                {/* Applications section */}
                {filteredApplications.length > 0 && (
                  <div className="flex flex-col gap-4">
                    <h3 className="text-sm font-black text-text-muted uppercase tracking-wider mb-1">Instructor Registrations / Profile Reviews</h3>
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                      {filteredApplications.map((app) => (
                        <div key={app.id} className="bg-surface rounded-2xl border border-slate-200/50 p-6 ambient-shadow flex flex-col justify-between">
                          <div>
                            <div className="flex justify-between items-start mb-3">
                              <div>
                                <h4 className="font-display font-bold text-base text-brand-blue">{app.fullName}</h4>
                                <p className="text-xs text-text-muted">{app.email}</p>
                              </div>
                              <span className={`text-[10px] font-black uppercase tracking-wider px-2 py-0.5 rounded-md ${app.status === 'APPROVED' ? 'bg-emerald-50 text-emerald-600' :
                                app.status === 'PENDING' ? 'bg-orange-50 text-orange-500' : 'bg-red-50 text-red-500'
                                }`}>{app.status}</span>
                            </div>
                            <p className="text-xs text-slate-700 bg-slate-50 p-3 rounded-xl line-clamp-3 italic">"{app.introduction}"</p>
                            <a
                              href={app.cvUrl}
                              target="_blank"
                              rel="noreferrer"
                              className="inline-flex items-center gap-1.5 text-xs text-primary hover:text-primary-hover font-bold mt-4"
                            >
                              <span className="material-symbols-outlined text-sm">picture_as_pdf</span> View Curriculum Vitae (CV)
                            </a>
                          </div>

                          {app.status === 'PENDING' && (
                            <div className="flex gap-3 border-t border-slate-100 pt-4 mt-4">
                              <button
                                onClick={() => handleApproveInstructor(app.id, 'APPROVED')}
                                className="flex-1 bg-emerald-500 hover:bg-emerald-600 text-white font-bold text-xs py-2 rounded-xl transition-all shadow-sm"
                              >
                                Approve
                              </button>
                              <button
                                onClick={() => handleApproveInstructor(app.id, 'REJECTED')}
                                className="flex-1 bg-red-500 hover:bg-red-600 text-white font-bold text-xs py-2 rounded-xl transition-all shadow-sm"
                              >
                                Reject
                              </button>
                            </div>
                          )}
                        </div>
                      ))}
                    </div>
                  </div>
                )}

                {/* Active Instructors list */}
                <div className="flex flex-col gap-4 mt-4">
                  <h3 className="text-sm font-black text-text-muted uppercase tracking-wider">Active Platform Instructors ({instructors.length})</h3>
                  <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                    {instructors.map((ins) => (
                      <div key={ins.id} className="bg-surface rounded-2xl border border-slate-200/50 p-5 ambient-shadow flex flex-col justify-between">
                        <div>
                          <div className="flex items-center gap-3 mb-3">
                            <img src={`https://ui-avatars.com/api/?name=${ins.fullName}&background=F36F21&color=fff`} className="w-10 h-10 rounded-full object-cover border border-slate-100" alt="" />
                            <div>
                              <h4 className="font-display font-bold text-sm text-brand-blue">{ins.fullName}</h4>
                              <p className="text-[10px] text-text-muted truncate max-w-[180px] font-semibold">{ins.major}</p>
                            </div>
                          </div>
                          <p className="text-xs text-slate-500 line-clamp-3">{ins.bio}</p>
                        </div>
                        <div className="grid grid-cols-3 gap-2 mt-4 text-[10px] font-bold text-slate-600 bg-slate-50 p-2 rounded-xl text-center">
                          <div>Courses: <span className="block text-brand-blue text-xs font-black">{ins.coursesCount}</span></div>
                          <div>Rating: <span className="block text-orange-500 text-xs font-black">★ {ins.rating}</span></div>
                          <div>Students: <span className="block text-slate-800 text-xs font-black">{ins.studentsCount}</span></div>
                        </div>
                      </div>
                    ))}
                  </div>
                </div>
              </div>
            )}

            {/* TAB: USERS */}
            {activeTab === 'users' && (
              <div className="flex flex-col gap-6">
                <div className="flex flex-col sm:flex-row justify-between items-start sm:items-center gap-4">
                  <h2 className="text-2xl font-display font-black text-brand-blue">Platform User Accounts</h2>
                  <div className="flex flex-col sm:flex-row gap-3 w-full sm:w-auto">
                    <input
                      type="text"
                      placeholder="Search by name or email..."
                      value={userSearch}
                      onChange={(e) => setUserSearch(e.target.value)}
                      className="text-xs bg-surface border border-slate-200 rounded-xl px-3 py-1.5 focus:ring-primary focus:border-primary w-full sm:w-60"
                    />
                    <select
                      value={userOnlineFilter}
                      onChange={(e) => setUserOnlineFilter(e.target.value as any)}
                      className="text-xs bg-surface border border-slate-200 rounded-xl pl-3 pr-8 py-1.5 focus:ring-primary focus:border-primary"
                    >
                      <option value="ALL">All Activity</option>
                      <option value="ONLINE">Online</option>
                      <option value="OFFLINE">Offline</option>
                    </select>
                    <select
                      value={userStatusFilter}
                      onChange={(e) => setUserStatusFilter(e.target.value as any)}
                      className="text-xs bg-surface border border-slate-200 rounded-xl pl-3 pr-8 py-1.5 focus:ring-primary focus:border-primary"
                    >
                      <option value="ALL">All Status</option>
                      <option value="ACTIVE">Active</option>
                      <option value="LOCKED">Locked</option>
                    </select>
                  </div>
                </div>

                {/* Users table */}
                <div className="bg-surface rounded-2xl border border-slate-200/50 overflow-hidden ambient-shadow">
                  <div className="overflow-x-auto">
                    <table className="w-full text-left border-collapse">
                      <thead>
                        <tr className="bg-slate-50 text-xs font-black text-text-muted border-b border-slate-100 uppercase tracking-wider">
                          <th className="py-4 px-6 text-center w-24">Activity</th>
                          <th className="py-4 px-6">Name</th>
                          <th className="py-4 px-6">Email</th>
                          <th className="py-4 px-6">Register Date</th>
                          <th className="py-4 px-6">Wallet Balance</th>
                          <th className="py-4 px-6">Deposited</th>
                          <th className="py-4 px-6">Status</th>
                          <th className="py-4 px-6 text-right">Actions</th>
                        </tr>
                      </thead>
                      <tbody className="text-xs font-semibold text-slate-700 divide-y divide-slate-100">
                        {filteredUsers.map((u) => (
                          <tr key={u.id} className="hover:bg-slate-50/50 transition-colors">
                            <td className="py-4 px-6 text-center">
                              <span
                                className={`inline-block w-2.5 h-2.5 rounded-full ${u.isOnline ? 'bg-emerald-500 animate-pulse' : 'bg-red-500'}`}
                                title={u.isOnline ? 'Online' : 'Offline'}
                              ></span>
                            </td>
                            <td className="py-4 px-6 font-bold text-slate-900">{u.name}</td>
                            <td className="py-4 px-6">{u.email}</td>
                            <td className="py-4 px-6">{new Date(u.registerDate).toLocaleDateString()}</td>
                            <td className="py-4 px-6 font-bold text-slate-800">{u.balance.toLocaleString()} ₫</td>
                            <td className="py-4 px-6 text-emerald-600 font-bold">+{u.totalDeposited.toLocaleString()} ₫</td>
                            <td className="py-4 px-6">
                              <select
                                value={u.status}
                                onChange={(e) => handleUserStatusChange(u.id, e.target.value as 'ACTIVE' | 'LOCKED')}
                                className={`border rounded-lg pl-2.5 pr-8 py-1.5 text-xs font-bold focus:ring-0 outline-none cursor-pointer ${
                                  u.status === 'ACTIVE'
                                    ? 'bg-emerald-50 text-emerald-600 border-emerald-200'
                                    : 'bg-red-50 text-red-600 border-red-200'
                                }`}
                              >
                                <option value="ACTIVE" className="bg-white text-emerald-600 font-bold">ACTIVE</option>
                                <option value="LOCKED" className="bg-white text-red-600 font-bold">LOCKED</option>
                              </select>
                            </td>
                            <td className="py-4 px-6 text-right">
                              {u.status === 'LOCKED' && (
                                <button
                                  onClick={() => handleUserStatusChange(u.id, 'ACTIVE')}
                                  className="text-[10px] bg-emerald-500 hover:bg-emerald-600 text-white font-bold px-2.5 py-1.5 rounded-lg transition-colors shadow-sm cursor-pointer border-none"
                                >
                                  Unlock
                                </button>
                              )}
                            </td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
            )}

            {/* TAB: FINANCIAL STATISTICS */}
            {activeTab === 'financial' && (
              <div className="flex flex-col gap-8 pb-10 text-left">
                {/* Header Title and Controls */}
                <div className="flex flex-col xl:flex-row justify-between items-start xl:items-center gap-6 border-b border-slate-200/60 pb-6">
                  <div>
                    <h2 className="text-2xl font-display font-black text-brand-blue flex items-center gap-2">
                      <span className="material-symbols-outlined text-3xl text-primary">insights</span>
                      Financial Insights & Audits
                    </h2>
                    <p className="text-xs text-text-muted mt-1 font-medium">
                      Real-time stats of platform course sales, instructor revenue payouts, and operating profit.
                    </p>
                  </div>

                  {/* Filter Controls Panel */}
                  <div className="flex flex-wrap items-center gap-4 bg-white p-3.5 rounded-2xl border border-slate-200/50 shadow-sm w-full xl:w-auto">
                    {/* Preset buttons */}
                    <div className="flex bg-slate-100 p-1 rounded-xl gap-0.5">
                      {[
                        { val: 'month', label: 'Tháng này' },
                        { val: '3months', label: '3 tháng' },
                        { val: '9months', label: '9 tháng' },
                        { val: '12months', label: '12 tháng' }
                      ].map(p => (
                        <button
                          key={p.val}
                          onClick={() => {
                            setFinancialTimeFilter(p.val as any);
                            setFinancialStartDate('');
                            setFinancialEndDate('');
                          }}
                          className={`text-xs font-bold px-3.5 py-2 rounded-lg transition-all ${
                            financialTimeFilter === p.val
                              ? 'bg-white text-brand-blue shadow-sm'
                              : 'text-slate-500 hover:text-brand-blue'
                          }`}
                        >
                          {p.label}
                        </button>
                      ))}
                    </div>

                    {/* Date pickers */}
                    <div className="flex items-center gap-2">
                      <span className="text-[10px] text-slate-400 font-bold uppercase tracking-wider hidden sm:inline">Custom:</span>
                      <div className="flex items-center gap-1.5 bg-slate-50 border border-slate-200 rounded-xl px-2.5 py-1.5">
                        <span className="material-symbols-outlined text-[15px] text-slate-400">calendar_today</span>
                        <input
                          type="date"
                          value={financialStartDate}
                          onChange={e => {
                            setFinancialStartDate(e.target.value);
                            setFinancialTimeFilter('custom');
                          }}
                          className="bg-transparent text-xs font-bold text-slate-700 outline-none border-none p-0 focus:ring-0 w-28"
                          placeholder="Từ ngày"
                        />
                      </div>
                      <span className="text-xs text-slate-400 font-bold">to</span>
                      <div className="flex items-center gap-1.5 bg-slate-50 border border-slate-200 rounded-xl px-2.5 py-1.5">
                        <span className="material-symbols-outlined text-[15px] text-slate-400">calendar_today</span>
                        <input
                          type="date"
                          value={financialEndDate}
                          onChange={e => {
                            setFinancialEndDate(e.target.value);
                            setFinancialTimeFilter('custom');
                          }}
                          className="bg-transparent text-xs font-bold text-slate-700 outline-none border-none p-0 focus:ring-0 w-28"
                          placeholder="Đến ngày"
                        />
                      </div>
                    </div>

                    {/* Reset Button */}
                    {(financialTimeFilter !== '12months' || financialStartDate || financialEndDate) && (
                      <button
                        onClick={() => {
                          setFinancialTimeFilter('12months');
                          setFinancialStartDate('');
                          setFinancialEndDate('');
                        }}
                        className="bg-slate-50 hover:bg-slate-100 text-slate-600 font-bold text-xs p-2 rounded-xl transition-all border border-slate-200 flex items-center justify-center"
                        title="Reset Filters"
                      >
                        <span className="material-symbols-outlined text-[16px]">restart_alt</span>
                      </button>
                    )}
                  </div>
                </div>

                {/* 6 Key Metric Cards Grid */}
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 xl:grid-cols-6 gap-5">
                  {/* Card 1: Gross Revenue */}
                  <div className="bg-white rounded-2xl p-5 border border-slate-200/50 shadow-sm hover:shadow-md transition-shadow flex flex-col justify-between relative overflow-hidden group">
                    <div className="absolute top-0 left-0 w-1.5 h-full bg-blue-500"></div>
                    <div>
                      <div className="flex justify-between items-center text-text-muted">
                        <span className="text-[10px] font-black uppercase tracking-wider">Gross Revenue</span>
                        <span className="material-symbols-outlined text-blue-500 text-lg bg-blue-50 p-1.5 rounded-lg">payments</span>
                      </div>
                      <h4 className="text-xl font-display font-black text-slate-900 mt-3 truncate">
                        {financialSummary.gross.toLocaleString()} ₫
                      </h4>
                    </div>
                    <p className="text-[10px] text-slate-400 font-semibold mt-4">
                      Total sales volume generated
                    </p>
                  </div>

                  {/* Card 2: Instructor Share (70%) */}
                  <div className="bg-white rounded-2xl p-5 border border-slate-200/50 shadow-sm hover:shadow-md transition-shadow flex flex-col justify-between relative overflow-hidden group">
                    <div className="absolute top-0 left-0 w-1.5 h-full bg-violet-500"></div>
                    <div>
                      <div className="flex justify-between items-center text-text-muted">
                        <span className="text-[10px] font-black uppercase tracking-wider">Instructor Share (70%)</span>
                        <span className="material-symbols-outlined text-violet-500 text-lg bg-violet-50 p-1.5 rounded-lg">school</span>
                      </div>
                      <h4 className="text-xl font-display font-black text-violet-600 mt-3 truncate">
                        {financialSummary.instructorPayouts.toLocaleString()} ₫
                      </h4>
                    </div>
                    <p className="text-[10px] text-slate-400 font-semibold mt-4">
                      70% split allocated to lecturers
                    </p>
                  </div>

                  {/* Card 3: Platform Cut (30%) */}
                  <div className="bg-white rounded-2xl p-5 border border-slate-200/50 shadow-sm hover:shadow-md transition-shadow flex flex-col justify-between relative overflow-hidden group">
                    <div className="absolute top-0 left-0 w-1.5 h-full bg-indigo-500"></div>
                    <div>
                      <div className="flex justify-between items-center text-text-muted">
                        <span className="text-[10px] font-black uppercase tracking-wider">Platform Cut (30%)</span>
                        <span className="material-symbols-outlined text-indigo-500 text-lg bg-indigo-50 p-1.5 rounded-lg">account_balance_wallet</span>
                      </div>
                      <h4 className="text-xl font-display font-black text-indigo-600 mt-3 truncate">
                        {financialSummary.platformNet.toLocaleString()} ₫
                      </h4>
                    </div>
                    <p className="text-[10px] text-slate-400 font-semibold mt-4">
                      System shares from courses
                    </p>
                  </div>

                  {/* Card 4: Contest Prizes */}
                  <div className="bg-white rounded-2xl p-5 border border-slate-200/50 shadow-sm hover:shadow-md transition-shadow flex flex-col justify-between relative overflow-hidden group">
                    <div className="absolute top-0 left-0 w-1.5 h-full bg-rose-500"></div>
                    <div>
                      <div className="flex justify-between items-center text-text-muted">
                        <span className="text-[10px] font-black uppercase tracking-wider">Contest Prizes</span>
                        <span className="material-symbols-outlined text-rose-500 text-lg bg-rose-50 p-1.5 rounded-lg">emoji_events</span>
                      </div>
                      <h4 className="text-xl font-display font-black text-rose-600 mt-3 truncate">
                        {financialSummary.contestRewards.toLocaleString()} ₫
                      </h4>
                    </div>
                    <p className="text-[10px] text-slate-400 font-semibold mt-4">
                      Total cash rewarded to top users
                    </p>
                  </div>

                  {/* Card 5: Net Operating Profit */}
                  <div className="bg-white rounded-2xl p-5 border border-slate-200/50 shadow-sm hover:shadow-md transition-shadow flex flex-col justify-between relative overflow-hidden group">
                    <div className="absolute top-0 left-0 w-1.5 h-full bg-emerald-500"></div>
                    <div>
                      <div className="flex justify-between items-center text-text-muted">
                        <span className="text-[10px] font-black uppercase tracking-wider">Net Operating Profit</span>
                        <span className="material-symbols-outlined text-emerald-500 text-lg bg-emerald-50 p-1.5 rounded-lg">trending_up</span>
                      </div>
                      <h4 className={`text-xl font-display font-black mt-3 truncate ${
                        financialSummary.netProfit >= 0 ? 'text-emerald-600' : 'text-rose-600'
                      }`}>
                        {financialSummary.netProfit.toLocaleString()} ₫
                      </h4>
                    </div>
                    <p className="text-[10px] text-slate-400 font-semibold mt-4">
                      Platform Share after expenses
                    </p>
                  </div>

                  {/* Card 6: Courses Sold */}
                  <div className="bg-white rounded-2xl p-5 border border-slate-200/50 shadow-sm hover:shadow-md transition-shadow flex flex-col justify-between relative overflow-hidden group">
                    <div className="absolute top-0 left-0 w-1.5 h-full bg-amber-500"></div>
                    <div>
                      <div className="flex justify-between items-center text-text-muted">
                        <span className="text-[10px] font-black uppercase tracking-wider">Courses Sold</span>
                        <span className="material-symbols-outlined text-amber-500 text-lg bg-amber-50 p-1.5 rounded-lg">shopping_bag</span>
                      </div>
                      <h4 className="text-xl font-display font-black text-slate-900 mt-3 truncate">
                        {financialSummary.coursesSold.toLocaleString()} copies
                      </h4>
                    </div>
                    <p className="text-[10px] text-slate-400 font-semibold mt-4">
                      Total purchased copies count
                    </p>
                  </div>
                </div>

                {/* Charts Row: 12-Month Breakdown (60%) & Platform Courses Sold Trend (40%) */}
                <div className="grid grid-cols-1 lg:grid-cols-5 gap-8">
                  {/* Chart 1: 12-Month Triple Column Revenue Chart - occupies 3 columns (60%) */}
                  <div className="lg:col-span-3 bg-white rounded-2xl p-6 border border-slate-200/50 shadow-sm flex flex-col relative">
                    <div className="flex justify-between items-start mb-4">
                      <div>
                        <h3 className="font-display font-bold text-lg text-brand-blue">12-Month Financial Revenue & Profit Breakdown</h3>
                        <p className="text-xs text-text-muted mt-0.5">Compares Gross Revenue, Platform Cut (30%), and Net Profit per month.</p>
                      </div>

                      {/* Legend */}
                      <div className="hidden sm:flex items-center gap-3 text-[10px] font-black text-slate-600 bg-slate-50 p-2 rounded-xl border border-slate-100">
                        <div className="flex items-center gap-1">
                          <span className="w-2.5 h-2.5 rounded-sm bg-[#F36F21]"></span>
                          <span>Gross Sales</span>
                        </div>
                        <div className="flex items-center gap-1">
                          <span className="w-2.5 h-2.5 rounded-sm bg-[#12284C]"></span>
                          <span>Platform Net (30%)</span>
                        </div>
                        <div className="flex items-center gap-1">
                          <span className="w-2.5 h-2.5 rounded-sm bg-[#10B981]"></span>
                          <span>Net Profit</span>
                        </div>
                      </div>
                    </div>

                    {/* Chart Area */}
                    <div className="w-full h-72 select-none relative mt-2">
                      <svg viewBox="0 0 800 250" className="w-full h-full overflow-visible">
                        {/* Grid lines */}
                        {[0, 0.25, 0.5, 0.75, 1].map((r, i) => {
                          const y = 20 + 190 - r * 190;
                          const labelVal = r * 30000000;
                          return (
                            <g key={i}>
                              <line x1="55" y1={y} x2="785" y2={y} stroke="#f1f5f9" strokeWidth="1.5" />
                              <text x="45" y={y + 3} fill="#94a3b8" fontSize="9" fontWeight="800" textAnchor="end">
                                {labelVal === 0 ? '0 ₫' : `${(labelVal / 1000000).toFixed(0)}M ₫`}
                              </text>
                            </g>
                          );
                        })}

                        {/* Bar loops */}
                        {financialMonthlyRecords.map((item, idx) => {
                          const chartMax = 30000000;
                          const gx = 65 + idx * 60;
                          const hGross = (item.grossRevenue / chartMax) * 190;
                          const hPlat = (item.platformShare / chartMax) * 190;
                          const hNet = (Math.max(item.netProfit, 0) / chartMax) * 190;

                          return (
                            <g
                              key={idx}
                              onMouseEnter={() => setHoveredMonthIndex(idx)}
                              onMouseLeave={() => setHoveredMonthIndex(null)}
                              className="cursor-pointer"
                            >
                              {/* Gross Column - Cam (Orange): #F36F21 */}
                              <rect x={gx} y={210 - hGross} width="11" height={hGross} fill="#F36F21" rx="2" className="transition-all hover:brightness-95" />
                              {/* Platform Share Column - Xanh dương (Navy): #12284C */}
                              <rect x={gx + 13} y={210 - hPlat} width="11" height={hPlat} fill="#12284C" rx="2" className="transition-all hover:brightness-95" />
                              {/* Net Profit Column - Xanh lá cây (Green): #10B981 */}
                              <rect x={gx + 26} y={210 - hNet} width="11" height={hNet} fill="#10B981" rx="2" className="transition-all hover:brightness-95" />

                              {/* Month label */}
                              <text x={gx + 18} y="228" fill="#64748b" fontSize="9.5" fontWeight="800" textAnchor="middle">
                                {item.label}
                              </text>

                              {/* Invisible interactive overlay for easier hovering */}
                              <rect x={gx - 4} y="15" width="45" height="200" fill="transparent" />
                            </g>
                          );
                        })}
                      </svg>

                      {/* Tooltip Popup */}
                      {hoveredMonthIndex !== null && (
                        <div
                          className="absolute z-30 bg-slate-900/95 backdrop-blur-md text-white p-3.5 rounded-xl border border-slate-800 shadow-xl flex flex-col gap-1.5 text-xs font-semibold"
                          style={{
                            left: `${65 + hoveredMonthIndex * 60 - 25}px`,
                            bottom: '215px',
                            minWidth: '180px'
                          }}
                        >
                          <div className="border-b border-slate-800 pb-1 flex justify-between items-center">
                            <span className="text-[10px] text-slate-400 font-bold uppercase tracking-wider">
                              Details for {financialMonthlyRecords[hoveredMonthIndex].label}
                            </span>
                            <span className="w-1.5 h-1.5 bg-emerald-500 rounded-full"></span>
                          </div>
                          <div className="flex justify-between items-center gap-4">
                            <span className="text-slate-400">Gross Sales:</span>
                            <span className="font-mono text-[#F36F21]">
                              {financialMonthlyRecords[hoveredMonthIndex].grossRevenue.toLocaleString()} ₫
                            </span>
                          </div>
                          <div className="flex justify-between items-center gap-4">
                            <span className="text-slate-400">Platform Cut:</span>
                            <span className="font-mono text-[#12284C]">
                              {financialMonthlyRecords[hoveredMonthIndex].platformShare.toLocaleString()} ₫
                            </span>
                          </div>
                          <div className="flex justify-between items-center gap-4 border-t border-slate-800 pt-1.5">
                            <span className="text-slate-400">Net Profit:</span>
                            <span className="font-mono text-[#10B981]">
                              {financialMonthlyRecords[hoveredMonthIndex].netProfit.toLocaleString()} ₫
                            </span>
                          </div>
                        </div>
                      )}
                    </div>
                  </div>

                  {/* Chart 2: 12-Month Courses Sold Line Chart - occupies 2 columns (40%) */}
                  <div className="lg:col-span-2 bg-white rounded-2xl p-6 border border-slate-200/50 shadow-sm flex flex-col relative">
                    <div>
                      <h3 className="font-display font-bold text-lg text-brand-blue">Platform Courses Sold Trend</h3>
                      <p className="text-xs text-text-muted mt-0.5">Volume copies purchased during the past year.</p>
                    </div>

                    <div className="w-full h-[270px] select-none relative mt-6">
                      <svg viewBox="0 0 640 270" className="w-full h-full overflow-visible">
                        <linearGradient id="courses-sales-grad" x1="0" y1="0" x2="0" y2="1">
                          <stop offset="0%" stopColor="#10B981" stopOpacity="0.25" />
                          <stop offset="100%" stopColor="#10B981" stopOpacity="0" />
                        </linearGradient>

                        {/* Grid lines */}
                        {[0, 0.25, 0.5, 0.75, 1].map((r, i) => {
                          const y = 30 + 200 - r * 200;
                          const val = Math.round(r * 60);
                          return (
                            <g key={i}>
                              <line x1="40" y1={y} x2="620" y2={y} stroke="#f1f5f9" strokeWidth="1.5" />
                              <text x="30" y={y + 3} fill="#94a3b8" fontSize="9" fontWeight="800" textAnchor="end">{val}</text>
                            </g>
                          );
                        })}

                        {/* Area path */}
                        <path
                          d={`M 50 230 L ${financialMonthlyRecords
                            .map((item, idx) => `${50 + idx * 49} ${230 - (item.coursesSold / 60) * 200}`)
                            .join(' L ')} L ${50 + 11 * 49} 230 Z`}
                          fill="url(#courses-sales-grad)"
                        />

                        {/* Line path */}
                        <path
                          d={`M ${financialMonthlyRecords
                            .map((item, idx) => `${50 + idx * 49} ${230 - (item.coursesSold / 60) * 200}`)
                            .join(' L ')}`}
                          fill="none"
                          stroke="#10B981"
                          strokeWidth="3"
                          strokeLinecap="round"
                        />

                        {/* Dots */}
                        {financialMonthlyRecords.map((item, idx) => {
                          const dx = 50 + idx * 49;
                          const dy = 230 - (item.coursesSold / 60) * 200;
                          return (
                            <g
                              key={idx}
                              onMouseEnter={() => setHoveredCourseSalesIndex(idx)}
                              onMouseLeave={() => setHoveredCourseSalesIndex(null)}
                              className="cursor-pointer"
                            >
                              <circle cx={dx} cy={dy} r="4.5" fill="#fff" stroke="#10B981" strokeWidth="2.5" />
                              {/* Invisible cover for easier hover */}
                              <circle cx={dx} cy={dy} r="10" fill="transparent" />
                            </g>
                          );
                        })}

                        {/* X-axis labels */}
                        {financialMonthlyRecords.map((item, idx) => (
                          <text key={idx} x={50 + idx * 49} y="252" fill="#64748b" fontSize="8.5" fontWeight="800" textAnchor="middle">
                            {item.label}
                          </text>
                        ))}
                      </svg>

                      {/* Tooltip for Course Sales */}
                      {hoveredCourseSalesIndex !== null && (
                        <div
                          className="absolute z-30 bg-slate-900/95 backdrop-blur-sm text-white px-2.5 py-1.5 rounded-lg border border-slate-800 shadow-md text-[10px] font-bold"
                          style={{
                            left: `${50 + hoveredCourseSalesIndex * 49 - 40}px`,
                            top: `${185 - (financialMonthlyRecords[hoveredCourseSalesIndex].coursesSold / 60) * 200}px`
                          }}
                        >
                          <p className="text-slate-400 font-medium">Sales Count:</p>
                          <p className="text-emerald-400 font-extrabold text-xs">
                            {financialMonthlyRecords[hoveredCourseSalesIndex].coursesSold} copies
                          </p>
                        </div>
                      )}
                    </div>
                  </div>
                </div>

                {/* Table: Top-Selling Courses Table - occupies 100% full width */}
                <div className="w-full bg-white rounded-2xl p-6 border border-slate-200/50 shadow-sm flex flex-col justify-between">
                  <div>
                    <h3 className="font-display font-bold text-lg text-brand-blue flex items-center gap-1.5">
                      <span className="material-symbols-outlined text-lg text-primary">auto_graph</span>
                      Top Revenue Generating Courses
                    </h3>
                    <p className="text-xs text-text-muted mt-0.5">Highest earning syllabus offerings and division statistics.</p>
                  </div>

                  <div className="overflow-x-auto mt-4">
                    <table className="w-full text-left border-collapse text-xs">
                      <thead>
                        <tr className="bg-slate-50 text-[10px] font-black text-text-muted border-b border-slate-100 uppercase tracking-wider">
                          <th className="py-3 px-4">Course title</th>
                          <th className="py-3 px-4">Instructor</th>
                          <th className="py-3 px-4 text-center">Units Sold</th>
                          <th className="py-3 px-4 text-right">Gross Income</th>
                          <th className="py-3 px-4 text-right">Instructor (70%)</th>
                          <th className="py-3 px-4 text-right">Platform (30%)</th>
                        </tr>
                      </thead>
                      <tbody className="divide-y divide-slate-50 font-semibold text-slate-700">
                        {[
                          { name: 'Mastering Full-Stack React & Node.js', tutor: 'Dr. Jenkins', sold: 340, gross: 169660000, payout: 118762000, plat: 50898000 },
                          { name: 'Java Algorithms & Coding Arena', tutor: 'Alice Miller', sold: 210, gross: 81690000, payout: 57183000, plat: 24507000 },
                          { name: 'Go Microservices & Dockerized Deployments', tutor: 'John Doe', sold: 80, gross: 52000000, payout: 36400000, plat: 15600000 },
                          { name: 'Python Data Science and Machine Learning', tutor: 'Dr. Jenkins', sold: 50, gross: 29950000, payout: 20965000, plat: 8985000 }
                        ].map((c, i) => (
                          <tr key={i} className="hover:bg-slate-50/50 transition-colors">
                            <td className="py-3 px-4 font-bold text-slate-900">{c.name}</td>
                            <td className="py-3 px-4 text-slate-500 font-extrabold">{c.tutor}</td>
                            <td className="py-3 px-4 text-center font-mono font-bold">{c.sold}</td>
                            <td className="py-3 px-4 text-right font-mono font-bold text-slate-900">{c.gross.toLocaleString()} ₫</td>
                            <td className="py-3 px-4 text-right font-mono font-semibold text-violet-600">+{c.payout.toLocaleString()} ₫</td>
                            <td className="py-3 px-4 text-right font-mono font-semibold text-indigo-600">+{c.plat.toLocaleString()} ₫</td>
                          </tr>
                        ))}
                      </tbody>
                    </table>
                  </div>
                </div>              </div>
            )}
          </main>
        )}
      </div>



      {/* ================= MODAL: INSTRUCTOR APPLICATION REVIEW ================= */}
      {selectedAppForReview && (
        <div className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-[100] flex items-center justify-center p-4">
          <div className="bg-surface rounded-2xl border border-slate-200/50 shadow-2xl max-w-lg w-full p-6 animate-fade-in text-left">
            <div className="flex justify-between items-start mb-4">
              <div>
                <span className="text-[10px] font-black uppercase tracking-wider text-brand-blue bg-blue-50 px-2 py-0.5 rounded-md">Instructor Application Review</span>
                <h3 className="font-display font-black text-xl text-brand-blue mt-1.5">{selectedAppForReview.fullName}</h3>
              </div>
              <button onClick={() => setSelectedAppForReview(null)} className="material-symbols-outlined text-slate-400 hover:text-slate-600 transition-colors">close</button>
            </div>

            <div className="flex flex-col gap-4 text-xs">
              <div className="bg-slate-50 p-3.5 rounded-xl">
                <p className="font-semibold text-slate-500">Applicant Email:</p>
                <p className="font-bold text-brand-blue text-sm mt-0.5">{selectedAppForReview.email}</p>
              </div>

              <div>
                <h4 className="font-bold text-slate-800 uppercase tracking-wider text-[10px] mb-1">Introduction Profile</h4>
                <p className="text-slate-600 leading-relaxed bg-slate-50/50 p-3.5 rounded-xl border border-slate-100 whitespace-pre-line italic">"{selectedAppForReview.introduction}"</p>
              </div>

              <div>
                <h4 className="font-bold text-slate-800 uppercase tracking-wider text-[10px] mb-1">Curriculum Vitae File</h4>
                <a href={selectedAppForReview.cvUrl} target="_blank" rel="noreferrer" className="inline-flex items-center gap-2 text-primary hover:text-primary-hover font-bold text-sm bg-orange-50 p-3 rounded-xl w-full border border-orange-100">
                  <span className="material-symbols-outlined text-base">picture_as_pdf</span> Open CV document (Elena Rostova CV)
                </a>
              </div>

              <div className="flex gap-4 border-t border-slate-150 pt-5 mt-3">
                <button
                  onClick={() => handleApproveInstructor(selectedAppForReview.id, 'APPROVED')}
                  className="flex-1 bg-emerald-500 hover:bg-emerald-600 text-white font-bold text-sm py-3 rounded-xl transition-all shadow-md"
                >
                  Approve Application
                </button>
                <button
                  onClick={() => handleApproveInstructor(selectedAppForReview.id, 'REJECTED')}
                  className="flex-1 bg-red-500 hover:bg-red-600 text-white font-bold text-sm py-3 rounded-xl transition-all shadow-md"
                >
                  Reject Application
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* ================= MODAL: USER PURCHASES VIEW ================= */}
      {selectedUserDetail && (
        <div className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-[100] flex items-center justify-center p-4">
          <div className="bg-surface rounded-2xl border border-slate-200/50 shadow-2xl max-w-lg w-full p-6 animate-fade-in text-left">
            <div className="flex justify-between items-start mb-4">
              <div>
                <span className="text-[10px] font-black uppercase tracking-wider text-slate-500 bg-slate-100 px-2 py-0.5 rounded-md">User Purchase Records</span>
                <h3 className="font-display font-black text-xl text-brand-blue mt-1.5">{selectedUserDetail.name}</h3>
              </div>
              <button onClick={() => setSelectedUserDetail(null)} className="material-symbols-outlined text-slate-400 hover:text-slate-600 transition-colors">close</button>
            </div>

            <div className="flex flex-col gap-4">
              <h4 className="text-xs font-black text-text-muted uppercase tracking-wider">Subscribed Courses ({selectedUserDetail.purchasedCourses.length})</h4>
              <div className="flex flex-col gap-2.5 max-h-60 overflow-y-auto">
                {selectedUserDetail.purchasedCourses.map((c, i) => (
                  <div key={i} className="flex justify-between items-center text-xs bg-slate-50/50 border border-slate-100 p-3 rounded-xl">
                    <div>
                      <p className="font-bold text-slate-900">{c.title}</p>
                      <p className="text-[10px] text-text-muted mt-0.5">Purchased on {new Date(c.date).toLocaleDateString()}</p>
                    </div>
                    <span className="font-extrabold text-primary">{c.price.toLocaleString()} ₫</span>
                  </div>
                ))}
                {selectedUserDetail.purchasedCourses.length === 0 && (
                  <p className="text-xs text-text-muted italic bg-slate-50 p-4 rounded-xl text-center">This user has not purchased any courses yet.</p>
                )}
              </div>
            </div>
          </div>
        </div>
      )}

      {/* ================= MODAL: CREATE OR EDIT PROBLEM ================= */}
      {(isCreateProblemOpen || isEditProblemOpen) && (
        <div className="fixed inset-0 bg-brand-blue/60 backdrop-blur-sm z-[100] flex items-center justify-center p-4">
          <div className="bg-white w-full max-w-5xl rounded-3xl overflow-hidden shadow-2xl flex flex-col max-h-[90vh]">
            <div className="bg-brand-blue px-6 py-4 flex items-center justify-between shrink-0">
              <h2 className="text-white font-display font-black text-xl flex items-center gap-2">
                <span className="material-symbols-outlined text-primary">code</span>
                {isEditProblemOpen ? "Edit Programming Problem" : "Create Programming Problem"}
              </h2>
              <button 
                type="button" 
                onClick={() => {
                  setIsCreateProblemOpen(false);
                  setIsEditProblemOpen(false);
                  setEditingProblemId(null);
                  setNewProbTitle('');
                  setNewProbDesc('');
                  setNewProbInputDesc('');
                  setNewProbOutputDesc('');
                  setNewProbConstraints('');
                  setNewProbExampleInput('');
                  setNewProbExampleOutput('');
                  setNewProbHint('');
                  setNewProbScope('PRACTICE');
                  setNewProbDifficulty('MEDIUM');
                  setNewProbScore(100);
                  setNewProbTimeLimit(2000);
                  setNewProbMemoryLimit(128000);
                  setNewProbIsPublic(true);
                  setNewProbSolutions('');
                  setNewProbTags([]);
                  setNewProbStarterC('');
                  setNewProbStarterCpp('');
                  setNewProbStarterJava('');
                  setNewProbStarterPython('');
                  setNewProbStarterCsharp('');
                  setStarterActiveTab('C');
                  setTestcasesList([]);
                }} 
                className="text-white/60 hover:text-white transition-colors"
              >
                <span className="material-symbols-outlined text-2xl">close</span>
              </button>
            </div>

            <form onSubmit={isEditProblemOpen ? handleEditProblemSubmit : handleCreateProblemSubmit} className="p-6 overflow-y-auto flex flex-col gap-6">
              
              <div className="flex flex-col gap-1.5">
                <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Problem Title *</label>
                <input required type="text" value={newProbTitle} onChange={e => setNewProbTitle(e.target.value)} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue" placeholder="e.g. Two Sum" />
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Difficulty Level</label>
                  <div className="flex p-1 bg-slate-100/80 rounded-xl border border-slate-200/50 shadow-inner">
                    {['EASY', 'MEDIUM', 'HARD'].map(diff => {
                      const isSelected = newProbDifficulty === diff;
                      let textColor = 'text-brand-blue';
                      if (isSelected) {
                        if (diff === 'EASY') textColor = 'text-emerald-600';
                        if (diff === 'MEDIUM') textColor = 'text-amber-500';
                        if (diff === 'HARD') textColor = 'text-rose-600';
                      }
                      return (
                        <label key={diff} className={`flex-1 flex items-center justify-center py-2 rounded-lg cursor-pointer transition-all duration-300 text-[13px] font-bold tracking-wide ${isSelected ? `bg-white ${textColor} shadow-sm ring-1 ring-black/5` : 'text-slate-500 hover:text-slate-700 hover:bg-slate-200/50'}`}>
                          <input type="radio" name="probDifficulty" value={diff} checked={isSelected} onChange={() => setNewProbDifficulty(diff as any)} className="hidden" />
                          {diff}
                        </label>
                      );
                    })}
                  </div>
                </div>
                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Scope</label>
                  <div className="flex p-1 bg-slate-100/80 rounded-xl border border-slate-200/50 shadow-inner">
                    {['PRACTICE', 'CONTEST', 'SHARED'].map(sc => {
                      const isSelected = newProbScope === sc;
                      return (
                        <label key={sc} className={`flex-1 flex items-center justify-center py-2 rounded-lg cursor-pointer transition-all duration-300 text-[13px] font-bold tracking-wide ${isSelected ? 'bg-white text-primary shadow-sm ring-1 ring-black/5' : 'text-slate-500 hover:text-slate-700 hover:bg-slate-200/50'}`}>
                          <input type="radio" name="probScope" value={sc} checked={isSelected} onChange={() => setNewProbScope(sc as any)} className="hidden" />
                          {sc}
                        </label>
                      );
                    })}
                  </div>
                </div>
              </div>

              {allTags.length > 0 && (
                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Problem Tags</label>
                  <div className="flex flex-wrap gap-2 mt-1">
                    {allTags.map(tag => {
                      const isSelected = newProbTags.includes(tag.name);
                      return (
                        <button
                          key={tag.id}
                          type="button"
                          onClick={() => {
                            if (isSelected) {
                              setNewProbTags(newProbTags.filter(t => t !== tag.name));
                            } else {
                              setNewProbTags([...newProbTags, tag.name]);
                            }
                          }}
                          className={`px-4 py-1.5 rounded-full text-xs font-bold transition-all border ${isSelected ? 'bg-indigo-50 border-indigo-200 text-indigo-600 font-extrabold shadow-sm' : 'bg-white border-slate-200 text-slate-500 hover:bg-slate-50 hover:shadow-sm'}`}
                        >
                          {tag.name}
                        </button>
                      );
                    })}
                  </div>
                </div>
              )}

              <div className="flex flex-col gap-1.5">
                <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Problem Description (Markdown) *</label>
                <textarea required value={newProbDesc} onChange={e => setNewProbDesc(e.target.value)} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue resize-y h-32" placeholder="Explain the problem here..." />
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Input Description</label>
                  <textarea rows={2} value={newProbInputDesc} onChange={e => setNewProbInputDesc(e.target.value)} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue" placeholder="Describe input structure..." />
                </div>
                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Output Description</label>
                  <textarea rows={2} value={newProbOutputDesc} onChange={e => setNewProbOutputDesc(e.target.value)} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue" placeholder="Describe output structure..." />
                </div>
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Constraints</label>
                <textarea rows={2} value={newProbConstraints} onChange={e => setNewProbConstraints(e.target.value)} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue" placeholder="e.g. 1 <= nums.length <= 10^5" />
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Example Input</label>
                  <textarea rows={2} value={newProbExampleInput} onChange={e => setNewProbExampleInput(e.target.value)} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-mono focus:ring-primary focus:border-primary text-brand-blue" placeholder="Input sample..." />
                </div>
                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Example Output</label>
                  <textarea rows={2} value={newProbExampleOutput} onChange={e => setNewProbExampleOutput(e.target.value)} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-mono focus:ring-primary focus:border-primary text-brand-blue" placeholder="Output sample..." />
                </div>
              </div>

              <div className="grid grid-cols-3 gap-4">
                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Max Score</label>
                  <input type="number" value={newProbScore} onChange={e => setNewProbScore(Number(e.target.value))} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue" />
                </div>
                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Time Limit (ms)</label>
                  <input type="number" value={newProbTimeLimit} onChange={e => setNewProbTimeLimit(Number(e.target.value))} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue" />
                </div>
                <div className="flex flex-col gap-1.5">
                  <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Memory Limit (KB)</label>
                  <input type="number" value={newProbMemoryLimit} onChange={e => setNewProbMemoryLimit(Number(e.target.value))} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue" />
                </div>
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Hint</label>
                <input type="text" value={newProbHint} onChange={e => setNewProbHint(e.target.value)} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-medium focus:ring-primary focus:border-primary text-brand-blue" placeholder="Tip or pointer..." />
              </div>

              {/* TESTCASES SECTION */}
              <div className="flex flex-col gap-4 mt-4 border-t border-slate-200 pt-6">
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-4">
                    <h4 className="font-display font-black text-lg text-brand-blue uppercase tracking-wider">Test Cases</h4>
                    <div className="flex bg-slate-100 rounded-lg p-1 shadow-inner">
                      <button 
                        type="button" 
                        onClick={() => setTestCaseGenerationMode('manual')}
                        className={`px-4 py-1.5 text-xs font-bold rounded-md transition-all duration-300 ${testCaseGenerationMode === 'manual' ? 'bg-white text-primary shadow-sm transform scale-100' : 'text-slate-500 hover:text-slate-700 hover:bg-slate-200/50'}`}
                      >
                        Manual Input
                      </button>
                      <button 
                        type="button" 
                        onClick={() => setTestCaseGenerationMode('generate')}
                        className={`px-4 py-1.5 text-xs font-bold rounded-md transition-all duration-300 flex items-center gap-1 ${testCaseGenerationMode === 'generate' ? 'bg-gradient-to-r from-orange-100 to-orange-50 text-primary border border-orange-200 shadow-sm transform scale-100' : 'text-slate-500 hover:text-slate-700 hover:bg-slate-200/50'}`}
                      >
                        <span className="material-symbols-outlined text-[14px]">auto_awesome</span> Auto Generate
                      </button>
                    </div>
                  </div>
                  {testCaseGenerationMode === 'manual' && (
                    <button type="button" onClick={() => setTestcasesList(prev => [...prev, { problemId: editingProblemId || 0, inputData: '', expectedOutput: '', orderIndex: prev.length + 1 }])} className="px-3 py-1.5 bg-primary/10 hover:bg-primary/20 text-primary text-xs font-bold rounded-lg transition-colors flex items-center gap-1">
                      <span className="material-symbols-outlined text-sm">add</span> Add Test Case
                    </button>
                  )}
                </div>
                
                {testCaseGenerationMode === 'generate' ? (
                  <div className="flex flex-col gap-4 bg-gradient-to-b from-slate-50 to-white border border-slate-200 rounded-xl p-5 shadow-sm animate-fade-in relative overflow-hidden">
                    <div className="absolute top-0 right-0 w-32 h-32 bg-orange-500/5 rounded-full blur-2xl -mr-10 -mt-10 pointer-events-none"></div>
                    <div className="flex items-center justify-between relative z-10">
                      <div className="flex items-center gap-2">
                        <div className="w-8 h-8 rounded-full bg-orange-100 flex items-center justify-center text-orange-600">
                          <span className="material-symbols-outlined text-sm">code_blocks</span>
                        </div>
                        <p className="text-xs font-medium text-slate-600">Write code to generate test cases. This code will run on the server.</p>
                      </div>
                      <div className="flex items-center gap-3 bg-white px-3 py-1.5 rounded-lg border border-slate-200 shadow-sm">
                        <label className="text-xs font-black text-brand-blue uppercase tracking-wider">Language:</label>
                        <select 
                          value={generatorLanguage}
                          onChange={(e) => {
                            setGeneratorLanguage(e.target.value);
                            setGeneratorCode(GENERATOR_TEMPLATES[e.target.value] || '');
                          }}
                          className="bg-transparent text-sm font-bold text-primary focus:outline-none cursor-pointer"
                        >
                          <option value="c">C</option>
                          <option value="cpp">C++</option>
                          <option value="java">Java</option>
                          <option value="python">Python</option>
                          <option value="csharp">C#</option>
                        </select>
                      </div>
                    </div>
                    <div className="w-full h-[320px] border border-slate-200 rounded-xl overflow-hidden shadow-inner bg-white relative group">
                      <Editor
                        height="100%"
                        defaultLanguage={generatorLanguage === 'c' || generatorLanguage === 'cpp' ? 'cpp' : generatorLanguage === 'csharp' ? 'csharp' : generatorLanguage}
                        language={generatorLanguage === 'c' || generatorLanguage === 'cpp' ? 'cpp' : generatorLanguage === 'csharp' ? 'csharp' : generatorLanguage}
                        theme="vs-light"
                        value={generatorCode}
                        onChange={(value) => setGeneratorCode(value || '')}
                        options={{
                          minimap: { enabled: false },
                          fontSize: 13,
                          lineHeight: 24,
                          padding: { top: 16, bottom: 16 },
                          fontFamily: "'JetBrains Mono', 'Fira Code', Consolas, monospace",
                          scrollBeyondLastLine: false,
                          smoothScrolling: true,
                          cursorBlinking: "smooth",
                          stickyScroll: { enabled: false },
                          automaticLayout: true
                        }}
                      />
                    </div>
                    <div className="flex flex-col gap-3 relative z-10">
                      <div className="flex justify-end items-center">
                        <button 
                          type="button" 
                          onClick={handleRunAndGenerateTestcases} 
                          disabled={generateLoading}
                          className={`px-5 py-2.5 ${generateLoading ? 'bg-slate-400 cursor-not-allowed' : 'bg-gradient-to-r from-orange-500 to-primary hover:from-orange-600 hover:to-primary-dark hover:scale-[1.02] hover:-translate-y-0.5 shadow-md hover:shadow-lg'} text-white text-sm font-black rounded-xl transition-all duration-300 flex items-center gap-2`}
                        >
                          {generateLoading ? (
                            <>
                              <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                              Generating...
                            </>
                          ) : (
                            <>
                              <span className="material-symbols-outlined text-base">play_arrow</span>
                              Run & Generate Testcases
                            </>
                          )}
                        </button>
                      </div>
                      {generateError && (
                        <div className="bg-red-50/80 backdrop-blur-sm border border-red-200 text-red-600 rounded-xl p-4 animate-fade-in shadow-sm relative overflow-hidden">
                          <p className="text-xs font-black mb-1 flex items-center gap-1.5 uppercase tracking-wider">
                            <span className="material-symbols-outlined text-[16px]">error</span> Generation Error
                          </p>
                          <pre className="text-[12px] whitespace-pre-wrap font-mono overflow-x-auto text-red-800 bg-white/50 p-3 rounded-lg mt-2 border border-red-100">{generateError}</pre>
                        </div>
                      )}
                    </div>
                  </div>
                ) : testcasesList.length === 0 ? (
                  <div className="text-center py-6 border-2 border-dashed border-slate-200 rounded-xl">
                    <p className="text-xs text-text-muted font-bold">No test cases added yet.</p>
                  </div>
                ) : (
                  <div className="flex flex-col gap-4">
                    {testcasesList.map((tc, idx) => (
                      <div key={idx} className="bg-slate-50 border border-slate-200 rounded-xl p-4 flex flex-col gap-3">
                        <div className="flex items-start justify-between">
                          <span className="font-display font-black text-brand-blue text-xs uppercase">Test Case {idx + 1}</span>
                          <div className="flex items-center gap-3">
                            <label className="flex items-center gap-1.5 text-xs font-bold text-slate-600 cursor-pointer">
                              <input type="checkbox" checked={tc.isHidden} onChange={(e) => setTestcasesList(prev => prev.map((item, i) => i === idx ? { ...item, isHidden: e.target.checked } : item))} className="rounded text-primary focus:ring-primary" />
                              Hidden
                            </label>
                            <button type="button" onClick={() => setTestcasesList(prev => prev.filter((_, i) => i !== idx))} className="text-slate-400 hover:text-red-500 transition-colors">
                              <span className="material-symbols-outlined text-sm">delete</span>
                            </button>
                          </div>
                        </div>
                        <div className="grid grid-cols-2 gap-3">
                          <div className="flex flex-col gap-1">
                            <label className="text-[10px] font-bold text-text-muted uppercase tracking-wider">Input</label>
                            <textarea value={tc.inputData} onChange={(e) => setTestcasesList(prev => prev.map((item, i) => i === idx ? { ...item, inputData: e.target.value } : item))} className="w-full bg-white border border-slate-200 rounded-lg px-3 py-2 text-xs font-medium focus:ring-primary focus:border-primary text-brand-blue resize-none h-16" placeholder="e.g. [1, 2, 3]" />
                          </div>
                          <div className="flex flex-col gap-1">
                            <label className="text-[10px] font-bold text-text-muted uppercase tracking-wider">Expected Output</label>
                            <textarea value={tc.expectedOutput || ''} onChange={(e) => setTestcasesList(prev => prev.map((item, i) => i === idx ? { ...item, expectedOutput: e.target.value } : item))} className="w-full bg-white border border-slate-200 rounded-lg px-3 py-2 text-xs font-medium focus:ring-primary focus:border-primary text-brand-blue resize-none h-16" placeholder="e.g. [3, 2, 1]" />
                          </div>
                        </div>
                      </div>
                    ))}
                  </div>
                )}
              </div>

              {/* Starter Templates */}
              <div className="flex flex-col gap-1 border border-slate-200/60 rounded-2xl p-4 bg-slate-50/50 mt-4">
                <div className="flex justify-between items-center mb-2">
                  <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Starter Code Templates (Optional)</label>
                  <div className="flex gap-1.5">
                    {(['C', 'C++', 'Java', 'Python 3', 'C#'] as const).map(lang => (
                      <button key={lang} type="button" onClick={() => setStarterActiveTab(lang)} className={`px-3 py-1.5 rounded-lg text-xs font-bold transition-all ${starterActiveTab === lang ? 'bg-primary text-white shadow-sm' : 'bg-white border border-slate-200 text-slate-500 hover:bg-slate-100'}`}>
                        {lang}
                      </button>
                    ))}
                  </div>
                </div>
                {starterActiveTab === 'C' && <textarea rows={8} value={newProbStarterC} onChange={e => setNewProbStarterC(e.target.value)} className="w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm font-mono focus:ring-primary focus:border-primary text-brand-blue resize-y" placeholder="void solve() {\n}" />}
                {starterActiveTab === 'C++' && <textarea rows={8} value={newProbStarterCpp} onChange={e => setNewProbStarterCpp(e.target.value)} className="w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm font-mono focus:ring-primary focus:border-primary text-brand-blue resize-y" placeholder="class Solution {\npublic:\n    void solve() {\n    }\n};" />}
                {starterActiveTab === 'Java' && <textarea rows={8} value={newProbStarterJava} onChange={e => setNewProbStarterJava(e.target.value)} className="w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm font-mono focus:ring-primary focus:border-primary text-brand-blue resize-y" placeholder="class Solution {\n    public void solve() {\n    }\n}" />}
                {starterActiveTab === 'Python 3' && <textarea rows={8} value={newProbStarterPython} onChange={e => setNewProbStarterPython(e.target.value)} className="w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm font-mono focus:ring-primary focus:border-primary text-brand-blue resize-y" placeholder="class Solution:\n    def solve(self):\n        pass" />}
                {starterActiveTab === 'C#' && <textarea rows={8} value={newProbStarterCsharp} onChange={e => setNewProbStarterCsharp(e.target.value)} className="w-full bg-white border border-slate-200 rounded-xl px-4 py-3 text-sm font-mono focus:ring-primary focus:border-primary text-brand-blue resize-y" placeholder="public class Solution {\n    public void Solve() {\n    }\n}" />}
              </div>

              <div className="flex flex-col gap-1.5">
                <label className="text-xs font-bold text-brand-blue uppercase tracking-wider">Solution Code</label>
                <textarea rows={12} value={newProbSolutions} onChange={e => setNewProbSolutions(e.target.value)} className="w-full bg-slate-50 border border-slate-200 rounded-xl px-4 py-3 text-sm font-mono focus:ring-primary focus:border-primary text-brand-blue resize-y" placeholder="Sample solution code..." />
              </div>

              <div className="flex items-center gap-3 mt-2 bg-slate-50 p-4 rounded-xl border border-slate-200">
                <input type="checkbox" checked={newProbIsPublic} onChange={e => setNewProbIsPublic(e.target.checked)} className="rounded text-primary border-slate-300 w-5 h-5" />
                <label className="text-sm font-bold text-brand-blue">Make this problem public immediately</label>
              </div>

              <div className="flex gap-4 mt-6">
                <button type="submit" className="flex-1 bg-gradient-to-r from-primary to-primary-hover text-white font-black text-sm py-4 rounded-xl shadow-lg hover:shadow-xl hover:-translate-y-0.5 transition-all">
                  {isEditProblemOpen ? "Save Problem & Testcases" : "Create Problem & Testcases"}
                </button>
              </div>

            </form>
          </div>
        </div>
      )}

      {/* ================= MODAL: CREATE CONTEST ================= */}
      {isCreateContestOpen && (
        <div className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-[100] flex items-center justify-center p-4">
          <div className="bg-surface rounded-2xl border border-slate-200/50 shadow-2xl max-w-2xl w-full p-6 animate-fade-in text-left">
            <div className="flex justify-between items-start mb-4 border-b border-slate-100 pb-3">
              <div>
                <h3 className="font-display font-black text-xl text-brand-blue">Create Contest</h3>
                <p className="text-xs text-text-muted mt-0.5">Input the basic meta details of the competition.</p>
              </div>
              <button onClick={() => {
                setIsCreateContestOpen(false);
                setNewContestTitle('');
                setNewContestDesc('');
                setNewContestScoringRule('ICPC');
                setNewContestStartTime('');
                setNewContestEndTime('');
                setNewContestPassword('');
                setNewContestConfirmPassword('');
              }} className="material-symbols-outlined text-slate-400 hover:text-slate-600 transition-colors">close</button>
            </div>

            <form onSubmit={handleCreateContestSubmit} className="flex flex-col gap-4 text-xs font-semibold">
              <div className="grid grid-cols-2 gap-4">
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Contest Title *</label>
                  <input required type="text" value={newContestTitle} onChange={e => setNewContestTitle(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" placeholder="e.g. Nonstop Coding Winter Cup" />
                </div>
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Scoring Rule</label>
                  <select value={newContestScoringRule} onChange={e => setNewContestScoringRule(e.target.value as any)} className="border border-slate-200 rounded-xl pl-3 pr-8 py-2 text-xs">
                    <option value="ICPC">ICPC Rule</option>
                    <option value="IOI">IOI Rule</option>
                    <option value="CUSTOM">Custom Rule</option>
                  </select>
                </div>
              </div>

              <div className="flex flex-col gap-1">
                <label className="text-text-muted">Contest Description</label>
                <textarea rows={3} value={newContestDesc} onChange={e => setNewContestDesc(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" placeholder="Detail contest guidelines..." />
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Start Time *</label>
                  <input required type="datetime-local" value={newContestStartTime} onChange={e => setNewContestStartTime(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs text-slate-800" />
                </div>
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">End Time *</label>
                  <input required type="datetime-local" value={newContestEndTime} onChange={e => setNewContestEndTime(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs text-slate-800" />
                </div>
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Password (Optional)</label>
                  <input type="password" value={newContestPassword} onChange={e => setNewContestPassword(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" placeholder="Leave empty for public" />
                </div>
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Confirm Password</label>
                  <input type="password" value={newContestConfirmPassword} onChange={e => setNewContestConfirmPassword(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" placeholder="Confirm contest password" />
                </div>
              </div>

              <button
                type="submit"
                className="bg-primary hover:bg-primary-hover text-white font-bold text-sm py-3 rounded-xl transition-all shadow-md mt-4"
              >
                Create Contest Meta
              </button>
            </form>
          </div>
        </div>
      )}

      {/* Confirmation Modal */}
      {isConfirmModalOpen && (
        <div className="fixed inset-0 z-[9999] flex items-center justify-center bg-slate-900/60 backdrop-blur-sm p-4 animate-fade-in">
          <div className="bg-surface w-full max-w-sm rounded-2xl p-6 border border-slate-200/50 shadow-2xl scale-100 transform transition-all duration-300 flex flex-col gap-4 text-left">
            <div className="flex items-center gap-3">
              <span className="material-symbols-outlined text-red-500 text-[24px] bg-red-50 p-2 rounded-xl">warning</span>
              <h3 className="text-sm font-black text-slate-900">{confirmModalTitle || "Confirm Action"}</h3>
            </div>
            <p className="text-xs font-bold text-slate-500 leading-relaxed">
              {confirmModalMessage}
            </p>
            <div className="flex justify-end gap-2.5 mt-2">
              <button
                type="button"
                onClick={() => {
                  setIsConfirmModalOpen(false);
                  setConfirmModalAction(null);
                }}
                className="px-4 py-2 text-[10px] font-black text-slate-500 hover:text-slate-700 bg-slate-100 hover:bg-slate-200/80 rounded-xl transition-all cursor-pointer"
              >
                Cancel
              </button>
              <button
                type="button"
                onClick={() => {
                  if (confirmModalAction) confirmModalAction();
                  setIsConfirmModalOpen(false);
                  setConfirmModalAction(null);
                }}
                className="px-4 py-2 text-[10px] font-black text-white bg-red-500 hover:bg-red-600 rounded-xl shadow-md transition-all cursor-pointer"
              >
                Confirm
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Floating Global Toast Alert */}
      {globalToast && (
        <div className={`fixed bottom-6 right-6 z-[999] text-white text-xs font-semibold px-4 py-3 rounded-lg shadow-lg flex items-center gap-2 animate-fade-in ${
          globalToast.type === 'success' ? 'bg-green-600 border border-green-500' :
          globalToast.type === 'error' ? 'bg-red-600 border border-red-500' : 'bg-brand-blue border border-brand-blue-light'
        }`}>
          <span className="material-symbols-outlined text-[18px]">
            {globalToast.type === 'success' ? 'check_circle' :
             globalToast.type === 'error' ? 'error' : 'info'}
          </span>
          <span>{globalToast.message}</span>
        </div>
      )}
    </div>
  );
};
