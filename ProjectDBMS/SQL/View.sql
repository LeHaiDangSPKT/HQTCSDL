use QLRP

-- Chi tiết Suất chiếu
go 
create view view_chiTietSuatChieu as
select MaSuatChieu, Phim.MaPhim, TenPhim, SuatChieu.MaPhong, TenPhong, Ngay, Gio, LoaiMay, ThoiLuong, LuaTuoi, DaoDienChinh, SuatChieu.TrangThai
from SuatChieu
	inner join PhongChieu on SuatChieu.MaPhong = PhongChieu.MaPhong
	inner join MayChieu on MayChieu.MaMay = PhongChieu.MaMay
	inner join Phim on SuatChieu.MaPhim = Phim.MaPhim
-- View chi tiết hoá đơn
go

create view view_chiTietHoaDon as
select MaHoaDon, min(Ten) as Ten, min(TenPhim) as TenPhim, min(TenPhong) as TenPhong, min(GioXuat) as GioXuat, min(NgayXuat) as NgayXuat, min(TenKM) as TenKM, min(TongChiPhi) as TongChiPhi
from Ve inner join SuatChieu on Ve.MaSuatChieu = SuatChieu.MaSuatChieu
		inner join PhongChieu on SuatChieu.MaPhong = PhongChieu.MaPhong
		inner join Phim on SuatChieu.MaPhim = Phim.MaPhim
		inner join HoaDon on HoaDon.MaKH = Ve.MaKH
		inner join KhachHang on HoaDon.MaKH = KhachHang.MaKH
		inner join KhuyenMai on HoaDon.MaKM = KhuyenMai.MaKM
group by MaHoaDon

-- View chi tiết doanh thu theo phim
go
create view view_chiTietDoanhThuPhim as
select MaHoaDon, min(TenPhim) as TenPhim, min(TenPhong) as TenPhong, min(NgayMua) as NgayMua, min(NgayKhoiChieu) as NgayKhoiChieu, min(NgayKetThuc) as NgayKetThuc, min(Ngay) as Ngay, min(Gio) as Gio, min(TongChiPhi) as TongChiPhi
from Ve inner join SuatChieu on Ve.MaSuatChieu = SuatChieu.MaSuatChieu
		inner join PhongChieu on SuatChieu.MaPhong = PhongChieu.MaPhong
		inner join Phim on SuatChieu.MaPhim = Phim.MaPhim
		inner join HoaDon on HoaDon.MaKH = Ve.MaKH
where Ve.TrangThai = 1
group by MaHoaDon




