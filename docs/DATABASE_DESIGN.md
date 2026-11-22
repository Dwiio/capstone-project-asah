# Database Design

The production SQL schema is `database/power_gym_fitness.sql` (MySQL 8+/MariaDB; utf8mb4).

| Table | Purpose | Key fields |
|---|---|---|
| users | Administrator accounts | email unique, password_hash, role |
| membership_packages | Configurable membership packages | code unique, duration_days, price, is_active |
| members | Member records | member_code unique, full_name, phone, package_id, start/end date, deleted_at |
| membership_histories | Membership changes/history | member_id, package_id, date range, changed_by |
| activity_logs | Admin activity audit | user_id, action, description, created_at |

## Business rules

- `member_code` is unique.
- Member name and phone are required.
- Package is a foreign key and must be active for new membership.
- End date cannot precede start date.
- Administrative status is `active` or `inactive`.
- Effective status is `expired` if `end_date < current_date`; otherwise it follows administrative status.
- Member deletion is a soft delete (`deleted_at`); package deletion is restricted while referenced.
- Zero price in seeded package rows means **unconfirmed**, not free membership.

## Runtime caveat

The current runnable Node build stores records in `storage/db.json`. SQL schema is importable separately; no live MySQL connection is configured in this environment. SQL schema must be used with a MySQL repository adapter before production.
