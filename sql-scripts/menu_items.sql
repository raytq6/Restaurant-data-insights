-- 1.view the menu items --
SELECT * FROM restaurant_db.menu_items;


-- 2.find the number of items on the menu 
SELECT COUNT(menu_item_id)
FROM menu_items
;


-- 3. what are the least and most expensive items on the menu.
SELECT MAX(price) as max_prc, MIN(price) as min_prc
FROM menu_items
ORDER BY max_prc, min_prc
;

-- 4.how many italian dishes are on the menu.
SELECT COUNT(*) 
FROM menu_items
WHERE category = 'italian'
;

-- 5. what are the least and most expensive italian dishes on the menu.
SELECT MAX(price) as max_prc, MIN(price) as min_prc
FROM menu_items
WHERE category = 'italian'
ORDER BY max_prc, min_prc
;


-- OR OTHER METHOD --

SELECT DISTINCT price
FROM menu_items
WHERE category = 'italian'
ORDER BY price
;

-- 6. how many dishes are in each category.
SELECT DISTINCT 
category,
COUNT(item_name) as num_dishes
FROM menu_items
GROUP BY category
;

-- 7. what are the avg price of each dish within each category.
SELECT DISTINCT category, AVG(price) OVER(PARTITION BY category) as avg_price
FROM menu_items
GROUP BY category, price
;

-- OR 

SELECT DISTINCT 
category,
AVG(price) as avg_price
FROM menu_items
GROUP BY category
;







