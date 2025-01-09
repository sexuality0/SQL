SELECT missing_date::date
FROM generate_series ('2022-01-01'::date, '2022-01-10', '1 day') AS missing_date
LEFT JOIN (SELECT * FROM person_visits 
WHERE (person_visits.person_id = '1' OR person_visits.person_id = '2') 
AND (person_visits.visit_date BETWEEN '2022-01-01' AND '2022-01-10')) miss ON (missing_date = miss.visit_date)
WHERE visit_date is null
ORDER BY missing_date ASC



