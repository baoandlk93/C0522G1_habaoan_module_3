/*
24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong 
với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung, 
với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan
*/
drop procedure sp_them_moi_hop_dong;
use furama_resort;
delimiter //
create procedure sp_them_moi_hop_dong(p_ma_hd int,p_ngay_lam_hd datetime,p_ngay_ket_thuc_hd datetime,p_tien_dat_coc double,p_ma_nhan_vien int,p_ma_khach_hang int,p_ma_dich_vu int)
begin
if (p_ma_hd not in (select ma_hop_dong from hop_dong order by ma_hop_dong))
and(datediff(curdate(),p_ngay_lam_hd)<datediff(curdate(),p_ngay_ket_thuc_hd))
and((datediff(curdate(),p_ngay_ket_thuc_hd)>datediff(curdate(),p_ngay_ket_thuc_hd)))
and(p_tien_dat_coc > 0)
and(p_ma_nhan_vien in(select ma_nhan_vien from nhan_vien order by ma_nhan_vien))
and(p_ma_khach_hang in(select ma_khach_hang from khach_hang order by ma_khach_hang))
and(p_ma_dich_vu in(select ma_dich_vu from dich_vu))
 then
insert into hop_dong(ma_hop_dong,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,ma_nhan_vien,ma_khach_hang,ma_dich_vu)
values(p_ma_hd,p_ngay_lam_hd,p_ngay_ket_thuc_hd,p_tien_dat_coc,p_ma_nhan_vien,p_ma_khach_hang,p_ma_dich_vu)
;
end if;
end //
delimiter ;



call sp_them_moi_hop_dong('14','2022-03-01','2022-03-20','3000','1','2','3');