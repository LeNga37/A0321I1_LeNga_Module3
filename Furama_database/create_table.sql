DROP DATABASE furama_resort;
CREATE DATABASE furama_resort;
USE furama_resort;
CREATE TABLE vi_tri(
id_vi_tri INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ten_vi_tri VARCHAR(45) DEFAULT NULL
);

CREATE TABLE trinh_do(
id_trinh_do INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
trinh_do VARCHAR(45) DEFAULT NULL
);

CREATE TABLE bo_phan(
id_bo_phan INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ten_bo_phan VARCHAR(45) DEFAULT NULL
);

CREATE TABLE nhan_vien(
id_nhan_vien INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
ho_ten VARCHAR(45) DEFAULT NULL,
id_vi_tri INT DEFAULT NULL,
CONSTRAINT vi_tri_nhan_vien FOREIGN KEY (id_vi_tri) REFERENCES vi_tri (id_vi_tri),
id_trinh_do INT DEFAULT NULL,
CONSTRAINT trinh_do_nhan_vien FOREIGN KEY (id_trinh_do) REFERENCES trinh_do (id_trinh_do),
id_bo_phan INT DEFAULT NULL,
CONSTRAINT bo_phan_nhan_vien FOREIGN KEY (id_bo_phan) REFERENCES bo_phan (id_bo_phan),
ngay_sinh DATE DEFAULT NULL,
so_cmnd VARCHAR(45)DEFAULT NULL,
luong VARCHAR(45)DEFAULT NULL,
sdt VARCHAR(45)DEFAULT NULL,
email VARCHAR(45)DEFAULT NULL,
dia_chi VARCHAR(45)DEFAULT NULL
);

CREATE TABLE loai_khach(
id_loai_khach INT NOT NULL PRIMARY KEY,
ten_loai_khach VARCHAR(45)DEFAULT NULL
);

CREATE TABLE khach_hang(
id_khach_hang INT NOT NULL PRIMARY KEY,
id_loai_khach INT DEFAULT NULL,
CONSTRAINT khach_hang FOREIGN KEY (id_loai_khach) REFERENCES loai_khach (id_loai_khach),
ho_ten VARCHAR(45) DEFAULT NULL,
ngay_sinh DATE DEFAULT NULL,
so_cmnd VARCHAR(45)DEFAULT NULL,
luong VARCHAR(45)DEFAULT NULL,
sdt VARCHAR(45)DEFAULT NULL,
email VARCHAR(45)DEFAULT NULL,
dia_chi VARCHAR(45)DEFAULT NULL
);

CREATE TABLE kieu_thue(
id_kieu_thue INT NOT NULL PRIMARY KEY,
ten_kieu_thue VARCHAR(45)DEFAULT NULL,
gia INT DEFAULT NULL
);

CREATE TABLE loai_dich_vu(
id_loai_dich_vu INT NOT NULL PRIMARY KEY,
ten_loai_dich_vu VARCHAR(45)DEFAULT NULL
);

CREATE TABLE dich_vu(
id_dich_vu INT NOT NULL PRIMARY KEY,
ten_dich_vu VARCHAR(45)DEFAULT NULL,
dien_tich INT DEFAULT NULL,
so_tang INT DEFAULT NULL,
so_nguoi_toi_da VARCHAR(45)DEFAULT NULL, -- kdl dung chua?
chi_phi_thue VARCHAR(45)DEFAULT NULL, -- kdl dung chua?
id_kieu_thue INT DEFAULT NULL,
CONSTRAINT kieu_thue_dich_vu FOREIGN KEY (id_kieu_thue) REFERENCES kieu_thue (id_kieu_thue),
id_loai_dich_vu INT DEFAULT NULL,
CONSTRAINT loai_dich_vu FOREIGN KEY (id_loai_dich_vu) REFERENCES loai_dich_vu (id_loai_dich_vu),
trang_thai VARCHAR(45)DEFAULT NULL
);

CREATE TABLE hop_dong(
id_hop_dong INT NOT NULL PRIMARY KEY,
id_nhan_vien INT DEFAULT NULL,
CONSTRAINT nhan_vien_lam_hop_dong FOREIGN KEY (id_nhan_vien) REFERENCES nhan_vien (id_nhan_vien),
id_khach_hang INT DEFAULT NULL,
CONSTRAINT khach_hang_thue FOREIGN KEY (id_khach_hang) REFERENCES khach_hang (id_khach_hang),
id_dich_vu INT DEFAULT NULL,
CONSTRAINT dich_vu_thue FOREIGN KEY (id_dich_vu) REFERENCES dich_vu (id_dich_vu),
ngay_lam_hop_dong DATE DEFAULT NULL,
ngay_ket_thuc DATE DEFAULT NULL,
tien_dat_coc INT DEFAULT NULL,
tong_tien INT DEFAULT NULL
);

CREATE TABLE dich_vu_di_kem(
id_dich_vu_di_kem INT NOT NULL PRIMARY KEY,
ten_dich_vu_di_kem VARCHAR(45)DEFAULT NULL,
gia INT DEFAULT NULL,
don_vi INT DEFAULT NULL,
trang_thai_kha_dung VARCHAR(45)DEFAULT NULL
);

CREATE TABLE hop_dong_chi_tiet(
id_hop_dong_chi_tiet INT NOT NULL PRIMARY KEY,
id_hop_dong INT DEFAULT NULL,
CONSTRAINT so_hop_dong FOREIGN KEY (id_hop_dong) REFERENCES hop_dong (id_hop_dong),
id_dich_vu_di_kem INT DEFAULT NULL,
CONSTRAINT dich_vu_di_kem FOREIGN KEY (id_dich_vu_di_kem) REFERENCES dich_vu_di_kem (id_dich_vu_di_kem),
so_luong INT DEFAULT NULL
);
