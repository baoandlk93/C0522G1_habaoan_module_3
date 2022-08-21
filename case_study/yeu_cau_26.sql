/*
26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, 
cần kiểm tra xem thời gian cập nhật có phù hợp hay không, 
với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày.
Nếu dữ liệu hợp lệ thì cho phép cập nhật,
nếu dữ liệu không hợp lệ thì in ra thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
*/

create table lich_su_cap_nhat_hop_dong(
id int auto_increment primary key,
ma_hop_dong int,

);