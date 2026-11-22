# Architecture

```text
Public browser (HTML/CSS/JS)
  ├─ Public landing page + light/dark theme
  ├─ FAQ chat UI ────────────────> POST /api/chat (grounded FAQ)
  └─ Admin login ────────────────> POST /api/login
                                      │ session cookie + CSRF token
                                      ▼
                              Node.js HTTP application
                               ├─ Authentication/session
                               ├─ Membership CRUD & validation
                               ├─ Search/filter/pagination
                               ├─ Package management
                               ├─ Analytics aggregation
                               ├─ Activity log
                               └─ JSON persistence adapter (local)

Production target: MySQL 8+/MariaDB via phpMyAdmin schema in database/.
The MySQL adapter is not implemented/connected in this workspace build.
```

The current runtime is a dependency-free Node.js app chosen because the workspace has Node 22 but lacks Composer, MySQL server/client, PHP MySQL drivers, and SQLite PDO driver. The SQL schema is a separate production database deliverable, not a runtime persistence backend. A MySQL repository adapter is required before production data migration.

## Trust boundaries

- Public routes expose no member data.
- Admin APIs require authenticated session.
- Mutating admin APIs require both same-site CSRF cookie and matching `X-CSRF-Token` header.
- Passwords are stored as scrypt hashes with random salt.
- API responses never return password hashes.
- Chatbot answers only from a small verified FAQ; it does not access admin/member data.
