select t1.machine_id, ROUND(AVG(t1.timestamp - t2.timestamp), 3) as processing_time
from Activity t1 join Activity t2 
on t1.machine_id=t2.machine_id
where t1.process_id=t2.process_id and t1.activity_type="end" and t2.activity_type="start"
group by t1.machine_id;
