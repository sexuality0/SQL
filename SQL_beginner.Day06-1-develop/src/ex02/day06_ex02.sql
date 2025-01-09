SELECT person.name, 
menu.pizza_name AS pizza_name, 
menu.price, 
ROUND(menu.price - (menu.price * person_discounts.discount/100)) AS discount_price, 
pizzeria.name
FROM menu
	JOIN pizzeria
		ON pizzeria.id = menu.pizzeria_id
	JOIN person_order
		ON person_order.menu_id = menu.id
	JOIN person
		ON person_order.person_id = person.id
	JOIN person_discounts
		ON person_discounts.person_id = person.id
ORDER BY person.name, pizza_name
	