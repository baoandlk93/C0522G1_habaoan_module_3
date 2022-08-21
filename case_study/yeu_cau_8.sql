/*
8.	Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên.
*/
use furama_resort;

-- c1
SELECT 
    ma_khach_hang, ho_ten
FROM
    khach_hang
GROUP BY ho_ten
;
-- c2
SELECT DISTINCT
    ma_khach_hang, ho_ten
FROM
    khach_hang

;
-- c3
SELECT 
    ho_ten
FROM
    khach_hang 
UNION SELECT 
    ho_ten
FROM
    khach_hang