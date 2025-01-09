CREATE FUNCTION func_minimum(VARIADIC arr NUMERIC[]) -- VARIADIC позволяет передавать переменное количество аргументов в функцию как массив
RETURNS NUMERIC 
AS $$
SELECT MIN(i) FROM UNNEST(arr) g(i); -- UNNEST разворачивает массив arr в отдельные строки, 
$$ LANGUAGE SQL;

-- SELECT func_minimum(VARIADIC arr => ARRAY[10.0, -1.0, 5.0, 4.4]); -- min будет -1.0