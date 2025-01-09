CREATE TABLE routes (
point1 VARCHAR,
point2 VARCHAR,
cost INT
);

INSERT INTO routes(point1,point2,cost)
VALUES
('a', 'b', 10),
('a', 'c', 15),
('a', 'd', 20),
('b', 'a', 10),
('b', 'c', 35),
('b', 'd', 25),
('c', 'a', 15),
('c', 'b', 35),
('c', 'd', 30),
('d', 'a', 20),
('d', 'b', 25),
('d', 'c', 30);

-- DROP TABLE routes

WITH RECURSIVE roads AS (
  SELECT point1 AS path,
    point1, point2, cost
  FROM routes
  WHERE point1 = 'a'
  UNION
  SELECT CONCAT(roads.path, ',', routes.point1) AS path,
    routes.point1, routes.point2,
    roads.cost + routes.cost
  FROM roads
    JOIN routes
    ON roads.point2 = routes.point1
  WHERE path NOT LIKE CONCAT('%', routes.point1, '%')
), tours AS (
  SELECT cost AS total_cost,
    CONCAT('{', path, ',', point2, '}') AS tour
  FROM roads
  WHERE LENGTH(path) = 7 AND point2 = 'a'
)
SELECT *
FROM tours
WHERE total_cost = (
  SELECT MIN(total_cost)
  FROM tours
)
ORDER BY total_cost, tour;