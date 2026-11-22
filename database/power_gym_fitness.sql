-- Power Gym and Fitness Management System
-- MySQL 8.0+ / MariaDB 10.6+ | Import using phpMyAdmin
-- All records below are synthetic demo data; replace before production.
CREATE DATABASE IF NOT EXISTS power_gym_fitness CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE power_gym_fitness;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS activity_logs;
DROP TABLE IF EXISTS membership_histories;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS membership_packages;
DROP TABLE IF EXISTS users;
SET FOREIGN_KEY_CHECKS=1;
CREATE TABLE users (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 name VARCHAR(100) NOT NULL,
 email VARCHAR(190) NOT NULL UNIQUE,
 password_hash VARCHAR(255) NOT NULL,
 role ENUM('admin') NOT NULL DEFAULT 'admin',
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;
CREATE TABLE membership_packages (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 code VARCHAR(32) NOT NULL UNIQUE,
 name VARCHAR(80) NOT NULL,
 duration_days SMALLINT UNSIGNED NOT NULL,
 price DECIMAL(12,2) NOT NULL DEFAULT 0,
 description VARCHAR(500) NULL,
 is_active BOOLEAN NOT NULL DEFAULT TRUE,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 INDEX idx_package_active(is_active)
) ENGINE=InnoDB;
CREATE TABLE members (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 member_code VARCHAR(24) NOT NULL UNIQUE,
 full_name VARCHAR(100) NOT NULL,
 phone VARCHAR(20) NOT NULL,
 email VARCHAR(190) NULL,
 package_id BIGINT UNSIGNED NOT NULL,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL,
 administrative_status ENUM('active','inactive') NOT NULL DEFAULT 'active',
 notes VARCHAR(500) NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
 deleted_at TIMESTAMP NULL,
 CONSTRAINT fk_members_package FOREIGN KEY(package_id) REFERENCES membership_packages(id) ON UPDATE CASCADE ON DELETE RESTRICT,
 CONSTRAINT chk_members_dates CHECK(end_date >= start_date),
 INDEX idx_member_name(full_name), INDEX idx_member_phone(phone), INDEX idx_member_dates(end_date), INDEX idx_member_status(administrative_status), INDEX idx_member_package(package_id), INDEX idx_member_deleted(deleted_at)
) ENGINE=InnoDB;
CREATE TABLE membership_histories (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 member_id BIGINT UNSIGNED NOT NULL,
 package_id BIGINT UNSIGNED NOT NULL,
 start_date DATE NOT NULL,
 end_date DATE NOT NULL,
 changed_by BIGINT UNSIGNED NULL,
 change_note VARCHAR(500) NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 CONSTRAINT fk_history_member FOREIGN KEY(member_id) REFERENCES members(id) ON DELETE RESTRICT,
 CONSTRAINT fk_history_package FOREIGN KEY(package_id) REFERENCES membership_packages(id) ON DELETE RESTRICT,
 CONSTRAINT fk_history_user FOREIGN KEY(changed_by) REFERENCES users(id) ON DELETE SET NULL,
 INDEX idx_history_member(member_id), INDEX idx_history_created(created_at)
) ENGINE=InnoDB;
CREATE TABLE activity_logs (
 id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
 user_id BIGINT UNSIGNED NULL,
 action VARCHAR(60) NOT NULL,
 description VARCHAR(500) NOT NULL,
 ip_address VARCHAR(45) NULL,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
 CONSTRAINT fk_activity_user FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE SET NULL,
 INDEX idx_activity_created(created_at), INDEX idx_activity_action(action)
) ENGINE=InnoDB;
-- Demo password is intentionally not seeded. Create the first admin with a secure password hash in the deployed application.
INSERT INTO membership_packages(code,name,duration_days,price,description,is_active) VALUES
('PKG-MONTH','Monthly',30,0,'Harga belum diverifikasi; konfirmasi ke pengelola.',TRUE),
('PKG-QUARTER','Quarterly',90,0,'Harga belum diverifikasi; konfirmasi ke pengelola.',TRUE);
INSERT INTO members(member_code,full_name,phone,package_id,start_date,end_date,administrative_status,notes) VALUES
('PG-0001','Demo Member One','081234567801',1,DATE_SUB(CURDATE(),INTERVAL 12 DAY),DATE_ADD(CURDATE(),INTERVAL 18 DAY),'active','SYNTHETIC DEMO RECORD'),
('PG-0002','Demo Member Two','081234567802',2,DATE_SUB(CURDATE(),INTERVAL 100 DAY),DATE_SUB(CURDATE(),INTERVAL 10 DAY),'active','SYNTHETIC DEMO RECORD'),
('PG-0003','Demo Member Three','081234567803',1,DATE_SUB(CURDATE(),INTERVAL 2 DAY),DATE_ADD(CURDATE(),INTERVAL 4 DAY),'active','SYNTHETIC DEMO RECORD');
-- Computed membership status: expired when end_date < CURDATE(); otherwise use administrative_status.
-- Do not use the zero demo prices as real commercial prices.
