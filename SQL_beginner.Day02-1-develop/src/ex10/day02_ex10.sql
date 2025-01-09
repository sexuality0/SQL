SELECT pers1.name AS person_name1, 
pers2.name AS person_name2, 
pers1.address AS common_address
	FROM person pers1, person pers2
	WHERE pers1.address = pers2.address 
AND pers1.id > pers2.id
ORDER BY person_name1, person_name2, common_address