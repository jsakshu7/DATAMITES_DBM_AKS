-- -----------------------------------------------------------------------------
-- School Database Setup and Stored Procedures
-- -----------------------------------------------------------------------------

-- Create the school_db database if it doesn't exist and use it.
CREATE DATABASE IF NOT EXISTS school_db_test;
USE school_db_test;

-- Drop the students table if it exists to start fresh.
DROP TABLE IF EXISTS students;

-- Create the students table with columns for student ID, name, and grade.
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(50) NOT NULL,
    grade VARCHAR(10) NOT NULL
);

-- created stored procedure 
call get_student_info();

-- -----------------------------------------------------------------------------
-- Stored Procedure using only IN Parameters (for INSERT)
-- -----------------------------------------------------------------------------
-- This simplified procedure inserts a new student without returning an ID.
-- IN: `p_name` and `p_grade` are input parameters for the new student's data.

-- -----------------------------------------------------------------------------
-- Example Usage of InsertStudent Procedure
-- -----------------------------------------------------------------------------
-- Call the procedure to insert a new student.
CALL insert_student_data('Arun Kumar', 'A');
CALL insert_student_data('Bhavya', 'B');

call get_student_info();
-- -----------------------------------------------------------------------------
-- Stored Procedure using only IN Parameters (for UPDATE)
-- -----------------------------------------------------------------------------
-- This procedure updates a student's grade based on their ID.
-- IN: `p_id` and `p_new_grade` are input parameters.
-- -----------------------------------------------------------------------------
-- Example Usage of UpdateStudentGrade Procedure
-- -----------------------------------------------------------------------------
-- First, view the current data.
SELECT * FROM students WHERE student_id = 1;
CALL update_student_grade(1, 'B');


-- ===============================================
-- Stored Procedure: count_students_byGrade
-- Purpose: Given a grade (e.g., 'A'), 
--          return the number of students in that grade
-- Parameters:
--   IN  p_grade  -> grade to search for
--   OUT p_count  -> total number of students with that grade
-- Example Call:
--   CALL count_students_byGrade('A', @total);
--   SELECT @total;  -- will show how many students got grade 'A'
-- ===============================================

-- Run the procedure and pass grade 'A'
CALL count_students_byGrade('B', @total);

-- Retrieve the OUT parameter value
SELECT @total AS total_students_with_A;

