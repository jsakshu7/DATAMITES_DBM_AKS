-- -----------------------------------------------------------------------------
-- School Database Setup and Stored Procedures
-- -----------------------------------------------------------------------------

-- Create the school_db database if it doesn't exist and use it.
CREATE DATABASE IF NOT EXISTS school_db;
USE school_db_test;

-- Drop the students table if it exists to start fresh.
DROP TABLE IF EXISTS students;

-- Create the students table with columns for student ID, name, and grade.
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL,
    grade VARCHAR(10) NOT NULL
);
