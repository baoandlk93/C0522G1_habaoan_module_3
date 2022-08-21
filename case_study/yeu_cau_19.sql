-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.                                        
SET SQL_SAFE_UPDATES = 0;
UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem IN (SELECT 
            *
        FROM
            (SELECT 
                dvdk.ma_dich_vu_di_kem
            FROM
                dich_vu_di_kem dvdk
            JOIN hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
            JOIN hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
            WHERE
                hdct.so_luong > 10
                    AND YEAR(hd.ngay_lam_hop_dong) = 2020) tb1);
                                             
 SELECT 
    dvdk.ma_dich_vu_di_kem, hdct.so_luong, dvdk.gia
FROM
    dich_vu_di_kem dvdk
        JOIN
    hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
        JOIN
    hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
WHERE
    hdct.so_luong > 10
        AND YEAR(hd.ngay_lam_hop_dong) = 2020;