# AI Financial Growth Pro

Flutter starter architecture for a combined credit improvement, grant writing,
business funding, CRM, document intelligence, analytics, and AI automation platform.

## Connected internally
- Dashboard + GoRouter navigation
- Credit Center
- Grant Center
- Business Funding
- AI Financial Coach
- Document Vault
- CRM
- Analytics
- Admin
- Settings
- Supabase-ready auth/database layer
- Multi-agent AI router
- Credit provider abstraction
- Grant provider abstraction
- Workflow automation engine
- Compliance review layer

## Provider-ready connectors
Credit: Equifax, Experian, TransUnion-style secure gateway adapters.
Grants: Grants.gov and Candid-style secure gateway adapters.
AI: provider-agnostic secure AI gateway.

## Important
External providers are NOT activated until their contracts/onboarding/credentials are completed.
Private API keys must live in secure server-side functions, not Flutter client code.

Credit workflows should only support legitimate disputes of information the consumer
identifies as inaccurate, incomplete, duplicated, identity-theft-related, or otherwise contestable.
Do not promise removal of accurate negative information.

Grant AI must use verified facts and must not invent eligibility, revenue, certifications,
impact statistics, outcomes, or other material claims.

## Run
flutter pub get
flutter run --dart-define=SUPABASE_URL=... --dart-define=SUPABASE_ANON_KEY=...

Recommended architecture:
Flutter -> Supabase/Auth -> Edge Functions -> AI/Credit/Grant APIs
