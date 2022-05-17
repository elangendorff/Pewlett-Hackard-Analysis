DROP TABLE IF EXISTS manager_info;

-- List of managers per department
SELECT
    dm.dept_no,
    dept.dept_name,
    dm.emp_no,
    ce.first_name,
    ce.last_name,
    dm.from_date,
    dm.to_date
INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS dept
    ON dept.dept_no = dm.dept_no
    INNER JOIN current_emp AS ce
    ON ce.emp_no = dm.emp_no
;

SELECT * FROM manager_info;

