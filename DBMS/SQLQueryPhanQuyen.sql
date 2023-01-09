﻿USE ShoeStore
-- tạo nhóm quyền
CREATE ROLE Adminitrator
CREATE ROLE NhanVien
-- cấp quyền cho nhóm
GRANT SELECT,INSERT,UPDATE,DELETE ON dbo.CHITIETHOADON TO Adminitrator WITH GRANT OPTION
GRANT SELECT,INSERT,UPDATE,DELETE ON dbo.CHITIETNHAPKHO TO Adminitrator WITH GRANT OPTION
GRANT SELECT,INSERT,UPDATE,DELETE ON dbo.GIAY TO Adminitrator WITH GRANT OPTION
GRANT SELECT,INSERT,UPDATE,DELETE ON dbo.HANGGIAY TO Adminitrator WITH GRANT OPTION
GRANT SELECT,INSERT,UPDATE,DELETE ON dbo.HOADON TO Adminitrator WITH GRANT OPTION
GRANT SELECT,INSERT,UPDATE,DELETE ON dbo.KHACHHANG TO Adminitrator WITH GRANT OPTION
GRANT SELECT,INSERT,UPDATE,DELETE ON dbo.LOAIGIAY TO Adminitrator WITH GRANT OPTION
GRANT SELECT,INSERT,UPDATE,DELETE ON dbo.NHACUNgCAP TO Adminitrator WITH GRANT OPTION
GRANT SELECT,INSERT,UPDATE,DELETE ON dbo.NHANVIEN TO Adminitrator WITH GRANT OPTION
GRANT SELECT,INSERT,UPDATE,DELETE ON dbo.NHAPKHO TO Adminitrator WITH GRANT OPTION
Grant execute to Adminitrator
Grant Select to Adminitrator

GRANT SELECT ON dbo.KHACHHANG TO NhanVien WITH GRANT OPTION
GRANT SELECT ON dbo.GIAY TO NhanVien WITH GRANT OPTION
GRANT SELECT,INSERT ON dbo.HOADON TO NhanVien WITH GRANT OPTION
GRANT SELECT,INSERT ON dbo.CHITIETHOADON TO NhanVien WITH GRANT OPTION

-- thực thi các stored
-- tạo login
CREATE LOGIN admin1 WITH PASSWORD = '123'
CREATE LOGIN Nhanvien WITH PASSWORD = '123'
-- tạo user
CREATE USER  admin1 FOR LOGIN admin1
CREATE USER nhanvien FOR LOGIN Nhanvien
-- phân quyền cho user
go
SP_addRoleMember 'Adminitrator','admin1'
go
SP_addRoleMember 'NhanVien','nhanvien'