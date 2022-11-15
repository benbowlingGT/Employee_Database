-- *****		
-- select * from departments
-- select * from dept_emp
-- select * from dept_manager
-- select * from employees
-- select * from salaries
-- select * from titles

-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary. 

select employees.first_name, employees.last_name, employees.sex, salaries.salary, salaries.emp_no
from employees
INNER JOIN salaries ON
salaries.emp_no=employees.emp_no;


-- 2. List first name, last name, and hire date for employees who were hired in 1986.   

select first_name,  last_name, hire_date 
from employees 
where hire_date BETWEEN '1986-1-1' AND '1986-12-31'


-- 3. List the manager of each department with the following information:    
-- 			department number, department name, the manager's employee number, last name, first name.

select dept_manager.dept_no, employees.emp_no, employees.first_name, employees.last_name, departments.dept_name
From dept_manager
INNER JOIN employees ON
employees.emp_no=dept_manager.emp_no
INNER JOIN departments ON 
departments.dept_no=dept_manager.dept_no;


-- 4. List the department of each employee with the following information: 
-- 								employee number, last name, first name, and department name.   

select departments.dept_name, employees.emp_no, employees.last_name, employees.first_name
from departments
INNER JOIN dept_emp ON
dept_emp.dept_no=departments.dept_no
INNER JOIN employees ON
employees.emp_no=dept_emp.emp_no


-- 5.  List first name, last name, and sex for employees whose first name 
--  								is "Hercules" and last names begin with "B."  

SELECT first_name, last_name, sex 
FROM employees
WHERE first_name ='Hercules' AND last_name like'B%'


-- 6. List all employees in the Sales department, including their 
-- 								employee number, last name, first name, and department name.


SELECT departments.dept_name, employees.first_name, employees.last_name, employees.emp_no
FROM departments
INNER JOIN dept_emp
ON dept_emp.dept_no=departments.dept_no
INNER JOIN employees
ON employees.emp_no=dept_emp.emp_no
WHERE departments.dept_name IN ('Sales')

-- 7. List all employees in the Sales and Development departments, 
-- 									including their employee number, last name, first name, and department name.
									
									
SELECT departments.dept_name, employees.first_name, employees.last_name, employees.emp_no
FROM departments
INNER JOIN dept_emp
ON dept_emp.dept_no=departments.dept_no
INNER JOIN employees
ON employees.emp_no=dept_emp.emp_no
WHERE departments.dept_name IN ('Sales', 'Development')
ORDER BY employees.emp_no;

-- 8. List the frequency count of employee last names 
-- 							(i.e., how many employees share each last name) in descending order. 
							
							
							select last_name,count(last_name) 
							from employees 
							group by last_name
							Order BY last_name DESC;
							
							
-- *****				




