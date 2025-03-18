with t1 as (
    select person_name, sum(weight) over(order by turn) as total, turn
    from Queue
)

select person_name
from t1 
where turn=(select max(turn) from t1 where total<=1000);