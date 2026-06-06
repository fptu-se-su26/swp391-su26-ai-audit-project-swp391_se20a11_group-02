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

export interface InstructorRevenueSummary {
  totalGrossRevenue: number;
  totalNetRevenue: number;
  totalActualTakeHome: number;
}

export interface InstructorCourseRegistrationsResponse {
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

  async getRevenueSummary(filter?: string, startDate?: string, endDate?: string): Promise<InstructorRevenueSummary> {
    let url = `${BASE_URL}/instructor/revenue/summary`;
    const params = new URLSearchParams();
    if (filter) params.append('filter', filter);
    if (startDate) params.append('startDate', startDate);
    if (endDate) params.append('endDate', endDate);

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
      throw new Error('Failed to fetch instructor revenue summary');
    }

    const data = await response.json();
    return data.result;
  },

  async getSalesHistory(filter?: string, startDate?: string, endDate?: string): Promise<SalesHistoryItem[]> {
    let url = `${BASE_URL}/instructor/revenue/sales-history`;
    const params = new URLSearchParams();
    if (filter) params.append('filter', filter);
    if (startDate) params.append('startDate', startDate);
    if (endDate) params.append('endDate', endDate);

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
      throw new Error('Failed to fetch instructor sales history');
    }

    const data = await response.json();
    return data.result;
  },

  async getRecentRegistrations(): Promise<RecentRegistration[]> {
    const response = await fetch(`${BASE_URL}/instructor/revenue/recent-registrations`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });

    if (!response.ok) {
      throw new Error('Failed to fetch instructor recent registrations');
    }

    const data = await response.json();
    return data.result;
  },

  async getPayoutHistory(): Promise<PayoutHistoryItem[]> {
    const response = await fetch(`${BASE_URL}/instructor/revenue/payout-history`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });

    if (!response.ok) {
      throw new Error('Failed to fetch instructor payout history');
    }

    const data = await response.json();
    return data.result;
  },

  async getCourseBreakdown(filter?: string, startDate?: string, endDate?: string): Promise<CourseBreakdownItem[]> {
    let url = `${BASE_URL}/instructor/revenue/course-breakdown`;
    const params = new URLSearchParams();
    if (filter) params.append('filter', filter);
    if (startDate) params.append('startDate', startDate);
    if (endDate) params.append('endDate', endDate);

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
      throw new Error('Failed to fetch instructor course breakdown');
    }

    const data = await response.json();
    return data.result;
  },

  async getMonthlyChartData(): Promise<MonthlyChartItem[]> {
    const response = await fetch(`${BASE_URL}/instructor/revenue/chart-data`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });

    if (!response.ok) {
      throw new Error('Failed to fetch instructor monthly chart data');
    }

    const data = await response.json();
    return data.result;
  },

  async getCourseRegistrations(trendTimeframe?: string): Promise<InstructorCourseRegistrationsResponse> {
    let url = `${BASE_URL}/instructor/revenue/course-registrations`;
    const params = new URLSearchParams();
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
      throw new Error('Failed to fetch instructor course registrations trend');
    }

    const data = await response.json();
    return data.result;
  }
};
