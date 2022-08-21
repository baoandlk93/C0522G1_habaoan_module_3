/*
9.	Thực hiện thống kê doanh thu theo tháng,
 nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng
 */
use furama_resort;

SELECT 
    MONTH(hd.ngay_lam_hop_dong) AS thang,
    COUNT(kh.ma_khach_hang) AS so_khach
FROM
    hop_dong hd
        JOIN
    khach_hang kh ON kh.ma_khach_hang = hd.ma_khach_hang
WHERE
    YEAR(hd.ngay_lam_hop_dong) = 2021
GROUP BY thang
ORDER BY thang
;