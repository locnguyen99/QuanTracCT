--1. Điếm có bao nhiêu xe máy trong hệ thống:16 xe
--select COUNT(BangSoXe) as tong_so_xe_may
--from XeMay

--2. Danh sách những người không có xe máy
--b1:Lấy danh sách những người có xe máy
--b2:Lấy những người có bảng số xe null
--Trường hợp này lấy tất cả để loại trừ nên sử dụng 2 trường hợp được
--2.1 sử dụng full join
--select cm.*,xm.BangSoXe
--from CMND cm
--full join XeMay xm on cm.SCMND=xm.SCMND
--where xm.BangSoXe IS null
----2.2 sử dụng left join
--select cm.*,xm.BangSoXe
--from CMND cm
--left join XeMay xm on cm.SCMND=xm.SCMND
--where xm.BangSoXe IS null

--3. Điếm tổng số người trong hệ thống : 7nguoi
--select COUNT(*) as tong_so_nguoi 
--from CMND

--4. Danh sách người có 2 xe máy trở lên
--Ghi chú:
--b1: Danh sách những người có xe máy
--b2: Điếm số lượng xe của mỗi người
--b3: Lấy số lượng xe >=2
--Group by có điều kiện dùng Having 
--Dùng left join hoặc inner join vì lấy cả người và người đó có cả xe
--select cm.SCMND, COUNT(xm.BangSoXe) as tong_so_xe_may
--from CMND cm
--inner join XeMay xm on cm.SCMND=xm.SCMND
--group by cm.SCMND
--having COUNT(xm.BangSoXe) >=2

--5. Danh sách người có 2 xe máy hãng Honda
--b1:Lấy danh sách người có xe máy
--b2:Lấy số lượng xe máy >2
--b3:Lấy danh sách xe máy tên hãng Honda với số lượng trên
--select cm.SCMND, COUNT(xm.BangSoXe) as tong_so_xe_may
--from CMND cm
--inner join XeMay xm on cm.SCMND=xm.SCMND 
--where xm.TenHang = 'Honda'
--group by cm.SCMND
--having COUNT(xm.BangSoXe) >=2 

--Kiểm tra:
--select *
--from XeMay xm
--where xm.SCMND ='371905707'

--6. Danh sách những người có xe máy Honda
--b1:Danh sách những người có xe máy
--b2:lấy danh sách hãng xe máy không trùng nhau
--b3:lấy danh sách tên hãng là Honda
--select distinct cm.*, xm.TenHang
--from CMND cm
--inner join XeMay xm on cm.SCMND=xm.SCMND
--where xm.TenHang='Honda'

--7. Danh sách những người có xe 2 hãng trở lên
--b1: Cần một danh sánh người có tên hãng xe không bị trùng lặp vì khi điếm nó điếm số lượng hãng chứ điếm số lượng mà khác nhau
--b2: Điếm số hãng xe từ danh sách đó

--select COUNT(xm.TenHang) as so_hang_xe, xm.SCMND
--from (
--select distinct xm.TenHang, xm.SCMND
--from XeMay xm
--) xm
--group by xm.SCMND
--having COUNT(xm.TenHang) >=2

--Lọc danh sách có Hãng không trùng nhau
--select distinct xm.TenHang, xm.SCMND
--from XeMay xm
--order by xm.SCMND

--8.Danh sách những người có 5 xe máy trở lên
--b1:Danh sách những người có xe máy từ cmnd
--b2: Điếm sô lượng người có xe máy
--b3:Người có số lượng xe máy =5
--select cm.SCMND, COUNT(xm.BangSoXe) as tong_so_xe_may
--from CMND cm
--inner join XeMay xm on cm.SCMND=xm.SCMND
--group by cm.SCMND
--having COUNT(xm.BangSoXe) >=5

--9. Danh sách những người có xe máy 1 hãng duy nhất
--b1: cần 1 danh sách người có xe máy hãng xe không trùng nhau vì nó điếm số xe máy trùng của mỗi người với group by
--b2: điếm số hãng từ danh sách đó với điều kiện bài cho

--select COUNT (xm.TenHang) as so_luong_hang, xm.SCMND
--from (select distinct xm.TenHang, xm.SCMND from XeMay xm) xm
--group by xm.SCMND
--having COUNT (xm.TenHang) = 1

--10. Điếm số xe máy trong hãng Honda
--b1:count bangsoxe từ bảng xe máy
--b2:Tên hãng xe được count là Honda
--select COUNT(xm.BangSoXe) as so_xe_may
--from XeMay xm
--where xm.TenHang = 'Honda'

--11. Tổng số xe máy từng hãng.
----b1:Điếm số xe máy của hãng
----b2: Group by tên hãng xe máy
--select COUNT(xm.BangSoXe) as xe_may,xm.TenHang
--from XeMay xm
--group by xm.TenHang

--12. Thêm vào cột xe máy cột ngày mua cách nhau 15 ngày giữa các xe
--b1:Thêm cột NgayMua kiêu date vào bảng XeMay
--b2:Lấy row index từng dòng 
--b3:NgayMua = ngày hiện tại + (row index *15)or ngay_can_add
--b4: tạo bảng tạm từ b3 (into tạm)
--b5: update NgayMua của xe máy từ ngay_mua của bảng tam

--SELECT DATEADD(DAY, 2*15, GETDATE()) 

--SELECT 
--  (ROW_NUMBER() OVER(ORDER BY SoKhungXe ASC)) AS row_index, 
--  (ROW_NUMBER() OVER(ORDER BY SoKhungXe ASC)) *15 AS ngay_add, 
--  BangSoXe,
--  GETDATE() ngay_hien_tai,
--DATEADD(DAY, (ROW_NUMBER() OVER(ORDER BY SoKhungXe ASC)) *15, GETDATE()) as ngay_mua
--into tam --đây là b4 into tam (tạo tam và đưa dữ liệu vào tam) 
--FROM XeMay 

--b5:
--update xm
--set xm.NgayMua = tam.ngay_mua
--from XeMay xm
--join tam on xm.BangSoXe=tam.BangSoXe

--13. Những xe máy mua trong tháng 8
--b1:Lấy ngày mua 
--b2:Lấy tháng của ngày mua(thang_mua)
--b3:Tháng của ngày mua = 8



--b4:Lấy thang, ngay, nam trong Date
--select *,MONTH(xm.NgayMua) as thang_mua,DAY(xm.NgayMua) as ngay_mua,YEAR(xm.NgayMua) as nam_mua
--from XeMay xm 

--SELECT*, DAY(xm.NgayMua) as ngaymua,MONTH(xm.NgayMua) as thangmua, YEAR(xm.NgayMua) as nammua
--from XeMay xm
--where MONTH(xm.NgayMua) = 8

--14.Những xe máy mua từ tháng 8 trở về trước
--b1:Lấy ngày mua xe máy
--b2:Lấy tháng của ngày mua xe máy
--b3:Tháng mua xe máy <=8

--SELECT*, DAY(xm.NgayMua) as ngay_mua,MONTH(xm.NgayMua) as thang_mua
--from XeMay xm
--where MONTH(xm.NgayMua) <= 8

--15. Cho biết những hãng xe bán nhiều xe máy nhất
--b1: Danh sách xe máy của từng hãng
--b2: Lấy kết quả lớn nhất số lượng xe máy của hãng
--b3: Lấy danh sách đó = với max kết quả số lượng xe máy

--///danh sách số xe từng hãng
--select COUNT(xm.BangSoXe) as so_xe,xm.TenHang
--from XeMay xm
--group by xm.TenHang

-- //Số lượng xe lớn nhất 
--select max(xm.so_xe) as so_xe_max
--from (select COUNT(xm.BangSoXe) as so_xe,xm.TenHang
--from XeMay xm
--group by xm.TenHang) xm

--//Tìm tổng số xe máy mỗi hãng = 9
--select COUNT(xm.BangSoXe) as so_xe,xm.TenHang
--from XeMay xm
--group by xm.TenHang
--having COUNT(xm.BangSoXe) = 9

--// b3...
--select xm.BangSoXe,xm.TenHang
--from XeMay xm
--where (select COUNT(xm.BangSoXe) as so_xe,xm.TenHang
--from XeMay xm
--group by xm.TenHang)=(select max(xm.so_xe) as so_xe_max
--from (select COUNT(xm.BangSoXe) as so_xe,xm.TenHang
--from XeMay xm
--group by xm.TenHang) xm)

--16.Cho biết tên hãng xe bán từ 15/6/2020 đến 15/8/2020
--b1:Lấy danh sách tên hãng
--b2:Danh sách xe bán từ ngày 6->8

--select xm.TenHang,xm.SCMND
--from XeMay xm
--where xm.NgayMua between '2020/6/15' and '2020/8/15'

--//check
--select *
--from XeMay xm
--where  xm.TenHang between '2020/6/15' and '2020/8/15' and xm.TenHang ='Suzuki '

--17.Update CSDL thêm 2 người LongAn mua xe Honda
--b1:Thêm 2 người có NguyenQuan 'Longan' vào CMND
--b2:Thêm 2 xe máy hãng Honda vào XeMay với thông tin người trên

--insert into CMND
--values(68686668,'LongAn','yes')

--insert into CMND
--values(84434668,'LongAn','No')

--insert into XeMay
--values(456495646,23424324,'Honda',68686668,'','','')

--insert into XeMay
--values(456456456,234254244,'Honda',84434668,'','','')

--18.Thêm một người HCM mua xe máy Yamaha
--b1:Thêm 1 người vào CMND vơi NguyenQuan'HCM'
--b2:Thêm 1 xe máy Yamaha vào XeMay với thông tin SCMND người trên

--insert into CMND
--values (6755587,'HCM','HoChiMinh')

--insert into XeMay
--values(353636,647463,'Yamaha',6755587,'','','')

--19.Update ngày mua không được phép null
--b1:set ngày mua bằng ngày mua
--b2: ngày mua không phép null
--// đây là thao tác thay đổi dữ liệu
--update XeMay 
--set NgayMua = NgayMua
--where NgayMua is not null
--//đây là thao tác thay đổi cấu trúc
--alter table XeMay
--alter column NgayMua date not null

--20.Thêm vào bảng mới tên xe hơi với thuộc tính giống xe máy,thêm vào số ghế không được null

--CREATE TABLE HoiXe (
--    BangSoXe varchar(50),
--    SoKhungXe int,
--    TenHang varchar(20),
--    SCMND int,
--    NgayMua date,
--	SoGheNgoi int not null
--    PRIMARY KEY(BangSoXe)
--);

--21.Quy ước mỗi người dân mua một xe hơi
--//Danh sách người có một xe hơi
--select COUNT(hx.BangSoXe) so_xe_hoi,cm.SCMND
--from CMND cm
--join HoiXe hx on cm.SCMND=hx.SCMND
--group by cm.SCMND
--having COUNT(hx.BangSoXe) =1

--22.Thêm một người mua xe hơi 9 chỗ ngồi
--b1:Thêm 1 người vào CMND
--b2:Thêm xe hoi 9 chỗ ngồi vào HoiXe với SCMND người trên b1

--insert into CMND
--values (7546423,'','')

--insert into HoiXe
--values (56236264,5643564,'',7546423,'',9)

--23.Update người không xe máy, có xe hơi 52 chỗ
--b1:Danh sách người không có xe máy
--b2:Thêm xe hơi 52 chỗ ngồi vào HoiXe cho những người trên

--// danh sách những người không có xe máy
--select *
--from CMND cm
--full join XeMay xm on cm.SCMND=xm.SCMND
--where xm.BangSoXe is null

--insert into HoiXe
--values(4575675,3453456,'',7546423,'',52)

--insert HoiXe
--values(45752753,34535456,'',52345646,'',52)

--insert HoiXe
--values(42575675,34553456,'',371905701,'',52)


