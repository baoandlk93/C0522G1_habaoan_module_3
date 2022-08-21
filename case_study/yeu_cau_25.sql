/*
25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.
*/
use furama_resort;
drop table if exists lich_su_xoa_hop_dong;
CREATE TABLE lich_su_xoa_hop_dong (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ma_hop_dong INT,
    ngay_lam_hop_dong DATETIME,
    ngay_ket_thuc DATETIME,
    tien_dat_coc DOUBLE,
    ma_nhan_vien INT,
    ma_khach_hang INT,
    ma_dich_vu INT,
    ngay_xoa DATETIME,
    so_hd_con_lai int
);

drop trigger if exists tr_xoa_hop_dong;

delimiter //
create trigger tr_xoa_hop_dong 
after delete
on hop_dong
for each row
begin 
declare dem int;
select count(ma_hop_dong) into dem from hop_dong;
insert into lich_su_xoa_hop_dong(
ma_hop_dong,
ngay_lam_hop_dong,
ngay_ket_thuc,
tien_dat_coc,
ma_nhan_vien,
ma_khach_hang,
ma_dich_vu,
ngay_xoa,
so_hd_con_lai)
values
(old.ma_hop_dong,
old.ngay_lam_hop_dong,
old.ngay_ket_thuc,
old.tien_dat_coc,
old.ma_nhan_vien,
old.ma_khach_hang,
old.ma_dich_vu,
now(),
dem)
;
end //
delimiter ;

insert into hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
values(15,'2022-03-11','2022-03-15',10000,5,2,6);

set sql_safe_updates = 0;
select * FROM hop_dong where hop_dong.ma_hop_dong = '15';

delete from hop_dong where ma_hop_dong = '15';

select * from lich_su_xoa_hop_dong;