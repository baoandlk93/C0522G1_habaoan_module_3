/*
15.	Hiển thi thông tin của tất cả nhân viên bao gồm 
ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
*/

use furama_resort;
SELECT 
    nv.ma_nhan_vien,
    nv.ho_va_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi,
    COUNT(hd.ma_hop_dong) AS so_hop_dong
FROM
    nhan_vien nv
        JOIN
    trinh_do td ON td.ma_trinh_do = nv.ma_trinh_do
        JOIN
    bo_phan bp ON bp.ma_bo_phan = nv.ma_bo_phan
        JOIN
    hop_dong hd ON hd.ma_nhan_vien = nv.ma_nhan_vien
GROUP BY nv.ma_nhan_vien
HAVING so_hop_dong <= 3
;



select *,count(ma_hop_dong) from hop_dong group by ma_nhan_vien;
select * from hop_dong;