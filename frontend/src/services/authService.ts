const BASE_URL = 'http://localhost:8080/nonstopcoding';

export interface LoginResponse {
  status: number;
  code: number;
  message: string;
  result: {
    id: number;
    username: string;
    displayName: string;
    avatarUrl?: string;
    email: string;
    balance?: number;
    roles?: string[];
  };
}

export const authService = {
  async login(username: string, password: string): Promise<LoginResponse['result']> {
    const response = await fetch(`${BASE_URL}/auth/login`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include', // CRITICAL: Required to receive and send HttpOnly cookies
      body: JSON.stringify({ username, password }),
    });

    if (!response.ok) {
      const errorData = await response.json().catch(() => ({}));
      throw new Error(errorData.message || 'Tên đăng nhập hoặc mật khẩu không chính xác');
    }

    const data: LoginResponse = await response.json();
    return data.result;
  },

  async googleLogin(idToken: string): Promise<LoginResponse['result']> {
    const response = await fetch(`${BASE_URL}/auth/google`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include', // CRITICAL: Required to receive and send HttpOnly cookies
      body: JSON.stringify({ idToken }),
    });

    if (!response.ok) {
      const errorData = await response.json().catch(() => ({}));
      throw new Error(errorData.message || 'Đăng nhập bằng Google thất bại');
    }

    const data: LoginResponse = await response.json();
    return data.result;
  },

  async register(registerData: any): Promise<LoginResponse['result']> {
    const response = await fetch(`${BASE_URL}/auth/register`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include', // CRITICAL: Required to receive and send HttpOnly cookies
      body: JSON.stringify(registerData),
    });

    if (!response.ok) {
      const errorData = await response.json().catch(() => ({}));
      throw new Error(errorData.message || 'Đăng ký không thành công');
    }

    const data: LoginResponse = await response.json();
    return data.result;
  },

  async logout(): Promise<void> {
    const response = await fetch(`${BASE_URL}/auth/logout`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
      },
      credentials: 'include', // CRITICAL: Required to send and clear HttpOnly cookies
    });

    if (!response.ok) {
      throw new Error('Đăng xuất không thành công');
    }
  }
};
