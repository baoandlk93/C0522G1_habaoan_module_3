drop database if exists furama_resorts;
create database furama_resorts;
use furama_resorts;
CREATE TABLE IF NOT EXISTS position (
    position_code INT PRIMARY KEY,
    position_name VARCHAR(45)
);
CREATE TABLE IF NOT EXISTS degree (
    degree_code INT PRIMARY KEY,
    degree_name VARCHAR(45)
);
CREATE TABLE IF NOT EXISTS department (
    department_code INT PRIMARY KEY,
    department_name VARCHAR(45)
);
CREATE TABLE IF NOT EXISTS employee (
    employee_code INT PRIMARY KEY,
    employee_name VARCHAR(45),
    employee_birthday DATE,
    employee_identifier VARCHAR(45),
    salary DOUBLE,
    employee_phone_number VARCHAR(45),
    employee_email VARCHAR(45),
    employee_address VARCHAR(45),
    position_code INT,
    degree_code INT,
    department_code INT,
    `status` BIT DEFAULT 1,
    FOREIGN KEY (position_code)
        REFERENCES position (position_code),
    FOREIGN KEY (degree_code)
        REFERENCES degree (degree_code),
    FOREIGN KEY (department_code)
        REFERENCES department (department_code)
);
CREATE TABLE IF NOT EXISTS customer_type (
    customer_type_code INT PRIMARY KEY,
    customer_type_name VARCHAR(45)
);
CREATE TABLE IF NOT EXISTS customer (
    customer_code INT PRIMARY KEY,
    customer_type_code INT,
    customer_name VARCHAR(45),
    customer_birthday DATE,
    customer_gender BIT(1),
    customer_idenfitier VARCHAR(45),
    customer_phone_number VARCHAR(45),
    customer_email VARCHAR(45),
    customer_address VARCHAR(45),
    `status` BIT(1),
    FOREIGN KEY (customer_type_code)
        REFERENCES customer_type (customer_type_code)
);
CREATE TABLE IF NOT EXISTS type_service (
    type_service_code INT PRIMARY KEY,
    type_service_name VARCHAR(45)
);
CREATE TABLE IF NOT EXISTS type_rent (
    type_rent_code INT PRIMARY KEY,
    type_rent_name VARCHAR(45)
);
CREATE TABLE IF NOT EXISTS service (
    service_code INT PRIMARY KEY,
    service_name VARCHAR(45),
    service_area INT,
    service_price DOUBLE,
    max_people INT,
    type_rent_code INT,
    type_service_code INT,
    standard_room VARCHAR(45),
    other VARCHAR(45),
    swimming_pool_area DOUBLE,
    floor INT,
    free_service TEXT,
    FOREIGN KEY (type_service_code)
        REFERENCES type_service (type_service_code),
    FOREIGN KEY (type_rent_code)
        REFERENCES type_rent (type_rent_code)
);
CREATE TABLE IF NOT EXISTS service_bonus (
    service_bonus_code INT PRIMARY KEY,
    service_bonus_name VARCHAR(45),
    price DOUBLE,
    unit VARCHAR(10),
    `status` VARCHAR(45)
);
CREATE TABLE IF NOT EXISTS contract (
    contract_code INT PRIMARY KEY,
    contract_date DATETIME,
    contract_end_date DATETIME,
    deposit DOUBLE,
    employee_code INT,
    customer_code INT,
    service_code INT,
    FOREIGN KEY (customer_code)
        REFERENCES customer (customer_code),
    FOREIGN KEY (employee_code)
        REFERENCES employee (employee_code),
    FOREIGN KEY (service_code)
        REFERENCES service (service_code)
);
CREATE TABLE IF NOT EXISTS detailed_contract (
    detailed_contract_code INT PRIMARY KEY,
    contract_code INT,
    service_bonus_code INT,
    amount INT,
    FOREIGN KEY (service_bonus_code)
        REFERENCES service_bonus (service_bonus_code),
    FOREIGN KEY (contract_code)
        REFERENCES contract (contract_code)
);

insert into  position (position_code,position_name)
values(1,'L??? T??n'),
(2,'Ph???c v???'),
(3,'Chuy??n vi??n'),
(4,'Gi??m s??t'),
(5,'Qu???n l??'),
(6,'Gi??m ?????c')
;

insert into degree(degree_code,degree_name)
values(1,'Trung c???p'),
(2,'Cao ?????ng'),
(3,'?????i h???c'),
(4,'Sau ?????i h???c')
;


insert into department(department_code,department_name)
values(1,'Sale-Marketing'),
(2,'H??nh ch??nh'),
(3,'Ph???c v???'),
(4,'Qu???n l??')
;

insert into employee(employee_code,employee_name,employee_birthday,employee_identifier,salary,employee_phone_number,employee_email,employee_address,position_code,degree_code,department_code,status)
values
('1','Nguy???n V??n An','1970-11-07','456231786','10000000','0901234121','annguyen@gmail.com','295 Nguy???n T???t Th??nh,???? N???ng',1,3,1,1),
('2','L?? V??n B??nh','1997-04-09','654231234','7000000','0934212314','binhlv@gmail.com','22 Y??n B??i, ???? N???ng',1,2,2,1),
('3','H??? Th??? Y???n','1995-12-12','999231723','14000000','0412352315','thiyen@gmail.com','K234/11 ??i???n Bi??n Ph???, Gia Lai',1,3,2,1),
('4', 'V?? C??ng To???n','1980-04-04','123231365','17000000', '0374443232','toan0404@gmail.com','77 Ho??ng Di???u, Qu???ng Tr???',1,4,4,1),
('5', 'Nguy???n B???nh Ph??t','1999-12-09', '454363232','6000000','0902341231','phatphat@gmail.com','43 Y??n B??i, ???? N???ng', 2, 1, 1,1),
('6', 'Kh??c Nguy???n An Nghi','2000-11-08','964542311','7000000','0978653213','annghi20@gmail.com','294 Nguy???n T???t Th??nh, ???? N???ng', 2, 2, 3,1),
('7', 'Nguy???n H???u H??','1993-01-01', '534323231','8000000','0941234553','nhh0101@gmail.com','4 Nguy???n Ch?? Thanh, Hu???', 2, 3, 2,1),
('8', 'Nguy???n H?? ????ng','1989-09-03', '234414123','9000000', '0642123111','donghanguyen@gmail.com','111 H??ng V????ng, H?? N???i', 2, 4, 4,1),
('9', 'T??ng Hoang', '1982-09-03', '256781231','6000000', '0245144444','hoangtong@gmail.com','213 H??m Nghi, ???? N???ng', 2, 4, 4,1),
('10', 'Nguy???n C??ng ?????o','1994-01-08','755434343','8000000','0988767111','nguyencongdao12@gmail.com', '6 Ho?? Kh??nh, ?????ng Nai', 2, 3, 2,1);

insert into customer_type(customer_type_code,customer_type_name)
values
(1,'Diamond'),
(2,'Platinium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');

insert into customer(customer_code,customer_name,customer_birthday,customer_gender,customer_idenfitier,customer_phone_number,customer_email,customer_address,status)
values
(1,'Nguy???n Th??? H??o','1970-11-07',0,'643431213','0945423362','thihao07@gmail.com','23 Nguy???n Ho??ng, ???? N???ng',1),
(2,'Ph???m Xu??n Di???u','1992-08-08',1,'865342123','0954333333','xuandieu92@gmail.com','K77/22 Th??i Phi??n, Qu???ng Tr???',1),
(3,'Tr????ng ????nh Ngh???','1990-02-27',1,'488645199','0373213122','nghenhan2702@gmail.com','K323/12 ??ng ??ch Khi??m, Vinh',1),
(4,'D????ng V??n Quan','1981-07-08',1,'543432111','0490039241','duongquan@gmail.com','K453/12 L?? L???i, ???? N???ng',1),
(5,'Ho??ng Tr???n Nhi Nhi','1995-12-09',0,'795453345','0312345678','nhinhi123@gmail.com','224 L?? Th??i T???, Gia Lai',1),
(6,'T??n N??? M???c Ch??u','2005-12-06',0,'732434215','0988888844','tonnuchau@gmail.com','37 Y??n Th???, ???? N???ng',1),
(7,'Nguy???n M??? Kim','1984-04-08',0,'856453123','0912345698','kimcuong84@gmail.com','K123/45 L?? L???i, H??? Ch?? Minh',1),
(8,'Nguy???n Th??? H??o','1999-04-08',0,'965656433','0763212345','haohao99@gmail.com','55 Nguy???n V??n Linh, Kon Tum',1),
(9,'Tr???n ?????i Danh','1994-07-01',1,'432341235','0643343433','danhhai99@gmail.com','24 L?? Th?????ng Ki???t, Qu???ng Ng??i',1),
(10,'Nguy???n T??m ?????c','1989-07-01',1,'344343432','0987654321','dactam@gmail.com','22 Ng?? Quy???n, ???? N???ng',1);

insert into type_rent(type_rent_code,type_rent_name)
values
(1,'year'),
(2,'month'),
(3,'day'),
(4,'hour');

insert into type_service(type_service_code,type_service_name)
values
(1,'Villa'),
(2,'House'),
(3,'Room');

insert into service(service_code,service_name,service_area,service_price,max_people,standard_room,other,swimming_pool_area,floor,free_service,type_rent_code,type_service_code)
values
(1,'Villa Beach Front',25000,1000000,10,'vip','C?? h??? b??i',500,4,null,3,1),
(2,'House Princess 01',14000,5000000,7,'vip','C?? th??m b???p n?????ng',null,3,null,2,2),
(3,'Room Twin 01',5000,1000000,2,'normal','C?? tivi',null,null,'1 Xe m??y, 1 Xe ?????p',4,3),
(4,'Villa No Beach Front',22000,9000000,8,'normal','C?? h??? b??i',300,3,null,3,1),
(5,'House Princess 02',10000,4000000,5,'normal','C?? th??m b???p n?????ng',null,2,null,3,2),
(6,'Room Twin 02',3000,900000,2,'normal','C?? tivi',null,null,'1 Xe m??y',4,3);

insert into service_bonus(service_bonus_code,service_bonus_name,salary,unit,status)
values
(1,'Karaoke',10000,'gi???','ti???n nghi, hi???n t???i'),
(2,'Thu?? xe m??y',10000,'chi???c','h???ng 1 xe'),
(3,'Thu?? xe ?????p',20000,'chi???c','t???t'),
(4,'Buffet bu???i s??ng',15000,'su???t','?????y ????? ????? ??n, tr??ng mi???ng'),
(5,'Buffet bu???i tr??a',90000,'su???t','?????y ????? ????? ??n, tr??ng mi???ng'),
(6,'Buffet bu???i t???i',16000,'su???t','?????y ????? ????? ??n, tr??ng mi???ng');

insert into contract(contract_code,contract_date,contract_end_date,deposit,employee_code,customer_code,service_codedetailed_contract)
values
(1,'2020-12-08','2020-12-08',0,3,1,3),
(2,'2020-07-14','2020-07-21',200000,7,3,1),
(3,'2021-03-15','2021-03-17',50000,3,4,2),
(4,'2021-01-14','2021-01-18',100000,7,5,5),
(5,'2021-07-14','2021-07-15',0,7,2,6),
(6,'2021-06-01','2021-06-03',0,7,7,6),
(7,'2021-09-02','2021-09-05',100000,7,4,4),
(8,'2021-06-17','2021-06-18',150000,3,4,1),
(9,'2020-11-19','2020-11-19',0,3,4,3),
(10,'2021-04-12','2021-04-14',0,10,3,5),
(11,'2021-04-25','2021-04-25',0,2,2,1),
(12,'2021-05-25','2021-05-27',0,7,10,1);

insert into detailed_contract(detailed_contract_code,contract_code,service_bonus_code,amount)
values
(1,5,2,4),
(2,8,2,5),
(3,15,2,6),
(4,1,3,1),
(5,11,3,2),
(6,1,1,3),
(7,2,1,2),
(8,2,12,2);




