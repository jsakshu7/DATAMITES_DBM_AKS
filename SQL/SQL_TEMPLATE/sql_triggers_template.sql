create database college_db;
use college_db;


CREATE TABLE department (
    dept_id INT PRIMARY KEY,                -- Primary Key 
    dept_name VARCHAR(50) UNIQUE ,           -- Unique Key 
	dept_head VARCHAR(120)
);

CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,   --  Primary Key
    student_roll VARCHAR(20) UNIQUE,             -- Unique Key (Candidate Key)
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE,                   -- Alternate Key (Candidate Key)
    dept_id INT,                                 -- Foreign Key
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);


SELECT * FROM department;
INSERT INTO department (dept_id, dept_name,dept_head) VALUES
(1, 'Computer Science','Ashok Kumar'),
(2, 'Electronics','Balchandra'),
(3, 'Mathematics','charan reddy'),
(4,'Data Science','Dharshan');

INSERT INTO student (student_roll, name, email, dept_id) VALUES
('CS01', 'Alice', 'alice@example.com', 1),
('CS02', 'Bob', 'bob@example.com', 1),
('EL01', 'Charlie', 'charlie@example.com', 2),
('MA01', 'David', 'david@example.com', 3);
-- ====================================================================================
--									Triggers
-- ====================================================================================

-- Convert dept_name to uppercase before insert

