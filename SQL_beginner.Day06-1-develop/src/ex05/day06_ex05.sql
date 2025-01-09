COMMENT ON TABLE person_discounts
	IS 'Структура хранения персональных скидок';
	
COMMENT ON COLUMN person_discounts.id
	IS 'Айди персональной скидки';
	
COMMENT ON COLUMN person_discounts.person_id
	IS 'Айди человека для каждой скидки';
	
COMMENT ON COLUMN person_discounts.pizzeria_id
	IS 'Айди пиццерии где действует скидка';
	
COMMENT ON COLUMN person_discounts.discount
	IS 'Размер самой скидки';
    

--SELECT obj_description('person_discounts'::regclass);

-- SELECT col_description('person_discounts'::regclass, 1)
-- FROM information_schema.columns
-- WHERE table_name = 'person_discounts' AND column_name = 'discount';