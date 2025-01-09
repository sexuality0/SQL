-- DROP TRIGGER IF EXISTS trg_person_delete_audit ON public.person CASCADE;
-- DROP TRIGGER IF EXISTS trg_person_insert_audit ON public.person CASCADE;
-- DROP TRIGGER IF EXISTS trg_person_update_audit ON public.person CASCADE;

-- DROP function IF EXISTS fnc_trg_person_insert_audit() CASCADE;
-- DROP FUNCTION IF EXISTS fnc_trg_person_delete_audit() CASCADE;
-- DROP FUNCTION IF EXISTS fnc_trg_person_update_audit() CASCADE;

-- truncate person_audit;


CREATE OR REPLACE FUNCTION fnc_trg_person_audit() RETURNS TRIGGER AS $fnc_trg_person_audit$
BEGIN
	IF (TG_OP = 'DELETE') THEN
		INSERT INTO person_audit SELECT current_timestamp, 'D', OLD.*;
	RETURN OLD;
	ELSIF (TG_OP = 'UPDATE') THEN
		INSERT INTO person_audit SELECT current_timestamp, 'U', NEW.*;
	RETURN NEW;
	ELSIF (TG_OP = 'INSERT') THEN
		INSERT INTO person_audit SELECT now(), 'I', NEW.*;
	RETURN NEW;
	END IF;
	RETURN NULL;
END;
$fnc_trg_person_audit$ LANGUAGE plpgsql;

CREATE TRIGGER fnc_trg_person_audit 
AFTER INSERT OR DELETE OR UPDATE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_audit();

INSERT INTO person(id, name, age, gender, address)  
VALUES (10,'Damir', 22, 'male', 'Irkutsk');

UPDATE person 
SET name = 'Bulat' 
WHERE id = 10;

UPDATE person 
SET name = 'Damir'
WHERE id = 10;

DELETE FROM person 
WHERE id = 10;


