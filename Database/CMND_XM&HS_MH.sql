--1. Lấy học sinh không học môn nào
--b1:Điếm số môn học của học sinh
--b2:Group by số học sinh theo số môn điếm trên
--b3:Lấy số lượng môn học = 0

--select hs.MSHS,hs.TenHS,COUNT(mh.TenMH) so_mon
--from HocSinh hs
--left join HS_MH hm on hs.MSHS=hm.MSHS left join MonHoc mh on hm.MSMH=mh.MSMH
--group by hs.MSHS,hs.TenHS
--having COUNT(mh.TenMH) = 0

--2.Lấy học sinh học môn Toán
--b1: Danh sách học sinh
--b2:học sinh trên học môn Toán

--select hs.MSHS,hs.TenHS,mh.TenMH
--from HocSinh hs
--left join HS_MH hm on hs.MSHS=hm.MSHS left join MonHoc mh on hm.MSMH=mh.MSMH
--where mh.TenMH='Toán

----3.Điếm số học sinh từng môn học
----//Số lượng học sinh học mỗi môn
----b1:Điếm số lượng học sinh
----b2:Group by tên môn học theo số lượng học sinh điếm trên

----select mh.TenMH, count(hs.MSHS) so_hoc_sinh
----from HocSinh hs
----left join HS_MH hm on hs.MSHS=hm.MSHS right join MonHoc mh on hm.MSMH=mh.MSMH
----group by mh.TenMH

--4.Cho biết môn học 2 học sinh trở lên
--b1:Điếm số lượng học sinh
--b2:Group by môn học theo số lượng học sinh trên
--b3:Lấy số học sinh điếm được >=2

--select mh.MSMH,mh.TenMH,count(hs.MSHS) so_hoc_sinh
--from HocSinh hs
--right join HS_MH hm on hs.MSHS=hm.MSHS right join MonHoc mh on hm.MSMH=mh.MSMH
--group by mh.MSMH,mh.TenMH
--having count(hs.MSHS) >=2

--5.Số lượng môn học của từng học sinh
--//Mỗi học sinh học bao nhiêu môn
--b1:Điếm số lượng môn học
--b2:group by học sinh theo số lượng môn trên

--select hs.MSHS,hs.TenHS,count(mh.MSMH) so_luong_mon_hoc
--from HocSinh hs
--left join HS_MH hm on hs.MSHS=hm.MSHS left join MonHoc mh on hm.MSMH=mh.MSMH
--group by hs.MSHS,hs.TenHS

--6.Cho biết học sinh học môn Anh
--b1:Danh sách học sinh học
--b2:Học sinh trên học môn Anh

--select *
--from HocSinh hs
--left join HS_MH hm on hs.MSHS=hm.MSHS left join MonHoc mh on hm.MSMH=mh.MSMH
--where mh.TenMH='Anh'

--7.Thêm vào môn học Ngôn Ngữ Lập Trình

--insert into MonHoc
--values ('231',N'Ngôn Ngữ Lập Trình')

--8.Cho biết môn học không có học sinh theo học
--b1:Điếm số lượng học sinh học
--b2:Group by môn học theo lượng học sinh kia
--b3:Số lượng học sinh trên =0 hoặc null

--select mh.MSMH,mh.TenMH, COUNT(hs.MSHS) so_luong_HS
--from HocSinh hs
--right join HS_MH hm on hs.MSHS=hm.MSHS right join MonHoc mh on hm.MSMH=mh.MSMH
--group by mh.MSMH,mh.TenMH
--having COUNT(hs.MSHS)=0
-----------------------------------------------------------------------------------------------------------------

--1.Điếm bao nhiêu xe máy trong hệ thống
--//Số lượng xe máy là số lượng bảng số xe

--select COUNT(xm.BangSoXe) so_luong_xe_may
--from XeMay xm

--2.Danh sách những người không có xe máy
--b1:Lấy danh sách những người có xe
--b2:Những người không có xe là người không có bảng số xe

--select *
--from CMND cm
--left join XeMay xm on cm.SCMND=xm.SCMND
--where xm.BangSoXe is null

--3.Điếm tổng số người trong hệ thống
--//Số người hệ thống là những người có SCMND

--select COUNT(cm.SCMND) tong_so_nguoi
--from CMND cm

--4.Danh sách người có 2 xe máy trở lên
--b1:Điếm số lượng xe máy
--b2:Group by số người có lượng xe máy trên
--b3:Số lượng xe máy điếm >=2

--select cm.SCMND,cm.HoVaTen, COUNT(xm.BangSoXe) so_luong_xe_may
--from CMND cm
--left join XeMay xm on cm.SCMND=xm.SCMND
--group by cm.SCMND,cm.HoVaTen
--having  COUNT(xm.BangSoXe)>=2

--5.Danh sách những người có 2 xe máy hãng Honda
--b1:Điếm số lượng xe máy
--b2:Số xe máy trên là hãng Honda
--b3:Group by những người có số lượng xe máy trên
--b4:Số lượng xe máy trên =2

--select cm.HoVaTen,cm.SCMND,xm.TenHang, COUNT(xm.BangSoXe) so_xe_may
--from CMND cm
--left join XeMay xm on cm.SCMND=xm.SCMND
--where xm.TenHang='Honda'
--group by cm.SCMND,cm.HoVaTen,xm.TenHang
--having COUNT(xm.BangSoXe) =2

--6.Danh sách những người có xe máy Honda

--select *
--from CMND cm
--left join XeMay xm on cm.SCMND=xm.SCMND
--where xm.TenHang='Honda'

--7.Danh sách những người có xe 2 hãng trở lên
--b1:Điếm số lượng hãng xe từ một danh sách người có hãng xe không trùng lập từ bảng xe máy
--b2:Group by số người có số lượng hãng trên trong bang xe máy
--b3:Lấy danh sách người có số lượng hãng >=2

--select xm.SCMND, COUNT(xm.TenHang) so_luong_hang
--from (select distinct xm.SCMND,xm.TenHang from XeMay xm)xm
--group by xm.SCMND
--having COUNT(xm.TenHang)>=2

--8.Danh sách những người có 5 xe máy trở lên
--b1:Điếm số lượng xe máy
--b2:Group by những người theo số lượng xe máy trên
--b3:Lấy số lượng xe máy >5

--select cm.SCMND,cm.HoVaTen, COUNT(xm.BangSoXe) so_luong_xe_may
--from CMND cm
--left join XeMay xm on cm.SCMND = xm.SCMND
--group by cm.SCMND,cm.HoVaTen
--having COUNT(xm.BangSoXe) >5

--9.Danh sách những người có xe máy 1 hãng duy nhất
--b1:Điếm số lượng hãng từ bảng xe máy với tên hãng xe không trùng nhau
--b2:Group by những người trên trong danh sách đó
--b3:Lấy những người có số lượng hãng = 1

--select xm.SCMND, COUNT(xm.TenHang) so_luong_hang
--from (select distinct xm.SCMND,xm.TenHang from XeMay xm)xm
--group by xm.SCMND
--having COUNT(xm.TenHang)=1

--10.Điếm số xe máy trong hãng Honda

--select COUNT(xm.BangSoXe) so_xe_may
--from XeMay xm
--where xm.TenHang ='Honda'

--11.Tổng số xe máy từng hãng
--b1:Điếm số lượng xe máy
--b2:Group by tên hãng theo số lượng xe máy trên

--select xm.TenHang, COUNT(xm.BangSoXe) so_xe_may
--from XeMay xm
--Group by xm.TenHang

--12.Thêm vào xe máy với cột ngày bán giữa các xe cách nhau 15 ngày
--b1:Thêm cột NgayBan vào bảng xe máy kiểu date
--b2:Công thức tổng quát: NgayBan = ((NumberRow or RowIndex)*15) + NgayHienTai
--b3:into vào một bảng tạm thời với ngày bán theo công thức trên
--b4:update xe máy với ngày bán bằng với ngày bán bảng tạm thời

--alter table XeMay  //b1
--add NgayBan date

--select 
--	GETDATE() ngay_hien_tai,
--	(ROW_NUMBER() OVER(ORDER BY xm.SoKhungXe ASC)) RowNumber,
--	(ROW_NUMBER() OVER(ORDER BY xm.SoKhungXe ASC)*15) ngay_them,
--	xm.SoKhungXe,
--	DATEADD(DAY,ROW_NUMBER() OVER(ORDER BY xm.SoKhungXe ASC)*15,GETDATE()) ngay_ban
--	into ngaybantam //b3
--from XeMay xm

--update  //b4
--set xm.NgayBan=nbt.ngay_ban
--from XeMay xm
--join ngaybantam nbt on xm.SoKhungXe=nbt.SoKhungXe

--13.Những xe máy mua trong tháng 8
--b1:Danh sách những xe máy
--b2:Lấy tháng trong date
--b3:Lấy xe có tháng trong date =8

--select *,MONTH(xm.NgayBan) thang_mua
--from XeMay xm
--where MONTH(xm.NgayBan) = 8

--14.Những xe máy mua từ tháng 8 trở về trước.
--b1:Danh sách những xe máy
--b2:Lấy tháng trong date
--b3:Lấy xe có tháng trong date <8

--select *,MONTH(xm.NgayBan) thang_mua
--from XeMay xm
--where MONTH(xm.NgayBan) < 8

--15.Cho biết những hãng xe bán nhiều xe máy nhất
--b1:Điếm số lượng xe máy
--b2:Group by tên hãng xe theo số lượng trên
--b3:order by no giảm dần
--b4:select top 1 số lượng xe bán hãng đó

--select top 1 xm.TenHang, COUNT(xm.BangSoXe) so_luong_xe_ban
--from XeMay xm
--group by xm.TenHang
--order by COUNT(xm.BangSoXe) DESC

--//Nếu có 2 giá trị max của 2 hãng khác nhau thì lấy tổng số xe mỗi hãng = với max đó (VD:max =10)
--select COUNT(xm.BangSoXe) as so_xe,xm.TenHang
--from XeMay xm
--group by xm.TenHang
--having COUNT(xm.BangSoXe) = 10

--16.Cho biết tên hãng xe bán từ 15/6/2020 đến 15/8/2020

--select *
--from XeMay xm
--where xm.TenHang between '15/6/2020' and '15/8/2020'

--17.Update CSDL thêm 2 người LongAn mua xe máy Honda
--b1:Thêm 2 người vào bảng CMND với NguyenQuan ở LongAn
--b2:Thêm 2 xe máy vào bảng xe máy với SCMND là 2 người trên

--insert CMND
--values (6442442,'LongAn','Thanh')

--insert CMND
--values (6412442,'LongAn','Thang')

--insert XeMay
--values (14535345,2342533,'Honda',6442442,'','','','')

--insert XeMay
--values (145351345,23421533,'Honda',6412442,'','','','')

----18.Thêm một người HCM mua xe máy Yamaha
----b1:Thêm 1 người có NguyenQuan HCM vào bảng CMND
----b2:Thêm 1 xe máy Honda vào bảng xe máy với SCMND trên

----insert CMND
----values (56424224,'HCM','')

----insert XeMay
----values (145353145,234253333,'Yamaha',56424224,'','','','')

--19.Update ngày bán không được phép null

--alter table XeMay
--alter column NgayBan date not null

--20.Thêm vào bảng mới tên xeben với thuộc tính giống như xe máy và thêm thuộc tính số ghê ngồi không được null

--CREATE TABLE XeBen (
--    BangSoXe int,
--    SoKhungXe int,
--    TenHang varchar(50),
--    SCMND int,
--    NgayBan date not null,
--	SoGheNgoi int not null
--    PRIMARY KEY(BangSoXe)
--);

--21.Quy ước mỗi người dân mua một xe ben

--select cm.SCMND, COUNT(xb.BangSoXe) so_xe
--from CMND cm
--left join XeBen xb on cm.SCMND=xb.SCMND
--group by cm.SCMND
--having COUNT(xb.BangSoXe) =1

--22.Thêm một người mua xe ben 9 chỗ
--b1:Thêm một người vào bảng CMND 
--b2:Thêm xe ben 9 chỗ cho người trên

--insert CMND
--values (4432342,'','')

--insert XeBen
--values (34435356,4225676,'',4432342,'',9)

--23.Update người không xe máy, có xe ben 52 chỗ
--b1:Danh sách người không có xe máy
--b2:Thêm xe ben 52 chỗ cho người trong danh sách trên

--select *
--from CMND cm
--left join XeMay xm on cm.SCMND=xm.SCMND
--where xm.BangSoXe is null

--insert XeBen
--values(52341124,4353563,'',4432342,'',52)

--insert XeBen
--values(52341124,4353533,'',7546423,'',52)

--insert XeBen
--values(52342114,435353,'',52345646,'',52)

--insert XeBen
--values(231241124,4315453,'',371905701,'',52)