drop database if exists quan_ly_cua_hang;
create database quan_ly_cua_hang;
use quan_ly_cua_hang;
create table product(
id int auto_increment primary key,
product_code varchar(45),
product_name varchar(45),
product_price varchar(45),
product_amount int,
product_descrition varchar(45),
product_status varchar(45)
);

insert into product(product_code,product_name,product_price,product_amount,product_descrition,product_status)
values
('1','đồ chơi con nít','1006000','2','Đồ chơi con nít','còn hàng'),
('2','đồ chơi con nít','1500000','2','Đồ chơi con nít','còn hàng'),
('3','đồ chơi con nít','1000400','2','Đồ chơi con nít','còn hàng'),
('4','đồ chơi con nít','10000022','2','Đồ chơi con nít','còn hàng'),
('5','đồ chơi con nít','10000012','2','Đồ chơi con nít','còn hàng'),
('6','đồ chơi con nít','10000034','2','Đồ chơi con nít','còn hàng'),
('7','đồ chơi con nít','100000','2','Đồ chơi con nít','còn hàng'),
('8','đồ chơi con nít','1000005','2','Đồ chơi con nít','còn hàng'),
('9','đồ chơi con nít','1000004','2','Đồ chơi con nít','còn hàng'),
('10','đồ chơi con nít','1000003','2','Đồ chơi con nít','còn hàng'),
('11','đồ chơi con nít','1000002','2','Đồ chơi con nít','còn hàng'),
('12','đồ chơi con nít','1000001','2','Đồ chơi con nít','còn hàng'),
('13','đồ chơi con nít','1000000000','2','Đồ chơi con nít','còn hàng'),
('14','đồ chơi con nít','100000000','2','Đồ chơi con nít','còn hàng'),
('15','đồ chơi con nít','10000000','2','Đồ chơi con nít','còn hàng'),
('16','đồ chơi con nít','1000000','2','Đồ chơi con nít','còn hàng')
;


-- tạo index
alter table product add index i_product(product_code); 
-- tạo composite index
alter table product add index i_composite_product(product_name,product_price); 

-- xóa index
drop index i_product on product;

-- test index
explain select * from product where product_code = '1';

-- tạo view
create view w_product as 
select product_code,product_name,product_price,product_status 
from product;

-- hiển thị view
select * from w_product;

-- Sửa record trong view
update w_product 
set 
product_name = 'Áo phao'
where product_code = '5';

-- sửa view
alter view w_product
as 
select id, product_code,product_name,product_price,product_status 
from product;

-- xóa view
drop view w_product;

-- tạo SP lấy tất cả thông tin trong product
delimiter //
create procedure p_get_all()
begin
select * from product;
end //
delimiter ;

call p_get_all();

-- tạo SP thêm sản phẩm mới
delimiter //
create procedure p_insert_new(in p_code varchar(45),p_name varchar(45),p_price varchar(45),p_amount varchar(45),p_descrition varchar(45),p_status varchar(45))
begin
insert into product(product_code,product_name,product_price,product_amount,product_descrition,product_status)
values (p_code,p_name,p_price,p_amount,p_descrition,p_status);
end //
delimiter ;

call p_insert_new('2','Quần short','500000','4','Quần ngắn','Còn hàng')

delimiter //
create procedure p_update_by_id(in p_id int, p_code varchar(45),p_name varchar(45),p_price varchar(45),p_amount varchar(45),p_descrition varchar(45),p_status varchar(45))
begin
update product 
set product_code = p_code,
product_name = p_name,
product_price = p_price ,
product_amount = p_amount,
product_descrition = p_descrition,
product_status = p_status
where id = p_id;
end //
delimiter ;

call p_update_by_id(5,'2','Quần short','500000','4','Quần ngắn','Còn hàng')


delimiter //
create procedure p_remove(in p_id int)
begin
delete from product where id = p_id;
end //
delimiter ;

call p_get_all();