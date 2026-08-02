const BASE_URL = import.meta.env.VITE_API_BASE_URL || '/nonstopcoding';

let isRefreshing = false;
let refreshSubscribers: ((success: boolean) => void)[] = [];

function subscribeTokenRefresh(cb: (success: boolean) => void) {
  refreshSubscribers.push(cb);
}

function onRefreshed(success: boolean) {
  refreshSubscribers.forEach((cb) => cb(success));
  refreshSubscribers = [];
}

export function handleLogoutAndRedirect() {
  localStorage.removeItem('user_info');
  window.dispatchEvent(new CustomEvent('auth:unauthorized'));
  if (window.location.pathname !== '/login') {
    window.location.href = '/login';
  }
}

export async function fetchWithAutoRefresh(input: RequestInfo | URL, init?: RequestInit): Promise<Response> {
  const defaultInit: RequestInit = {
    ...init,
    credentials: 'include',
  };

  let response = await fetch(input, defaultInit);

  if (response.status === 401) {
    const urlString = typeof input === 'string' ? input : input instanceof URL ? input.href : (input as Request).url;

    // Do NOT attempt to refresh if the request itself is an auth endpoint where 401 is expected
    if (
      urlString.includes('/auth/refresh') ||
      urlString.includes('/auth/login') ||
      urlString.includes('/auth/google') ||
      urlString.includes('/auth/register') ||
      urlString.includes('/auth/forgot-password') ||
      urlString.includes('/auth/verify-otp') ||
      urlString.includes('/auth/reset-password')
    ) {
      return response;
    }

    if (!isRefreshing) {
      isRefreshing = true;
      try {
        const refreshRes = await fetch(`${BASE_URL}/auth/refresh`, {
          method: 'POST',
          credentials: 'include',
        });

        if (refreshRes.ok) {
          isRefreshing = false;
          onRefreshed(true);
          // Retry the original request with new cookies
          return fetch(input, defaultInit);
        } else {
          isRefreshing = false;
          onRefreshed(false);
          console.warn('[Auth] Refresh token expired or invalid. Redirecting to login...');
          handleLogoutAndRedirect();
          return response;
        }
      } catch (err) {
        isRefreshing = false;
        onRefreshed(false);
        console.error('[Auth] Refresh token request failed:', err);
        handleLogoutAndRedirect();
        return response;
      }
    } else {
      // If refresh is already in progress, wait for it to complete
      return new Promise<Response>((resolve) => {
        subscribeTokenRefresh((success) => {
          if (success) {
            resolve(fetch(input, defaultInit));
          } else {
            resolve(response);
          }
        });
      });
    }
  }

  return response;
}
