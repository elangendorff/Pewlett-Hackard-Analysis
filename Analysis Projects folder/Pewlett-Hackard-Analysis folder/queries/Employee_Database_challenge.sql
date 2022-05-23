DROP TABLE IF EXISTS retirement_titles;

SELECT
    emp.emp_no,
    emp.first_name,
    emp.last_name,
    titles.title,
    titles.from_date,
    titles.to_date
INTO retirement_titles
FROM employees AS emp
    INNER JOIN titles
    ON titles.emp_no = emp.emp_no
WHERE extract( YEAR FROM emp.birth_date ) BETWEEN 1952 AND 1955
ORDER BY emp.emp_no, titles.to_date DESC
;

DROP TABLE IF EXISTS unique_titles;

SELECT DISTINCT ON ( emp_no )
    emp_no,
    first_name,
    last_name,
    title
INTO unique_titles
FROM retirement_titles
WHERE extract( YEAR FROM to_date ) = 9999
ORDER BY emp_no, to_date DESC
;

DROP TABLE IF EXISTS retiring_titles;

SELECT
    count(1),
    title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY 1 DESC
;

DROP TABLE IF EXISTS mentorship_eligibilty;

SELECT DISTINCT ON ( emp.emp_no )
    emp.emp_no,
    emp.first_name,
    emp.last_name,
    emp.birth_date,
    de.from_date,
    de.to_date,
    titles.title
INTO mentorship_eligibilty
FROM employees AS emp
    INNER JOIN dept_emp AS de
    ON de.emp_no = emp.emp_no
    INNER JOIN titles
    ON titles.emp_no = emp.emp_no
WHERE ( extract( YEAR FROM de.to_date ) = 9999 )
    AND ( extract( YEAR FROM emp.birth_date ) = 1965 )
ORDER BY emp.emp_no
;

DROP TABLE IF EXISTS mentorship_titles;

SELECT
    count(1),
    ment.title
INTO mentorship_titles
FROM mentorship_eligibilty AS ment
    -- Include retiring_titles table so that output sorts in the same order across both tables
    LEFT JOIN retiring_titles AS ret
    ON ret.title = ment.title
GROUP BY ment.title, ret.count
ORDER BY ret.count DESC
;

DROP TABLE IF EXISTS mentors_vs_retirees;

SELECT
    coalesce( ment.title, ret.title ) AS title,
    coalesce( ment.count, 0 ) AS mentors,
    coalesce( ret.count, 0 ) AS retirees,
    CASE
        WHEN coalesce( ment.count, 0 ) = 0
        THEN NULL
        ELSE round( ret.count / ment.count::numeric, 1 )
    END AS "retiree to mentor ratio"
INTO mentors_vs_retirees
FROM mentorship_titles AS ment
    FULL OUTER JOIN retiring_titles AS ret
    ON ret.title = ment.title
ORDER BY ret.count DESC
;

