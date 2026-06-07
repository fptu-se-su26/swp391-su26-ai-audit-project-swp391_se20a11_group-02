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
  AdminDepositHistory
} from '../services/adminService';

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

  // Filter states
  const [courseFilter, setCourseFilter] = useState<'ALL' | 'APPROVED' | 'PENDING' | 'REJECTED'>('ALL');
  const [instructorAppFilter, setInstructorAppFilter] = useState<'ALL' | 'APPROVED' | 'PENDING' | 'REJECTED'>('ALL');
  const [userSearch, setUserSearch] = useState('');
  const [userStatusFilter, setUserStatusFilter] = useState<'ALL' | 'ACTIVE' | 'LOCKED'>('ALL');
  const [problemSearch, setProblemSearch] = useState('');
  const [problemDifficultyFilter, setProblemDifficultyFilter] = useState<'ALL' | 'EASY' | 'MEDIUM' | 'HARD'>('ALL');
  const [problemSubTab, setProblemSubTab] = useState<'repository' | 'practice' | 'contest'>('repository');
  const [contestStatusFilter, setContestStatusFilter] = useState<'ALL' | 'UPCOMING' | 'ONGOING' | 'COMPLETED'>('ALL');

  // Modal / review panel states

  const [selectedAppForReview, setSelectedAppForReview] = useState<AdminInstructorApplication | null>(null);
  const [selectedUserDetail, setSelectedUserDetail] = useState<AdminUser | null>(null);
  const [isCreateProblemOpen, setIsCreateProblemOpen] = useState(false);
  const [isCreateContestOpen, setIsCreateContestOpen] = useState(false);

  // Course Player Review Mode states
  const [reviewingCourse, setReviewingCourse] = useState<AdminCourse | null>(null);
  const [reviewPlayerTab, setReviewPlayerTab] = useState<'overview' | 'qa' | 'exercises' | 'source-code' | 'quiz'>('overview');
  const [reviewLectureTitle, setReviewLectureTitle] = useState('1.1 Course Introduction');
  const [reviewCurriculumSections, setReviewCurriculumSections] = useState<Record<string, boolean>>({ sec1: true });
  const [reviewCurrentProblem, setReviewCurrentProblem] = useState<string | null>(null);
  const [reviewSolveLang, setReviewSolveLang] = useState('Java');
  const [reviewSolveCode, setReviewSolveCode] = useState('');

  // Hash-based routing synchronization
  useEffect(() => {
    const handleRouting = () => {
      let currentHash = window.location.hash || '#dashboard';
      
      // Close active review player and modals when navigating tabs
      setReviewingCourse(null);
      setSelectedAppForReview(null);
      setSelectedUserDetail(null);
      setIsCreateProblemOpen(false);
      setIsCreateContestOpen(false);

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
        recentDepositsRes
      ] = await Promise.all([
        adminService.getDashboardStats(),
        adminService.getCourses(),
        adminService.getInstructorApplications(),
        adminService.getInstructors(),
        adminService.getUsers(),
        adminService.getProblems(),
        adminService.getContests(),
        adminService.getRecentDeposits()
      ]);

      setStats(statsRes);
      setCourses(coursesRes);
      setApplications(appsRes);
      setInstructors(instsRes);
      setUsers(usersRes);
      setProblems(probsRes);
      setContests(contestsRes);
      setRecentDeposits(recentDepositsRes);
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

  // Add Contest form state
  const [newContestTitle, setNewContestTitle] = useState('');
  const [newContestDesc, setNewContestDesc] = useState('');
  const [newContestScoringRule, setNewContestScoringRule] = useState<'ICPC' | 'IOI' | 'CUSTOM'>('ICPC');
  const [newContestStartTime, setNewContestStartTime] = useState('');
  const [newContestEndTime, setNewContestEndTime] = useState('');
  const [newContestDuration, setNewContestDuration] = useState(120);

  const dashboardTimeFilter = '12';

  // SVG Chart Computations
  const financialChartData = useMemo(() => adminService.getFinancialChartData(), []);
  
  // Filter mock metrics based on time filter
  const filteredRevenue = useMemo(() => {
    const months = parseInt(dashboardTimeFilter);
    const subset = financialChartData.slice(0, months);
    return subset.reduce((sum, item) => sum + item.amount, 0);
  }, [dashboardTimeFilter, financialChartData]);

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
      alert(`Successfully ${status.toLowerCase()} course application.`);
    } catch (error) {
      alert("Failed to process course approval");
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
      alert(`Successfully ${status.toLowerCase()} instructor application.`);
    } catch (error) {
      alert("Failed to process instructor application approval");
    }
  };

  const handleToggleUserLock = async (userId: number, currentStatus: 'ACTIVE' | 'LOCKED') => {
    const targetStatus = currentStatus === 'ACTIVE' ? 'LOCKED' : 'ACTIVE';
    const confirmMsg = `Are you sure you want to ${targetStatus === 'LOCKED' ? 'LOCK' : 'UNLOCK'} this user account?`;
    if (!window.confirm(confirmMsg)) return;

    try {
      const updated = await adminService.setUserLockStatus(userId, targetStatus);
      setUsers(prev => prev.map(u => u.id === userId ? updated : u));
      if (selectedUserDetail?.id === userId) {
        setSelectedUserDetail(updated);
      }
      alert(`User status successfully updated to ${targetStatus}`);
    } catch (error) {
      alert("Failed to toggle user lock status");
    }
  };

  const handleCreateProblemSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!newProbTitle.trim() || !newProbDesc.trim()) {
      alert("Please fill in the title and description.");
      return;
    }

    try {
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
        solutions: newProbSolutions.trim()
      });

      setProblems(prev => [...prev, newProb]);
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

      alert(`Problem "${newProb.title}" created successfully!`);
    } catch (error) {
      alert("Failed to create problem");
    }
  };

  const handleUpdateProblemScope = async (problemId: number, scope: 'PRACTICE' | 'CONTEST') => {
    try {
      const updated = await adminService.updateProblemScope(problemId, scope);
      setProblems(prev => prev.map(p => p.id === problemId ? updated : p));
    } catch (error) {
      alert("Failed to update problem scope.");
    }
  };

  const handleUpdateProblemPublicStatus = async (problemId: number, isPublic: boolean) => {
    try {
      const updated = await adminService.updateProblemPublicStatus(problemId, isPublic);
      setProblems(prev => prev.map(p => p.id === problemId ? updated : p));
      alert(`Problem successfully ${isPublic ? "published" : "made private"}.`);
    } catch (error) {
      alert("Failed to update publication status.");
    }
  };

  const handleActivateProblem = async (problemId: number) => {
    const countStr = prompt("Add Test Cases to Activate this problem.\nEnter number of test cases to add (e.g. 5, 10):", "5");
    if (countStr === null) return;
    const count = parseInt(countStr);
    if (isNaN(count) || count <= 0) {
      alert("Please enter a valid positive number.");
      return;
    }
    try {
      const updated = await adminService.activateProblem(problemId, count);
      setProblems(prev => prev.map(p => p.id === problemId ? updated : p));
      alert("Problem successfully activated and moved to Private/Draft Problems!");
    } catch (error) {
      alert("Failed to activate problem.");
    }
  };

  const handleCreateContestSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!newContestTitle.trim() || !newContestStartTime || !newContestEndTime) {
      alert("Please fill in the title and duration dates.");
      return;
    }

    try {
      const newContest = await adminService.createContest({
        title: newContestTitle.trim(),
        description: newContestDesc.trim(),
        scoringRule: newContestScoringRule,
        startTime: newContestStartTime,
        endTime: newContestEndTime,
        durations: newContestDuration
      });

      setContests(prev => [...prev, newContest]);
      setIsCreateContestOpen(false);

      // Reset form
      setNewContestTitle('');
      setNewContestDesc('');
      setNewContestScoringRule('ICPC');
      setNewContestStartTime('');
      setNewContestEndTime('');
      setNewContestDuration(120);

      // update stats
      const newStats = await adminService.getDashboardStats();
      setStats(newStats);

      alert(`Contest "${newContest.title}" created successfully!`);
    } catch (error) {
      alert("Failed to create contest");
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
      return matchesSearch && matchesStatus;
    });
  }, [users, userSearch, userStatusFilter]);

  const filteredProblems = useMemo(() => {
    return problems.filter(p => {
      const matchesSearch = p.title.toLowerCase().includes(problemSearch.toLowerCase()) || p.description.toLowerCase().includes(problemSearch.toLowerCase());
      const matchesDifficulty = problemDifficultyFilter === 'ALL' || p.difficulty === problemDifficultyFilter;
      
      let matchesSubTab = false;
      if (problemSubTab === 'repository') {
        matchesSubTab = !p.isActive || !p.isPublic; // Repository shows inactive or private (draft) problems
      } else if (problemSubTab === 'practice') {
        matchesSubTab = p.isActive && p.isPublic && p.problemScope === 'PRACTICE';
      } else if (problemSubTab === 'contest') {
        matchesSubTab = p.isActive && p.isPublic && p.problemScope === 'CONTEST';
      }

      return matchesSearch && matchesDifficulty && matchesSubTab;
    });
  }, [problems, problemSearch, problemDifficultyFilter, problemSubTab]);

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
        className={`fixed top-0 left-0 h-screen transition-all duration-300 ${
          isSidebarCollapsed ? 'sidebar-collapsed' : 'sidebar-expanded'
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
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${
              activeTab === 'dashboard' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
            }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'dashboard' ? 'text-primary icon-fill' : ''}`}>dashboard</span>
            <span className="sidebar-text text-sm">Dashboard</span>
          </a>

          <a
            href="#courses"
            onClick={() => setActiveTab('courses')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${
              activeTab === 'courses' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
            }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'courses' ? 'text-primary icon-fill' : ''}`}>library_books</span>
            <span className="sidebar-text text-sm">Courses</span>
          </a>

          <a
            href="#problems"
            onClick={() => setActiveTab('problems')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${
              activeTab === 'problems' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
            }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'problems' ? 'text-primary icon-fill' : ''}`}>task</span>
            <span className="sidebar-text text-sm">Problems</span>
          </a>

          <a
            href="#contest"
            onClick={() => setActiveTab('contest')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${
              activeTab === 'contest' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
            }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'contest' ? 'text-primary icon-fill' : ''}`}>emoji_events</span>
            <span className="sidebar-text text-sm">Contest</span>
          </a>

          <a
            href="#instructor"
            onClick={() => setActiveTab('instructor')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${
              activeTab === 'instructor' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
            }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'instructor' ? 'text-primary icon-fill' : ''}`}>school</span>
            <span className="sidebar-text text-sm">Instructor</span>
          </a>

          <a
            href="#users"
            onClick={() => setActiveTab('users')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${
              activeTab === 'users' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
            }`}
          >
            <span className={`material-symbols-outlined text-[22px] transition-colors group-hover:text-primary ${activeTab === 'users' ? 'text-primary icon-fill' : ''}`}>group</span>
            <span className="sidebar-text text-sm">Users</span>
          </a>

          <a
            href="#financial"
            onClick={() => setActiveTab('financial')}
            className={`group flex items-center gap-3 px-3 py-3 rounded-xl transition-all duration-200 ${
              activeTab === 'financial' ? 'bg-white/10 text-white font-bold border-l-4 border-primary' : 'hover:bg-white/5 text-slate-300 hover:text-white font-medium'
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
        className={`flex-grow transition-all duration-300 relative z-10 ${
          isSidebarCollapsed ? 'main-collapsed' : 'main-expanded'
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
                        { key: 'source-code', icon: 'code', label: 'Source Code' },
                        { key: 'quiz', icon: 'quiz', label: 'Quiz' },
                      ] as const).map((tab) => (
                        <button
                          key={tab.key}
                          onClick={() => { setReviewPlayerTab(tab.key); setReviewCurrentProblem(null); }}
                          className={`pb-3 px-1 font-semibold text-sm border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${
                            reviewPlayerTab === tab.key ? 'border-primary text-primary' : 'border-transparent text-text-muted hover:text-primary'
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

                      {/* Source Code Tab */}
                      {reviewPlayerTab === 'source-code' && (
                        <div className="animate-fade-in">
                          <h2 className="text-lg font-bold text-text-main mb-1">Lesson Resources</h2>
                          <p className="text-xs text-text-muted mb-4">Download the starting templates and completed source code for this lesson.</p>
                          <div className="flex flex-col gap-3">
                            <div className="bg-surface border border-gray-200 p-4 rounded-xl flex items-center justify-between gap-4 hover:border-primary transition-all group">
                              <div className="flex items-center gap-3">
                                <span className="material-symbols-outlined text-brand-blue text-[28px] bg-slate-100 p-2 rounded-lg">folder_zip</span>
                                <div>
                                  <p className="font-bold text-sm text-text-main">lesson-1-starter-template.zip</p>
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
                                    className={`flex items-center gap-2.5 px-4 py-2.5 cursor-pointer border-l-2 transition-colors group ${
                                      isActive
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
        ) : (
          <main className="flex-grow p-4 md:p-8 lg:p-10 flex flex-col gap-8 max-w-[1440px] w-full mx-auto">
            {/* Header Banner */}
            <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
              <div>
                <div className="inline-flex items-center gap-1.5 bg-brand-blue-light/10 border border-brand-blue/20 px-3 py-1 rounded-full text-brand-blue font-bold text-xs uppercase tracking-wider mb-2.5 shadow-sm">
                  <span className="material-symbols-outlined text-xs icon-fill">admin_panel_settings</span> Platform Administration
                </div>
                <h1 className="text-3xl md:text-4xl font-display font-black leading-tight">
                  <span className="bg-gradient-to-r from-brand-blue to-primary bg-clip-text text-transparent">System Control Dashboard ⚙️</span>
                </h1>
                <p className="text-text-muted mt-1">Manage courses, instructors, users, program problems, contests, and view statistics.</p>
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
                          <stop offset="0%" stopColor="#F36F21" stopOpacity="0.25"/>
                          <stop offset="100%" stopColor="#F36F21" stopOpacity="0"/>
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
                                    {c.name} <span className={`text-[9px] font-bold px-1.5 py-0.5 rounded-full ml-1.5 ${
                                      c.difficulty === 'EASY' ? 'bg-green-50 text-green-600' :
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
                        className={`text-xs font-bold px-3 py-1.5 rounded-xl border transition-all ${
                          courseFilter === filterVal
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
                          <span className={`text-[10px] font-black uppercase tracking-wider px-2 py-0.5 rounded-md self-start ${
                            c.status === 'APPROVED' ? 'bg-emerald-50 text-emerald-600' :
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
                    <button
                      onClick={() => setIsCreateProblemOpen(true)}
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
                    className={`pb-2.5 px-4 text-xs font-bold border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${
                      problemSubTab === 'repository'
                        ? 'border-primary text-primary'
                        : 'border-transparent text-slate-500 hover:text-primary'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[16px]">folder_open</span>
                    Repository & Drafts ({problems.filter(p => !p.isActive || !p.isPublic).length})
                  </button>
                  <button
                    onClick={() => setProblemSubTab('practice')}
                    className={`pb-2.5 px-4 text-xs font-bold border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${
                      problemSubTab === 'practice'
                        ? 'border-primary text-primary'
                        : 'border-transparent text-slate-500 hover:text-primary'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[16px]">terminal</span>
                    Practice Problems ({problems.filter(p => p.isActive && p.isPublic && p.problemScope === 'PRACTICE').length})
                  </button>
                  <button
                    onClick={() => setProblemSubTab('contest')}
                    className={`pb-2.5 px-4 text-xs font-bold border-b-2 transition-all flex items-center gap-2 whitespace-nowrap ${
                      problemSubTab === 'contest'
                        ? 'border-primary text-primary'
                        : 'border-transparent text-slate-500 hover:text-primary'
                    }`}
                  >
                    <span className="material-symbols-outlined text-[16px]">emoji_events</span>
                    Contest Problems ({problems.filter(p => p.isActive && p.isPublic && p.problemScope === 'CONTEST').length})
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
                          <th className="py-4 px-6">Scope</th>
                          <th className="py-4 px-6 text-right">Submissions</th>
                          <th className="py-4 px-6 text-right">Accepted Rate</th>
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
                                <span className={`px-2.5 py-0.5 rounded-md font-bold text-[10px] ${
                                  p.difficulty === 'EASY' ? 'bg-emerald-50 text-emerald-600' :
                                  p.difficulty === 'MEDIUM' ? 'bg-blue-50 text-blue-600' : 'bg-red-50 text-red-600'
                                }`}>{p.difficulty}</span>
                              </td>
                              <td className="py-4 px-6">
                                <select
                                  value={p.problemScope}
                                  onChange={(e) => handleUpdateProblemScope(p.id, e.target.value as any)}
                                  className="bg-white border border-slate-200 rounded-lg pl-2.5 pr-8 py-1 text-xs font-bold focus:ring-0 focus:border-primary text-slate-700 cursor-pointer outline-none"
                                >
                                  <option value="PRACTICE">Practice</option>
                                  <option value="CONTEST">Contest</option>
                                  <option value="SHARED">Share</option>
                                </select>
                              </td>
                              <td className="py-4 px-6 text-right font-mono font-bold text-slate-600">
                                {totalSubs.toLocaleString()}
                              </td>
                              <td className="py-4 px-6 text-right font-mono font-bold text-slate-800">
                                {acceptedRate}%
                              </td>
                              <td className="py-4 px-6 text-center">
                                {p.isActive ? (
                                  p.isPublic ? (
                                    <span className="inline-flex items-center gap-1 text-emerald-600 bg-emerald-50 border border-emerald-250 px-2 py-0.5 rounded text-[10px] font-bold">
                                      <span className="inline-block w-1.5 h-1.5 rounded-full bg-emerald-500"></span>
                                      Public
                                    </span>
                                  ) : (
                                    <span className="inline-flex items-center gap-1 text-slate-500 bg-slate-100 border border-slate-200 px-2 py-0.5 rounded text-[10px] font-bold">
                                      <span className="inline-block w-1.5 h-1.5 rounded-full bg-slate-400"></span>
                                      Private
                                    </span>
                                  )
                                ) : (
                                  <span className="inline-flex items-center gap-1 text-amber-600 bg-amber-50 border border-amber-250 px-2 py-0.5 rounded text-[10px] font-bold">
                                    <span className="inline-block w-1.5 h-1.5 rounded-full bg-amber-500"></span>
                                    Inactive
                                  </span>
                                )}
                              </td>
                              <td className="py-4 px-6 text-center">
                                <div className="flex items-center justify-center gap-2">
                                  {!p.isActive ? (
                                    <button
                                      onClick={() => handleActivateProblem(p.id)}
                                      className="bg-primary hover:bg-primary-hover text-white font-bold text-[10px] px-3 py-1.5 rounded-xl transition-all flex items-center gap-1 shadow-sm border-none cursor-pointer"
                                    >
                                      <span className="material-symbols-outlined text-[14px]">tune</span> Add Test Cases
                                    </button>
                                  ) : p.isPublic ? (
                                    <button
                                      onClick={() => handleUpdateProblemPublicStatus(p.id, false)}
                                      className="bg-slate-500 hover:bg-slate-600 text-white font-bold text-[10px] px-3 py-1.5 rounded-xl transition-all flex items-center gap-1 shadow-sm border-none cursor-pointer"
                                    >
                                      <span className="material-symbols-outlined text-[14px]">visibility_off</span> Make Private
                                    </button>
                                  ) : (
                                    <button
                                      onClick={() => handleUpdateProblemPublicStatus(p.id, true)}
                                      className="bg-emerald-500 hover:bg-emerald-600 text-white font-bold text-[10px] px-3 py-1.5 rounded-xl transition-all flex items-center gap-1 shadow-sm border-none cursor-pointer"
                                    >
                                      <span className="material-symbols-outlined text-[14px]">public</span> Publish
                                    </button>
                                  )}
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
                          <th className="py-4 px-6">Avg Score</th>
                          <th className="py-4 px-6">Status</th>
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
                            <td className="py-4 px-6 font-bold text-brand-blue">{c.averageScore}</td>
                            <td className="py-4 px-6">
                              <span className={`px-2.5 py-0.5 rounded-md font-bold text-[10px] ${
                                c.status === 'RUNNING' ? 'bg-red-50 text-red-500 animate-pulse' :
                                c.status === 'UPCOMING' ? 'bg-blue-50 text-blue-600' : 'bg-slate-100 text-slate-500'
                              }`}>{c.status}</span>
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
                        className={`text-xs font-bold px-3 py-1.5 rounded-xl border transition-all ${
                          instructorAppFilter === filterVal
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
                              <span className={`text-[10px] font-black uppercase tracking-wider px-2 py-0.5 rounded-md ${
                                app.status === 'APPROVED' ? 'bg-emerald-50 text-emerald-600' :
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
                      value={userStatusFilter}
                      onChange={(e) => setUserStatusFilter(e.target.value as any)}
                      className="text-xs bg-surface border border-slate-200 rounded-xl pl-3 pr-8 py-1.5 focus:ring-primary focus:border-primary"
                    >
                      <option value="ALL">All Status</option>
                      <option value="ACTIVE">Active Only</option>
                      <option value="LOCKED">Locked Only</option>
                    </select>
                  </div>
                </div>

                {/* Users table */}
                <div className="bg-surface rounded-2xl border border-slate-200/50 overflow-hidden ambient-shadow">
                  <div className="overflow-x-auto">
                    <table className="w-full text-left border-collapse">
                      <thead>
                        <tr className="bg-slate-50 text-xs font-black text-text-muted border-b border-slate-100 uppercase tracking-wider">
                          <th className="py-4 px-6">User ID</th>
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
                            <td className="py-4 px-6 text-brand-blue font-bold">#{u.id}</td>
                            <td className="py-4 px-6 font-bold text-slate-900">{u.name}</td>
                            <td className="py-4 px-6">{u.email}</td>
                            <td className="py-4 px-6">{new Date(u.registerDate).toLocaleDateString()}</td>
                            <td className="py-4 px-6 font-bold text-slate-800">{u.balance.toLocaleString()} ₫</td>
                            <td className="py-4 px-6 text-emerald-600 font-bold">+{u.totalDeposited.toLocaleString()} ₫</td>
                            <td className="py-4 px-6">
                              <span className={`px-2.5 py-0.5 rounded-md font-bold text-[10px] ${
                                u.status === 'ACTIVE' ? 'bg-emerald-50 text-emerald-600' : 'bg-red-50 text-red-600'
                              }`}>{u.status}</span>
                            </td>
                            <td className="py-4 px-6 text-right flex items-center justify-end gap-2">
                              <button
                                onClick={() => setSelectedUserDetail(u)}
                                className="text-[10px] bg-slate-100 hover:bg-slate-200 text-slate-700 font-bold px-2.5 py-1.5 rounded-lg transition-colors"
                              >
                                View Purchases
                              </button>
                              <button
                                onClick={() => handleToggleUserLock(u.id, u.status)}
                                className={`text-[10px] font-bold px-2.5 py-1.5 rounded-lg transition-colors ${
                                  u.status === 'ACTIVE'
                                    ? 'bg-red-500 hover:bg-red-600 text-white shadow-sm'
                                    : 'bg-emerald-500 hover:bg-emerald-600 text-white shadow-sm'
                                }`}
                              >
                                {u.status === 'ACTIVE' ? 'Lock' : 'Unlock'}
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

            {/* TAB: FINANCIAL STATISTICS */}
            {activeTab === 'financial' && (
              <div className="flex flex-col gap-8">
                <div className="mb-2">
                  <h2 className="text-2xl font-display font-black text-brand-blue">Platform Financial Audits</h2>
                  <p className="text-text-muted mt-1">Detailed statistical records of all financial parameters and metrics.</p>
                </div>

                {/* Metric breakdown cards */}
                <div className="grid grid-cols-1 md:grid-cols-4 gap-6">
                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                    <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Gross Platform Revenue</span>
                    <span className="text-3xl font-display font-black text-brand-blue mt-2">{(filteredRevenue).toLocaleString()} ₫</span>
                  </div>

                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                    <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Active Wallet Deposits</span>
                    <span className="text-3xl font-display font-black text-emerald-600 mt-2">12,400,000 ₫</span>
                  </div>

                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                    <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Total Courses Purchased</span>
                    <span className="text-3xl font-display font-black text-primary mt-2">550 times</span>
                  </div>

                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col justify-between">
                    <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Net Platform Earnings (10%)</span>
                    <span className="text-3xl font-display font-black text-indigo-600 mt-2">{(filteredRevenue * 0.1).toLocaleString()} ₫</span>
                  </div>
                </div>

                {/* Financial chart detail grid */}
                <div className="bg-surface rounded-2xl p-8 border border-slate-200/50 ambient-shadow flex flex-col">
                  <h3 className="font-display font-bold text-lg text-brand-blue mb-4">Detailed Financial Inflow & Course Purchase Count</h3>
                  
                  {/* Custom Bar chart comparing Cash vs Purchases */}
                  <div className="w-full h-72 relative select-none">
                    <svg viewBox="0 0 800 240" className="w-full h-full overflow-visible">
                      {/* Grid lines */}
                      {[0, 0.25, 0.5, 0.75, 1].map((r, i) => {
                        const y = 20 + 190 - r * 190;
                        return (
                          <line key={i} x1="60" y1={y} x2="780" y2={y} stroke="#f1f5f9" strokeWidth="1.5" />
                        );
                      })}

                      {/* Bar groups */}
                      {financialChartData.map((item, idx) => {
                        const x = 75 + idx * 60;
                        // Max scaling
                        const revHeight = (item.amount / 30000000) * 190;
                        const buyHeight = (item.count / 60) * 190;

                        return (
                          <g key={idx}>
                            {/* Revenue Bar (Orange) */}
                            <rect x={x} y={210 - revHeight} width="16" height={revHeight} fill="#F36F21" rx="2" />
                            {/* Purchase Count Bar (Blue) */}
                            <rect x={x + 20} y={210 - buyHeight} width="16" height={buyHeight} fill="#12284C" rx="2" />

                            <text x={x + 18} y="228" fill="#64748b" fontSize="10" fontWeight="700" textAnchor="middle">{item.label}</text>
                          </g>
                        );
                      })}
                    </svg>
                  </div>
                  <div className="flex gap-6 justify-center text-xs font-bold mt-4">
                    <div className="flex items-center gap-2">
                      <span className="w-4 h-4 bg-primary rounded"></span>
                      <span>Total Cash Inflow (VND)</span>
                    </div>
                    <div className="flex items-center gap-2">
                      <span className="w-4 h-4 bg-brand-blue rounded"></span>
                      <span>Total Purchase Volume</span>
                    </div>
                  </div>
                </div>
              </div>
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

      {/* ================= MODAL: CREATE PROBLEM ================= */}
      {isCreateProblemOpen && (
        <div className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-[100] flex items-center justify-center p-4">
          <div className="bg-surface rounded-2xl border border-slate-200/50 shadow-2xl max-w-2xl w-full max-h-[85vh] overflow-y-auto p-6 animate-fade-in text-left">
            <div className="flex justify-between items-start mb-4 border-b border-slate-100 pb-3">
              <div>
                <h3 className="font-display font-black text-xl text-brand-blue">Create Programming Problem</h3>
                <p className="text-xs text-text-muted mt-0.5">Fill in the specifications based on the platform db/entity schema.</p>
              </div>
              <button onClick={() => setIsCreateProblemOpen(false)} className="material-symbols-outlined text-slate-400 hover:text-slate-600 transition-colors">close</button>
            </div>

            <form onSubmit={handleCreateProblemSubmit} className="flex flex-col gap-4 text-xs font-semibold">
              <div className="grid grid-cols-2 gap-4">
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Problem Title *</label>
                  <input required type="text" value={newProbTitle} onChange={e => setNewProbTitle(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" placeholder="e.g. Fizz Buzz" />
                </div>
                <div className="flex grid grid-cols-2 gap-2">
                  <div className="flex flex-col gap-1">
                    <label className="text-text-muted">Difficulty</label>
                    <select value={newProbDifficulty} onChange={e => setNewProbDifficulty(e.target.value as any)} className="border border-slate-200 rounded-xl pl-3 pr-8 py-2 text-xs">
                      <option value="EASY">Easy</option>
                      <option value="MEDIUM">Medium</option>
                      <option value="HARD">Hard</option>
                    </select>
                  </div>
                  <div className="flex flex-col gap-1">
                    <label className="text-text-muted">Scope</label>
                    <select value={newProbScope} onChange={e => setNewProbScope(e.target.value as any)} className="border border-slate-200 rounded-xl pl-3 pr-8 py-2 text-xs">
                      <option value="PRACTICE">Practice</option>
                      <option value="CONTEST">Contest</option>
                      <option value="SHARED">Share</option>
                    </select>
                  </div>
                </div>
              </div>

              <div className="flex flex-col gap-1">
                <label className="text-text-muted">Problem Description *</label>
                <textarea required rows={3} value={newProbDesc} onChange={e => setNewProbDesc(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" placeholder="Describe the challenge..." />
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Input Description</label>
                  <textarea rows={2} value={newProbInputDesc} onChange={e => setNewProbInputDesc(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" placeholder="Describe input structure..." />
                </div>
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Output Description</label>
                  <textarea rows={2} value={newProbOutputDesc} onChange={e => setNewProbOutputDesc(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" placeholder="Describe output structure..." />
                </div>
              </div>

              <div className="flex flex-col gap-1">
                <label className="text-text-muted">Constraints</label>
                <textarea rows={2} value={newProbConstraints} onChange={e => setNewProbConstraints(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" placeholder="e.g. 1 <= nums.length <= 10^5" />
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Example Input</label>
                  <textarea rows={2} value={newProbExampleInput} onChange={e => setNewProbExampleInput(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs font-mono" placeholder="Input sample..." />
                </div>
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Example Output</label>
                  <textarea rows={2} value={newProbExampleOutput} onChange={e => setNewProbExampleOutput(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs font-mono" placeholder="Output sample..." />
                </div>
              </div>

              <div className="grid grid-cols-3 gap-3">
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Max Score</label>
                  <input type="number" value={newProbScore} onChange={e => setNewProbScore(Number(e.target.value))} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" />
                </div>
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Time Limit (ms)</label>
                  <input type="number" value={newProbTimeLimit} onChange={e => setNewProbTimeLimit(Number(e.target.value))} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" />
                </div>
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Memory Limit (KB)</label>
                  <input type="number" value={newProbMemoryLimit} onChange={e => setNewProbMemoryLimit(Number(e.target.value))} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" />
                </div>
              </div>

              <div className="flex flex-col gap-1">
                <label className="text-text-muted">Hint</label>
                <input type="text" value={newProbHint} onChange={e => setNewProbHint(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" placeholder="Tip or pointer..." />
              </div>

              <div className="flex flex-col gap-1">
                <label className="text-text-muted">Solution Code</label>
                <textarea rows={2} value={newProbSolutions} onChange={e => setNewProbSolutions(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs font-mono" placeholder="Sample solution code..." />
              </div>

              <div className="flex items-center gap-2 mt-2">
                <input type="checkbox" checked={newProbIsPublic} onChange={e => setNewProbIsPublic(e.target.checked)} className="rounded text-primary border-slate-250" />
                <label className="text-slate-700">Make this problem public immediately</label>
              </div>

              <button
                type="submit"
                className="bg-primary hover:bg-primary-hover text-white font-bold text-sm py-3 rounded-xl transition-all shadow-md mt-4"
              >
                Create Problem Metadata
              </button>
            </form>
          </div>
        </div>
      )}

      {/* ================= MODAL: CREATE CONTEST ================= */}
      {isCreateContestOpen && (
        <div className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-[100] flex items-center justify-center p-4">
          <div className="bg-surface rounded-2xl border border-slate-200/50 shadow-2xl max-w-lg w-full p-6 animate-fade-in text-left">
            <div className="flex justify-between items-start mb-4 border-b border-slate-100 pb-3">
              <div>
                <h3 className="font-display font-black text-xl text-brand-blue">Create Contest</h3>
                <p className="text-xs text-text-muted mt-0.5">Input the basic meta details of the competition.</p>
              </div>
              <button onClick={() => setIsCreateContestOpen(false)} className="material-symbols-outlined text-slate-400 hover:text-slate-600 transition-colors">close</button>
            </div>

            <form onSubmit={handleCreateContestSubmit} className="flex flex-col gap-4 text-xs font-semibold">
              <div className="flex flex-col gap-1">
                <label className="text-text-muted">Contest Title *</label>
                <input required type="text" value={newContestTitle} onChange={e => setNewContestTitle(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" placeholder="e.g. Nonstop Coding Winter Cup" />
              </div>

              <div className="flex flex-col gap-1">
                <label className="text-text-muted">Contest Description</label>
                <textarea rows={3} value={newContestDesc} onChange={e => setNewContestDesc(e.target.value)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" placeholder="Detail contest guidelines..." />
              </div>

              <div className="grid grid-cols-2 gap-4">
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Scoring Rule</label>
                  <select value={newContestScoringRule} onChange={e => setNewContestScoringRule(e.target.value as any)} className="border border-slate-200 rounded-xl pl-3 pr-8 py-2 text-xs">
                    <option value="ICPC">ICPC Rule</option>
                    <option value="IOI">IOI Rule</option>
                    <option value="CUSTOM">Custom Rule</option>
                  </select>
                </div>
                <div className="flex flex-col gap-1">
                  <label className="text-text-muted">Duration (Minutes)</label>
                  <input type="number" value={newContestDuration} onChange={e => setNewContestDuration(Number(e.target.value))} className="border border-slate-200 rounded-xl px-3 py-2 text-xs" />
                </div>
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
    </div>
  );
};
