export const languages = { en: 'English', fr: 'Français' } as const;
export type Lang = keyof typeof languages;
export const defaultLang: Lang = 'en';

export function getLangFromUrl(url: URL): Lang {
  const [, lang] = url.pathname.split('/');
  if (lang in languages) return lang as Lang;
  return defaultLang;
}

export function getLocalizedPath(path: string, lang: Lang): string {
  const clean = path.replace(/^\/(en|fr)/, '');
  return `/${lang}${clean || '/'}`;
}

const ui = {
  en: {
    'nav.home': 'Home',
    'nav.services': 'Services',
    'nav.portfolio': 'Portfolio',
    'nav.about': 'About',
    'nav.blog': 'Blog',
    'nav.contact': 'Contact',
    'cta.book': 'Book a Consultation',
    'cta.view_work': 'View My Work',
    'cta.learn_more': 'Find Out More',
    'hero.title': 'Building Technology Solutions Across Africa & Beyond',
    'hero.subtitle': '15+ years of software development, ICT consulting, and business advisory across 10+ African countries.',
    'stats.years': 'Years Experience',
    'stats.countries': 'Countries Served',
    'stats.products': 'SaaS Products Built',
    'stats.industries': 'Industries Served',
    'section.services': 'Services',
    'section.services_intro': 'Comprehensive technology and business consulting, grounded in practical experience across Africa.',
    'section.portfolio': 'Portfolio',
    'section.about': 'About',
    'section.contact': 'Get in Touch',
    'section.testimonials': 'What Clients Say',
    'section.why': 'Why Work With Peter',
    'section.products': 'Flagship Products',
    'section.faq': 'Frequently Asked Questions',
    'footer.rights': 'All rights reserved.',
    'footer.built_with': 'Technology & Business Consulting',
    'contact.name': 'Full Name',
    'contact.email': 'Email Address',
    'contact.phone': 'Phone Number',
    'contact.company': 'Company / Organisation',
    'contact.service': 'Service Interest',
    'contact.message': 'Project Description',
    'contact.method': 'Preferred Contact Method',
    'contact.submit': 'Book a Consultation',
    'contact.success': 'Thank you for your enquiry. Peter will be in touch within 48 hours.',
    'contact.hours_label': 'Business Hours',
    'contact.hours': 'Monday – Saturday, 9:00 AM – 6:00 PM EAT',
    'contact.response': 'Consultations typically scheduled within 48 hours',
    'blog.title': 'Insights',
    'blog.subtitle': 'Thoughts on technology, business, and building solutions across Africa.',
    'blog.coming': 'Articles coming soon.',
    'about.story_title': "Peter Bamuhigire's Story",
    'about.philosophy': 'Philosophy',
    'about.timeline': 'Career Journey',
    'about.certs': 'Certifications & Professional Development',
  },
  fr: {
    'nav.home': 'Accueil',
    'nav.services': 'Services',
    'nav.portfolio': 'Réalisations',
    'nav.about': 'À Propos',
    'nav.blog': 'Blog',
    'nav.contact': 'Contact',
    'cta.book': 'Réserver une Consultation',
    'cta.view_work': 'Découvrir Nos Réalisations',
    'cta.learn_more': 'En Savoir Plus',
    'hero.title': 'Des Solutions Technologiques à Travers l\'Afrique et Au-delà',
    'hero.subtitle': 'Plus de 15 ans de développement logiciel, de conseil en TIC et de conseil aux entreprises dans plus de 10 pays africains.',
    'stats.years': 'Années d\'Expérience',
    'stats.countries': 'Pays Servis',
    'stats.products': 'Produits SaaS',
    'stats.industries': 'Industries Servies',
    'section.services': 'Services',
    'section.services_intro': 'Des services complets en technologie et conseil aux entreprises, fondés sur une expérience pratique à travers l\'Afrique.',
    'section.portfolio': 'Réalisations',
    'section.about': 'À Propos',
    'section.contact': 'Nous Contacter',
    'section.testimonials': 'Témoignages',
    'section.why': 'Pourquoi Travailler Avec Peter',
    'section.products': 'Produits Phares',
    'section.faq': 'Questions Fréquentes',
    'footer.rights': 'Tous droits réservés.',
    'footer.built_with': 'Conseil en Technologie & Entreprise',
    'contact.name': 'Nom Complet',
    'contact.email': 'Adresse E-mail',
    'contact.phone': 'Numéro de Téléphone',
    'contact.company': 'Entreprise / Organisation',
    'contact.service': 'Service Souhaité',
    'contact.message': 'Description du Projet',
    'contact.method': 'Moyen de Contact Préféré',
    'contact.submit': 'Réserver une Consultation',
    'contact.success': 'Merci pour votre demande. Peter vous contactera dans les 48 heures.',
    'contact.hours_label': 'Horaires d\'Ouverture',
    'contact.hours': 'Lundi – Samedi, 9h00 – 18h00 EAT',
    'contact.response': 'Consultations généralement planifiées sous 48 heures',
    'blog.title': 'Perspectives',
    'blog.subtitle': 'Réflexions sur la technologie, les affaires et le développement de solutions en Afrique.',
    'blog.coming': 'Articles à venir prochainement.',
    'about.story_title': 'L\'Histoire de Peter Bamuhigire',
    'about.philosophy': 'Philosophie',
    'about.timeline': 'Parcours Professionnel',
    'about.certs': 'Certifications & Développement Professionnel',
  },
} as const;

export function t(key: keyof typeof ui.en, lang: Lang = defaultLang): string {
  return ui[lang]?.[key] ?? ui.en[key] ?? key;
}
