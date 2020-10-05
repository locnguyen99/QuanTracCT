--1.Cho biết tên, địa điểm công trình
--// Lấy tên, địa điểm từ bảng CongTrinh
--select *	
--from CongTrinh

--2.Cho biết số lượng mốc lưới cơ sở trong chu kỳ 6
--b1:Danh sách mốc lưới cơ sở
--b2:Điếm số mốc lưới trên
--b3:số mốc của lưới trong chu kỳ 6

--select COUNT(m.TenMoc) so_moc_CS
--from Moc m
--where m.LoaiMoc='MocCS' and m.TenCK=N'Chu Kỳ 6'

--3.Cho biết số lượng mốc lưới quan trắc trong chu kỳ 6
----b1:Danh sách mốc lưới quan trắc
----b2:Điếm số mốc lưới trên
----b3:số mốc của lưới trong chu kỳ 6

--select COUNT(m.TenMoc) so_moc_QT
--from Moc m
--where m.LoaiMoc='MocQT' and m.TenCK=N'Chu Kỳ 6'

--4.Cho biết danh sách chu kỳ và thời gian đo mỗi chu kỳ
--//Lấy TenCK,ThoiGianDo trong table ChuKy
--select ck.TenCK,ck.ThoiGianDo
--from ChuKy ck

--5.Cho biết số mốc trong chu kỳ 6
--b1:Danh sách số mốc 
--b2:Mốc trên trong chu kỳ 6

--select COUNT(m.TenMoc) tong_so_moc
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6'

--6.CHo biết mốc lưới quan trắc có trong chu kỳ 6
--b1:Danh sách mốc lưới quan trắc
--b2:Danh sách lưới trên trong chu kỳ 6

--select m.TenMoc,m.TenCK
--from Moc m 
--where m.LoaiMoc='MocQT' and m.TenCK=N'Chu Kỳ 6'


--7.Danh sách mốc trong chu kỳ 6
--b1:Danh sách mốc
--b2:Danh sách mốc trong chu kỳ 6

--select m.TenMoc ,m.TenCK
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6'

--8.Cho biết cao độ H của mỗi mốc trong chu kỳ 6
--b1:Danh sách cao độ H
--b2:Danh sách trên trong chu kỳ 6

--select m.CaoDo_H,m.TenCK 
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6'

--9.Cho biết mốc không có cao độ H trong chu kỳ 6
--b1:Danh sách mốc có cao độ H
--b2:Danh sách trên trong chu kỳ 6
--b3:Lấy mốc có CaoDo_H is null

--select m.TenMoc, m.CaoDo_H,m.TenCK 
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6' and m.CaoDo_H is null

--10.Cho biết độ lún tuyệt đối, độ lún tương đối các mốc trong chu kỳ 6
--b1:Lấy độ LunTuetDoi và LunTuongDoi trong table Moc
--b2:Lấy trong chu kỳ 6

--select m.TenMoc, m.LunTuyetDoi, m.LunTuongDoi
--from Moc m	
--where m.TenCK=N'Chu Kỳ 6'

--11.Cho biết độ lún trung bình trong chu kỳ 6
--select m.TenMoc, m.LunTB
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6'

--12.Cho biết độ lún trung bình tổng cộng chu kỳ 6
--select m.TenMoc, m.LunTBTong
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6'

--13.Cho biết độ lún Max trong chu kỳ 6 tại mốc 6
--select m.TenMoc, m.LunMax
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6' and m.TenMoc='M6'

--14.Cho biết độ lún Min trong chù kỳ 6 tại mốc 6
--select m.TenMoc, m.LunMin
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6'

--15.Cho biết độ không lún Max trong chu kỳ 6 tại mốc 6
--select m.TenMoc, m.KhongLunMax
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6'and m.TenMoc='M6'

--16.Cho biết độ không lún Min trong chu kỳ 6 tại mốc 6
--select m.TenMoc, m.KhongLunMin
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6' and m.TenMoc='M6'

--17.Cho biết độ lún tổng cộng Max trong chu kỳ 6 tại mốc 6
--select m.TenMoc, m.LunTongCongMax
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6' and m.TenMoc='M6'

--18.Cho biết độ lún tổng cộng Min trong chu kỳ 6 tại mốc 6
--select m.TenMoc, m.LunTongCongMin
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6' and m.TenMoc='M6'

--19.Cho biết tốc độ lún trung trình của chu kỳ 6
--select m.TenMoc, m.TocDoLunTB
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6'

--20.Cho biết tốc độ lún trung bình tổng chu kỳ 6
--select m.TenMoc, m.TocDoLunTBTong
--from Moc m 
--where m.TenCK=N'Chu Kỳ 6'

--21.Cho biết tổng số tuyến đo trong chu kỳ 6	
--select COUNT(td.TenTuyen) tong_so_tuyen
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6'

--22.Cho biết số tuyến đo mỗi lưới trong chu kỳ 6	
--b1:Lấy danh sách tuyến đo
--b2:Gruop by Loại mốc của tuyến đo
--b3:Điếm tuyến đo trên

--select td.LoaiMoc, COUNT(td.TenTuyen) so_tuyen_do
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6'
--group by td.LoaiMoc

--23.Danh sách các tuyến đo mốc cơ sở trong chù kỳ 6
--select *
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6' and td.LoaiMoc='MocCS'

--24.Danh sách các tuyến đo mốc quan trắc trong chù kỳ 6
--select *
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6' and td.LoaiMoc='MocQT'

--25.Cho biết khoảng cách đo của các tuyến trong chu kỳ 6
--select td.TenTuyen, td.KhoangCach
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6'

--26.Cho biết khoảng cách đo của tuyến mốc cơ sở trong chu kỳ 6

--select td.TenTuyen, td.KhoangCach
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6' and td.LoaiMoc='MocCS'

--27. 
--select td.TenTuyen, td.SoMayTram
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6' 

--28.Danh sách chênh cao của các tuyến đo trong chu kỳ 6
--select td.TenTuyen, td.ChenhCao
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6'

--29.Cho biết tuyến đo có khoảng cách lớn nhất trong chu kỳ 6
--select top 1 td.TenTuyen ,td.KhoangCach
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6'
--order by td.KhoangCach DESC

--30.Cho biết tuyến đo có khoảng cách bé nhất lưới quan trắc trong chu kỳ 6
--select top 1 td.TenTuyen ,td.KhoangCach
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6' and td.LoaiMoc='MocQT'
--order by td.KhoangCach ASC

--31.Cho biết tổng số khoảng cách trong chu kỳ 6
--select sum(td.KhoangCach) tong_so_Khoang
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6'

--32.Cho biết tổng số trạm trong chu kỳ 6
--select sum(td.SoMayTram) tong_so_tram
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6'

--33.Cho biết tổng khoảng cách lưới cơ sở trong chu kỳ 6
--select sum(td.KhoangCach) tong_so_khoang
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6' and td.LoaiMoc='MocCS'

--34.Cho biết tổng số chênh cao trong chu kỳ 6
--select COUNT(td.ChenhCao) tong_so
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6'

--35.Cho biết SHC của các tuyến đo trong chu kỳ 6
--select td.TenTuyen,td.SHC
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6'

--36.Cho biết SSTP của các tuyến đo trong chu kỳ 6
--select td.TenTuyen,td.SSTP
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6'

--37.Cho biết các điếm đầu và điểm cuối trong chu kỳ 6
--select td.TenTuyen, td.DiemDau,td.DiemCuoi
--from TuyenDo td
--where td.TenCK=N'Chu Kỳ 6'
--38.Danh sách tổng khoảng cách của mỗi chu kỳ 
--b1:Nhóm chu kỳ 
--b2:Tính tổng khoảng cách mỗi chu kỳ
--b2:Lấy danh sách tổng chu kỳ đó

--select ck.TenCK, SUM(td.KhoangCach) tong_khoang_cach
--from TuyenDo td
--join ChuKy ck on td.TenCK = ck.TenCK
--group by ck.TenCK


update ChuKy ck
set m.MaCK = ck.MaCK
join Moc m on ck.TenCK = m.TenCK

alter table 
add MaCK uniqueidentifier NOT NULL default newid()

ALTER TABLE ChuKy ADD CONSTRAINT pk_ChuKy PRIMARY KEY (MaCK)

ALTER TABLE ChuKy DROP CONSTRAINT FK_ChuKy_TuyenDo

ALTER TABLE ChuKy add CONSTRAINT FK_CongTrinh_ChuKy FOREIGN KEY (MaCT)
REFERENCES CongTrinh (MaCT)
	ON DELETE CASCADE
    ON UPDATE CASCADE

ALTER TABLE TuyenDo add CONSTRAINT FK_ChuKy_TuyenDo  FOREIGN KEY (MaCK)
REFERENCES ChuKy (MaCK)
	ON DELETE CASCADE
    ON UPDATE CASCADE

ALTER TABLE Moc add CONSTRAINT FK_ChuKy_Moc  FOREIGN KEY (MaCK)
REFERENCES ChuKy (MaCK)
	ON DELETE CASCADE
    ON UPDATE CASCADE


ALTER TABLE Sales.TempSalesReason
   ADD CONSTRAINT FK_TempSales_SalesReason FOREIGN KEY (TempID)
      REFERENCES Sales.SalesReason (SalesReasonID)
      ON DELETE CASCADE
      ON UPDATE CASCADE


select *
from CongTrinh
select * 
from ChuKy