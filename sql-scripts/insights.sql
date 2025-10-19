SELECT * FROM menu_items
;
SELECT * FROM order_details
;

-- combine the menu_items and order_details into one table 

SELECT *
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
;

-- what were the least and most ordered items? and from which category 
SELECT item_name,category, COUNT(order_details_id) as num_purchases
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC
;

-- what were the top 5 orders that spent the most money?
SELECT order_id, ROUND(SUM(price),4) as total_spent 
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5
;

-- view the details of the highest spend order and what insight can you get from it? 

SELECT category, COUNT(item_id) as num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category
;

-- view the details of the top 5 highest spend order and what insight can you get from it?
SELECT category, COUNT(item_id) as num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
WHERE order_id IN (440, 2075, 1957, 330, 2675)
GROUP BY category
;




