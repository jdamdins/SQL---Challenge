
---Data Analysis
-----#1 List the following details of each employee: employee number, last name, first name, sex, and salary
CREATE VIEW salary_info AS
SELECT Employees.emp_no, last_name, first_name, sex, salary FROM Employees 
INNER JOIN Salaries ON Employees.emp_no=Salaries.emp_no;

-- Run the View
SELECT * FROM salary_info

-----#2 List first name, last name, and hire date for employees who were hired in 1986
SELECT first_name, last_name, hire_date FROM Employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-----#3 List the manager of each department with the following info: department number, department name, the manager's empl number, last name, first name.

SELECT Dept_manager.dept_no, Departments.dept_name, Employees.emp_no, Employees.first_name, Employees.last_name
FROM Dept_manager 
	INNER JOIN Departments
	ON Departments.dept_no=Dept_manager.dept_no
	INNER JOIN Employees ON Employees.emp_no=Dept_manager.emp_no;
	
----#4 List the department of each employee with the following info: employee number, last name, first name, department name.


SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees 
	INNER JOIN Dept_emp
	ON Dept_emp.emp_no=Employees.emp_no
	INNER JOIN Departments 
	ON Departments.dept_no=Dept_emp.dept_no;

----#5 List the first name, last name,and sex for employees whose first name is "Hercules" and last names begin with "B"

SELECT Employees.first_name, Employees.last_name, Employees.sex
FROM Employees 
WHERE first_name= 'Hercules'
 	AND upper(Employees.last_name) LIKE 'B%';

----#6 List all employees in the Sales department including their employee number, last name, first name, and department name. 

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees 
	INNER JOIN Dept_emp
	ON Dept_emp.emp_no=Employees.emp_no
	INNER JOIN Departments 
	ON Departments.dept_no=Dept_emp.dept_no AND Departments.dept_name='Sales';

----#7 List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name. 

SELECT Employees.emp_no, Employees.last_name, Employees.first_name, Departments.dept_name
FROM Employees 
	INNER JOIN Dept_emp
	ON Dept_emp.emp_no=Employees.emp_no
	INNER JOIN Departments 
	ON Departments.dept_no=Dept_emp.dept_no
	AND Departments.dept_name IN ('Sales','Development');
	
----#8 In descending order, list the frequency count of employees last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name) AS "frequency count"
FROM Employees 
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;


