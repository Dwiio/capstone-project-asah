# Testing Report

**Executed:** 22 November 2026 in the provided workspace.  
**Command:** `npm test`  
**Result:** 11 tests passed, 0 failed.

| Test ID | Scenario | Actual result | Status |
|---|---|---|---|
| SYS-01 | Health endpoint | HTTP 200; `ok=true` | PASS |
| AUTH-01 | Unauthenticated member API | HTTP 401 | PASS |
| AUTH-02 | Valid development admin login | HTTP 200; session and CSRF token issued | PASS |
| MEM-01 | Search synthetic member by name | Exact matching member returned | PASS |
| MEM-02 | Create member | HTTP 201; member returned | PASS |
| MEM-03 | Invalid end date before start date | HTTP 422 | PASS |
| MEM-04 | Update member | HTTP 200; updated name returned | PASS |
| MEM-05 | Soft archive | HTTP 200; archived member hidden from detail route | PASS |
| ANA-01 | Analytics endpoint | HTTP 200; totals and package distribution returned from store | PASS |
| CHAT-01 | Known price FAQ and unknown question | Grounded answer and safe fallback returned | PASS |
| SEC-01 | Missing CSRF token on logout | HTTP 403 | PASS |
| AUTH-03 | Logout and session invalidation | HTTP 200; subsequent `/api/me` HTTP 401 | PASS |

> There are 12 named scenarios in this table including the two authentication cases; the test runner executes 11 test blocks because login and setup are grouped. Final runner summary is 11/11 passed.

## Automated test coverage boundaries

- These tests exercise the Node.js local JSON-backed runtime, not MySQL.
- They do not constitute a penetration test, external device/browser compatibility certification, or real-world UMKM user acceptance test.
- Visual responsiveness has been implemented with CSS breakpoints but not validated on a physical device/browser farm in this environment.
- SQL import was not executed because this environment has no MySQL/MariaDB client or server.
- Live LLM evaluation was not executed because no model provider/key was supplied and chatbot is currently FAQ-based.
- Public internet deployment/HTTPS was not tested because no hosting/domain credentials were supplied.

## Test data hygiene

Tests create a temporary QA member in the local JSON store and archive it. The runtime database file is excluded from the final ZIP; a clean synthetic seed is generated on first launch.
