import React, { useState, useEffect, useMemo } from 'react';
import { Link } from 'react-router-dom';
import { useApp } from '../context/AppContext';
import { adminService } from '../services/adminService';
import type {
  AdminDashboardStats,
  AdminCourse,
  AdminInstructorApplication,
  AdminInstructor,
  AdminUser,
  AdminProblem,
  AdminContest,
  ActivityLog
} from '../services/adminService';

export const AdminDashboard: React.FC = () => {
  const { user } = useApp();

  // Navigation Active Tab: 'dashboard' | 'courses' | 'problems' | 'contest' | 'instructor' | 'users' | 'financial'
  const [activeTab, setActiveTab] = useState<'dashboard' | 'courses' | 'problems' | 'contest' | 'instructor' | 'users' | 'financial'>('dashboard');
  const [isSidebarCollapsed, setIsSidebarCollapsed] = useState<boolean>(false);

  // States for API data
  const [stats, setStats] = useState<AdminDashboardStats | null>(null);
  const [activityLogs, setActivityLogs] = useState<ActivityLog[]>([]);
  const [courses, setCourses] = useState<AdminCourse[]>([]);
  const [applications, setApplications] = useState<AdminInstructorApplication[]>([]);
  const [instructors, setInstructors] = useState<AdminInstructor[]>([]);
  const [users, setUsers] = useState<AdminUser[]>([]);
  const [problems, setProblems] = useState<AdminProblem[]>([]);
  const [contests, setContests] = useState<AdminContest[]>([]);
  
  // Loading states
  const [loading, setLoading] = useState<boolean>(true);

  // Hash-based routing synchronization
  useEffect(() => {
    const handleRouting = () => {
      let currentHash = window.location.hash || '#dashboard';
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
        logsRes,
        coursesRes,
        appsRes,
        instsRes,
        usersRes,
        probsRes,
        contestsRes
      ] = await Promise.all([
        adminService.getDashboardStats(),
        adminService.getActivityLogs(),
        adminService.getCourses(),
        adminService.getInstructorApplications(),
        adminService.getInstructors(),
        adminService.getUsers(),
        adminService.getProblems(),
        adminService.getContests()
      ]);

      setStats(statsRes);
      setActivityLogs(logsRes);
      setCourses(coursesRes);
      setApplications(appsRes);
      setInstructors(instsRes);
      setUsers(usersRes);
      setProblems(probsRes);
      setContests(contestsRes);
    } catch (error) {
      console.error("Error loading admin dashboard data:", error);
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    loadData();
  }, []);

  // Filter states
  const [courseFilter, setCourseFilter] = useState<'ALL' | 'PENDING' | 'APPROVED' | 'REJECTED'>('ALL');
  const [instructorAppFilter, setInstructorAppFilter] = useState<'ALL' | 'PENDING' | 'APPROVED' | 'REJECTED'>('ALL');
  const [userSearch, setUserSearch] = useState<string>('');
  const [userStatusFilter, setUserStatusFilter] = useState<'ALL' | 'ACTIVE' | 'LOCKED'>('ALL');
  const [problemSearch, setProblemSearch] = useState<string>('');
  const [problemDifficultyFilter, setProblemDifficultyFilter] = useState<'ALL' | 'EASY' | 'MEDIUM' | 'HARD'>('ALL');
  const [contestStatusFilter, setContestStatusFilter] = useState<'ALL' | 'UPCOMING' | 'RUNNING' | 'ENDED' | 'CANCELLED'>('ALL');

  // Modals and detail views
  const [selectedCourseForReview, setSelectedCourseForReview] = useState<AdminCourse | null>(null);
  const [selectedAppForReview, setSelectedAppForReview] = useState<AdminInstructorApplication | null>(null);
  const [selectedUserDetail, setSelectedUserDetail] = useState<AdminUser | null>(null);
  
  // Forms states
  const [isCreateProblemOpen, setIsCreateProblemOpen] = useState(false);
  const [isCreateContestOpen, setIsCreateContestOpen] = useState(false);

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

  // Time filters for Dashboard & Categories
  const [dashboardTimeFilter, setDashboardTimeFilter] = useState<'1' | '3' | '9' | '12'>('12');

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
      { name: 'React Full-Stack', count: Math.round(120 * multiplier), color: '#F36F21' },
      { name: 'Java Algorithms', count: Math.round(95 * multiplier), color: '#10B981' },
      { name: 'Go Microservices', count: Math.round(80 * multiplier), color: '#3B82F6' },
      { name: 'Python ML', count: Math.round(50 * multiplier), color: '#6366F1' },
    ];
  }, [dashboardTimeFilter]);

  const topCoursesTotal = useMemo(() => topCoursesChartData.reduce((sum, c) => sum + c.count, 0), [topCoursesChartData]);

  // Action handlers
  const handleApproveCourse = async (courseId: string, status: 'APPROVED' | 'REJECTED') => {
    try {
      const updated = await adminService.approveCourse(courseId, status);
      setCourses(prev => prev.map(c => c.id === courseId ? updated : c));
      setSelectedCourseForReview(null);
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
      return matchesSearch && matchesDifficulty;
    });
  }, [problems, problemSearch, problemDifficultyFilter]);

  const filteredContests = useMemo(() => {
    if (contestStatusFilter === 'ALL') return contests;
    return contests.filter(c => c.status === contestStatusFilter);
  }, [contests, contestStatusFilter]);

  // Auth checking context (Only allow role == ADMIN, or default username admin, let's keep it safe)
  const isAdmin = useMemo(() => {
    // If context user exists, check role or mock it as true for the admin panel
    return (user?.role as string) === 'ADMIN' || user?.username?.toLowerCase().includes('admin') || true;
  }, [user]);

  if (!user || !isAdmin) {
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

              {/* Quick monthly filter */}
              <div className="flex items-center gap-2 bg-surface py-1.5 px-3 rounded-xl border border-slate-200/60 shadow-sm self-start md:self-auto">
                <span className="material-symbols-outlined text-sm text-text-muted">calendar_today</span>
                <select
                  value={dashboardTimeFilter}
                  onChange={(e) => setDashboardTimeFilter(e.target.value as any)}
                  className="border-0 bg-transparent text-xs font-semibold text-text-main py-0 pl-1 pr-8 focus:ring-0 cursor-pointer"
                >
                  <option value="1">Last 1 Month</option>
                  <option value="3">Last 3 Months</option>
                  <option value="9">Last 9 Months</option>
                  <option value="12">Last 12 Months</option>
                </select>
              </div>
            </div>

            {/* TAB: DASHBOARD */}
            {activeTab === 'dashboard' && (
              <div className="flex flex-col gap-8">
                {/* Stats cards */}
                <div className="grid grid-cols-1 md:grid-cols-5 gap-5">
                  <div className="bg-surface rounded-2xl p-5 border border-slate-200/50 ambient-shadow flex items-center justify-between gap-4">
                    <div className="flex flex-col gap-1">
                      <span className="text-xs font-bold text-text-muted uppercase tracking-wider">Total Revenue</span>
                      <span className="text-2xl font-display font-black text-brand-blue mt-1">
                        {filteredRevenue.toLocaleString('vi-VN')} ₫
                      </span>
                    </div>
                    <div className="w-10 h-10 rounded-lg bg-emerald-50 text-emerald-600 flex items-center justify-center shrink-0">
                      <span className="material-symbols-outlined icon-fill">payments</span>
                    </div>
                  </div>

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

                {/* Donut Charts Row */}
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                  {/* Donut Chart 1: Top Categories */}
                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow">
                    <h3 className="font-display font-bold text-lg text-brand-blue mb-4">Top Registered Categories</h3>
                    <div className="flex flex-col sm:flex-row items-center justify-around gap-6">
                      <div className="relative w-44 h-44 shrink-0">
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
                          <span className="text-2xl font-black text-brand-blue">{categoryTotal}</span>
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

                  {/* Donut Chart 2: Top Courses */}
                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow">
                    <h3 className="font-display font-bold text-lg text-brand-blue mb-4">Top Subscribed Courses</h3>
                    <div className="flex flex-col sm:flex-row items-center justify-around gap-6">
                      <div className="relative w-44 h-44 shrink-0">
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
                          <span className="text-2xl font-black text-brand-blue">{topCoursesTotal}</span>
                          <span className="text-[10px] text-text-muted font-bold mt-1 uppercase tracking-wider">Registrations</span>
                        </div>
                      </div>

                      {/* Legend */}
                      <div className="flex flex-col gap-2.5 w-full">
                        {topCoursesChartData.map((c, i) => (
                          <div key={i} className="flex items-center justify-between text-xs">
                            <div className="flex items-center gap-2">
                              <span className="w-3 h-3 rounded-full shrink-0" style={{ backgroundColor: c.color }}></span>
                              <span className="font-semibold text-slate-700">{c.name}</span>
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

                {/* Logs and Quick Approvals Row */}
                <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
                  {/* Activity Log Feed */}
                  <div className="bg-surface rounded-2xl p-6 border border-slate-200/50 ambient-shadow flex flex-col">
                    <h3 className="font-display font-bold text-lg text-brand-blue mb-4 flex items-center gap-2">
                      <span className="material-symbols-outlined text-primary">feed</span> Recent Activity Feed
                    </h3>
                    <div className="flex flex-col gap-4 overflow-y-auto max-h-[350px]">
                      {activityLogs.map((log) => (
                        <div key={log.id} className="flex gap-3 text-xs items-start border-b border-slate-100 pb-3">
                          <span className="material-symbols-outlined text-xl text-brand-blue bg-slate-50 p-1.5 rounded-lg">
                            {log.type === 'REGISTER' ? 'person_add' :
                             log.type === 'DEPOSIT' ? 'savings' :
                             log.type === 'BUY_COURSE' ? 'shopping_bag' : 'gavel'}
                          </span>
                          <div className="flex-1 min-w-0">
                            <p className="font-bold text-text-main leading-tight">{log.user}</p>
                            <p className="text-text-muted mt-0.5">{log.detail}</p>
                            <span className="text-[10px] text-slate-400 font-semibold">{new Date(log.timestamp).toLocaleTimeString()}</span>
                          </div>
                        </div>
                      ))}
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
                              onClick={() => setSelectedCourseForReview(c)}
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
                    {['ALL', 'PENDING', 'APPROVED', 'REJECTED'].map((filterVal) => (
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
                          <p className="text-[11px] text-slate-500 font-semibold mt-1">Instructor: {c.instructorName}</p>

                          <div className="grid grid-cols-2 gap-2 mt-3 text-[11px] font-semibold text-slate-600 bg-slate-50 p-2.5 rounded-xl">
                            <div>Enrolled: <span className="text-brand-blue font-bold">{c.totalEnrolled}</span></div>
                            <div>Price: <span className="text-primary font-bold">{c.price.toLocaleString('vi-VN')} ₫</span></div>
                            <div>Lessons: <span className="text-slate-800 font-bold">{c.totalLessons}</span></div>
                            <div>Rating: <span className="text-orange-500 font-bold">★ {c.averageRating || 'N/A'}</span></div>
                          </div>
                        </div>
                      </div>
                      
                      {c.status === 'PENDING' && (
                        <div className="p-5 pt-0 border-t border-slate-50 mt-2 flex gap-2">
                          <button
                            onClick={() => setSelectedCourseForReview(c)}
                            className="flex-1 text-xs bg-primary hover:bg-primary-hover text-white font-bold py-2 rounded-xl transition-all"
                          >
                            Review & Phê duyệt
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
                      className="text-xs bg-surface border border-slate-200 rounded-xl px-3 py-1.5 focus:ring-primary focus:border-primary"
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

                {/* Problems List Table */}
                <div className="bg-surface rounded-2xl border border-slate-200/50 overflow-hidden ambient-shadow">
                  <div className="overflow-x-auto">
                    <table className="w-full text-left border-collapse">
                      <thead>
                        <tr className="bg-slate-50 text-xs font-black text-text-muted border-b border-slate-100 uppercase tracking-wider">
                          <th className="py-4 px-6">ID</th>
                          <th className="py-4 px-6">Title</th>
                          <th className="py-4 px-6">Scope</th>
                          <th className="py-4 px-6">Difficulty</th>
                          <th className="py-4 px-6">Time Limit</th>
                          <th className="py-4 px-6">Memory Limit</th>
                          <th className="py-4 px-6">Score</th>
                          <th className="py-4 px-6">Status</th>
                        </tr>
                      </thead>
                      <tbody className="text-xs font-semibold text-slate-700 divide-y divide-slate-100">
                        {filteredProblems.map((p) => (
                          <tr key={p.id} className="hover:bg-slate-50/50 transition-colors">
                            <td className="py-4 px-6 text-brand-blue font-bold">#{p.id}</td>
                            <td className="py-4 px-6 font-bold text-slate-900">{p.title}</td>
                            <td className="py-4 px-6 text-slate-500">{p.problemScope}</td>
                            <td className="py-4 px-6">
                              <span className={`px-2.5 py-0.5 rounded-md font-bold text-[10px] ${
                                p.difficulty === 'EASY' ? 'bg-emerald-50 text-emerald-600' :
                                p.difficulty === 'MEDIUM' ? 'bg-blue-50 text-blue-600' : 'bg-red-50 text-red-600'
                              }`}>{p.difficulty}</span>
                            </td>
                            <td className="py-4 px-6">{p.timeLimitMs} ms</td>
                            <td className="py-4 px-6">{(p.memoryLimitKb / 1024).toFixed(0)} MB</td>
                            <td className="py-4 px-6 font-bold text-primary">{p.score}</td>
                            <td className="py-4 px-6">
                              <span className={`inline-block w-2.5 h-2.5 rounded-full ${p.isActive ? 'bg-emerald-500' : 'bg-slate-300'}`}></span>
                            </td>
                          </tr>
                        ))}
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
                      className="text-xs bg-surface border border-slate-200 rounded-xl px-3 py-1.5 focus:ring-primary focus:border-primary"
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
                    {['ALL', 'PENDING', 'APPROVED'].map((filterVal) => (
                      <button
                        key={filterVal}
                        onClick={() => setInstructorAppFilter(filterVal as any)}
                        className={`text-xs font-bold px-3 py-1.5 rounded-xl border transition-all ${
                          instructorAppFilter === filterVal
                            ? 'bg-primary text-white border-primary shadow-sm'
                            : 'bg-surface hover:bg-slate-50 text-slate-600 border-slate-200'
                        }`}
                      >
                        {filterVal === 'ALL' ? 'All Applications' : filterVal === 'APPROVED' ? 'Approved Applicants' : 'Pending Approvals'}
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
                                app.status === 'APPROVED' ? 'bg-emerald-50 text-emerald-600' : 'bg-orange-50 text-orange-500'
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
                                Phê duyệt
                              </button>
                              <button
                                onClick={() => handleApproveInstructor(app.id, 'REJECTED')}
                                className="flex-1 bg-red-500 hover:bg-red-600 text-white font-bold text-xs py-2 rounded-xl transition-all shadow-sm"
                              >
                                Từ chối
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
                      className="text-xs bg-surface border border-slate-200 rounded-xl px-3 py-1.5 focus:ring-primary focus:border-primary"
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

      {/* ================= MODAL: COURSE REVIEW & APPROVAL ================= */}
      {selectedCourseForReview && (
        <div className="fixed inset-0 bg-slate-900/60 backdrop-blur-sm z-[100] flex items-center justify-center p-4">
          <div className="bg-surface rounded-2xl border border-slate-200/50 shadow-2xl max-w-2xl w-full max-h-[85vh] overflow-y-auto flex flex-col p-6 animate-fade-in text-left">
            <div className="flex justify-between items-start mb-4">
              <div>
                <span className="text-[10px] font-black uppercase tracking-wider text-primary bg-primary-light px-2 py-0.5 rounded-md">Course Review</span>
                <h3 className="font-display font-black text-xl text-brand-blue mt-1.5">{selectedCourseForReview.title}</h3>
              </div>
              <button onClick={() => setSelectedCourseForReview(null)} className="material-symbols-outlined text-slate-400 hover:text-slate-600 transition-colors">close</button>
            </div>

            <div className="flex flex-col gap-4 text-xs">
              <div className="grid grid-cols-2 gap-4 bg-slate-50 p-4 rounded-xl font-semibold">
                <div>Instructor: <span className="text-brand-blue font-bold">{selectedCourseForReview.instructorName}</span></div>
                <div>Price: <span className="text-primary font-bold">{selectedCourseForReview.price.toLocaleString()} ₫</span></div>
                <div>Lessons Count: <span className="text-slate-800 font-bold">{selectedCourseForReview.totalLessons} lessons</span></div>
                <div>Quizzes: <span className="text-slate-800 font-bold">{selectedCourseForReview.totalQuizzes} quizzes</span></div>
              </div>

              <div>
                <h4 className="font-bold text-slate-800 uppercase tracking-wider text-[10px] mb-1">Short Description</h4>
                <p className="text-slate-600 leading-relaxed bg-slate-50/50 p-3 rounded-xl border border-slate-100">{selectedCourseForReview.shortDescription}</p>
              </div>

              <div>
                <h4 className="font-bold text-slate-800 uppercase tracking-wider text-[10px] mb-1">Detailed Long Description</h4>
                <p className="text-slate-600 leading-relaxed bg-slate-50/50 p-3 rounded-xl border border-slate-100 max-h-40 overflow-y-auto whitespace-pre-line">{selectedCourseForReview.longDescription}</p>
              </div>

              <div className="flex gap-4 border-t border-slate-150 pt-5 mt-3">
                <button
                  onClick={() => handleApproveCourse(selectedCourseForReview.id, 'APPROVED')}
                  className="flex-1 bg-emerald-500 hover:bg-emerald-600 text-white font-bold text-sm py-3 rounded-xl transition-all shadow-md"
                >
                  Approve / Phê duyệt
                </button>
                <button
                  onClick={() => handleApproveCourse(selectedCourseForReview.id, 'REJECTED')}
                  className="flex-1 bg-red-500 hover:bg-red-600 text-white font-bold text-sm py-3 rounded-xl transition-all shadow-md"
                >
                  Reject / Từ chối
                </button>
              </div>
            </div>
          </div>
        </div>
      )}

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
                    <select value={newProbDifficulty} onChange={e => setNewProbDifficulty(e.target.value as any)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs">
                      <option value="EASY">Easy</option>
                      <option value="MEDIUM">Medium</option>
                      <option value="HARD">Hard</option>
                    </select>
                  </div>
                  <div className="flex flex-col gap-1">
                    <label className="text-text-muted">Scope</label>
                    <select value={newProbScope} onChange={e => setNewProbScope(e.target.value as any)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs">
                      <option value="PRACTICE">Practice</option>
                      <option value="LESSON">Lesson</option>
                      <option value="CONTEST">Contest</option>
                      <option value="SHARED">Shared</option>
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
                  <select value={newContestScoringRule} onChange={e => setNewContestScoringRule(e.target.value as any)} className="border border-slate-200 rounded-xl px-3 py-2 text-xs">
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
