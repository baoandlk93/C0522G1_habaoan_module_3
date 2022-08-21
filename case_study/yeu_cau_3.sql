SELECT 
    ma_khach_hang, ho_ten, dia_chi, ngay_sinh
FROM
    khach_hang
WHERE
    ((dia_chi REGEXP 'Quảng trị$'
        OR dia_chi REGEXP 'Đà Nẵng$')
        AND (ROUND(DATEDIFF(CURDATE(), ngay_sinh) / 365, 0) <= 50
        AND ROUND(DATEDIFF(CURDATE(), ngay_sinh) / 365, 0) >= 18))
;