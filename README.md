# Restaurant Data Insights using MySQL

# Overview :
This project analyzes restaurant order data using MySQL to identify key business insights such as top-selling items, high spenders, and ordering patterns.

# Objectives:

1. What were the least and most ordered items? What categories were they in?

2. What do the highest spend orders look like? Which items did they buy and how much did they spend?


3. Which cuisines should we focus on developing more menu items for based on the data?


for seeing the dataset description refer to 'restaurant_db_data_dictionary.pdf'

# Analysis and insights gained by running sql queries: answers for objectives 
1. 

# ASC for least ordered and DESC for most ordered.
# This query shows that the highest ordered item was hamburger from the category 'American' 
# and the least ordered item was chicken tacos  form 'Mexican' 
SELECT item_name,category, COUNT(order_details_id) as num_purchases
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
GROUP BY item_name, category
ORDER BY num_purchases DESC 
;



2. 



# this query shows that amongst top 5 order_id, 440 spent the most money. ($192) so, from this we can get the insight about what dishes did they order. 
SELECT order_id, ROUND(SUM(price),4) as total_spent 
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
GROUP BY order_id
ORDER BY total_spent DESC
LIMIT 5
;


# This specifically shows that although the most frequently ordered dish was an American hamburger, the highest spending orders included more Italian dishes. Therefore, the restaurant should focus on maintaining and expanding Italian menu items to maximize revenue.
SELECT category, COUNT(item_id) as num_items
FROM order_details AS od
LEFT JOIN menu_items AS mi
	ON od.item_id = mi.menu_item_id
WHERE order_id = 440
GROUP BY category
;



# in order to run these sql queries 

Clone repo :

Import data into MySQL

Run queries from insights.sql

View results or export them

# data set from online source https://mavenanalytics.io/data-playground/restaurant-orders?pageSize=10 

