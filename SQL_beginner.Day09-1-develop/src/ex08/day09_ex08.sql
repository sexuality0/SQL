CREATE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10)
    RETURNS TABLE (A BIGINT) AS $$
WITH RECURSIVE F(A,B) AS ( -- рекурсивно генерим данные, где А текущее число В след число
	SELECT 0 AS A, 1 AS B -- начальные значения чисел Фибоначчи
	UNION ALL
	SELECT B, A+B -- A становится старым значением В, новое В = сумме А и В
	FROM F
	WHERE B<pstop -- счет идет до момента параметра pstop
)
SELECT A FROM F;
$$ LANGUAGE SQL;

-- SELECT * 
-- FROM fnc_fibonacci(100);


-- SELECT * 
-- FROM fnc_fibonacci();