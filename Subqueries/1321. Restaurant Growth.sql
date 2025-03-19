WITH t AS (
    SELECT 
        visited_on, 
        SUM(amount) OVER (
            ORDER BY visited_on 
            RANGE BETWEEN INTERVAL 6 day PRECEDING AND CURRENT ROW
        ) AS amount, 
        ROUND(SUM(amount) OVER (
            ORDER BY visited_on 
            RANGE BETWEEN INTERVAL 6 day PRECEDING AND CURRENT ROW
        )/7, 2) AS average_amount 
    FROM Customer
)

SELECT visited_on,max(amount) as amount,max(average_amount) as average_amount
FROM t
WHERE DATEDIFF(visited_on, (SELECT MIN(visited_on) FROM Customer)) >= 6
group by visited_on
ORDER BY visited_on;
