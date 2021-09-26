USE furama_resort;
-- VI TRI
INSERT INTO vi_tri (ten_vi_tri)
-- VALUES (1,'Le_Tan'),(2,'Phuc_Vu'),(3,'Chuyen_Vien'),(4,'Giam_Sat'),(5,'Quan_Ly'),(6,'Giam_Doc');
VALUES ('Le_Tan'),('Phuc_Vu'),('Chuyen_Vien'),('Giam_Sat'),('Quan_Ly'),('Giam_Doc');

-- TRINH DO
INSERT INTO trinh_do (trinh_do)
VALUES ('Trung_Cap'),('Cao_Dang'),('Dai_Hoc'),('Sau_Dai_Hoc');

-- BO_PHAN
INSERT INTO bo_phan (ten_bo_phan)
VALUES ('Sale_Marketing'),('Hanh-Chinh'),('Phuc_Vu'),('Quan_Ly');

-- NHAN_VIEN
INSERT INTO nhan_vien (ho_ten, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, sdt, email, dia_chi)
VALUES 
('Nguyen Van Bach', 1, 3, 2, '1991-03-04','987245824','7500000','0127482937','nguyenvanbach@gmail.com','Da Nang'),
('Nguyen Hoang Anh', 3, 3, 4, '1988-09-26','754825582','9000000','0895349357','nguyenhoanganh@gmail.com','Quang Binh'),
('Le Truc Diem', 2, 1, 3, '1999-01-28','445274527','5800000','0376728167','letrucdiem@gmail.com','Quang Tri'),
('Tran Quoc Minh', 5, 4, 4, '1993-02-01','972514304','14500000','0957182507','tranquocminh@gmail.com','Thua Thien Hue'),
('Le Bao Binh', 4, 2, 4, '1989-06-19','673548264','9300000','0371835477','lebaobinh@gmail.com','Nghe An'),
('Pham Minh Tuyet', 6, 4, 4, '1983-09-08','736492640','20500000','0384274999','phamminhtuyet@gmail.com','Da Nang'), -- giam doc
('Phan Tuong Vy', 3, 3, 1, '1995-02-18','075374926','8800000','0906556182','phantuongvy@gmail.com','Quang Tri'),
('Nguyen Ba Vinh', 2, 1, 3, '2000-05-27','012839475','5400000','0827364758','nguyenbavinh@gmail.com','Quang Ngai'),
('Tran Quoc Thien', 5, 3, 3, '1990-01-18','6472916394','9500000','0975325753','tranquocthien@gmail.com','Ha Tinh'),
('Le Minh Thu', 1, 2, 2, '1997-11-27','860973840','6800000','0238472839','leminhthu@gmail.com','Da Nang'),
('Nguyen Hung Dung', 4, 4, 4, '1986-06-09','6274926402','11500000','0835472846','nguyenhungdung@gmail.com','Ha Noi'),
('Le Thao Nguyen', 2, 1, 3, '1999-10-09','983629154','6500000','0136825624','lethaonguyen@gmail.com','Da Nang'),
('Nguyen Minh Tien', 4, 3, 2, '1988-09-26','8745274926','98000000','0982872632','nguyenminhtien@gmail.com','Quang Binh'),
('Le Thanh Hang', 5, 3, 4, '1985-01-20','735628846','14800000','0826467293','lethanhhang@gmail.com','Quang Tri'),
('Tran Van Anh', 2, 2, 3, '1998-09-01','0986243642','6500000','0967424636','tranvananh@gmail.com','Thua Thien Hue');

-- LOAI KHACH
INSERT INTO loai_khach (ten_loai_khach)
VALUES ('Diamond'),('Platinium'),('Gold'),('Silver'),('Member');

-- KHACH HANG
INSERT INTO khach_hang (id_loai_khach, ho_ten, ngay_sinh, so_cmnd, sdt, email, dia_chi)
VALUES 
(1,'Tran Van Bao','1990-05-09', '562738462','0987652431','tranvanbao@gmail.com','Da Nang'),
(2,'Tran Ba Minh','1980-12-15', '017354824','0129525794','baminh@gmail.com','Hung Yen'),
(4,'Nguyen Tran Nhat Khang','1993-06-29', '017349163','0392174902','nhatkhang@gmail.com','Khanh Hoa'),
(5,'Le Minh Huy','1995-02-03', '391048192','0962692790','tranminhhuy@gmail.com','Nghe An'),
(3,'Phan Nhat Anh','1992-09-12', '016243912','0981357368','nhatanh@gmail.com','Quang Tri'),
(2,'Le Van Quoc Trung','1994-07-15', '8162043612','0981234900','quoctrung@gmail.com','Hai Duong'),
(4,'Ho Dieu Hien','1988-04-17', '915293613','0961284278','dieuhien@gmail.com','Ben Tre'),
(1,'Dinh Van Quang','1989-03-19', '982630173','0123590122','dinhquang@gmail.com','Ha Noi'),
(4,'Le Nguyen Hung Dung','1987-02-20', '096273826','0367802113','hungdung@gmail.com','Bac Ninh'),
(2,'Nguyen Cong Phuong','2012-11-26', '125028462','07345129021','nguyencongphuong@gmail.com','Quang Tri'),
(3,'Tran Minh Phuc','1993-01-19', '524505262','0896237411','tranminhphuc@gmail.com','Ha Tinh');

-- KIEU THUE
INSERT INTO kieu_thue (ten_kieu_thue,gia)
VALUES ('nam',20000000),('thang',2500000),('ngay',350000),('gio',200000);

-- LOAI DICH VU
INSERT INTO loai_dich_vu (ten_loai_dich_vu)
VALUES ('villa'),('house'),('room');

-- DICH VU
INSERT INTO dich_vu (ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, id_loai_dich_vu, trang_thai)
VALUES
('Villa1',300,4,15,20000000,1,1,'moi'),
('Villa2',230,2,9,350000,3,1,'moi'),
('House',90,3,8,2500000,2,2,'moi'),
('Room1',45,1,3,200000,4,3,'moi'),
('Room2',60,1,4,200000,4,3,'moi');

-- HOP DONG
INSERT INTO hop_dong (id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien)
VALUES
(1, 1, 1, '2018-09-03','2018-09-03',2000000,20000000),
(10, 5, 3, '2021-02-15','2021-03-15',500000,2500000),
(2, 8, 5, '2021-08-18','2021-08-18',200000,200000),
(3, 2, 1, '2020-06-03','2021-06-03',3500000,20000000),
(10, 5, 3, '2021-05-01','2021-05-01',500000,2500000),
(7, 10, 5, '2021-09-20','2021-09-20',200000,200000),
(15, 2, 1, '2021-12-12','2022-12-12',4000000,20000000),
(15, 2, 4, '2019-01-05','2019-01-06',4000000,20000000),
(10, 9, 3, '2021-08-15','2021-09-15',500000,2500000),
(10, 8, 3, '2019-02-15','2019-03-15',500000,2500000),
(1, 11, 5, '2021-03-14','2021-03-14',200000,200000);

-- DICH VU DI KEM
INSERT INTO dich_vu_di_kem (ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung)
VALUES
('massage',300000,1,'tot'), ('karaoke', 120000,1,'tot'), ('thuc_an',50000,1,'tot'),('nuoc', 20000,1,'tot'),( 'thue_xe', 1200000, 1, 'tot');

-- HOP DONG CHI TIET
INSERT INTO hop_dong_chi_tiet (id_hop_dong, id_dich_vu_di_kem, so_luong)
VALUES
(1,2,1), (2,1,3), (3,3,1), (4,4,10), (5,5,1), (6,3,3),(6,4,3);