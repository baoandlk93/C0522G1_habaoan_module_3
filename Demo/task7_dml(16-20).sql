-- 16.Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.
SET SQL_SAFE_UPDATES = 0;
DELETE FROM nhan_vien
WHERE ma_nhan_vien NOT IN (SELECT ma_nhan_vien
						   FROM hop_dong 
						   WHERE YEAR(ngay_lam_hop_dong) BETWEEN 2019 AND 2021
						   GROUP BY ma_nhan_vien);
			
-- DELETE FROM nhan_vien
-- WHERE ma_nhan_vien NOT IN (SELECT * FROM nhanvien);
--        
-- CREATE VIEW nhanvien AS
-- SELECT nv.ma_nhan_vien
-- 	   FROM nhan_vien as nv
-- 	   INNER JOIN hop_dong hd
-- 		ON nv.ma_nhan_vien = hd.ma_nhan_vien
-- 	   WHERE YEAR(hd.ngay_lam_hop_dong)  BETWEEN 2019 AND 2021
--        GROUP BY nv.ma_nhan_vien;

   
-- 17.Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
--  chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.       
UPDATE khach_hang 
SET ma_loai_khach = 1
WHERE ma_khach_hang IN ( SELECT * FROM ( SELECT kh.ma_khach_hang
										 FROM khach_hang kh
										 INNER JOIN loai_khach lk
											ON kh.ma_loai_khach = lk.ma_loai_khach
										 WHERE lk.ten_loai_khach = 'Platinium' AND kh.ma_khach_hang IN(SELECT kh.ma_khach_hang
																									   FROM khach_hang kh
																									   INNER JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
																									   INNER JOIN dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
																									   INNER JOIN hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
																									   INNER JOIN dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
																									   WHERE IFNULL((dv.chi_phi_thue + dvdk.gia * hdct.so_luong),0) > 1000000
																									   GROUP BY kh.ma_khach_hang)) tb1);

-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).
DELETE FROM khach_hang
WHERE ma_khach_hang IN (SELECT * FROM ( SELECT kh.ma_khach_hang
										FROM khach_hang kh
										INNER JOIN hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
										WHERE hd.ngay_lam_hop_dong < '2021-01-01') tb1);
                                        
-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.                                        
UPDATE dich_vu_di_kem
SET gia = gia * 2  
WHERE ma_dich_vu_di_kem IN ( SELECT * FROM ( SELECT dvdk.ma_dich_vu_di_kem 
											 FROM dich_vu_di_kem dvdk
											 INNER JOIN hop_dong_chi_tiet hdct ON dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
											 INNER JOIN hop_dong hd ON hdct.ma_hop_dong = hd.ma_hop_dong
											 WHERE hdct.so_luong > 10 AND YEAR(hd.ngay_lam_hop_dong) = 2020) tb1);

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, thông tin hiển thị bao gồm id
--  (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

SELECT ma_nhan_vien id , ho_ten , email, so_dien_thoai, ngay_sinh, dia_chi
FROM nhan_vien
UNION ALL
SELECT ma_khach_hang id , ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi
FROM khach_hang;

SELECT * FROM nhan_vien;
SELECT * FROM khach_hang;
       SELECT * FROM dich_vu;
       SELECT * FROM dich_vu_di_kem;
       SELECT * FROM hop_dong_chi_tiet;
SELECT * FROM nhan_vien;
SELECT * FROM hop_dong;
SELECT * FROM khach_hang;
SELECT * FROM ten_loai_khach;