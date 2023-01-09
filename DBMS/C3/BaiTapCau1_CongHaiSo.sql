-- Trần Thị Lệ Xuân - 18133066
-- Câu 1: Stored – procedure tính tổng hai số nguyên.
create procedure TongHaiSo(
	@a int, 
	@b int
)
as
begin
	return @a + @b
end
go


