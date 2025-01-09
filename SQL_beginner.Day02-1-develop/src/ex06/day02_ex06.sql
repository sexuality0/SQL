SELECT pizza_name, pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu
	ON pizzeria.id = menu.pizzeria_id
JOIN person_order
	ON person_order.menu_id = menu.id
JOIN person
	ON person_order.person_id = person.id
WHERE person.name IN ('Denis', 'Anna')
ORDER BY pizza_name, pizzeria_name
