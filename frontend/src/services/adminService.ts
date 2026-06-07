const BASE_URL = 'http://localhost:8080/nonstopcoding';

export interface AdminDashboardStats {
  totalRevenue: number;
  activeUsers: number;
  activeContests: number;
  totalCourses: number;
  totalInstructors: number;
  totalProblems: number;
}

export interface AdminCourse {
  id: string;
  instructorId: number;
  instructorName: string;
  title: string;
  thumbnailUrl: string;
  shortDescription: string;
  longDescription: string;
  status: 'PENDING' | 'APPROVED' | 'REJECTED';
  price: number;
  averageRating: number;
  totalReviews: number;
  totalEnrolled: number;
  totalLessons: number;
  totalQuizzes: number;
  totalVideos: number;
  totalChapters: number;
  instructorAvatarUrl?: string;
}

export interface AdminInstructorApplication {
  id: number;
  userId: number;
  fullName: string;
  email: string;
  cvUrl: string;
  introduction: string;
  status: 'PENDING' | 'APPROVED' | 'REJECTED';
  adminNote?: string;
  createdAt: string;
}

export interface AdminInstructor {
  id: number;
  userId: number;
  fullName: string;
  major: string;
  bio: string;
  status: 'ACTIVE' | 'SUSPENDED';
  coursesCount: number;
  rating: number;
  studentsCount: number;
}

export interface AdminUser {
  id: number;
  name: string;
  email: string;
  registerDate: string;
  status: 'ACTIVE' | 'LOCKED';
  balance: number;
  totalDeposited: number;
  totalPurchased: number;
  purchasedCourses: { id: string; title: string; price: number; date: string }[];
}

export interface AdminProblem {
  id: number;
  title: string;
  description: string;
  inputDescription: string;
  outputDescription: string;
  constraints: string;
  exampleInput: string;
  exampleOutput: string;
  hint: string;
  problemScope: 'LESSON' | 'CONTEST' | 'SHARED' | 'PRACTICE';
  difficulty: 'EASY' | 'MEDIUM' | 'HARD';
  isActive: boolean;
  createdBy: number;
  createdAt: string;
  totalTestcases: number;
  timeLimitMs: number;
  memoryLimitKb: number;
  isPublic: boolean;
  score: number;
  solutions?: string;
}

export interface AdminContest {
  id: number;
  title: string;
  description: string;
  scoringRule: 'ICPC' | 'IOI' | 'CUSTOM';
  startTime: string;
  endTime: string;
  durations: number; // in minutes
  status: 'UPCOMING' | 'RUNNING' | 'ENDED' | 'CANCELLED';
  participantCount: number;
  submissionCount: number;
  averageScore: number;
}

export interface ActivityLog {
  id: string;
  type: 'REGISTER' | 'DEPOSIT' | 'BUY_COURSE' | 'APPROVAL';
  user: string;
  detail: string;
  timestamp: string;
}

export interface AdminDepositHistory {
  id: string;
  userName: string;
  amount: number;
  date: string;
}

// Mock database to simulate stateful actions locally when backend is unavailable
let mockStats: AdminDashboardStats = {
  totalRevenue: 24580000,
  activeUsers: 342,
  activeContests: 4,
  totalCourses: 18,
  totalInstructors: 8,
  totalProblems: 45,
};

let mockCourses: AdminCourse[] = [
  {
    id: "c-101",
    instructorId: 10,
    instructorName: "Dr. Jenkins",
    instructorAvatarUrl: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&q=80",
    title: "Mastering Full-Stack React & Node.js",
    thumbnailUrl: "https://images.unsplash.com/photo-1633356122544-f134324a6cee?auto=format&fit=crop&w=400&q=80",
    shortDescription: "Build scalable web applications from scratch using MERN stack.",
    longDescription: "This course is a comprehensive, deep-dive into standard React and Node.js. It covers everything from project initialization, routing, styling, state management, testing, and production deployment.",
    status: 'APPROVED',
    price: 499000,
    averageRating: 4.8,
    totalReviews: 120,
    totalEnrolled: 340,
    totalLessons: 42,
    totalQuizzes: 8,
    totalVideos: 24,
    totalChapters: 6,
  },
  {
    id: "c-102",
    instructorId: 11,
    instructorName: "Alice Miller",
    instructorAvatarUrl: "https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80",
    title: "Java Algorithms & Coding Arena",
    thumbnailUrl: "https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=400&q=80",
    shortDescription: "Solve complex programmatic challenges using Java standard library.",
    longDescription: "Ideal for student developers preparing for technical coding interviews. Learn Big-O analysis, sorting algorithms, trees, graph theory, and dynamic programming.",
    status: 'APPROVED',
    price: 389000,
    averageRating: 4.6,
    totalReviews: 85,
    totalEnrolled: 210,
    totalLessons: 30,
    totalQuizzes: 5,
    totalVideos: 18,
    totalChapters: 4,
  },
  {
    id: "c-103",
    instructorId: 10,
    instructorName: "Dr. Jenkins",
    instructorAvatarUrl: "https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&q=80",
    title: "Python Data Science and Machine Learning",
    thumbnailUrl: "https://images.unsplash.com/photo-1527474305487-b87b222841cc?auto=format&fit=crop&w=400&q=80",
    shortDescription: "Analyze datasets, build neural networks, and visualize data trends.",
    longDescription: "Learn Python libraries including NumPy, Pandas, Scikit-Learn, and TensorFlow. Perfect for beginners entering the AI audit and science sectors.",
    status: 'PENDING',
    price: 599000,
    averageRating: 0.0,
    totalReviews: 0,
    totalEnrolled: 0,
    totalLessons: 35,
    totalQuizzes: 6,
    totalVideos: 20,
    totalChapters: 5,
  },
  {
    id: "c-104",
    instructorId: 12,
    instructorName: "John Doe",
    instructorAvatarUrl: "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80",
    title: "Go Microservices & Dockerized Deployments",
    thumbnailUrl: "https://images.unsplash.com/photo-1607799279861-4dd421887fb3?auto=format&fit=crop&w=400&q=80",
    shortDescription: "Build blazing fast microservices with Golang, gRPC and RabbitMQ.",
    longDescription: "Learn to design production systems with distributed messaging, microservice gateways, and orchestration using Docker-compose.",
    status: 'PENDING',
    price: 650000,
    averageRating: 0.0,
    totalReviews: 0,
    totalEnrolled: 0,
    totalLessons: 28,
    totalQuizzes: 4,
    totalVideos: 15,
    totalChapters: 4,
  }
];

let mockInstructorApplications: AdminInstructorApplication[] = [
  {
    id: 1,
    userId: 201,
    fullName: "Elena Rostova",
    email: "elena@nonstopcoding.edu",
    cvUrl: "https://example.com/cv-elena.pdf",
    introduction: "Senior React Engineer with 8 years of experience. Former Tech Lead at Yandex. Passionate about mentoring.",
    status: 'PENDING',
    createdAt: "2026-06-01T10:30:00Z"
  },
  {
    id: 2,
    userId: 202,
    fullName: "Marcus Aurelius",
    email: "marcus.coder@gmail.com",
    cvUrl: "https://example.com/cv-marcus.pdf",
    introduction: "Core C++ compiler developer. I want to build a deep, high-level course on CPU architectures and assembly.",
    status: 'PENDING',
    createdAt: "2026-06-05T14:45:00Z"
  }
];

let mockInstructors: AdminInstructor[] = [
  {
    id: 10,
    userId: 1001,
    fullName: "Dr. Jenkins",
    major: "Computer Science & Engineering",
    bio: "Ph.D. in Software Architectures. Creator of modern web frameworks and author of over 10 books.",
    status: 'ACTIVE',
    coursesCount: 3,
    rating: 4.8,
    studentsCount: 550
  },
  {
    id: 11,
    userId: 1002,
    fullName: "Alice Miller",
    major: "Data Analyst & Algorithmist",
    bio: "Algorithm designer specializing in dynamic programming and Competitive Coding structures.",
    status: 'ACTIVE',
    coursesCount: 2,
    rating: 4.6,
    studentsCount: 340
  },
  {
    id: 12,
    userId: 1003,
    fullName: "John Doe",
    major: "Cloud Architecture specialist",
    bio: "Ex-Google Engineer. Cloud Solutions Architect focusing on Go and Kubernetes deployments.",
    status: 'ACTIVE',
    coursesCount: 1,
    rating: 4.5,
    studentsCount: 120
  }
];

let mockUsers: AdminUser[] = [
  {
    id: 101,
    name: "Nguyen Van A",
    email: "vana@gmail.com",
    registerDate: "2026-01-15T08:00:00Z",
    status: 'ACTIVE',
    balance: 1500000,
    totalDeposited: 5000000,
    totalPurchased: 3500000,
    purchasedCourses: [
      { id: "c-101", title: "Mastering Full-Stack React & Node.js", price: 499000, date: "2026-02-01T12:00:00Z" },
      { id: "c-102", title: "Java Algorithms & Coding Arena", price: 389000, date: "2026-03-10T14:20:00Z" }
    ]
  },
  {
    id: 102,
    name: "Tran Thi B",
    email: "thib@gmail.com",
    registerDate: "2026-02-20T10:15:00Z",
    status: 'ACTIVE',
    balance: 200000,
    totalDeposited: 1200000,
    totalPurchased: 1000000,
    purchasedCourses: [
      { id: "c-101", title: "Mastering Full-Stack React & Node.js", price: 499000, date: "2026-02-25T09:00:00Z" }
    ]
  },
  {
    id: 103,
    name: "Le Van C",
    email: "vanc@gmail.com",
    registerDate: "2026-03-05T16:30:00Z",
    status: 'LOCKED',
    balance: 0,
    totalDeposited: 300000,
    totalPurchased: 300000,
    purchasedCourses: []
  },
  {
    id: 104,
    name: "Pham Minh D",
    email: "minhd@hotmail.com",
    registerDate: "2026-05-12T11:40:00Z",
    status: 'ACTIVE',
    balance: 4500000,
    totalDeposited: 4500000,
    totalPurchased: 0,
    purchasedCourses: []
  }
];

let mockProblems: AdminProblem[] = [
  {
    id: 1,
    title: "Two Sum",
    description: "Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.",
    inputDescription: "An integer array `nums` and a single target integer `target`.",
    outputDescription: "Indices of the two numbers in any order.",
    constraints: "-10^9 <= nums[i] <= 10^9\n-10^9 <= target <= 10^9",
    exampleInput: "nums = [2,7,11,15], target = 9",
    exampleOutput: "[0,1]",
    hint: "Use a hashmap to check if the complement (target - nums[i]) already exists in the map.",
    problemScope: "PRACTICE",
    difficulty: "EASY",
    isActive: true,
    createdBy: 1001,
    createdAt: "2026-01-20T10:00:00Z",
    totalTestcases: 4,
    timeLimitMs: 1000,
    memoryLimitKb: 128000,
    isPublic: true,
    score: 100.0
  },
  {
    id: 2,
    title: "Longest Substring Without Repeating Characters",
    description: "Given a string `s`, find the length of the longest substring without repeating characters.",
    inputDescription: "A single string `s` containing english letters, digits, and symbols.",
    outputDescription: "An integer representing the length of the longest unique substring.",
    constraints: "0 <= s.length <= 5 * 10^4",
    exampleInput: "s = \"abcabcbb\"",
    exampleOutput: "3 (The substring is \"abc\")",
    hint: "Use the sliding window technique with two pointers.",
    problemScope: "PRACTICE",
    difficulty: "MEDIUM",
    isActive: true,
    createdBy: 1002,
    createdAt: "2026-02-15T15:30:00Z",
    totalTestcases: 5,
    timeLimitMs: 1500,
    memoryLimitKb: 256000,
    isPublic: true,
    score: 100.0
  }
];

let mockContests: AdminContest[] = [
  {
    id: 1,
    title: "Non-Stop Coding Championship Season 1",
    description: "Our quarterly programming contest containing 5 hard problems. ICPC rules.",
    scoringRule: "ICPC",
    startTime: "2026-06-15T18:00:00Z",
    endTime: "2026-06-15T21:00:00Z",
    durations: 180,
    status: "UPCOMING",
    participantCount: 124,
    submissionCount: 412,
    averageScore: 68.5
  },
  {
    id: 2,
    title: "Weekly Practice Contest #12",
    description: "Weekly friendly challenge containing 3 easy-to-medium problems.",
    scoringRule: "IOI",
    startTime: "2026-06-07T09:00:00Z",
    endTime: "2026-06-07T11:00:00Z",
    durations: 120,
    status: "RUNNING",
    participantCount: 89,
    submissionCount: 201,
    averageScore: 78.2
  }
];

let mockActivityLogs: ActivityLog[] = [
  {
    id: "log-1",
    type: "REGISTER",
    user: "Nguyen Van A",
    detail: "Registered a new account successfully.",
    timestamp: "2026-06-07T07:10:00Z"
  },
  {
    id: "log-2",
    type: "DEPOSIT",
    user: "Tran Thi B",
    detail: "Deposited 500,000 ₫ via VNPay transaction code #VN9429.",
    timestamp: "2026-06-07T07:22:00Z"
  },
  {
    id: "log-3",
    type: "BUY_COURSE",
    user: "Nguyen Van A",
    detail: "Purchased course: 'Mastering Full-Stack React & Node.js'.",
    timestamp: "2026-06-07T07:45:00Z"
  },
  {
    id: "log-4",
    type: "APPROVAL",
    user: "Admin",
    detail: "Approved course application: 'Java Algorithms & Coding Arena'.",
    timestamp: "2026-06-07T07:50:00Z"
  }
];

let mockRecentDeposits: AdminDepositHistory[] = [
  { id: "dep-1", userName: "Nguyen Van A", amount: 500000, date: "2026-06-07T07:45:00Z" },
  { id: "dep-2", userName: "Tran Thi B", amount: 1000000, date: "2026-06-07T06:30:00Z" },
  { id: "dep-3", userName: "Le Van C", amount: 200000, date: "2026-06-06T15:20:00Z" },
  { id: "dep-4", userName: "Pham Minh D", amount: 1500000, date: "2026-06-05T09:10:00Z" },
  { id: "dep-5", userName: "Hoang Van E", amount: 50000, date: "2026-06-04T11:00:00Z" }
];

// Helper to delay response for realism
const delay = (ms: number) => new Promise(resolve => setTimeout(resolve, ms));

export const adminService = {
  // Statistics
  async getDashboardStats(): Promise<AdminDashboardStats> {
    try {
      const response = await fetch(`${BASE_URL}/admin/dashboard/stats`, { credentials: 'include' });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Using mock data for Dashboard Stats:", err);
    }
    await delay(300);
    return mockStats;
  },

  async getActivityLogs(): Promise<ActivityLog[]> {
    try {
      const response = await fetch(`${BASE_URL}/admin/dashboard/activity-logs`, { credentials: 'include' });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Using mock data for Activity Logs:", err);
    }
    await delay(200);
    return mockActivityLogs;
  },

  async getRecentDeposits(): Promise<AdminDepositHistory[]> {
    try {
      const response = await fetch(`${BASE_URL}/admin/dashboard/recent-deposits`, { credentials: 'include' });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Using mock data for Recent Deposits:", err);
    }
    await delay(200);
    return mockRecentDeposits;
  },

  // Courses
  async getCourses(): Promise<AdminCourse[]> {
    try {
      const response = await fetch(`${BASE_URL}/admin/courses`, { credentials: 'include' });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Using mock data for Admin Courses:", err);
    }
    await delay(300);
    return mockCourses;
  },

  async approveCourse(courseId: string, status: 'APPROVED' | 'REJECTED'): Promise<AdminCourse> {
    try {
      const response = await fetch(`${BASE_URL}/admin/courses/${courseId}/approve`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ status }),
        credentials: 'include'
      });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Mocking approve course action:", err);
    }
    await delay(400);
    mockCourses = mockCourses.map(c => c.id === courseId ? { ...c, status } : c);
    const updated = mockCourses.find(c => c.id === courseId)!;
    // Add log
    mockActivityLogs.unshift({
      id: `log-${Date.now()}`,
      type: "APPROVAL",
      user: "Admin",
      detail: `${status === 'APPROVED' ? 'Approved' : 'Rejected'} course: '${updated.title}'`,
      timestamp: new Date().toISOString()
    });
    return updated;
  },

  // Instructor applications
  async getInstructorApplications(): Promise<AdminInstructorApplication[]> {
    try {
      const response = await fetch(`${BASE_URL}/admin/instructors/applications`, { credentials: 'include' });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Using mock data for Instructor Applications:", err);
    }
    await delay(300);
    return mockInstructorApplications;
  },

  async approveInstructorApplication(appId: number, status: 'APPROVED' | 'REJECTED', adminNote?: string): Promise<AdminInstructorApplication> {
    try {
      const response = await fetch(`${BASE_URL}/admin/instructors/applications/${appId}/approve`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ status, adminNote }),
        credentials: 'include'
      });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Mocking approve instructor application:", err);
    }
    await delay(400);
    mockInstructorApplications = mockInstructorApplications.map(app => 
      app.id === appId ? { ...app, status, adminNote } : app
    );
    const app = mockInstructorApplications.find(a => a.id === appId)!;
    if (status === 'APPROVED') {
      // Add instructor to active list
      mockInstructors.push({
        id: mockInstructors.length + 13,
        userId: app.userId,
        fullName: app.fullName,
        major: "Software Engineering Instructor",
        bio: app.introduction,
        status: 'ACTIVE',
        coursesCount: 0,
        rating: 5.0,
        studentsCount: 0
      });
      mockStats.totalInstructors += 1;
    }
    // Add log
    mockActivityLogs.unshift({
      id: `log-${Date.now()}`,
      type: "APPROVAL",
      user: "Admin",
      detail: `${status === 'APPROVED' ? 'Approved' : 'Rejected'} instructor application from '${app.fullName}'`,
      timestamp: new Date().toISOString()
    });
    return app;
  },

  // Instructors List
  async getInstructors(): Promise<AdminInstructor[]> {
    try {
      const response = await fetch(`${BASE_URL}/admin/instructors`, { credentials: 'include' });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Using mock data for Active Instructors:", err);
    }
    await delay(300);
    return mockInstructors;
  },

  // Users List
  async getUsers(): Promise<AdminUser[]> {
    try {
      const response = await fetch(`${BASE_URL}/admin/users`, { credentials: 'include' });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Using mock data for Users list:", err);
    }
    await delay(300);
    return mockUsers;
  },

  async setUserLockStatus(userId: number, status: 'ACTIVE' | 'LOCKED'): Promise<AdminUser> {
    try {
      const response = await fetch(`${BASE_URL}/admin/users/${userId}/lock`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ status }),
        credentials: 'include'
      });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Mocking user lock/unlock status:", err);
    }
    await delay(300);
    mockUsers = mockUsers.map(u => u.id === userId ? { ...u, status } : u);
    const updated = mockUsers.find(u => u.id === userId)!;
    // Add log
    mockActivityLogs.unshift({
      id: `log-${Date.now()}`,
      type: "APPROVAL",
      user: "Admin",
      detail: `${status === 'LOCKED' ? 'Locked' : 'Unlocked'} account of '${updated.name}'`,
      timestamp: new Date().toISOString()
    });
    return updated;
  },

  // Problems
  async getProblems(): Promise<AdminProblem[]> {
    try {
      const response = await fetch(`${BASE_URL}/admin/problems`, { credentials: 'include' });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Using mock data for Problems:", err);
    }
    await delay(300);
    return mockProblems;
  },

  async createProblem(problem: Omit<AdminProblem, 'id' | 'createdAt' | 'createdBy' | 'isActive'>): Promise<AdminProblem> {
    try {
      const response = await fetch(`${BASE_URL}/admin/problems`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(problem),
        credentials: 'include'
      });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Mocking create problem:", err);
    }
    await delay(400);
    const newProb: AdminProblem = {
      ...problem,
      id: mockProblems.length + 1,
      createdAt: new Date().toISOString(),
      createdBy: 9999, // Admin
      isActive: true
    };
    mockProblems.push(newProb);
    mockStats.totalProblems += 1;
    return newProb;
  },

  // Contests
  async getContests(): Promise<AdminContest[]> {
    try {
      const response = await fetch(`${BASE_URL}/admin/contests`, { credentials: 'include' });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Using mock data for Contests:", err);
    }
    await delay(300);
    return mockContests;
  },

  async createContest(contest: Omit<AdminContest, 'id' | 'status' | 'participantCount' | 'submissionCount' | 'averageScore'>): Promise<AdminContest> {
    try {
      const response = await fetch(`${BASE_URL}/admin/contests`, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(contest),
        credentials: 'include'
      });
      if (response.ok) {
        const data = await response.json();
        return data.result;
      }
    } catch (err) {
      console.warn("Mocking create contest:", err);
    }
    await delay(400);
    const newContest: AdminContest = {
      ...contest,
      id: mockContests.length + 1,
      status: 'UPCOMING',
      participantCount: 0,
      submissionCount: 0,
      averageScore: 0.0
    };
    mockContests.push(newContest);
    mockStats.activeContests += 1;
    return newContest;
  },

  // Financial Chart details for 12 months
  getFinancialChartData() {
    return [
      { label: 'Jul 25', amount: 14000000, count: 28, usersCount: 18 },
      { label: 'Aug 25', amount: 16500000, count: 33, usersCount: 21 },
      { label: 'Sep 25', amount: 15000000, count: 30, usersCount: 25 },
      { label: 'Oct 25', amount: 17200000, count: 34, usersCount: 30 },
      { label: 'Nov 25', amount: 19000000, count: 38, usersCount: 29 },
      { label: 'Dec 25', amount: 21500000, count: 43, usersCount: 35 },
      { label: 'Jan 26', amount: 12000000, count: 24, usersCount: 15 },
      { label: 'Feb 26', amount: 15000000, count: 30, usersCount: 22 },
      { label: 'Mar 26', amount: 18500000, count: 37, usersCount: 31 },
      { label: 'Apr 26', amount: 16000000, count: 32, usersCount: 28 },
      { label: 'May 26', amount: 22000000, count: 44, usersCount: 45 },
      { label: 'Jun 26', amount: 24580000, count: 49, usersCount: 52 }
    ];
  }
};
