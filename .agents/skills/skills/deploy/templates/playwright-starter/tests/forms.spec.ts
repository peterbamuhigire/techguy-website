import { expect, test } from "@playwright/test";

const successText = process.env.E2E_CONTACT_SUCCESS_TEXT || "Thank you";

test("contact form validates and submits", async ({ page }) => {
  await page.goto("/contact");

  await page.getByRole("textbox", { name: /name/i }).fill("Test User");
  await page.getByRole("textbox", { name: /email/i }).fill("test@example.com");

  const messageField = page.getByRole("textbox", { name: /message/i });
  await messageField.fill("This is an automated end-to-end verification message.");

  await page.getByRole("button", { name: /send|submit/i }).click();

  await expect(page.getByText(new RegExp(successText, "i"))).toBeVisible();
});
