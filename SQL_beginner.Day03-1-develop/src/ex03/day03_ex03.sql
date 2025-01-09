WITH male AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
	JOIN person_visits
		ON person_visits.pizzeria_id = pizzeria.id
	JOIN person
		ON person_visits.person_id = person.id
	WHERE gender = 'male'),
	female AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
	JOIN person_visits
		ON person_visits.pizzeria_id = pizzeria.id
	JOIN person
		ON person_visits.person_id = person.id
	WHERE gender = 'female'),
	males_only AS (SELECT * FROM male
	EXCEPT ALL
	SELECT * FROM female
	),
	females_only AS (SELECT * FROM female
	EXCEPT ALL
	SELECT *
	FROM male)

SELECT *
FROM males_only
UNION ALL
SELECT *
FROM females_only
ORDER BY pizzeria_name





