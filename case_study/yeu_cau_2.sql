select ma_nhan_vien,ho_va_ten
from nhan_vien
where
 ho_va_ten like 'h%'
or ho_va_ten like't%' 
or ho_va_ten like'k%' 
and length(ho_va_ten) <= 15;