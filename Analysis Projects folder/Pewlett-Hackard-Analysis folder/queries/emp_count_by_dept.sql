DROP TABLE IF EXISTS emp_count_by_dept;

-- Employee count by department number
SELECT
    de.dept_no,
    count(1) AS employees
INTO emp_count_by_dept
FROM current_emp as ce
    LEFT JOIN dept_emp as de
    ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no
;

SELECT * FROM emp_count_by_dept;

