const BASE_URL = 'http://localhost:8080/nonstopcoding';

export interface InstructorCourse {
  id: string;
  title: string;
  level: string;
  topic: string;
  price: string;
  studentsCount: number;
  rating: number;
  reviewsCount: number;
  status: 'published' | 'review' | 'draft';
  icon: string;
  gradient: string;
  description: string;
}

export interface SalesHistoryItem {
  id: string;
  studentName: string;
  courseId: string;
  courseTitle: string;
  amount: number;
  timestamp: string;
}

export interface RecentRegistration {
  studentName: string;
  avatar: string;
  course: string;
  time: string;
  amount: string;
}

export interface PayoutHistoryItem {
  id: string;
  payoutPeriod: string;
  amount: number;
  bankName: string;
  bankAccountNumber: string;
  status: 'SUCCESS' | 'PROCESSING' | 'PENDING' | 'FAILED';
  transactionReference: string;
  adminNote?: string;
}

export interface CourseBreakdownItem {
  courseId: string;
  courseTitle: string;
  amount: number;
  percentage: number;
}

export interface MonthlyChartItem {
  label: string;
  year: number;
  month: number;
  amount: number;
  count: number;
}

export interface CourseRegistrationsItem {
  courseId: string;
  courseTitle: string;
  count: number;
}

export interface InstructorRevenueResponse {
  totalGrossRevenue: number;
  totalNetRevenue: number;
  totalActualTakeHome: number;
  salesHistory: SalesHistoryItem[];
  recentRegistrations: RecentRegistration[];
  payoutHistory: PayoutHistoryItem[];
  courseBreakdown: CourseBreakdownItem[];
  monthlyChartData: MonthlyChartItem[];
  courseRegistrations: CourseRegistrationsItem[];
  totalTrendRegistrations: number;
}

export const instructorService = {
  async getCourses(): Promise<InstructorCourse[]> {
    const response = await fetch(`${BASE_URL}/instructor/courses`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });

    if (!response.ok) {
      throw new Error('Failed to fetch instructor courses');
    }

    const data = await response.json();
    return data.result;
  },

  async getRevenueData(filter?: string, startDate?: string, endDate?: string, trendTimeframe?: string): Promise<InstructorRevenueResponse> {
    let url = `${BASE_URL}/instructor/revenue`;
    const params = new URLSearchParams();
    if (filter) params.append('filter', filter);
    if (startDate) params.append('startDate', startDate);
    if (endDate) params.append('endDate', endDate);
    if (trendTimeframe) params.append('trendTimeframe', trendTimeframe);

    const queryString = params.toString();
    if (queryString) {
      url += `?${queryString}`;
    }

    const response = await fetch(url, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });

    if (!response.ok) {
      throw new Error('Failed to fetch instructor revenue data');
    }

    const data = await response.json();
    return data.result;
  }
};
