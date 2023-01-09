--a.	Xem thông tin độc giả
--Tên: sp_ThongtinDocGia
--Nội dung: Liệt kê những thông tin của độc giả tương ứng với mã độc giả. Nếu độc giả là người lớn thì hiển thị
--thông tin độc giả + thông tin trong bảng người lớn. Nếu độc giả là trẻ em thì hiển thị những thông tin độc giả +
--thông tin của bảng trẻ em.
--Thực hiện:
--[1] Kiểm tra độc giả này thuộc loại người lớn hay trẻ em.
--[2] Nếu là người lớn thì: In những thông độc giả này, gồm có: thông tin độc giả + thông tin người lớn.
--[3] Nếu là trẻ em thì: In những thông tin liên quan đến độc giả này, gồm có: thông tin độc giả + thông tin trẻ em.

create proc sp_ThongtinDocGia (@madocgia int)
as 
if @madocgia in(select ma_DocGia from Nguoilon)
	begin
		select DocGia.ma_DocGia, ho, tenlot, ten, ngaysinh, sonha, duong, quan, dienthoai, han_sd
		from DocGia , Nguoilon
		where DocGia.ma_DocGia = Nguoilon.ma_DocGia and
			Nguoilon.ma_DocGia = @madocgia
	end
else
	begin
		select DocGia.ma_DocGia, ho, tenlot, ten, ngaysinh, ma_DocGia_nguoilon
		from DocGia , Treem
		where DocGia.ma_DocGia = Treem.ma_DocGia and
			Treem.ma_DocGia = @madocgia
	end

go
execute sp_ThongtinDocGia @madocgia = 1

