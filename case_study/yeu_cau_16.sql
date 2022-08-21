/*
16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
*/
use furama_resort;
SET SQL_SAFE_UPDATES = 0;
update nhan_vien set trang_thai = 0
where ma_nhan_vien not in (select ma_nhan_vien from hop_dong)
;

select * from nhan_vien;