-- insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
-- insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29'); -- по тз жобавили данные


SELECT
    firsts.name,
    firsts.lastname,
    firsts.currency_name,
    firsts.money * firsts.rate_to_usd AS currency_in_usd
FROM (
         SELECT
             COALESCE("user".name, 'not defined') AS name,
             COALESCE("user".lastname, 'not defined') AS lastname,
             groups.name AS currency_name,
             balance.money,
             COALESCE(
                 (SELECT currency.rate_to_usd -- курс валюиты на момент транзакции
                  FROM currency
                  WHERE balance.currency_id = currency.id AND currency.updated < balance.updated  
                  ORDER BY currency.updated DESC
                  LIMIT 1),
                 (SELECT currency.rate_to_usd -- если не нашел первый подзапрос, ищет второй уже после даты транзакции
                  FROM currency
                  WHERE balance.currency_id = currency.id AND currency.updated > balance.updated
                  ORDER BY currency.updated ASC
                  LIMIT 1)
             ) AS rate_to_usd
         FROM balance
         INNER JOIN (SELECT currency.id, currency.name 
         FROM currency 
         GROUP BY currency.id, currency.name) groups
             ON groups.id = balance.currency_id
         LEFT JOIN "user"
             ON balance.user_id = "user".id
     ) firsts
ORDER BY firsts.name DESC, firsts.lastname, firsts.currency_name;
