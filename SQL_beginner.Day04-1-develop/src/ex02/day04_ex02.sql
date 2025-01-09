CREATE VIEW v_generated_dates AS
SELECT generate_date::date
FROM generate_series('2022-01-01'::date, '2022-01-31'::date, '1 day') as generate_date
ORDER BY 1;

-- SELECT *
-- FROM v_generated_dates
-- ORDER BY v_generated_dates;