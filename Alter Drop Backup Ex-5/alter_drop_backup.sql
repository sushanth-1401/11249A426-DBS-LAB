USE CollegeDB;

ALTER TABLE Student ADD COLUMN phone VARCHAR(15);
ALTER TABLE Student ADD COLUMN gender CHAR(1) AFTER name;
ALTER TABLE Student MODIFY COLUMN name VARCHAR(100) NOT NULL;
ALTER TABLE Student CHANGE COLUMN phone mobile VARCHAR(12);
ALTER TABLE Student DROP COLUMN gender;
ALTER TABLE Student ADD CONSTRAINT chk_cgpa CHECK (cgpa BETWEEN 0 AND 10);
ALTER TABLE Student DROP CONSTRAINT chk_cgpa;
ALTER TABLE Student_Basic ADD PRIMARY KEY (student_id);

CREATE TABLE IF NOT EXISTS Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

ALTER TABLE Student ADD CONSTRAINT fk_dept
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id);

DESC Student;
SHOW CREATE TABLE Student;

TRUNCATE TABLE Student_Basic;
DROP TABLE IF EXISTS Student_Basic;
RENAME TABLE Student TO BEStudents;
ALTER TABLE BEStudents RENAME TO Student;
