WITH t AS (
    SELECT t1.name, COUNT(*) AS cnt
    FROM Users t1 
    JOIN MovieRating t2 ON t1.user_id = t2.user_id
    GROUP BY t1.name
), 
tb AS (
    SELECT t1.title, AVG(t2.rating) AS rat
    FROM Movies t1 
    JOIN MovieRating t2 ON t1.movie_id = t2.movie_id
    WHERE DATE_FORMAT(t2.created_at, '%Y-%m') = '2020-02'
    GROUP BY t1.title
)

SELECT MIN(name) AS results
FROM t 
WHERE cnt = (SELECT MAX(cnt) FROM t)

UNION ALL

SELECT MIN(title) AS results
FROM tb 
WHERE rat = (SELECT MAX(rat) FROM tb);