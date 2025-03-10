select t1.student_id,t1.student_name,t1.subject_name,count(t2.student_id) as attended_exams
from (select * from Students join Subjects) as t1
left join Examinations as t2
on t1.student_id=t2.student_id and t1.subject_name=t2.subject_name
group by t1.student_id,subject_name
order by t1.student_id,subject_name