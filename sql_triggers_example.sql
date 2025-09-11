create database college_db_test;
use college_db_test;


CREATE TABLE department (
    dept_id INT PRIMARY KEY,                -- Primary Key 
    dept_name VARCHAR(50) UNIQUE ,           -- Unique Key 
	dept_head VARCHAR(120)
);

CREATE TABLE student (
    student_id INT AUTO_INCREMENT PRIMARY KEY,   -- Surrogate + Primary Key
    student_roll VARCHAR(20) UNIQUE,             -- Unique Key (Candidate Key)
    name VARCHAR(50),
    email VARCHAR(100) UNIQUE,                   -- Alternate Key (Candidate Key)
    dept_id INT,                                 -- Foreign Key
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);


SELECT * FROM department;
INSERT INTO Department (dept_id, dept_name,dept_head) VALUES
(1, 'Computer Science','Ashok Kumar'),
(2, 'Electronics','Balchandra'),
(3, 'Mathematics','charan reddy'),
(4,'Data Science','Dharshan');

INSERT INTO student (student_roll, name, email, dept_id) VALUES
('CS01', 'Alice', 'alice@example.com', 1),
('CS02', 'Bob', 'bob@example.com', 1),
('EL01', 'Charlie', 'charlie@example.com', 2),
('MA01', 'David', 'david@example.com', 3);


SELECT * FROM department;
SELECT * FROM student;

-- insert duplicate value for dept_id
-- error duplicate entry
INSERT INTO Department (dept_id, dept_name,dept_head) VALUES
(1, 'electrical Engg','Santhosh Kumar');

-- insert  dept_id 7 in student tale
-- error forgein key constraint. there is no dept_id 7 in dept table
INSERT INTO student (student_roll, name,email,dept_id) VALUES
('EE01', 'MONIKA','mm@gmail.com',7);

DELIMITER $$

CREATE TRIGGER before_department_insert
BEFORE INSERT ON department
FOR EACH ROW
BEGIN
    SET NEW.dept_name = UPPER(NEW.dept_name);
END $$

DELIMITER ;

INSERT INTO department (dept_id, dept_name,dept_head) VALUES
(5, 'electrical Engg','Santhosh Kumar');


CREATE TABLE studentLog (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_roll VARCHAR(20),
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action_type VARCHAR(10)
);

DELIMITER $$
CREATE TRIGGER after_student_insert
AFTER INSERT ON student
FOR EACH ROW
BEGIN
    INSERT INTO studentLog (student_roll, action_type)
    VALUES (NEW.student_roll, 'INSERT');
END;
$$ 

DELIMITER ;
SELECT * FROM studentLog;
INSERT INTO student (student_roll, name,email,dept_id) VALUES
('CS03', 'MONIKA','mm@gmail.com',1);