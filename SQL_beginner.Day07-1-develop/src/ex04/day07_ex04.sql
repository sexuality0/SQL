WITH count_of_visits AS (
SELECT person_id, COUNT(*) AS counts
FROM person_visits
GROUP BY person_id
HAVING COUNT(*) > 3
)

SELECT person.name, count_of_visits.counts
FROM person
JOIN count_of_visits
	ON person.id = count_of_visits.person_id
ORDER BY count_of_visits DESC, name ASC