use QLRP
go

create trigger trigger_check_DateSuatChieuPhim 
on SuatChieu after insert, update
as
begin
	declare @ThoiGianChieu date, @MaPhim int, @NgayKhoiChieu date, @NgayKetThuc date
	select @ThoiGianChieu = Ngay, @MaPhim = MaPhim from inserted

	select @NgayKetThuc = NgayKetThuc, @NgayKhoiChieu = NgayKhoiChieu
	from Phim
	where MaPhim = @MaPhim

	if (@ThoiGianChieu < @NgayKhoiChieu or @ThoiGianChieu > @NgayKetThuc)
	begin
		rollback tran
		Raiserror(N'Thời gian Suất chiếu phải lớn hơn hoặc bằng Ngày Khởi Chiếu và nhỏ hơn hoặc bằng Ngày Kết Thúc',16,1)
		return
	end
end
go

create trigger trigger_check_TimeSuatChieuPhim 
on SuatChieu after insert, update
as
begin
	declare @NgayChieu date, @GioChieu time, @MaPhim int, @MaPhong int, @count int
	select @NgayChieu = Ngay, @GioChieu = Gio, @MaPhim = MaPhim, @MaPhong = MaPhong from inserted

	select @count = count(*)
	from Phim inner join SuatChieu on Phim.MaPhim = SuatChieu.MaPhim inner join PhongChieu on SuatChieu.MaPhong = PhongChieu.MaPhong
	where PhongChieu.MaPhong = @MaPhong and (@NgayChieu = SuatChieu.Ngay and @GioChieu >= SuatChieu.Gio and @GioChieu <= dateadd(mi, Phim.ThoiLuong, convert(time, SuatChieu.Gio)))

	if(@count > 1)
	begin
		rollback tran
		raiserror(N'Thời gian chiếu trùng với suất chiếu khác của cùng Phòng chiếu',16,1)
		return
	end
end
go


