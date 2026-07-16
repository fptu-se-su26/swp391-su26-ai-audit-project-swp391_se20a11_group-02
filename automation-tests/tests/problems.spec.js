import { test, expect } from '@playwright/test';

test.describe('Practice Problems & Code Playground Flow', () => {
  // Run tests sequentially to avoid parallel session conflicts
  test.describe.configure({ mode: 'serial' });

  test.beforeEach(async ({ page }) => {
    // Authenticate first
    await page.goto('/login');
    await page.fill('input[name="username"]', 'user1');
    await page.fill('input[name="password"]', 'user1');
    await page.click('button[type="submit"]');
    await expect(page).toHaveURL(/\/dashboard/);
  });

  test('should browse problems list and select a problem', async ({ page }) => {
    // Navigate to problems page
    await page.goto('/problems');

    // Verify page header
    const header = page.locator('h1:has-text("Problems")');
    await expect(header).toBeVisible();

    // Check if problems table is rendered
    const firstProblemLink = page.locator('tbody tr td a').first();
    await expect(firstProblemLink).toBeVisible();

    const problemTitle = await firstProblemLink.innerText();
    console.log(`Selecting problem: ${problemTitle}`);

    // Click the first problem link
    await firstProblemLink.click();

    // Should navigate to solve problem page
    await expect(page).toHaveURL(/\/problems\/\d+/);

    // Verify description panel is visible
    const descTab = page.locator('button:has-text("Description")');
    await expect(descTab).toBeVisible();
    
    // Wait for the Monaco Code Editor to be visible (longer timeout for CDN download)
    const editorContainer = page.locator('.monaco-editor').first();
    await expect(editorContainer).toBeVisible({ timeout: 45000 });
  });

  test('should choose language and submit code solution', async ({ page }) => {
    // Navigate straight to the first problem solving page (ID 1)
    await page.goto('/problems/1');

    // Wait for Monaco Code Editor to load
    const editorContainer = page.locator('.monaco-editor').first();
    await expect(editorContainer).toBeVisible({ timeout: 45000 });

    // Select language dropdown and choose Python (ID: 71)
    const langSelect = page.locator('select');
    await expect(langSelect).toBeVisible();
    await langSelect.selectOption('71'); // Select Python

    // Locate Submit button
    const submitBtn = page.locator('button:has-text("Submit")');
    await expect(submitBtn).toBeVisible();

    // Click Submit
    await submitBtn.click();

    // Verify it transitions to result tab or shows evaluating state
    const resultTab = page.locator('button:has-text("Tutor")');
    await expect(resultTab).toBeVisible();
  });
});
