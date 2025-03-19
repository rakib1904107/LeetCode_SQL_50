with t as (
    select id, sum(num) as num
    from (
        select requester_id as id, count(*) as num
        from RequestAccepted
        group by requester_id

        union all

        select accepter_id as id, count(*) as num
        from RequestAccepted
        group by accepter_id
    ) as combined
    group by id
)

select id, num
from t
where num=(select max(num) from t);