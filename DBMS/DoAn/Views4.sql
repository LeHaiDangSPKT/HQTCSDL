--VIEW (Đã kiểm tra đủ)
--1.Hien thi giay ban duoc
go 
create view v_giaybanduoc
as 
select g.idGiay ,lg.tenLoaiGiay,hd.thanhTien,hd.soLuong
from CHITIETHOADON as hd ,LOAIGIAY as lg ,GIAY as g
where hd.idGiay = g.idGiay and g.idLoaiGiay =lg.idLoaiGiay

select distinct idGiay ,tenLoaiGiay ,thanhTien ,soLuong from v_giaybanduoc

--2.Hien thi thong tin khach hang theo don hang ho da dat 
go
create view v_khachhang_hoadon
as
select hd.idHoaDon ,kh.idKH ,kh.tenKH,kh.sdt,kh.tongTien,kh.status
from KHACHHANG as kh ,HOADON as hd
where hd.idKH =kh.idKH
select distinct * from v_khachhang_hoadon

--3.Hien thi thong tin ten loai giay ,ma loai giay theo id loai giay 
go
create view v_thongtingiay
as
select LOAIGIAY.idLoaiGiay, tenLoaiGiay, maLoaiGiay,GIAY.idGiay
from LOAIGIAY,GIAY 
where LOAIGIAY.idLoaiGiay = GIAY.idLoaiGiay

select * from v_thongtingiay order by maLoaiGiay
--4.Load danh sach kho
go
create view v_loaddanhsachkho 
as
	select *
	from NHAPKHO
	where NHAPKHO.status=1
	
select distinct * from v_loaddanhsachkho