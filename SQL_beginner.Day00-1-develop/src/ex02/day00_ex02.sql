SELECT name, rating
FROM pizzeria
WHERE rating >= 3.5 and rating <= 5
ORDER BY rating

SELECT name, rating
FROM pizzeria
WHERE rating BETWEEN 3.4 and 5
ORDER BY rating
