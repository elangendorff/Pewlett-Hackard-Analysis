DROP TABLE IF EXISTS dept_info;

SELECT
    ce.emp_no,
    ce.first_name,
    ce.last_name,
    dept.dept_name
INTO dept_info
FROM current_emp as ce
    INNER JOIN dept_emp AS de
    ON de.emp_no = ce.emp_no
        INNER JOIN departments AS dept
        ON dept.dept_no = de.dept_no
;

SELECT * FROM dept_info;

