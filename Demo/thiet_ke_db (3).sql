create database if not exists c0522g1;
use c0522g1;
create table class_type(
id int primary key auto_increment,
name varchar(50)
);
create table class(
id int primary key auto_increment,
name varchar(50),
class_type_id int,
foreign key(class_type_id) references class_type(id)
);
create table jame (
`account` varchar(50),
`password` varchar(25),
primary key (`account`)
);
create table student(
 id int primary key auto_increment,
 name varchar(50),
 birthday date,
 gender boolean,
 email varchar(50),
 point int,
 `account` varchar(50),
 class_id int,
 foreign key(`account`) references jame(`account`),
 foreign key(class_id) references class(id)
 )
;
create table instructor(
 id int primary key auto_increment,
 name varchar(50),
 birthday date,
 salary float
);

create table instructor_class(
class_id int,
instructor_id int,
start_time date,
primary key(class_id,instructor_id),
foreign key(class_id) references class(id),
foreign key(instructor_id) references instructor(id)
);


-- Nhập thông tin cho bảng 
insert into class_type (name) values ('full time'), ('part time'),('orther');

insert into class (name,class_type_id) values ('c1121g1',1), ('c1221g1',1),('a0821i1',2),('a0921i1',2);

insert into jame(`account`,`password`)
 values('cunn','12345'),('chunglh','12345'),('hoanhh','12345'),('dungd','12345'),('huynhtd','12345'),
 ('hainm','12345'),('namtv','12345'),('hieuvm','12345'),('kynx','12345'),('vulm','12345');

insert into jame(`account`,`password`)
 values('anv','12345'),('bnv','12345');

 
insert into instructor(`name`,birthday, salary)
 values('tran van chanh','1985-02-03',100),('tran minh chien','1985-02-03',200),('vu thanh tien','1985-02-03',300);
insert into instructor(`name`,birthday, salary)
 values('tran van nam','1989-12-12',100);

 
 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen ngoc cu','1981-12-12',1,8,1,'cunn'),('le hai chung','1981-12-12',1,5,1,'chunglh'),
 ('hoang huu hoan','1990-12-12',1,6,2,'hoanhh'),('dau dung','1987-12-12',1,8,1,'dungd'),
 ('ta dinh huynh','1981-12-12',1,7,2,'huynhtd'),('nguyen minh hai','1987-12-12',1,9,1,'hainm'),
 ('tran van nam','1989-12-12',1,4,2,'namtv'),('vo minh hieu','1981-12-12',1,3,1,'hieuvm'),
 ('le xuan ky','1981-12-12',1,7,2,'kynx'),('le minh vu','1981-12-12',1,7,1,'vulm');

 insert into student(`name`,birthday, gender,`point`, class_id,`account`) 
 values ('nguyen van a','1981-12-12',1,8,null,'anv'),('tran van b','1981-12-12',1,5,null,'bnv');

 insert into instructor_class(class_id,instructor_id) values (1,1),(1,2),(2,1),(2,2),(3,1),(3,2);

select * from class_type;
select* from class;
select* from student;
select* from jame;
select* from instructor;select * from student;
select * from instructor_class;

-- ss3 thao tác với csdl

-- 1. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào.
select s.id, s.name, s.birthday, c.name as class_name
from student s
inner join class c on s.class_id = c.id;

-- 2. Lấy ra thông tin các học viên, và cho biết các học viên đang theo học lớp nào 
-- và cả các bạn đã đăng ký nhưng chưa có lớp học.
select s.id, s.name, s.birthday, c.name as class_name
from student s
left join class c on s.class_id = c.id;
-- join 3 bảng lấy thêm thông tin tên loại lớp
select s.id, s.name, s.birthday, c.name as class_name,ct.name as class_type
from student s
join class c on s.class_id = c.id
join class_type ct on c.class_type_id=ct.id;

-- 3. Lấy thông tin của các học viên tên 'nguyen minh hai'.
select * 
from student s 
where s.name ='nguyen minh hai';

-- 5. Lấy ra học viên có họ là “nguyen”
select * 
from student s 
where s.name like 'nguyen %';

-- 5. Lấy thông tin của các học viên tên 'hai' và 'huynh’.
select * 
from student s 
where s.name like '% hai' or s.name like '% huynh';

-- lấy các học viên có tên bắt đầu bằng chữ h => regexp

-- 6. Lấy ra các học viên có điểm lớn hơn 5 .
select * 
from student s
where s.point>5;

select * 
from student s
having s.point>5;
-- 7. lấy ra thông tin các học viên có điểm 4,6,8
select * 
from student s
where s.point in(4,6,8);

-- 8. Thông kế số lượng học sinh theo từng loại điểm.
select s.point, count(s.point) as so_luong
from student s 
group by s.point;

-- 9 . Thông kế số lượng học sinh theo điểm và điểm phải lớn hơn = 5
select s.point, count(s.point) as so_luong
from student s
where s.point>=5
group by s.point;
-- 10. Thông kế số lượng học sinh theo điểm lớn hơn 5 và chỉ hiện thị với số lượng>=2
select s.point, count(s.point) as so_luong
from student s
group by s.point
having s.point>=5 and so_luong>=2;

-- 11. Lấy ra danh sách học viên của lớp c1121g1 và sắp xếp  học viên theo point,
-- nếu point bằng nhau thì sắp xếp theo tên.
select *
from student s
join class c on s.class_id = c.id
where c.name ='c1121g1'
order by s.point desc, s.name ;


 -- bài 4: sử dụng các hàm thông dụng

-- đếm số học viên toàn trung tâm

 select count(*) as so_luong
 from student;
 
 select * from student;
 select * from class;
-- 1.1	Hiện thị danh sách các lớp có học viên theo học và số lượng học viên của mỗi lớp
select c.name as class_name, count(c.name) as so_luong
from student s 
join class c on s.class_id = c.id
group by c.name;

-- 1.2.	 Tính điểm lớn nhất của mỗi các lớp
select c.name as class_name, max(s.point) as diem_max
from student s 
join class c on s.class_id = c.id
group by c.name;

-- 1.3	 Tình điểm trung bình  của từng lớp 
select c.name as class_name, avg(s.point) as diem_tb
from student s 
join class c on s.class_id = c.id
group by c.name;




 -- 2 Lấy ra toàn bộ tên và ngày sinh các instructor và student ở CodeGym.

select  s.name, s.birthday from student s
union
select  i.name,i.birthday from instructor i;

select count(*) from
(select s.name as s_name
from student s 
left join class c on s.class_id = c.id
union all
select s.name as s_name
from student s 
right join class c on s.class_id = c.id) as tem;
  -- 4 Lấy ra 3 học viên có điểm cao nhất của trung tâm.
select *
from student s
order by s.point desc
limit 3;

select *
from student s
order by s.point desc
limit 2,1;

 -- 5. Lấy ra các học viên có điểm số là cao nhất của trung tâm.
 -- dùng subquery
select *
from student s
where s.point = (select max(point)from student);

select * from instructor;
select * from instructor_class;
-- 6 tìm  những gv chưa từng tham gia giảng dạy;
-- dùng join
select i.name
from instructor_class ic
right join instructor i on ic.instructor_id=i.id
where ic.instructor_id is null;

-- dùng truy vấn con với i
explain select * from instructor i where i.id not in(select distinct instructor_id
from instructor_class );

-- dùng truy vấn con với exist
 explain select *
from instructor i
where not exists (select *
from instructor_class ic
where ic.instructor_id=i.id);


select * from student s,class c
where s.class_id = c.id ;

insert into student(`name`,birthday, gender,`point`, class_id) 
 values ('nguyen văn c','1981-12-12',1,8,1);
delete from student;
truncate student;

-- ss5: index, view, sp, function, trigger
-- 1. index
select * from customers;
explain select * from customers where city ='lyon';

create index i_city on customers(city);
drop index i_city on customers;
alter table customers add index i_country(country);
alter table customers drop index i_country;

 select * from student;
 select * from class;
 select * from class_type;

 -- 2.view (tạo view lấy thông tin của học viên)
 create view w_student as
select s.id, s.name, s.gender, s.email ,c.name as class_name,c.class_type_id from student s 
join class c on s.class_id = c.id;
create view w_class_type as
select * from class_type;
 -- sử dụng view
select * from w_student s
join w_class_type ct on s.class_type_id=ct.id ;

 
-- 3.1  tạo một sp không tham số  để lấy danh sách student
delimiter //
create procedure sp_get_all_student()
begin 
select * from student;
end //
delimiter ;
-- goi sp
call sp_get_all_student();

-- 3.2 sp có tham số in để lấy ra học viên có tham số id
delimiter //
create procedure sp_get_student_by_id(IN p_id int)
begin 
select * from student where id = p_id;
end //
delimiter ;
 
 call sp_get_student_by_id(1);
 call sp_get_student_by_id(12);

-- 3.3 sp đếm số lượng học viên của trung tâm sử dụng OUT param
delimiter //
create procedure sp_count_student(out p_so_luong int)
begin 
select count(*) into p_so_luong from student;
end //
delimiter ;

-- gọi sp
call sp_count_student(@sl);
select @sl;

-- 4 viêt 1 function xếp loại học lưc theo point

-- sử dụng function


-- 5 tạo trigger tự động tạo tài khoản jame trước khi thêm mới một học viên


















































