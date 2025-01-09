INSERT INTO menu (id, pizzeria_id, pizza_name, price)
SELECT
	(SELECT MAX(id)+1 FROM menu), (SELECT id FROM pizzeria WHERE name = 'Dominos'),
	'sicilian pizza', 900

-- SELECT *
-- FROM menu
-- ORDER BY id DESC;