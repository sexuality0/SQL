-- CREATE VIEW v_generated_dates AS
-- SELECT generate_date::date
-- FROM generate_series('2022-01-01'::date, '2022-01-31'::date, '1 day') as generate_date
-- ORDER BY 1;

SELECT generate_date AS missing_date
FROM v_generated_dates
EXCEPT
SELECT visit_date
FROM person_visits
WHERE visit_date BETWEEN '2022-01-01' AND '2022-01-31'
ORDER BY missing_date