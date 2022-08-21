/*
11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng 
có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
*/

use furama_resort;

SELECT 
    dvdk.`ten_dich_vu_di_kem`,
    kh.ho_ten,
    lk.ten_loai_khach,
    kh.dia_chi
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
WHERE
    (kh.dia_chi LIKE '%Vinh'
        OR kh.dia_chi LIKE '%Quảng Ngãi')
        AND lk.ten_loai_khach = 'Diamond'
;

