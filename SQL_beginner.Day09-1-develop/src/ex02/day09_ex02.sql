CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS TRIGGER AS $fnc_trg_person_delete_audit$
BEGIN
	IF(TG_OP = 'DELETE') THEN
		INSERT INTO person_audit SELECT current_timestamp, 'D', OLD.*;
	RETURN OLD;
	END IF;
	RETURN NULL;
END;
$fnc_trg_person_delete_audit$ LANGUAGE plpgsql;

CREATE TRIGGER fnc_trg_person_delete_audit 
AFTER DELETE ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();

DELETE FROM person 
WHERE id = 10;