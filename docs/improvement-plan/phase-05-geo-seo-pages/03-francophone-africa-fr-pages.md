# 03 — Francophone Africa FR Pages: Three Low-Competition Landing Pages

## Skills Applied
- `seo` — `references/seo-reference.md` (Geo-SEO, French-language search)
- `page-builder` — `references/page-patterns.md` (Service landing page template)
- `sales-copywriting` — `references/website-messaging-framework.md` (Sections 3, 6)
- `i18n` — `references/i18n-patterns.md` (French language, hreflang)
- `east-african-english` — formal register; FR equivalent: formal francophone African register, vouvoiement

## Current State

The French homepage (`/fr/`) exists but has no dedicated service + geography landing pages. A buyer in Abidjan searching "consultant informatique Côte d'Ivoire" or a buyer in Dakar searching "développeur web Sénégal" finds nothing from this site.

From the geo-seo-strategy.md: "Almost zero dedicated competition for 'consultant informatique Afrique francophone'. Peter is uniquely positioned — bilingual, pan-African experience, genuine Francophone Africa track record (Sierra Leone, Senegal)."

**Important:** All FR copy must target all of Francophone Africa broadly — not Uganda or East Africa specifically. Reference cities: Abidjan, Dakar, Kinshasa, Douala, Lomé, Cotonou, Bamako. Institutions: Ecobank, BOA, BCEAO. Regulatory frameworks where relevant: OHADA, SYSCOHADA.

## Current Score

**Technical SEO and discoverability: 7.0/10**

## Target State

Three new Astro pages at:
- `src/pages/fr/consultant-informatique-afrique.astro`
- `src/pages/fr/developpement-logiciel-afrique.astro`
- `src/pages/fr/developpement-web-afrique.astro`

## Target Score

**Technical SEO and discoverability: 8.0/10** (combined with Uganda and East Africa pages)

## Why This Matters

Francophone African markets have almost no dedicated ICT consulting or software development web presence in French. The competitive environment for "consultant informatique Abidjan" or "développeur logiciel Dakar" is weak — mostly generic directory listings and individual LinkedIn profiles. A well-constructed set of French-language pages targeting this space will rank quickly and will produce enquiries from markets where there is essentially no other serious option available.

## Step-by-Step Instructions

### Page 1 — `/fr/consultant-informatique-afrique/`

**File to create:** `src/pages/fr/consultant-informatique-afrique.astro`

**Primary keyword:** `consultant informatique Afrique` / `consultant ICT Afrique francophone`
**Secondary keywords:** `conseil informatique Côte d'Ivoire`, `consultant IT Sénégal`, `consultant informatique Cameroun`, `expert informatique Abidjan Dakar Douala`, `services informatiques Afrique francophone`

**Meta title:**
```
Consultant Informatique Afrique — Conseil ICT & Stratégie Technologique | Peter Bamuhigire
```

**Meta description:**
```
Conseil ICT indépendant pour les entreprises d'Afrique francophone. Stratégie technologique, mise en œuvre ERP et audit des systèmes pour les organisations au Sénégal, Côte d'Ivoire, Cameroun, RDC et au-delà. Bilingue anglais-français. Basé à Kampala.
```

**Page h1:**
```
Conseil ICT indépendant pour les organisations d'Afrique francophone qui ont besoin de plus que des recommandations génériques
```

**Sub-headline:**
```
La plupart des conseils technologiques disponibles pour les entreprises africaines proviennent des vendeurs qui commercialisent leurs propres produits. Peter Bamuhigire propose une alternative : un conseil ICT indépendant, sans affiliation à aucun fournisseur, fondé sur 15 ans d'expérience au sein d'organisations africaines — en anglais et en français.
```

**Body copy (Section 1 — Le contexte africain francophone):**
```html
<section class="py-16 md:py-24 bg-warm-white">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 prose prose-navy max-w-none">
    <h2>Pourquoi les entreprises francophones africaines ont besoin d'un conseil ICT différent</h2>
    <p>
      Les marchés d'Afrique francophone — qu'il s'agisse de Côte d'Ivoire, du Sénégal, du Cameroun, de la RDC ou du Mali — partagent un ensemble de défis technologiques que les cabinets de conseil occidentaux ne traitent pas de manière adéquate : des opérations multilingues en français et dans des langues locales, des infrastructures de connectivité variables selon les villes et les régions, des cadres réglementaires OHADA et SYSCOHADA qui conditionnent les exigences comptables et de reporting, et le besoin de systèmes que le personnel non technique peut utiliser sans assistance informatique permanente.
    </p>
    <p>
      Ce cabinet a été construit à l'intérieur de cet environnement. L'expérience opérationnelle en Afrique de l'Ouest — Sierra Leone, Sénégal, Guinée — a produit une méthode de conseil ICT conçue pour les réalités spécifiques des marchés africains francophones, pas pour celles des marchés pour lesquels la plupart des logiciels d'entreprise ont été développés.
    </p>
    <h2>Ce que comprend une mission de conseil ICT</h2>
    <p>
      Chaque mission commence par un audit honnête de votre situation technologique actuelle : ce qui fonctionne, ce qui vous coûte plus que nécessaire, les risques que vous supportez, et l'écart entre ce que votre technologie actuelle permet et ce que votre organisation a besoin de faire. Cet audit produit un plan d'action priorisé — pas une liste de souhaits, mais une séquence d'actions ordonnées par impact et faisabilité.
    </p>
    <p>
      Les missions récentes en Afrique francophone ont couvert : la mise en œuvre et l'unification de systèmes ERP au Sénégal et en Sierra Leone, la formation bilingue du personnel (français-anglais), l'audit et la restructuration d'infrastructure réseau, et l'élaboration de politiques ICT conformes aux cadres réglementaires locaux.
    </p>
  </div>
</section>
```

**Services list (FR):**
- Stratégie ICT — feuille de route technologique et plan d'action priorisé
- Audit des systèmes — évaluation indépendante de vos coûts et risques technologiques actuels
- Sélection et mise en œuvre ERP — conseil neutre vis-à-vis des fournisseurs et gestion de la mise en œuvre
- Politique ICT et gouvernance — documentation, procédures et formations
- Évaluation des fournisseurs technologiques — évaluation indépendante avant signature de contrat

**Proof element (FR):**
```astro
<CaseSnippet
  label="Mission en Afrique de l'Ouest"
  client="Dynapharm Africa"
  outcome="Systèmes ERP en Sierra Leone, Sénégal et Ouganda unifiés sur une seule plateforme. Formation bilingue (français-anglais) dispensée dans les délais sur trois pays."
  sector="Distribution pharmaceutique, Afrique de l'Ouest"
  lang="fr"
/>
```

**Countries block (FR):**
```
Pays desservis : Sénégal · Côte d'Ivoire · Cameroun · RDC · Mali · Togo · Bénin · Burkina Faso · Sierra Leone · Guinée · Rwanda · Ouganda
```

**CTA section (FR):**
```
h2: Commençons par un diagnostic
sub: Le premier entretien est un diagnostic de 30 minutes — pas une démarche commerciale. À l'issue de cet échange, vous saurez si ce cabinet correspond à votre situation, et Peter saura s'il peut véritablement vous aider.
CTA button: Réserver un appel diagnostic ICT
Link: /fr/contact/
```

**ProfessionalService schema (FR page):**
```javascript
const pageSchema = {
  "@context": "https://schema.org",
  "@type": "ProfessionalService",
  "name": "Consultant Informatique Afrique — Peter Bamuhigire",
  "url": "https://techguypeter.com/fr/consultant-informatique-afrique/",
  "description": "Conseil ICT indépendant pour les entreprises d'Afrique francophone. Stratégie technologique, ERP, audit des systèmes.",
  "areaServed": [
    { "@type": "Country", "name": "Sénégal" },
    { "@type": "Country", "name": "Côte d'Ivoire" },
    { "@type": "Country", "name": "Cameroun" },
    { "@type": "Country", "name": "République Démocratique du Congo" },
    { "@type": "Country", "name": "Mali" },
    { "@type": "Country", "name": "Togo" },
    { "@type": "Country", "name": "Bénin" },
    { "@type": "Country", "name": "Burkina Faso" },
    { "@type": "Country", "name": "Sierra Leone" },
    { "@type": "Country", "name": "Guinée" }
  ],
  "serviceType": ["Conseil ICT", "Stratégie technologique", "Mise en œuvre ERP", "Audit des systèmes"],
  "knowsLanguage": ["fr", "en"],
  "provider": {
    "@type": "Person",
    "name": "Peter Bamuhigire",
    "url": "https://techguypeter.com/fr/about/"
  }
};
```

**hreflang pair:** This FR page must have an `hreflang="en"` alternate pointing to `/en/it-consulting-east-africa/` as the closest EN equivalent.

---

### Page 2 — `/fr/developpement-logiciel-afrique/`

**File to create:** `src/pages/fr/developpement-logiciel-afrique.astro`

**Primary keyword:** `développeur logiciel Afrique` / `développement logiciel Afrique francophone`
**Secondary keywords:** `développeur logiciel sur mesure Afrique`, `développeur application Côte d'Ivoire`, `développement logiciel Sénégal`, `développeur ERP Afrique`, `société développement logiciel Afrique francophone`

**Meta title:**
```
Développeur Logiciel Afrique — Développement Logiciel Sur Mesure | Peter Bamuhigire
```

**Meta description:**
```
Développement logiciel sur mesure pour les entreprises d'Afrique francophone. Applications web, systèmes ERP, applications mobiles et plateformes SaaS adaptées aux réalités africaines. Bilingue anglais-français. Basé à Kampala, Ouganda.
```

**Page h1:**
```
Développement logiciel sur mesure pour les entreprises africaines — conçu pour vos réalités, pas pour celles d'ailleurs
```

**Sub-headline:**
```
Les logiciels standard sont conçus pour le marché dans lequel ils ont été développés. Si votre organisation opère en Afrique francophone — avec ses infrastructures de connectivité, ses équipes multilingues, ses cadres réglementaires OHADA et ses processus métier spécifiques — les logiciels standard produisent des contournements, pas des solutions. Ce cabinet développe des logiciels conçus pour fonctionner dans l'environnement réel de votre organisation.
```

**Body copy:**
```html
<section class="py-16 md:py-24 bg-warm-white">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 prose prose-navy max-w-none">
    <h2>Ce qui distingue le développement logiciel africain du développement logiciel générique</h2>
    <p>
      Un système de gestion pour une entreprise à Abidjan ou à Dakar doit gérer le paiement mobile (Orange Money, Wave, MTN Mobile Money), fonctionner en mode hors ligne lorsque la connectivité est intermittente, prendre en charge les rapports financiers conformes aux normes SYSCOHADA, et être utilisable par un personnel dont le niveau de compétence technique varie considérablement. Ces exigences ne sont pas des particularités — elles sont les réalités de base du marché.
    </p>
    <p>
      Les trois plateformes propriétaires développées par ce cabinet — Maduuka (gestion d'entreprise), Aqar (gestion immobilière) et Longhorn ERP (planification des ressources d'entreprise) — ont été conçues de zéro pour ces réalités. Elles ne sont pas des produits occidentaux adaptés. Elles gèrent nativement les cas spécifiques à l'Afrique : intégration de la monnaie mobile, fonctionnement hors ligne, interfaces multilingues et conformité aux cadres comptables locaux.
    </p>
    <h2>Développement sur mesure pour les organisations avec des besoins spécifiques</h2>
    <p>
      Lorsque les plateformes existantes ne couvrent pas le besoin, un développement sur mesure est réalisé à partir d'une spécification dérivée des processus réels de l'organisation — pas d'un modèle générique. Les missions de développement sur mesure récentes ont couvert : des systèmes de gestion ERP pour la distribution pharmaceutique en Afrique de l'Ouest, des plateformes de gestion des données pour des institutions de recherche, et des systèmes de suivi logistique pour des entreprises de distribution opérant sur plusieurs marchés africains.
    </p>
  </div>
</section>
```

**Products section (FR):** Maduuka, Aqar, Longhorn ERP avec descriptions courtes et lien vers `/fr/portfolio/`.

**Proof element (FR):**
```astro
<CaseSnippet
  label="Résultat client"
  client="Dynapharm Africa"
  outcome="Systèmes ERP en Sierra Leone, Sénégal et Ouganda unifiés sur une seule plateforme. Formation bilingue dispensée. Déployé dans les délais sur trois pays."
  sector="Distribution pharmaceutique, Afrique de l'Ouest"
  lang="fr"
/>
```

**CTA (FR):**
```
h2: Décrivez votre besoin logiciel
sub: La première étape est un diagnostic de 30 minutes pour déterminer si votre besoin est mieux satisfait par une plateforme existante ou un développement sur mesure — et ce que représente un budget réaliste pour chaque option.
CTA button: Démarrer la conversation
Link: /fr/contact/
```

**hreflang pair:** This FR page must have an `hreflang="en"` alternate pointing to `/en/software-development-east-africa/`.

---

### Page 3 — `/fr/developpement-web-afrique/`

**File to create:** `src/pages/fr/developpement-web-afrique.astro`

**Primary keyword:** `développeur web Afrique` / `développement web Afrique francophone`
**Secondary keywords:** `création site web Afrique`, `agence web Afrique francophone`, `développeur web Côte d'Ivoire`, `création site web Dakar Abidjan`, `conception web Afrique`

**Meta title:**
```
Développeur Web Afrique — Création Site Web Professionnel | Peter Bamuhigire
```

**Meta description:**
```
Création de sites web professionnels pour les entreprises d'Afrique francophone. Sites rapides, optimisés pour mobile et référencés dans les moteurs de recherche locaux. Bilingue anglais-français. Devis formel sous 24 heures.
```

**Page h1:**
```
Création de sites web professionnels pour les entreprises africaines — rapides, bien référencés, conçus pour convertir
```

**Sub-headline:**
```
Un site web pour une entreprise africaine doit se charger rapidement sur les réseaux mobiles disponibles dans la région, se positionner dans les résultats de recherche locaux, et convaincre des visiteurs issus de marchés où les signaux de confiance et de crédibilité locale sont différents de ceux des marchés occidentaux. Ce cabinet conçoit pour ces trois exigences simultanément.
```

**Body copy:**
```html
<section class="py-16 md:py-24 bg-warm-white">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 prose prose-navy max-w-none">
    <h2>Pourquoi la plupart des sites web africains sous-performent</h2>
    <p>
      Le site web type d'une entreprise africaine est construit sur un thème WordPress générique, chargé d'extensions qui le ralentissent, et optimisé pour personne en particulier. Il se charge en 8 à 12 secondes sur une connexion 3G — ce qui signifie que la majorité de vos clients potentiels quitteront la page avant qu'elle ait fini de charger. Il n'est pas positionné pour les recherches locales. Et il ne donne pas au visiteur une raison claire de prendre contact.
    </p>
    <p>
      Les sites web développés par ce cabinet sont différents sur trois points précis : ils sont construits comme des sites statiques — pas de requêtes de base de données au chargement, pas de WordPress, pas de scripts inutiles — ce qui leur permet de se charger en moins de 2 secondes sur une connexion 3G ; ils sont construits avec un référencement local africain dès le départ, pas en option ; et ils sont conçus avec un objectif de conversion unique — amener le visiteur à passer à l'étape suivante.
    </p>
    <h2>Référencement local pour les marchés africains francophones</h2>
    <p>
      Un site web qui n'apparaît pas dans les résultats de recherche locaux est un site web qui n'existe pas pour la plupart de vos clients potentiels. Chaque site livré par ce cabinet comprend : la configuration de Google Search Console, le référencement on-page de base pour le marché cible (Sénégal, Côte d'Ivoire, Cameroun, RDC — selon le cas), et un guide d'optimisation de la fiche Google Business Profile. Ce ne sont pas des options supplémentaires : elles sont incluses parce qu'un site web sans elles est incomplet.
    </p>
    <h2>Sites bilingues anglais-français</h2>
    <p>
      Pour les organisations qui opèrent à la fois dans des marchés anglophones et francophones — ou qui souhaitent atteindre les deux audiences — ce cabinet développe des sites web bilingues anglais-français avec une architecture i18n propre, une gestion des hreflang conforme aux recommandations de Google, et un contenu adapté à chaque langue plutôt que simplement traduit.
    </p>
  </div>
</section>
```

**Pricing section (FR):**
```html
<section class="py-12 bg-warm-cream">
  <div class="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8">
    <h2 class="text-2xl font-bold text-navy-900 mb-6">Combien coûte un site web en Afrique francophone ?</h2>
    <p class="text-navy-700 leading-relaxed mb-4">
      Le coût d'un site web varie selon la portée du projet. Un site vitrine de 5 pages débute à partir de 600 000 à 1 000 000 FCFA (environ 900 à 1 500 USD) pour la conception, le développement et le référencement de base. Un site plus complexe avec e-commerce, système de réservation ou application web sur mesure est devisé individuellement après un entretien de cadrage.
    </p>
    <p class="text-navy-700 leading-relaxed">
      Un devis formel écrit est remis dans les 24 heures suivant l'entretien initial. Aucun engagement n'est requis.
    </p>
  </div>
</section>
```

**CTA (FR):**
```
h2: Obtenez un devis pour votre site web
sub: Décrivez votre activité et ce que vous attendez d'un site web. Un devis écrit vous parvient dans les 24 heures.
CTA button: Demander un devis
Link: /fr/contact/
```

**hreflang pair:** This FR page must have an `hreflang="en"` alternate pointing to `/en/website-development-east-africa/`.

---

## Page Template Structure (all three FR pages)

1. Hero — dark (`bg-navy-900 geo-pattern`) — h1 + sub-headline
2. Body copy — `bg-warm-white` — prose, h2 sections, benefit-led in French
3. Proof element — CaseSnippet component (`lang="fr"`)
4. Countries/markets block — Sénégal, Côte d'Ivoire, Cameroun, RDC, Mali, Togo, Bénin
5. hreflang alternate link to EN equivalent page (visible language-switch CTA in addition to meta hreflang)
6. CTA section — CTASection component

## Language Switch CTA (all FR pages)

Each FR page must include a visible language-switch panel:
```html
<div class="bg-navy-50 rounded-xl p-6 border border-navy-100 mt-8">
  <p class="text-sm font-semibold text-navy-900">English version available</p>
  <p class="text-sm text-navy-600 mt-1">This page is available in English for East African markets.</p>
  <a href="/en/it-consulting-east-africa/" class="inline-flex items-center text-sm font-semibold text-gold-600 hover:text-amber-accent mt-3 gap-1.5">
    View in English →
  </a>
</div>
```

(Adjust the English link to match the appropriate EN equivalent page for each FR page.)

## Acceptance Criteria

- [ ] `src/pages/fr/consultant-informatique-afrique.astro` created and builds without errors
- [ ] `src/pages/fr/developpement-logiciel-afrique.astro` created and builds without errors
- [ ] `src/pages/fr/developpement-web-afrique.astro` created and builds without errors
- [ ] All three FR pages are in formal French with vouvoiement throughout
- [ ] All three FR pages reference Francophone Africa broadly: Abidjan, Dakar, Kinshasa, Douala (not Uganda or East Africa as primary reference)
- [ ] All three FR pages have ProfessionalService schema with `areaServed` listing Francophone African countries
- [ ] All three FR pages have `hreflang` pointing to correct EN equivalents
- [ ] All three FR pages include a visible English-version language-switch CTA
- [ ] Pricing section for website development page references FCFA as primary currency unit
- [ ] `npm run build` passes with no errors

## Effort

**M** — 1 day (3 FR pages)
