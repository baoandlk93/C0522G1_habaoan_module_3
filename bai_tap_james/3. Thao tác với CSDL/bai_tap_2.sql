use quan_ly_ban_hang;
insert into customer(customer_name,customer_age)
values
('Minh Quan',10),
('Ngoc Oanh',20),
('Hong Ha',50);

insert into oder(customer_id,oder_date,oder_total_price)
values
(1,'2006-03-21',null),
(2,'2006-03-23',null),
(1,'2006-03-16',null);

insert into product(product_id,product_name,product_price)
values
(1,'May Giat',3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2);

insert into oder_detail(oder_id,product_id,oder_qty)
values
(1,1,3),
(1,3,7),
(1,4,2),
(2,1,1),
(3,1,8),
(2,5,4),
(2,3,3)
;

select oder_id,oder_date,oder_total_price
from oder
;

select customer_name,product_name
from customer
join oder on oder.customer_id = customer.customer_id
join oder_detail od on  od.oder_id = oder.oder_id
join product on product.product_id = od.product_id
;

select customer_name, count(oder.customer_id) as so_luong
from customer
left join oder on oder.customer_id = customer.customer_id
group by oder.customer_id
having so_luong =0
;

select oder.oder_id,oder.oder_date,sum(oder_detail.oder_qty*product.product_price) as tong_tien_hoa_don
from oder
join oder_detail on oder_detail.oder_id = oder.oder_id
join product on product.product_id = oder_detail.product_id
group by oder.oder_id
