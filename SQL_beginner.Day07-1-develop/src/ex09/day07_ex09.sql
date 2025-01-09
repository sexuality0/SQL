WITH comparison AS (
  SELECT address,
         CASE 
           WHEN (MAX(age) - (MIN(age) / MAX(age::numeric))) > AVG(age) THEN 'true'
           ELSE 'false'
         END AS comp
  FROM person
  GROUP BY address
)

SELECT  person.address, 
		ROUND((MAX(age) - (MIN(age) / MAX(age::numeric))),2) AS formula,
		ROUND(AVG(age),2),
		comparison.comp
 FROM person
 JOIN comparison 
 	ON person.address = comparison.address
 GROUP BY person.address, comparison.comp
 ORDER BY address