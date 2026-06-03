const BASE_URL = 'http://localhost:8080/nonstopcoding';

export interface ProblemListItem {
  id: number;
  title: string;
  difficulty: 'Easy' | 'Medium' | 'Hard';
  tags: string[];
  score: number;
  acceptance: string;
  totalSolved: number;
  status: 'solved' | 'unsolved' | 'attempted';
}

export interface ProblemDetail {
  id: number;
  title: string;
  difficulty: string;
  description: string;
  inputDescription: string;
  outputDescription: string;
  constraints: string;
  exampleInput: string;
  exampleOutput: string;
  hint: string;
  tags: string[];
  testcases: { id: number; inputData: string; expectedOutput: string }[];
  templates: { [key: string]: string };
  status: 'solved' | 'unsolved' | 'attempted';
  acceptance: string;
  totalSolved: number;
  submissions?: {
    status: string;
    lang: string;
    runtime: string;
    memory: string;
    time: string;
    statusClass: string;
  }[];
}

export interface SubmitResponse {
  verdict: string;
  runtime: number;
  memory: number;
  passedTestcases: number;
  totalTestcases: number;
}

export interface ProblemComment {
  id: number;
  author: string;
  avatarInitials: string;
  avatarBg: string;
  text: string;
  time: string;
  createdAt: string;
  parentId: number | null;
  replies: ProblemComment[];
}

interface ApiResponse<T> {
  status: number;
  code: number;
  message: string;
  result: T;
  timestamp: string;
}

export const problemService = {
  async fetchProblems(): Promise<ProblemListItem[]> {
    const response = await fetch(`${BASE_URL}/api/problems`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });
    if (!response.ok) {
      throw new Error('Failed to fetch problems');
    }
    const data: ApiResponse<ProblemListItem[]> = await response.json();
    return data.result;
  },

  async fetchProblemDetail(id: number | string): Promise<ProblemDetail> {
    const response = await fetch(`${BASE_URL}/api/problems/${id}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });
    if (!response.ok) {
      throw new Error('Failed to fetch problem detail');
    }
    const data: ApiResponse<ProblemDetail> = await response.json();
    return data.result;
  },

  async submitSolution(id: number | string, language: string, sourceCode: string): Promise<SubmitResponse> {
    const response = await fetch(`${BASE_URL}/api/problems/${id}/submit`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
      body: JSON.stringify({ language, sourceCode }),
    });
    if (!response.ok) {
      const err = await response.json().catch(() => ({}));
      throw new Error(err.message || 'Failed to submit solution');
    }
    const data: ApiResponse<SubmitResponse> = await response.json();
    return data.result;
  },

  async fetchProblemComments(problemId: number | string): Promise<ProblemComment[]> {
    const response = await fetch(`${BASE_URL}/api/problems/${problemId}/comments`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
    });
    if (!response.ok) {
      throw new Error('Failed to fetch problem comments');
    }
    const data: ApiResponse<ProblemComment[]> = await response.json();
    return data.result;
  },

  async postProblemComment(problemId: number | string, content: string, parentId?: number): Promise<ProblemComment> {
    const response = await fetch(`${BASE_URL}/api/problems/${problemId}/comments`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include',
      body: JSON.stringify({ content, parentId }),
    });
    if (!response.ok) {
      const err = await response.json().catch(() => ({}));
      throw new Error(err.message || 'Failed to post comment');
    }
    const data: ApiResponse<ProblemComment> = await response.json();
    return data.result;
  }
};
