SELECT
    ce.emp_no,
    ce.first_name,
    ce.last_name,
    dept.dept_name
FROM current_emp AS ce
    INNER JOIN dept_emp AS de
    ON de.emp_no = ce.emp_no
        INNER JOIN departments AS dept
        ON dept.dept_no = de.dept_no
WHERE dept.dept_name IN ( 'Development', 'Sales' )
;

