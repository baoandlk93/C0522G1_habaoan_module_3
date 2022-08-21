use furama_resort;

/* 
Hiển thị ma_dich_vu, ten_dich_vu, dien_tich, chi_phi_thue, ten_loai_dich_vu 
của tất cả các loại dịch vụ chưa từng được khách hàng thực hiện đặt 
từ quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3).
*/

SELECT 
    dv.ma_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON ldv.ma_loai_dich_vu = dv.ma_loai_dich_vu
        JOIN
    hop_dong hd ON hd.ma_dich_vu = dv.ma_loai_dich_vu
WHERE
    hd.ma_dich_vu NOT IN (SELECT 
            hop_dong.ma_dich_vu
        FROM
            hop_dong
        WHERE
            (MONTH(ngay_lam_hop_dong) BETWEEN 1 AND 3)
                AND YEAR(ngay_lam_hop_dong) = 2021)
GROUP BY ten_dich_vu

