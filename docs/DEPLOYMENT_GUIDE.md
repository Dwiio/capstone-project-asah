# Deployment Guide

## Current status

No hosting provider, domain, DNS control, or deployment credentials were provided. A public internet URL and HTTPS certificate cannot be created from this workspace alone. This package is prepared for deployment but is **not published**.

## Recommended production path

Use a Node.js 20+ VPS or managed Node hosting for the current application. The current workspace runtime uses a JSON file adapter; do not use it for multi-user commercial production without a database migration and concurrency/backup strategy.

For a MySQL production deployment:
1. Create a MySQL 8+ database with `utf8mb4_unicode_ci`.
2. Create a database user with only required privileges.
3. Import `database/power_gym_fitness.sql` through phpMyAdmin.
4. Implement/configure a MySQL repository adapter (not included in current runtime) and migrate the application records; do not assume SQL dump is already connected.
5. Set `NODE_ENV=production`, `HOST=127.0.0.1`, a unique administrator email, and a strong administrator password in the host's secret manager.
6. Run the app behind Nginx/Caddy/Apache reverse proxy with HTTPS (Let's Encrypt), secure cookies, request body limits, and rate limits at proxy level.
7. Configure process supervision (systemd/PM2), log rotation, monitoring, and encrypted database/file backups.
8. Disable or replace demo records and rotate credentials before exposing the app.
9. Test login, logout, CRUD, search, analytics, chatbot, mobile layout, HTTPS, and backup restore from an external network.

## cPanel notes

Shared hosting must support Node.js applications and reverse proxy/static assets to run this current code. If the provider only supports PHP/MySQL, deploy a Laravel/PHP port rather than uploading the Node app as if it were PHP. phpMyAdmin can import the provided SQL schema, but the current app will not use that database until its MySQL adapter is implemented.
