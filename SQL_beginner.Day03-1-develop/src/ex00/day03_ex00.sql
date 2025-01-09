SELECT menu.pizza_name AS pizza_name, price AS price, pizzeria.name AS pizzeria_name, visit_date 
FROM pizzeria
JOIN person_visits
	ON person_visits.pizzeria_id = pizzeria.id
JOIN menu
	ON menu.pizzeria_id = pizzeria.id
JOIN person
	ON person.id = person_visits.person_id
WHERE person.name = 'Kate' AND price BETWEEN 800 AND 1000 
ORDER BY pizza_name, price, pizzeria_name
