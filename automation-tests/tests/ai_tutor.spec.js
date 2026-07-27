import { test, expect } from '@playwright/test';

test.describe('AI Learning Assistant / Tutor Flow', () => {
  let cachedSimulationResult = {
    detectedAlgorithm: 'Binary Search',
    timeComplexity: 'O(log n)',
    htmlContent: '<html><body><h1>Binary Search Simulation</h1></body></html>',
    fromCache: true
  };

  test.beforeEach(async ({ page }) => {
    // Intercept visualizer API requests and mock them for fast, reliable testing
    await page.route('**/api/v1/ai/visualizer/**', async (route) => {
      const url = route.request().url();
      const method = route.request().method();
      if (url.includes('/generate') || url.includes('/regenerate') || method === 'POST') {
        cachedSimulationResult = {
          detectedAlgorithm: 'Binary Search',
          timeComplexity: 'O(log n)',
          htmlContent: '<html><body><h1>Binary Search Simulation</h1></body></html>',
          fromCache: true
        };
        await route.fulfill({
          status: 200,
          contentType: 'application/json',
          body: JSON.stringify({
            status: 200,
            code: 2000,
            message: 'Success (generated)',
            result: cachedSimulationResult
          })
        });
      } else {
        await route.fulfill({
          status: 200,
          contentType: 'application/json',
          body: JSON.stringify({
            status: 200,
            code: 2000,
            message: cachedSimulationResult ? 'Cache found' : 'No cache found',
            result: cachedSimulationResult
          })
        });
      }
    });
  });

  test('Admin should generate AI simulation', async ({ page }) => {
    // Reset cache first to test the generator button behavior
    cachedSimulationResult = null;

    // Log in as super administrator
    await page.goto('/login');
    await page.fill('input[name="username"]', 'admin');
    await page.fill('input[name="password"]', 'admin');
    await page.click('button[type="submit"]');
    await expect(page).toHaveURL(/\/admin/);

    // Go to edit problem 1 page
    await page.goto('/admin/problems-edit/1');

    // Click "AI Simulator" tab
    const aiSimulatorTab = page.locator('button:has-text("AI Simulator")');
    await expect(aiSimulatorTab).toBeVisible();
    await aiSimulatorTab.click();

    // Verify AI Tutor Panel (Admin view) is shown by checking if textarea is visible
    const customInputLabel = page.locator('label:has-text("Custom Input")');
    await expect(customInputLabel).toBeVisible();

    // Check if the simulation button is present
    const askAiBtn = page.locator('button:has-text("Simulate Algorithm")');
    await expect(askAiBtn).toBeVisible();
    
    // Trigger AI generation (which is mocked above)
    await askAiBtn.click();

    // Verify visualizer iframe and badges become visible
    const complexityBadge = page.locator('text=⏱ O-Big:');
    const algorithmBadge = page.locator('text=🚀 Algorithm:');
    const visualizerIframe = page.locator('iframe[title="AI Visualizer"]');

    await expect(visualizerIframe).toBeVisible({ timeout: 15000 });
    await expect(complexityBadge).toBeVisible();
    await expect(algorithmBadge).toBeVisible();
  });

  test('Student should see the pre-generated AI simulation', async ({ page }) => {
    // Log in as student/user1
    await page.goto('/login');
    await page.fill('input[name="username"]', 'user1');
    await page.fill('input[name="password"]', 'user1');
    await page.click('button[type="submit"]');
    await expect(page).toHaveURL(/\/dashboard|\/instructor/);

    // Go to solve problem page 1
    await page.goto('/problems/1');

    // Wait for editor container to be visible to ensure page is loaded
    await expect(page.locator('.monaco-editor').first()).toBeVisible({ timeout: 45000 });

    // Locate the AI Tutor tab button
    const aiTutorTab = page.locator('button:has-text("AI Tutor")');
    await expect(aiTutorTab).toBeVisible();
    await aiTutorTab.click();

    // Verify visualizer iframe and badges are visible directly since they were pre-generated
    const complexityBadge = page.locator('text=⏱ O-Big:');
    const algorithmBadge = page.locator('text=🚀 Algorithm:');
    const visualizerIframe = page.locator('iframe[title="AI Visualizer"]');

    await expect(visualizerIframe).toBeVisible({ timeout: 15000 });
    await expect(complexityBadge).toBeVisible();
    await expect(algorithmBadge).toBeVisible();

    // Student should NOT see the custom input label or Ask AI button since they are not admin
    const customInputLabel = page.locator('label:has-text("Custom Input")');
    const askAiBtn = page.locator('button:has-text("Simulate Algorithm")');
    await expect(customInputLabel).not.toBeVisible();
    await expect(askAiBtn).not.toBeVisible();
  });
});

