USE demo10;

DROP TABLE IF EXISTS employee;
SHOW TABLES;

CREATE TABLE Employee(
	empid int NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    city VARCHAR(100) DEFAULT 'Bangalore',
    age int,
    salary int
);

INSERT into employee values(101,'Aman', 'Kumar', 'Jaipur', 30,100000);
INSERT into employee values(102,'Anand', 'Mahindra', 'Mumbai', 55,110000);
INSERT into employee values(103,'Vishal', 'Khemka', 'Delhi', 28,90000);
INSERT into employee values(104,'Bhuvan', 'Sharma', 'Jaipur', 20,120000);
INSERT into employee values(105,'Geetha', 'Yadav', 'Gurgaon', 26,130000);
INSERT into employee values(106,'Shalini', 'Shinde', 'Pune', 31,80000);
INSERT into employee values(107,'Shyam', 'Sharma', 'Patna', 37,80000);
INSERT into employee values(108,'Shubham', 'Sharma', 'Gurgaon', 31,60000);
INSERT into employee values(109,'Shubhankar', 'Sharma', 'Gurgaon', 38,160000);
INSERT into employee values(110,'Shubhangi', 'Bhardwaj', 'Jaipur', 41,60000);

SELECT * FROM employee;                                 -- ALL fields

SELECT empid, first_name, salary FROM employee;

SELECT DISTINCT city FROM employee;                     -- To get distinct values

/* =============== WHERE =================== */

SELECT * FROM employee
WHERE city = 'Jaipur';

SELECT * FROM employee
WHERE salary >= 90000;

SELECT * FROM employee
WHERE salary <= 90000;

SELECT * FROM employee
WHERE city = 'Jaipur' and salary > 100000;

SELECT * FROM employee
WHERE city = 'Jaipur' or city = 'Delhi';

SELECT * FROM employee
WHERE city IN ('Jaipur', 'Mumbai', 'Delhi');

SELECT * FROM employee
WHERE city NOT IN ('Jaipur', 'Mumbai', 'Delhi');

SELECT * FROM employee
WHERE salary >= 80000 and salary <= 100000;

SELECT * FROM employee
WHERE salary BETWEEN 80000 AND 100000;

SELECT * FROM employee
WHERE first_name LIKE 'S%';

SELECT * FROM employee
WHERE last_name LIKE '%ma';

SELECT * FROM employee
WHERE last_name LIKE 'Sharma';

/*================= ORDER BY ==================*/
SELECT * FROM employee
ORDER BY salary;                            -- Ascending order

SELECT * FROM employee
ORDER BY salary ASC;

SELECT * FROM employee
ORDER BY salary DESC;

SELECT * FROM employee
ORDER BY first_name;

SELECT * FROM employee
ORDER BY salary DESC, age ASC;

SELECT * FROM employee
WHERE salary >= 80000 and salary <= 100000
ORDER BY salary DESC;

/* ========== LIMIT ============= */
SELECT * FROM employee
LIMIT 5;

SELECT * FROM employee
LIMIT 3;

SELECT * FROM employee
WHERE salary >= 80000 and salary <= 100000
ORDER BY salary DESC
LIMIT 3;

-- Top 3 salaries
SELECT * FROM employee
ORDER BY salary DESC
LIMIT 3;

-- Bottom 3 salaries
SELECT * FROM employee
ORDER BY salary ASC
LIMIT 3;

-- Highest Salary
SELECT * FROM employee
ORDER BY salary DESC
LIMIT 1;

-- Lowest Salary
SELECT * FROM employee
ORDER BY salary ASC
LIMIT 1;

-- Second Highest Salary
SELECT * FROM employee
ORDER BY salary DESC
LIMIT 1,1;

-- Second Lowest Salary
SELECT * FROM employee
ORDER BY salary ASC
LIMIT 1,1;

-- Third highest salary
SELECT * FROM employee
ORDER BY salary DESC
LIMIT 2,1;

-- Highest Salary from Jaipur or Delhi
SELECT * FROM employee
WHERE city IN ('Jaipur', 'Delhi')
ORDER BY salary DESC
LIMIT 1;

-- Second Highest Salary from Jaipur or Delhi
SELECT * FROM employee
WHERE city IN ('Jaipur', 'Delhi')
ORDER BY salary DESC
LIMIT 1,1;


/*============== Aggregate Functions ================== 
COUNT()    -   Returns Number of rows
SUM()      -   Returns the sum
AVG()      -   Returns The average
MIN()      -   Returns the minimum value
MAX()      -   Returns the maximum value
*/

SELECT COUNT(*) FROM employee;

SELECT COUNT(*) FROM employee
WHERE city = 'Jaipur';

SELECT COUNT(*) FROM employee
WHERE salary >= 80000 and salary <= 100000;

SELECT COUNT(DISTINCT city) FROM employee;

SELECT SUM(salary) FROM employee;

SELECT SUM(salary) FROM employee
WHERE city = 'Jaipur';

SELECT AVG(salary) FROM employee
WHERE city = 'Jaipur';

SELECT MIN(salary) FROM employee;

SELECT MAX(salary) FROM employee;

SELECT Min(salary) FROM employee
WHERE city = 'Jaipur';


/* ======== SUB Query ============ */
-- Extract name and salary of employees having salary greater than the average

SELECT AVG(salary) FROM employee;

SELECT first_name, salary FROM employee
WHERE salary > 99000;                                   -- Without subquery

SELECT first_name, salary FROM employee
WHERE salary > (SELECT AVG(salary) FROM employee);     -- Sub query

-- Second max salary using sub query
SELECT MAX(salary) FROM employee
WHERE salary != (SELECT MAX(salary) FROM employee);

-- Third max salary using subquery
SELECT MAX(salary) FROM employee
WHERE salary != (SELECT MAX(salary) FROM employee) and salary != (SELECT MAX(salary) FROM employee
																  WHERE salary != (SELECT MAX(salary) FROM employee));
                                                                  
/*===============================================================*/																
/* ====================== GROUP BY ==============================*/

-- Number of employees from each city
SELECT city, Count(*) FROM employee
GROUP BY city;

SELECT city, Count(*) as total_employees FROM employee
GROUP BY city;

-- Number of employees from each city in descending order
SELECT city, Count(*) as total_employees FROM employee
GROUP BY city
ORDER BY total_employees DESC;

-- Average salary based on city
SELECT city, AVG(salary) as avg_salary FROM employee
GROUP BY city;

-- Average salary based on city in descending order
SELECT city, AVG(salary) as avg_salary FROM employee
GROUP BY city
ORDER BY avg_salary DESC;

-- City having highest average salary
SELECT city, AVG(salary) as avg_salary FROM employee
GROUP BY city
ORDER BY avg_salary DESC
LIMIT 1;

-- Max salary based on city in descending order
SELECT city, MAX(salary) as max_salary FROM employee
GROUP BY city
ORDER BY max_salary DESC;


-- Cities having average Salary more than 100000          (HAVING)
SELECT city, AVG(salary) as avg_salary FROM employee
GROUP BY city
HAVING avg_salary > 100000;

-- Cities having average Salary more than 90000 in Descending order
SELECT city, AVG(salary) as avg_salary FROM employee
GROUP BY city
HAVING avg_salary > 90000
ORDER BY avg_salary DESC;