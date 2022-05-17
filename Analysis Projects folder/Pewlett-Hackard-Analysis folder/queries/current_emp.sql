DROP TABLE IF EXISTS current_emp;

SELECT
    ret.emp_no,
    ret.first_name,
    ret.last_name,
    de.to_date
INTO current_emp
FROM retirement_info as ret
    LEFT JOIN dept_emp as de
    ON ret.emp_no = de.emp_no
WHERE extract( YEAR FROM de.to_date ) = 9999
;

SELECT * FROM current_emp;

