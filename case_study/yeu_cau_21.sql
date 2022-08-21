/*
21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu” 
và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
*/
use furama_resort;
drop view if exists v_nhan_vien;
CREATE VIEW v_nhan_vien AS
    SELECT 
        *
    FROM
        nhan_vien
    WHERE
        dia_chi LIKE '%Hải Châu%'
            AND ma_nhan_vien IN (SELECT 
                ma_nhan_vien
            FROM
                hop_dong
            WHERE
                ngay_lam_hop_dong = '2019/12/12');
select * from v_nhan_vien;