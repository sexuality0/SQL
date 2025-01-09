-- DROP FUNCTION IF EXISTS public.fnc_persons_male();
-- DROP FUNCTION IF EXISTS public.fnc_persons_female();


CREATE OR REPLACE FUNCTION fnc_persons(IN pgender VARCHAR DEFAULT 'female')
RETURNS TABLE (
id BIGINT,
name VARCHAR,
age INTEGER,
gender VARCHAR,
address VARCHAR
) AS $$ (SELECT * FROM person
		WHERE person.gender = pgender)
$$ LANGUAGE sql;


select *
from fnc_persons(pgender := 'male');


select *
from fnc_persons();
