-- #11
SHOW TRANSACTION ISOLATION LEVEL; 

-- #2
SHOW TRANSACTION ISOLATION LEVEL; 

-- #1
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

-- #2
BEGIN TRANSACTION ISOLATION LEVEL REPEATABLE READ;

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

-- 1 
COMMIT 


--  Стопаем зависший запрос у 2 запросинка

-- 2 
COMMIT  
-- пишет ROLLBACK

-- - обе таблицы показывают 4
SELECT *
FROM pizzeria
WHERE name = 'Pizza Hut' 