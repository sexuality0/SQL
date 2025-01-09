BEGIN;
UPDATE pizzeria
SET rating = 5
WHERE name = 'Pizza Hut'  -- обновялем в первом запроснике

-- №1
SELECT name, rating
FROM pizzeria
WHERE name = 'Pizza Hut' --проверяем в первом запроснике , выводит rating 5

--№2
SELECT name, rating
FROM pizzeria
WHERE name = 'Pizza Hut' --првоеряем во втором запрорснике, выводит rating 4,6

--№1
COMMIT --в первом запроснике, что бы во втором rating стал 5

--№2
SELECT * 
FROM pizzeria 
WHERE name = 'Pizza Hut'; -- обновилось

