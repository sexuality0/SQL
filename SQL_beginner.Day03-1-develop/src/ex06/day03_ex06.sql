SELECT 
    men1.pizza_name AS pizza_name,
    piz2.name AS pizzeria_name_1,
    piz1.name AS pizzeria_name_2,
    men1.price AS price
FROM 
    menu men1
JOIN 
    menu men2 ON men1.pizza_name = men2.pizza_name AND men1.price = men2.price AND men1.pizzeria_id < men2.pizzeria_id
JOIN 
    pizzeria piz1 ON men1.pizzeria_id = piz1.id
JOIN 
    pizzeria piz2 ON men2.pizzeria_id = piz2.id
ORDER BY 
    men1.pizza_name;
