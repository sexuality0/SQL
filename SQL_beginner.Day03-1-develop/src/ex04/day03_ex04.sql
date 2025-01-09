WITH male AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
	JOIN menu
		ON menu.pizzeria_id = pizzeria.id
	JOIN person_order
		ON person_order.menu_id = menu.id
	JOIN person
		ON person.id = person_order.person_id
	WHERE gender = 'male'),
	female AS (SELECT pizzeria.name AS pizzeria_name FROM pizzeria
	JOIN menu
		ON menu.pizzeria_id = pizzeria.id
	JOIN person_order
		ON person_order.menu_id = menu.id
	JOIN person
		ON person.id = person_order.person_id
	WHERE gender = 'female'),
	males_only AS (SELECT * FROM male
	EXCEPT
	SELECT * FROM female
	),
	females_only AS (SELECT * FROM female
	EXCEPT
	SELECT *
	FROM male)

SELECT *
FROM males_only
UNION ALL
SELECT *
FROM females_only
ORDER BY pizzeria_name





