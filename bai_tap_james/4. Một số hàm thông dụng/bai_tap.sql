use quan_ly_sinh_vien;
select *, max(credit)
from `subject`
;

select *, max(mark)
from mark
right join `subject` on mark.sub_id = `subject`.sub_id
;

select *  , avg(mark)
from student 
left join mark on student.student_id = mark.student_id
group by student.student_id
order by mark desc

