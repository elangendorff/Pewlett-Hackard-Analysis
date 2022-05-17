DROP TABLE IF EXISTS retirement_info;

-- Retirement eligibility
SELECT
    emp_no,
    first_name,
    last_name
INTO retirement_info
FROM employees
WHERE ( extract( YEAR FROM birth_date ) BETWEEN 1952 AND 1955 )
    AND ( extract( YEAR FROM hire_date ) BETWEEN 1985 AND 1988 )
;

SELECT * FROM retirement_info;

