SELECT menu.pizza_name AS pizza_name, price AS price, pizzeria.name AS pizzeria_name
FROM pizzeria
JOIN menu
	ON menu.pizzeria_id = pizzeria.id
LEFT JOIN person_order
	ON menu.id = person_order.menu_id
WHERE person_order IS NULL
ORDER BY pizza_name, price