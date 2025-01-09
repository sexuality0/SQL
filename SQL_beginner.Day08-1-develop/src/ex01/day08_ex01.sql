

-- #1
SHOW TRANSACTION ISOLATION LEVEL; 

-- #2
SHOW TRANSACTION ISOLATION LEVEL; 

-- #1
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; 

-- #2
BEGIN TRANSACTION ISOLATION LEVEL READ COMMITTED; 

-- проверяем оьбе таблицы, значение рейтинга у пиццерии равно 5
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut'  


-- #1 обновялем 1
UPDATE pizzeria 
SET rating = 4 
WHERE name = 'Pizza Hut'; 

-- #2 обновялем 2
UPDATE pizzeria 
SET rating = 3.6
WHERE name = 'Pizza Hut'; 

-- 1 таблицу 
COMMIT 

-- 2 таблицу
COMMIT  

-- - обе таблицы показывают 3.6
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut' 