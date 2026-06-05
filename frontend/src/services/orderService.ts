export const BASE_URL = 'http://localhost:8080/nonstopcoding';

export interface ApiResponse<T> {
  code: number;
  message: string;
  result: T;
}

const getHeaders = () => {
  return {
    'Content-Type': 'application/json',
  };
};

export const checkoutApi = async (courseIds: number[]): Promise<boolean> => {
  try {
    const response = await fetch(`${BASE_URL}/orders/checkout`, {
      method: 'POST',
      headers: getHeaders(),
      body: JSON.stringify({ courseIds }),
      credentials: 'include',
    });
    
    if (!response.ok) {
      const errData = await response.json().catch(() => null);
      console.error("Checkout failed:", errData);
      return false;
    }
    
    const data: ApiResponse<any> = await response.json();
    return data.code === 1000;
  } catch (error) {
    console.error("Failed to checkout:", error);
    return false;
  }
};
