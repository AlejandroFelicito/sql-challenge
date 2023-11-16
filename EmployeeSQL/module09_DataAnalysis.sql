-- Data Analysis

-- 1. List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
	employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	employees.sex AS "Sex",
	salaries.salary AS "Salary"
FROM 
	employees,
	salaries
WHERE 
	employees.emp_no = salaries.emp_no
;

-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
	first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date"
FROM 
	employees
WHERE 
	extract(year from hire_date) = 1986
;

-- 3. List the manager of each department along with their department number, department name, 
-- employee number, last name, and first name.
SELECT 
	dept_manager.dept_no AS "Department Number",
	departments.dept_name AS "Department Name",
	employees.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name"
FROM 
	dept_manager, 
	departments,
	employees
WHERE 
	(dept_manager.emp_no = employees.emp_no) 
	AND
	(dept_manager.dept_no = departments.dept_no)
;

-- 4. List the department number for each employee along with that employee’s employee number, 
-- last name, first name, and department name.
SELECT 
	dept_emp.dept_no AS "Department Number",
	dept_emp.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	departments.dept_name AS "Department Name"
FROM 
	dept_emp, 
	employees, 
	departments
WHERE 
	(dept_emp.emp_no = employees.emp_no) 
	AND
	(dept_emp.dept_no = departments.dept_no)
;

-- 5. List first name, last name, and sex of each employee whose first name is Hercules 
-- and whose last name begins with the letter B.
SELECT 
	first_name AS "First Name",
	last_name AS "Last Name",
	sex AS "Sex"
FROM 
	employees 
WHERE 
	first_name = 'Hercules'
	AND
	last_name LIKE 'B%'
;

-- 6. List each employee in the Sales department, including their employee number, 
-- last name, and first name.
SELECT 
	dept_emp.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name"
FROM 
	dept_emp, 
	employees, 
	departments
WHERE 
	(dept_emp.dept_no = 'd007') 
	AND
	(dept_emp.dept_no = departments.dept_no) 
	AND
	(dept_emp.emp_no = employees.emp_no)
;

-- 7. List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT 
	dept_emp.emp_no AS "Employee Number",
	employees.last_name AS "Last Name",
	employees.first_name AS "First Name",
	departments.dept_name AS "Department Name"
FROM 
	dept_emp, 
	employees, 
	departments
WHERE 
	(dept_emp.dept_no = 'd005' 
	OR
	dept_emp.dept_no = 'd007')
	AND
	dept_emp.dept_no = departments.dept_no 
	AND
	dept_emp.emp_no = employees.emp_no 
;

-- 8. List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT 
	last_name AS "Last Name",
	COUNT(last_name) AS "Last Name Count"
FROM 
	employees
GROUP BY 
	last_name
ORDER BY 
	"Last Name Count" DESC 
;
