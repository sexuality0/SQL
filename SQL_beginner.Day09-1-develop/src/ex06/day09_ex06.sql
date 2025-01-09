-- DROP FUNCTION IF EXISTS fnc_person_visits_and_eats_on_date(varchar, numeric, date);

CREATE OR REPLACE FUNCTION fnc_person_visits_and_eats_on_date(
IN pperson VARCHAR DEFAULT 'Dmitriy',
IN pprice NUMERIC DEFAULT 500,
In pdate DATE DEFAULT '2022-01-08')
RETURNS TABLE(
name VARCHAR
) AS $$
SELECT pizzeria.name AS pizzeria_name
FROM pizzeria
	INNER JOIN menu
		ON menu.pizzeria_id = pizzeria.id
	INNER JOIN person_visits 
		ON person_visits.pizzeria_id = pizzeria.id
	INNER JOIN person
		ON person.id = person_visits.person_id
WHERE person.name = pperson 
AND menu.price < pprice 
AND person_visits.visit_date = pdate;

$$LANGUAGE sql;


select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');



