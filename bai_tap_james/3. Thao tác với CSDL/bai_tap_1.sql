use quan_ly_sinh_vien;

select *
from student
where student_name like 'h%';

select *
from class
where month(start_date) = 12; 

select *
from `subject`
where credit between 3 and 5;


SET SQL_SAFE_UPDATES = 0;
update student 
set class_id = 2 
where student_name = 'Hung';

select student.student_name,`subject`.sub_name,mark.mark
from mark
join student 
on mark.student_id = student.student_id
join `subject` 
on `subject`.sub_id = mark.sub_id
order by mark.mark desc, student.student_name ;