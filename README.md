# Power Gym and Fitness Management System

Capstone Asah 2026 — Team A26-CS202 (Next Level)

## Implemented scope

- Public information website; admin-only console.
- Admin login/logout, password hashing (`scrypt`), session timeout, login throttling, CSRF token check, and protected API routes.
- Membership CRUD, unique member IDs, server-side validation, search by name/ID/phone, status/package filtering, pagination, and soft archive.
- Package management, dashboard metrics, package distribution, monthly registration trend, and activity log.
- Grounded FAQ chatbot with unknown-question fallback. **This is not an LLM chatbot**; no AI provider key or official AI quest checklist was supplied.
- Light/dark theme toggle.
- Original uploaded logo.

## Run locally

Requirements: Node.js 20+ (no npm packages required).

```bash
cp .env.example .env
# Set ADMIN_EMAIL and ADMIN_PASSWORD in your shell or configure your process manager.
ADMIN_EMAIL=admin@powergym.local ADMIN_PASSWORD='ChangeMe!2026' npm start
```

Open `http://127.0.0.1:4177`.

Demo login (development only):
- Email: `admin@powergym.local`
- Password: `ChangeMe!2026`

Change the demo password before sharing or deploying. The server reads environment variables; it does not automatically parse `.env` without a process manager/dotenv loader. Do not reuse the demo credential in production.

## Data persistence and SQL

The executable workspace build uses a local JSON persistence adapter at `storage/db.json`, because this execution environment does not provide a MySQL server, PHP MySQL driver, or SQLite driver. The import-ready MySQL schema and synthetic demo rows are provided in `database/power_gym_fitness.sql` for phpMyAdmin. **The local JSON adapter is not connected to the MySQL dump.** Before production, implement/configure a MySQL repository adapter and run the production integration tests; do not describe the present runtime as MySQL-backed.

## Testing

```bash
npm test
```

Test results and limitations: `docs/TESTING_REPORT.md`.

## Important source limitations

- Project Plan explicitly describes this as a prototype/MVP for demonstration and validation, not a fully commercial production platform.
- Prices, hours, address, contact number, and detailed facilities were not confirmed in supplied materials. The app intentionally does not invent them.
- No authentic gym facility photographs were present in the supplied files; the gallery shows an honest placeholder. Only the supplied official logo is used.
- Demo members are synthetic and clearly labeled. Do not mix them with actual member records.
- Official Asah Main Quest details are blocked pending the separate `Checklist Tech Stack` document referenced by the Project Brief.

See `docs/` for audit, quest matrix, architecture, database, user guide, testing, AI limitations, data-science analysis, and deployment.
