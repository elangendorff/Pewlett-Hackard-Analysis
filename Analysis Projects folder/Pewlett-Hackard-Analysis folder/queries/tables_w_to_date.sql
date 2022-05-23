SELECT
    'dept_emp' AS "table",
    count( CASE WHEN extract( YEAR FROM to_date ) = 9999 THEN 1 END ) AS "current",
    count( CASE WHEN extract( YEAR FROM to_date ) != 9999 THEN 1 END ) AS former
FROM dept_emp
UNION ALL
SELECT
    'dept_manager',
    count( CASE WHEN extract( YEAR FROM to_date ) = 9999 THEN 1 END ) AS "current",
    count( CASE WHEN extract( YEAR FROM to_date ) != 9999 THEN 1 END ) AS former
FROM dept_manager
UNION ALL
SELECT
    'salaries',
    count( CASE WHEN extract( YEAR FROM to_date ) = 9999 THEN 1 END ) AS "current",
    count( CASE WHEN extract( YEAR FROM to_date ) != 9999 THEN 1 END ) AS former
FROM salaries
UNION ALL
SELECT
    'titles',
    count( CASE WHEN extract( YEAR FROM to_date ) = 9999 THEN 1 END ) AS "current",
    count( CASE WHEN extract( YEAR FROM to_date ) != 9999 THEN 1 END ) AS former
FROM titles
ORDER BY "table"
;

SELECT
    to_date - from_date AS "salary duration (days)",
    count(1)
FROM salaries
GROUP BY 1
ORDER BY 1
;

SELECT
    to_date - from_date AS "salary duration (days)",
    count(1)
FROM salaries
GROUP BY 1
ORDER BY 2 DESC
;

