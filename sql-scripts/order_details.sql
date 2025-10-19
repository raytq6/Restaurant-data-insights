SELECT * FROM restaurant_db.order_details;


-- what is the date range of the table 

SELECT MIN(order_date) as min_date, MAX(order_date) as max_date
FROM order_details
;

-- how many orders were made in this range.
SELECT COUNT(distinct order_id)
FROM order_details
;

-- how many items were ordered within this range
SELECT COUNT(item_id)
FROM order_details
;

-- which order had the most number of items 
SELECT order_id, COUNT(item_id) as num_items
FROM order_details
GROUP BY order_id
ORDER BY num_items DESC
;


-- how many orders had more than 12 items. using subquery 
SELECT COUNT(*) FROM 
(SELECT order_id, COUNT(item_id) as num_items
FROM order_details
GROUP BY order_id
HAVING num_items > 12) as num_orders
;


