const BASE_URL = 'http://localhost:8080/nonstopcoding';

export const paymentService = {
  createDepositLink: async (amount: number) => {
    const response = await fetch(`${BASE_URL}/payment/deposit`, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      credentials: 'include',
      body: JSON.stringify({ amount })
    });

    if (!response.ok) {
      throw new Error('Failed to create payment link');
    }

    const data = await response.json();
    return data.result; // contains checkoutUrl, transactionCode, qrCode
  },

  getBalance: async (): Promise<number> => {
    const response = await fetch(`${BASE_URL}/payment/balance`, {
      method: 'GET',
      headers: {
        'Content-Type': 'application/json'
      },
      credentials: 'include'
    });

    if (!response.ok) {
      throw new Error('Failed to fetch balance');
    }

    const data = await response.json();
    return Number(data.result);
  }
};
