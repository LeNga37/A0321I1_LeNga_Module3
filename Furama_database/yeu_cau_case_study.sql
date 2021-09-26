use furama_resort;
-- Task 2: Hiển thị thông tin tất cả nhân viên có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
select * from nhan_vien 
where (ho_ten like 'H%' or ho_ten like 'T%' or ho_ten like 'K%') and length(ho_ten)<16;

-- Task 3: Hiển thị thông tin tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select *, round(datediff(curdate(), ngay_sinh) / 356, 0) as age from khach_hang
where dia_chi in('Da Nang','Quang Tri')
having age between 18 and 50;

-- Task 4: Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
select khach_hang.ho_ten, count(hop_dong.id_hop_dong) as so_lan_dat_phong from khach_hang inner join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang 
inner join loai_khach on khach_hang.id_loai_khach = loai_khach.id_loai_khach where loai_khach.ten_loai_khach = 'Diamond'
group by khach_hang.id_khach_hang order by so_lan_dat_phong;

-- Task 5: Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) cho tất cả các Khách hàng đã từng đặt phòng. 
-- (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select kh.id_khach_hang, kh.ho_ten, lk.ten_loai_khach , hd.id_hop_dong, dv.ten_dich_vu, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,
sum(dv.chi_phi_thue + hdct.so_luong*dvdk.gia) as tong_tien
from khach_hang kh
left join loai_khach lk on kh.id_loai_khach  = lk.id_loai_khach 
left join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
left join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
left join hop_dong_chi_tiet hdct on hdct.id_hop_dong = hd.id_hop_dong
left join dich_vu_di_kem dvdk on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
group by kh.id_khach_hang;

-- Task 6:	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 
-- (Quý 1 là tháng 1, 2, 3).
select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
from dich_vu dv
inner join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
where not exists (select hop_dong.id_hop_dong from hop_dong where (hop_dong.ngay_lam_hop_dong between 
'2019-01-01' and '2019-03-31') and hop_dong.id_dich_vu = dv.id_dich_vu);

-- Task 7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng 
-- trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
select dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu from dich_vu dv
inner join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
where exists (select hop_dong.id_hop_dong from hop_dong where year(hop_dong.ngay_lam_hop_dong)='2018' and hop_dong.id_dich_vu = dv.id_dich_vu) and
not exists (select hop_dong.id_hop_dong from hop_dong where year(hop_dong.ngay_lam_hop_dong)='2019' and hop_dong.id_dich_vu = dv.id_dich_vu);

-- Task 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- Cách 1
select distinct khach_hang.ho_ten from khach_hang;
-- Cách 2
select khach_hang.ho_ten from khach_hang group by khach_hang.ho_ten;
-- Cách 3
select khach_hang.ho_ten from khach_hang union select khach_hang.ho_ten from khach_hang;

-- Task 9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
select month(hop_dong.ngay_lam_hop_dong) as thang, sum(hop_dong.tong_tien) as doanh_thu,count(hop_dong.id_hop_dong) as so_khach_hang_dat_phong from hop_dong
where year(hop_dong.ngay_lam_hop_dong)='2019'
group by month(hop_dong.ngay_lam_hop_dong);

-- Task 10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, 
-- SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).
select hd.id_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc, count(hdct.id_hop_dong_chi_tiet) as so_luong_dich_vu_di_kem from hop_dong hd
left join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
left join dich_vu_di_kem dvdk on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
group by hd.id_hop_dong;


-- 11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
select khach_hang.ho_ten,dvdk.id_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai_kha_dung from khach_hang
left join hop_dong on khach_hang.id_khach_hang = hop_dong.id_khach_hang
left join hop_dong_chi_tiet on hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
left join dich_vu_di_kem dvdk on hop_dong_chi_tiet.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem;
-- Lỗi trùng lặp thông tin với thông tin NULL

select distinct kh.ho_ten, dvdk.id_dich_vu_di_kem, dvdk.ten_dich_vu_di_kem, dvdk.gia, dvdk.don_vi, dvdk.trang_thai_kha_dung
from khach_hang kh
left join loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
left join hop_dong hd on kh.id_khach_hang = hd.id_khach_hang
left join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
left join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
where lk.ten_loai_khach = "Diamond" and (kh.dia_chi = "Vinh" or  kh.dia_chi = "Quang Ngai");

-- Task 12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), 
-- TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
select hd.id_hop_dong, nv.id_nhan_vien, kh.ho_ten as ho_ten_nhan_vien, kh.sdt as sdt_khach_hang, dv.ten_dich_vu, count(hdct.id_hop_dong_chi_tiet) as so_luong_dich_vu_di_kem, hd.tien_dat_coc 
from nhan_vien nv 
left join hop_dong hd on hd.id_nhan_vien = nv.id_nhan_vien
left join khach_hang kh on kh.id_khach_hang = hd.id_khach_hang
left join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
left join hop_dong_chi_tiet hdct on hdct.id_hop_dong = hd.id_hop_dong
where exists (select hd.id_hop_dong where hd.ngay_lam_hop_dong between '2019-10-01' and '2019-12-31') and
not exists (select hd.id_hop_dong where hd.ngay_lam_hop_dong between '2019-01-01' and '2019-06-30');
-- where exists (select hd.id_hop_dong from hop_dong hd where hd.ngay_lam_hop_dong between '2019-10-01' and '2019-12-31') and
-- not exists (select hd.id_hop_dong from hop_dong hd where hd.ngay_lam_hop_dong between '2019-01-01' and '2019-06-30');
-- 2 câu này không được do đã join ở phía trên rồi xuống lại gọi lần nữa nên không lấy phần join được ở trên
-- where exists (select hd.id_hop_dong from hop_dong hd where (hd.ngay_lam_hop_dong between '2019-10-01' and '2019-12-31') and hd.id_dich_vu = dv.id_dich_vu) and
-- not exists (select hd.id_hop_dong from hop_dong hd where (hd.ngay_lam_hop_dong between '2019-01-01' and '2019-06-30') and hd.id_dich_vu = dv.id_dich_vu);

-- Task 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).






