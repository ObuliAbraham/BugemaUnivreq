CREATE DATABASE IF NOT EXISTS bugema_university;

USE bugema_university;

CREATE TABLE IF NOT EXISTS requisitions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    requested_by VARCHAR(255) NOT NULL,
    amount_in_words VARCHAR(255) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    reason TEXT NOT NULL,
    date DATE NOT NULL,
    tel_no VARCHAR(20) NOT NULL,
    signature VARCHAR(255) NOT NULL,
    checked_by VARCHAR(255) NOT NULL,
    approved_by VARCHAR(255) NOT NULL,
    charged_to VARCHAR(255) NOT NULL,
    paid_by VARCHAR(255) NOT NULL,
    received_by VARCHAR(255) NOT NULL,
    bank_ac_no VARCHAR(255) NOT NULL,
    bank_name VARCHAR(255) NOT NULL,
    voucher_no VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
