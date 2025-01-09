CREATE VIEW v_price_with_discount AS

WITH discounted_price AS (
SELECT id, ROUND (price * 0.9) AS discount_price
FROM menu
)

SELECT person.name, menu.pizza_name, menu.price AS price, discounted_price.discount_price
FROM menu
JOIN discounted_price
	ON discounted_price.id = menu.id
JOIN person_order
	ON menu.id = person_order.menu_id
JOIN person
	ON person_order.person_id = person.id
	
ORDER BY name, pizza_name


-- SELECT *
-- FROM v_price_with_discount