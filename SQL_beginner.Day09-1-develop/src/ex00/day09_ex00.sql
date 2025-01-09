CREATE TABLE person_audit(
created timestamp with time ZONE NOT NULL DEFAULT current_timestamp,
type_event char(1) DEFAULT 'I' NOT NULL,
row_id BIGINT NOT NULL,
name VARCHAR,
age INTEGER,
gender VARCHAR,
address VARCHAR,
CONSTRAINT ch_type_event CHECK (type_event IN ('I', 'D', 'U'))
); -- создаем табличку 

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS TRIGGER AS $fnc_trg_person_insert_audit$
BEGIN
	IF(TG_OP = 'INSERT') THEN
		INSERT INTO person_audit SELECT now(), 'I', NEW.*;
	RETURN NEW;
	END IF;
	RETURN NULL;
END;
$fnc_trg_person_insert_audit$ LANGUAGE plpgsql; -- создаем триггер функцию


CREATE TRIGGER trg_person_insert_audit -- создае мтриггер
AFTER INSERT ON person
FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();


INSERT INTO person(id, name, age, gender, address) -- инсертим данные 
VALUES (10,'Damir', 22, 'male', 'Irkutsk');