CREATE INDEX idx_person_name ON person(UPPER(name));

SET enable_seqscan = off;

EXPLAIN ANALYZE 

SELECT *
FROM person
WHERE UPPER(name) = 'ANNA'

-- "Index Scan using idx_person_name on person  (cost=0.14..8.15 rows=1 width=108) (actual time=0.031..0.032 rows=1 loops=1)"
-- "Index Cond: (upper((name)::text) = 'ANNA'::text)"