-- SELECT *
-- FROM person_order
-- ORDER BY order_date DESC, id DESC

DELETE FROM person_order
WHERE order_date = '2022-02-25';

-- SELECT *
-- FROM menu
-- ORDER BY id DESC

DELETE FROM menu
WHERE pizza_name = 'greek pizza';