--Stored procedure liệt kê những thông tin của đầu sách, 
--thông tin tựa sách và số lượng sách hiện chưa được mượn của một đầu sách cụ thể (ISBN).
create proc LietKeDanhSach
as
begin
	select ds.bia, ds.isbn, ds.ma_tuasach, ds.ngonngu, ds.trangthai, COUNT(cs.isbn) as SoLuongSach,
			ts.tacgia, ts.tomtat, ts.tuasach
	from Tuasach ts, Dausach ds, Cuonsach cs
	where ts.ma_tuasach = ds.ma_tuasach and
		ds.isbn = cs.isbn 
	group by ds.bia, ds.isbn, ds.ma_tuasach, ds.ngonngu, ds.trangthai,ts.tacgia, ts.tomtat, ts.tuasach,cs.tinhtrang
		having cs.tinhtrang = '1'
end