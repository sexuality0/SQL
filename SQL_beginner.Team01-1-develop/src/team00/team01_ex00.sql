SELECT DISTINCT 
    firsts.name, 
    firsts.lastname, 
    firsts.type, 
    SUM(firsts.money::numeric) AS volume, -- сумма денег для пользователя
    firsts.currency_name,
    firsts.last_rate_to_usd, 
    (SUM(firsts.money) * firsts.last_rate_to_usd) AS total_volume_in_usd -- общ сумма денег по ласт курсу 
FROM (
    SELECT DISTINCT 
        COALESCE("user".name, 'not defined') AS name, 
        COALESCE("user".lastname, 'not defined') AS lastname,
        balance.type,
        balance.money,
        COALESCE(currency.name, 'not defined') AS currency_name,
        COALESCE(FIRST_VALUE(currency.rate_to_usd) OVER (PARTITION BY currency.id ORDER BY currency.updated DESC), 1) AS last_rate_to_usd -- выбирает первое знач курса валюты
    FROM balance
    FULL JOIN "user"  -- full что бы включилисб все строки из user balance и curr
        ON "user".id = balance.user_id
    FULL JOIN currency
        ON currency.id = balance.currency_id
) firsts
GROUP BY name, lastname, type, currency_name, last_rate_to_usd
ORDER BY firsts.name DESC, firsts.lastname, firsts.type ASC;