create database if not exists quan_ly_ban_hang;
create table customer(
customer_id int auto_increment primary key,
customer_name varchar(45),
customer_age int
);

create table oder(
oder_id int primary key auto_increment,
customer_id int,
oder_date date,
oder_total_price double,
foreign key(customer_id) references customer(customer_id)
);

create table product(
product_id int primary key,
product_name varchar(45),
product_price double
);

create table oder_detail(
oder_id int,
product_id int,
oder_qty int,
primary key(oder_id,product_id),
foreign key(oder_id) references oder(oder_id),
foreign key(product_id) references product(product_id)
);