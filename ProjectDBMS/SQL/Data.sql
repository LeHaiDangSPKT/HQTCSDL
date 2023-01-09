use QLRP
go

exec proc_addRole 'Admin'
exec proc_addRole 'Nhân viên'

exec proc_addUser N'Nhóm 5', 'Nam', '2002-10-10', '0354944840' , '012345678985', 'adminnhom5@gmail.com' , 'adminG5' , 'adminG5' , '12345'

exec proc_addUserRole 1 , 1

exec proc_addUser N'Nhóm 5', 'Nam', '2002-10-10', '0354944340' , '012345648985', 'nvnhom5@gmail.com' , 'nvG5' , 'nvG5' , '12345'

exec proc_addUserRole 2 , 2

---TAO GHE
exec proc_addChair 45000, '1'

---TAO PHIM
exec proc_addFilm 124, N'Bỗng dưng trúng số', 12, '2022-11-7', '2022-11-15', N'Park Yun Huyn' 
exec proc_addFilm 124, N'Bố già', 12, '2022-11-8', '2022-11-16', N'Trấn Thành' 

---TAO DIEN VIEN
exec proc_add_Actor N'Trấn Thành'
exec proc_add_Actor N'Ninh Dương Lan Ngọc'
exec proc_add_Actor N'Kiều Minh Tuấn'
exec proc_add_Actor N'Kim Ji Soun'
exec proc_add_Actor N'Lee Seun Kyo'

---TAO THE LOAI

exec proc_addCategory N'Hài'
exec proc_addCategory N'Hành động'
exec proc_addCategory N'Tâm lý xã hội'
exec proc_addCategory N'Khoa học viễn tưởng'
exec proc_addCategory N'Tình cảm'

---TAO PHIM - DIEN VIEN
exec proc_addFilmActor 1, 4
exec proc_addFilmActor 1, 5
exec proc_addFilmActor 2, 1

---TAO PHIM - THE LOAI
exec proc_addFilmCategory 1, 1
exec proc_addFilmCategory 2, 1
exec proc_addFilmCategory 2, 5

---TAO MAY CHIEU
exec proc_addProjector '2D', 5000
exec proc_addProjector '3D', 6000
exec proc_addProjector 'IMAX', 7000

---TAO PHONG CHIEU
exec proc_addCinemaRoom 'P1', 6, 10, 60, 1, 1
exec proc_addCinemaRoom 'P2', 5, 10, 50, 1, 2
exec proc_addCinemaRoom 'P3', 6, 10, 60, 1, 3
exec proc_addCinemaRoom 'P4', 7, 10, 70, 1, 2
---TAO PHONG CHIEU - GHE
exec proc_addCinemaRoomChair 1, 1, 60
exec proc_addCinemaRoomChair 2, 1, 50
exec proc_addCinemaRoomChair 3, 1, 60
exec proc_addCinemaRoomChair 4, 1, 70
---TAO DICH VU
exec proc_addService N'Bắp rang bơ', 45000
exec proc_addService N'Bắp caramel', 45000
exec proc_addService N'Bắp phô mai', 45000
exec proc_addService N'Nước pepsi', 50000
exec proc_addService N'Nước monster', 50000
exec proc_addService N'Nước redbull', 50000

---TAO KHUYEN MAI
exec proc_addDiscount N'Lễ 30/4', 0.3
exec proc_addDiscount N'Lễ Quốc Khánh', 0.4
exec proc_addDiscount N'Lễ Tết', 0.5

---TAO LOAI KHACH HANG
exec proc_addTypeCustomer N'Người lớn', 0
exec proc_addTypeCustomer N'Học sinh', 0.1
exec proc_addTypeCustomer N'Sinh viên', 0.2
exec proc_addTypeCustomer N'Trẻ em', 0.3
