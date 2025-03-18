SELECT DISTINCT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN(
    SELECT DISTINCT product_id FROM Products
    WHERE change_date < DATE('2019-08-17')
    )

UNION 

SELECT product_id, IFNULL(new_price,10) AS price
FROM Products
WHERE (product_id, change_date) IN (
    SELECT product_id, MAX(change_date) as change_id
    FROM Products
    WHERE change_date < DATE('2019-08-17')
    GROUP BY product_id
    );