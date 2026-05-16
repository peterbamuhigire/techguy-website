import { expect, test } from "@playwright/test";

test("homepage loads and exposes the primary heading", async ({ page }) => {
  await page.goto("/");
  await expect(page).toHaveTitle(/.+/);
  await expect(page.getByRole("heading").first()).toBeVisible();
});
