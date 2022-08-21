/*
17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
 chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
*/

use furama_resort;
UPDATE khach_hang 
SET 
    ma_loai_khach = '2'
WHERE
    ma_khach_hang IN (SELECT 
            kh.ma_khach_hang
        FROM
            khach_hang kh
                LEFT JOIN
            loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
                LEFT JOIN
            hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
                LEFT JOIN
            dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
                LEFT JOIN
            hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
                LEFT JOIN
            dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2021
                AND lk.ten_loai_khach = 'Platinium'
                AND IFNULL((dv.chi_phi_thue + hdct.so_luong * dvdk.gia),
                    0) >= 1000000
        GROUP BY hd.ngay_lam_hop_dong)
;

UPDATE khach_hang 
SET 
    ma_loai_khach = '1'
WHERE
    ma_khach_hang = (SELECT 
            kh.ma_khach_hang
        FROM
            khach_hang kh
                LEFT JOIN
            loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
                LEFT JOIN
            hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
                LEFT JOIN
            dich_vu dv ON dv.ma_dich_vu = hd.ma_dich_vu
                LEFT JOIN
            hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hd.ma_hop_dong
                LEFT JOIN
            dich_vu_di_kem dvdk ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
        WHERE
            YEAR(hd.ngay_lam_hop_dong) = 2021
                AND lk.ten_loai_khach = 'Platinium'
                AND IFNULL((dv.chi_phi_thue + hdct.so_luong * dvdk.gia),
                    0) >= 1000000
        GROUP BY kh.ma_khach_hang)
;


;
select * from loai_khach;
select * from khach_hang;