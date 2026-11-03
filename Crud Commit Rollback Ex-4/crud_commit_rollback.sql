SHOW DATABASES;

CREATE DATABASE CollegeDB;
USE CollegeDB;
SELECT DATABASE();

CREATE TABLE Student_Basic (
    student_id INT,
    name       VARCHAR(50),
    dept       VARCHAR(20),
    cgpa       FLOAT
);

CREATE TABLE Student (
    student_id  INT          PRIMARY KEY AUTO_INCREMENT,
    name        VARCHAR(50)  NOT NULL,
    email       VARCHAR(80)  UNIQUE,
    dept_id     INT          NOT NULL,
    cgpa        DECIMAL(4,2) DEFAULT 0.0 CHECK (cgpa >= 0 AND cgpa <= 10),
    join_date   DATE         DEFAULT (CURRENT_DATE)
);

SHOW TABLES;
DESC Student;
DESCRIBE Student;

INSERT INTO Student (name, email, dept_id, cgpa)
VALUES ('Priya S', 'priya@mail.com', 1, 9.2);

INSERT INTO Student (name, email, dept_id, cgpa) VALUES
('Arjun K',   'arjun@mail.com',  2, 8.7),
('Deepika R', 'deepika@mail.com',1, 9.5),
('Ravi M',    'ravi@mail.com',   3, 7.8),
('Kavya P',   'kavya@mail.com',  1, 8.9);

SELECT * FROM Student;

UPDATE Student SET cgpa = 9.0 WHERE name = 'Ravi M';
DELETE FROM Student WHERE student_id = 5;
DELETE FROM Student WHERE cgpa < 8.0;

SET autocommit = 0;
START TRANSACTION;
INSERT INTO Student (name, email, dept_id, cgpa) VALUES ('Test', 'test@m.com', 1, 5.0);
SELECT * FROM Student;
COMMIT;

START TRANSACTION;
UPDATE Student SET cgpa = 0.0 WHERE dept_id = 1;
SELECT * FROM Student;
ROLLBACK;
SELECT * FROM Student;

START TRANSACTION;
INSERT INTO Student (name,email,dept_id,cgpa) VALUES ('A','a@m.com',1,9.0);
SAVEPOINT sp1;
INSERT INTO Student (name,email,dept_id,cgpa) VALUES ('B','b@m.com',2,8.0);
ROLLBACK TO sp1;
COMMIT;
