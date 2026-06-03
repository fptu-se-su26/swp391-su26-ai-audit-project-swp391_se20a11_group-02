const BASE_URL = 'http://localhost:8080/nonstopcoding';

export interface DashboardStatsResponse {
    enrolled: number;
    completedCourses: number;
    solvedPractice: number;
    totalPracticeProblems: number;
    ranking: number;
    totalUsers: number;
    currentBalance: number;
}

export const dashboardService = {
  async getDashboardStats(): Promise<DashboardStatsResponse> {
    const response = await fetch(`${BASE_URL}/me/dashboard-stats`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });
    
    if (!response.ok) {
      throw new Error('Failed to fetch dashboard stats');
    }
    
    const data = await response.json();
    return data.result;
  }
};
