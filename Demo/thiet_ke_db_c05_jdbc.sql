create database if not exists a0222g1;
use a0222g1;
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

-- 5 tạo trigger tự động tạo tài khoản jame trước khi thêm mới một học viên

DELIMITER //
CREATE TRIGGER tr_auto_create_jame 
BEFORE INSERT ON student
FOR EACH ROW
BEGIN
insert into jame(`account`, `password`) values ( new.email, '123');
END //
DELIMITER ;
select s.id,s.name,s.point,s.email,c.name as class_name from student s
join class c on s.class_id=c.id;

-- tạo sp tìm kiếm theo 3 trường
delimiter //
create procedure search(in p_name varchar(50), in p_account varchar(50), in p_class_id varchar(50))
begin
select * from student where name like concat('%',p_name,'%') and account like concat('%',p_account,'%') and class_id like concat('%',p_class_id,'%');
end //
delimiter ;


call search('','','');

select * from student;


delimiter //
create procedure delete_by_id(in p_id int)
begin
delete from student where id = p_id;
end //
delimiter ;
call delete_by_id(18);





