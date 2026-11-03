USE CollegeDB;

CREATE TABLE dept (dept_id INT PRIMARY KEY, dept_name VARCHAR(30), hod VARCHAR(30));
INSERT INTO dept VALUES (1,'CSE','Dr. Sharma'),(2,'ECE','Dr. Patel'),(3,'MECH','Dr. Kumar');

CREATE TABLE emp (
  emp_id INT PRIMARY KEY, emp_name VARCHAR(40), dept_id INT,
  salary DECIMAL(10,2), join_date DATE, city VARCHAR(20));
INSERT INTO emp VALUES
(1,'Priya',1,55000,'2020-06-15','Chennai'),
(2,'Arjun',1,62000,'2019-03-10','Bangalore'),
(3,'Kavya',2,48000,'2021-08-22','Chennai'),
(4,'Ravi',2,71000,'2018-11-05','Delhi'),
(5,'Deepika',3,43000,'2022-01-30','Chennai'),
(6,'Siva',3,38000,'2020-09-18','Mumbai');

SELECT * FROM emp;
SELECT emp_name, salary FROM emp WHERE city = 'Chennai';
SELECT emp_name, salary FROM emp WHERE salary BETWEEN 40000 AND 60000;
SELECT emp_name, salary FROM emp ORDER BY salary DESC;
SELECT DISTINCT city FROM emp;
SELECT emp_name FROM emp WHERE emp_name LIKE 'A%';
SELECT * FROM emp LIMIT 3;

SELECT COUNT(*) AS total_employees FROM emp;
SELECT SUM(salary) AS total_payroll FROM emp;
SELECT AVG(salary) AS avg_salary FROM emp;
SELECT MAX(salary) AS highest_salary FROM emp;
SELECT MIN(salary) AS lowest_salary FROM emp;
SELECT COUNT(*) AS count, ROUND(AVG(salary),2) AS avg,
       MAX(salary) AS max_sal, MIN(salary) AS min_sal FROM emp;

SELECT dept_id,
       COUNT(*) AS headcount,
       ROUND(AVG(salary),2) AS avg_salary,
       SUM(salary) AS total_salary,
       MAX(salary) AS max_salary
FROM emp
GROUP BY dept_id;

SELECT dept_id, ROUND(AVG(salary),2) AS avg_sal
FROM emp
GROUP BY dept_id
HAVING AVG(salary) > 50000;

SELECT city, COUNT(*) AS cnt
FROM emp
GROUP BY city
HAVING cnt >= 2
ORDER BY cnt DESC;

SELECT NOW(), CURDATE(), CURTIME();
SELECT emp_name, join_date,
       YEAR(join_date) AS join_year,
       MONTH(join_date) AS join_month,
       DAY(join_date) AS join_day,
       DAYNAME(join_date) AS day_name
FROM emp;

SELECT emp_name, join_date,
       TIMESTAMPDIFF(YEAR, join_date, CURDATE()) AS years_exp,
       DATEDIFF(CURDATE(), join_date) AS days_served
FROM emp;

SELECT emp_name, DATE_ADD(join_date, INTERVAL 1 YEAR) AS anniversary FROM emp;
SELECT emp_name, DATE_FORMAT(join_date, '%d-%b-%Y') AS formatted_date FROM emp;

SELECT emp_name,
       UPPER(emp_name) AS upper_name,
       LOWER(emp_name) AS lower_name,
       LENGTH(emp_name) AS name_length,
       SUBSTR(emp_name, 1, 3) AS first3,
       CONCAT(emp_name, ' - ', city) AS full_info,
       REPLACE(city, 'Chennai', 'Madras') AS city_new,
       TRIM('  Priya  ') AS trimmed,
       REVERSE(emp_name) AS reversed,
       LPAD(emp_id, 5, '0') AS padded_id
FROM emp;

SELECT
  ROUND(3.14159, 2) AS rounded,
  CEIL(4.1) AS ceiling,
  FLOOR(4.9) AS floor_val,
  ABS(-250) AS absolute,
  MOD(10, 3) AS modulo,
  POWER(2, 8) AS power_of,
  SQRT(144) AS square_rt,
  TRUNCATE(3.99999, 2) AS truncated,
  RAND() AS random_num;

SELECT emp_name, salary, ROUND(salary * 1.10, 2) AS new_salary FROM emp;

SELECT e.emp_name, e.salary, d.dept_name, d.hod
FROM emp e
INNER JOIN dept d ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM emp e
LEFT JOIN dept d ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM emp e
RIGHT JOIN dept d ON e.dept_id = d.dept_id;

SELECT e.emp_name, d.dept_name
FROM emp e CROSS JOIN dept d;

SELECT a.emp_name AS emp, b.emp_name AS colleague
FROM emp a JOIN emp b
ON a.dept_id = b.dept_id AND a.emp_id <> b.emp_id;

SELECT d.dept_name, COUNT(e.emp_id) AS headcount,
       ROUND(AVG(e.salary),2) AS avg_sal
FROM dept d
LEFT JOIN emp e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
ORDER BY avg_sal DESC;
