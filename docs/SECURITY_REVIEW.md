# Security Review

Implemented in current Node runtime:
- scrypt password hashing with per-password random salt; hashes are not returned by API.
- HttpOnly session cookie, SameSite=Lax, 8-hour inactivity expiry.
- Session is held server-side; logout invalidates it.
- Mutating authenticated API routes require a CSRF cookie and matching `X-CSRF-Token` header.
- Login throttling per remote address after eight failures within a 15-minute window.
- Auth required for all membership/package/analytics/activity routes.
- Server-side input validation, JSON payload size cap, path traversal guard, and response security headers.
- Chatbot has no access to member/admin endpoints or records.
- Runtime JSON storage file is created with restrictive mode 0600.

Production hardening still required:
- Replace JSON store with MySQL repository and use least-privilege DB user.
- Use a high-entropy session secret, secure cookies behind HTTPS, reverse-proxy rate limits, centralized session store, and log rotation.
- Add password reset/change flow, MFA if required, admin account lifecycle, audit retention policy, backups, restore drills, CSP nonce/hash policy, and external security review.
- Add stricter origin validation and persistent login throttling for horizontally scaled production.
- No penetration test has been performed; this document is not a security certification.
