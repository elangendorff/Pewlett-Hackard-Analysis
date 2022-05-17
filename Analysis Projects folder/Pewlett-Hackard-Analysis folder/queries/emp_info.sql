DROP TABLE IF EXISTS emp_info;

-- Employee Information
SELECT
    emp.emp_no,
    emp.first_name,
    emp.last_name,
    emp.gender,
    sal.salary,
    de.to_date
INTO emp_info
FROM employees AS emp
    INNER JOIN salaries AS sal
    ON sal.emp_no = emp.emp_no
    INNER JOIN dept_emp AS de
    ON de.emp_no = emp.emp_no
WHERE ( extract( YEAR FROM emp.birth_date ) BETWEEN 1952 AND 1955 )
    AND ( extract( YEAR FROM emp.hire_date ) BETWEEN 1985 AND 1988 )
    AND ( extract( YEAR FROM de.to_date ) = 9999 )
;

SELECT * FROM emp_info;

