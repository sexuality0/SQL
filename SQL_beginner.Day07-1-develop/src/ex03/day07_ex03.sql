WITH orders_counts AS (
  SELECT pizzeria.name AS name, COUNT(*) AS count
  FROM person_order
  JOIN menu ON person_order.menu_id = menu.id
  JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
  GROUP BY pizzeria.name
), visits_counts AS (
  SELECT pizzeria.name AS name, COUNT(*) AS count
  FROM person_visits
  JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
  GROUP BY pizzeria.name
)

SELECT
  orders_counts.name, visits_counts.count + orders_counts.count AS total_count
FROM orders_counts
JOIN visits_counts ON orders_counts.name = visits_counts.name
ORDER BY total_count DESC, name ASC;
