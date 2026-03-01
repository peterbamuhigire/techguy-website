import { defineConfig } from 'astro/config';
import sitemap from '@astrojs/sitemap';
import tailwindcss from '@tailwindcss/vite';

export default defineConfig({
  site: 'https://techguypeter.com',
  integrations: [
    sitemap({
      filter: (page) => !page.includes('/blog') && page !== 'https://techguypeter.com/',
      i18n: {
        defaultLocale: 'en',
        locales: {
          en: 'en-GB',
          fr: 'fr-FR',
        },
      },
    }),
  ],
  i18n: {
    defaultLocale: 'en',
    locales: ['en', 'fr'],
    routing: {
      prefixDefaultLocale: true,
      redirectToDefaultLocale: false,
    },
  },
  vite: {
    plugins: [tailwindcss()],
  },
});
