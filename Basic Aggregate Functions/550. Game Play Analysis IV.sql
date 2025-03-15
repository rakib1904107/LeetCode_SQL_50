select round(count(*)/(select count(distinct player_id) from Activity),2) as fraction
from (select player_id,min(event_date) as date from Activity group by player_id) t1
join Activity t2
on t1.player_id=t2.player_id and DATEDIFF(t2.event_date,t1.date)=1;