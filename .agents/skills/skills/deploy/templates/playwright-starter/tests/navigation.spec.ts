import { expect, test } from "@playwright/test";

test("primary navigation reaches the contact page", async ({ page }) => {
  await page.goto("/");
  await page.getByRole("link", { name: /contact/i }).first().click();
  await expect(page).toHaveURL(/contact/);
  await expect(page.getByRole("heading").first()).toBeVisible();
});

test("primary CTA routes to the intended conversion page", async ({ page }) => {
  await page.goto("/");
  await page.getByRole("link", { name: /book|contact|get started|request/i }).first().click();
  await expect(page).not.toHaveURL(/\/$/);
});
