import { test, expect } from '@playwright/test';

test.describe('Authentication Flow', () => {

  test('should fail to login with invalid credentials', async ({ page }) => {
    // Go to login page
    await page.goto('/login');

    // Fill credentials
    await page.fill('input[name="username"]', 'wrong_user');
    await page.fill('input[name="password"]', 'wrong_password');

    // Click Login
    await page.click('button[type="submit"]');

    // Expect an error alert to be visible
    const errorAlert = page.locator('div.bg-red-50');
    await expect(errorAlert).toBeVisible();
    await expect(errorAlert).toContainText('Invalid username or password');
  });

  test('should login and logout successfully with valid credentials', async ({ page }) => {
    // Go to login page
    await page.goto('/login');

    // Fill valid credentials
    await page.fill('input[name="username"]', 'user1');
    await page.fill('input[name="password"]', 'user1');

    // Click Login
    await page.click('button[type="submit"]');

    // Should redirect to dashboard
    await expect(page).toHaveURL(/\/dashboard/);

    // Profile dropdown interaction in the header
    const avatar = page.locator('header img[alt="User Avatar"]');
    await expect(avatar).toBeVisible();

    // Click avatar to open dropdown
    await avatar.click();

    // Select Logout button
    const logoutBtn = page.locator('button:has-text("Logout")');
    await expect(logoutBtn).toBeVisible();
    
    // Click Logout
    await logoutBtn.click();

    // Should redirect back to login page
    await expect(page).toHaveURL(/\/login/);
  });
});
