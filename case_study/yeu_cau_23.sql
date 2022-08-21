/*
23.	Tạo Stored Procedure sp_xoa_khach_hang 
dùng để xóa thông tin của một khách hàng nào đó với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
*/
drop procedure sp_xoa_khach_hang;
use furama_resort;
delimiter //
create procedure sp_xoa_khach_hang(in p_ma_khach_hang int)
begin
update khach_hang set trang_thai = 0 where ma_khach_hang = p_ma_khach_hang;
end //
delimiter ;

call sp_xoa_khach_hang(1);