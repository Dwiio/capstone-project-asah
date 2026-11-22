# Testing Plan

| ID | Area | Scenario | Expected result |
|---|---|---|---|
| AUTH-01 | Auth | Correct admin credentials | Session created; user returned without password hash |
| AUTH-02 | Auth | Wrong credentials | 401; no session |
| AUTH-03 | Authorization | Access member API unauthenticated | 401 |
| AUTH-04 | CSRF | Mutating request without token | 403 |
| AUTH-05 | Logout | Valid CSRF logout | Session invalidated |
| MEM-01 | CRUD | Create valid member | 201; persisted record |
| MEM-02 | Validation | Missing name/invalid phone/package/date range | 422 |
| MEM-03 | Search | Search name/ID/phone | Only matching records |
| MEM-04 | CRUD | Update member | 200; updated fields |
| MEM-05 | CRUD | Archive member | Soft-deleted; hidden from normal list |
| ANA-01 | Analytics | Compare total and package counts | Counts match stored members |
| CHAT-01 | Chatbot | Known membership price question | Grounded answer states price unconfirmed |
| CHAT-02 | Chatbot | Unknown question | Safe fallback; no invented facts |
| UI-01 | UI | Theme toggle | Light/dark variables switch |
| UI-02 | Responsive | Narrow viewport | Navigation/menu and admin layout adapt |

Run automated tests using `npm test`.
