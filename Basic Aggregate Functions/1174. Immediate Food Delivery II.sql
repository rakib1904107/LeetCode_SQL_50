# Write your MySQL query statement below
select round(sum(min_order=pref_date)*100/count(*),2) as immediate_percentage
from (select customer_id, min(order_date) as min_order, min(customer_pref_delivery_date) as pref_date
from Delivery
group by customer_id) t;