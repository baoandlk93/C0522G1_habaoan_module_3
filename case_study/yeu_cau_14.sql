/*
14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
(được tính dựa trên việc count các ma_dich_vu_di_kem).
*/

use furama_resort;
SELECT 
    hd.ma_hop_dong,
    ldv.ten_loai_dich_vu,
    dvdk.ten_dich_vu_di_kem,
    SUM(hdct.so_luong) AS so_lan_su_dung
FROM
    dich_vu_di_kem dvdk
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        LEFT JOIN
    hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN
    dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
        LEFT JOIN
    loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
GROUP BY dvdk.ma_dich_vu_di_kem
HAVING so_lan_su_dung = (SELECT 
        COUNT(so_luong)
    FROM
        hop_dong_chi_tiet
    GROUP BY ma_hop_dong_chi_tiet
    ORDER BY COUNT(so_luong)
    LIMIT 1)


