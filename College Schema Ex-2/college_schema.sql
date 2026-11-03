CREATE TABLE Department (
    dept_id    INT PRIMARY KEY,
    dept_name  VARCHAR(50) NOT NULL,
    location   VARCHAR(30)
);

CREATE TABLE Student (
    student_id INT PRIMARY KEY,
    name       VARCHAR(50) NOT NULL,
    dob        DATE,
    phone      VARCHAR(15),
    dept_id    INT,
    cgpa       DECIMAL(4,2),
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Faculty (
    faculty_id  INT PRIMARY KEY,
    name        VARCHAR(50),
    designation VARCHAR(30),
    dept_id     INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Course (
    course_id  VARCHAR(10) PRIMARY KEY,
    title      VARCHAR(80) NOT NULL,
    credits    INT,
    dept_id    INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);

CREATE TABLE Enrollment (
    student_id INT,
    course_id  VARCHAR(10),
    semester   VARCHAR(10),
    grade      CHAR(2),
    PRIMARY KEY (student_id, course_id, semester),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id)  REFERENCES Course(course_id)
);

CREATE TABLE Teaches (
    faculty_id INT,
    course_id  VARCHAR(10),
    semester   VARCHAR(10),
    PRIMARY KEY (faculty_id, course_id, semester),
    FOREIGN KEY (faculty_id) REFERENCES Faculty(faculty_id),
    FOREIGN KEY (course_id)  REFERENCES Course(course_id)
);
