--1.Lấy học sinh không học môn nào
--b1:Điếm số lượng môn học
--b2:group by học sinh theo môn học
--b3:số lượng môn học =0

--select hs.MSHS,hs.TenHS,COUNT(mh.MSMH) so_luong_mon
--from HocSinh hs
--left join HS_MH hm on hs.MSHS=hm.MSHS left join MonHoc mh on hm.MSMH=mh.MSMH
--group by hs.MSHS,hs.TenHS
--having COUNT(mh.MSMH)=0

--2.Lấy học sinh học môn toán
--b1:Lấy danh sách sinh viên
--b2:join 3 bảng lấy tên môn học ='Toán'

--select hs.*
--from HocSinh hs
--left join HS_MH hm on hs.MSHS=hm.MSHS left join MonHoc mh on hm.MSMH=mh.MSMH
--where mh.TenMH='Toán'

--3.Điếm số học sinh từng môn học
--//Tức là điếm số học sinh học từng môn
--b1:Điếm số học sinh
--b2:group by môn học theo số học sinh điếm được

--select mh.MSMH, mh.TenMH, COUNT(hs.MSHS) so_HS
--from HocSinh hs
--right join HS_MH hm on hs.MSHS=hm.MSHS right join MonHoc mh on hm.MSMH=mh.MSMH
--group by mh.TenMH,mh.MSMH


--SELECT TOP (1000) [MSHS]
--      ,[MSMH]
--  FROM [QLHS].[dbo].[HS_MH]
--  where MSMH = 555

--4.Cho biết môn học 2 học sinh trở lên
--//Tức là môn học có số lượng học sinh là 2
--b1:Điếm số lượng học >=2
--b2:Group môn học theo số lượng học sinh trên

--select mh.MSMH,mh.TenMH, COUNT(hs.MSHS) so_luong_hs
--from HocSinh hs
--right join HS_MH hm on hs.MSHS=hm.MSHS right join MonHoc mh on hm.MSMH=mh.MSMH
--group by mh.TenMH,mh.MSMH
--having COUNT(hs.MSHS)>=2

--5.Số lượng môn học của từng học sinh
--//Tức là mỗi học sinh học bao nhiêu môn
--b1:Điếm số lượng môn học
--b2:group by học sinh học theo số lượng môn học

--select hs.MSHS,hs.TenHS, COUNT(hm.MSMH) so_luong_mon
--from HS_MH hm 
--full join HocSinh hs on hm.MSHS=hs.MSHS left join MonHoc mh on hm.MSMH=mh.MSMH
--group by hs.MSHS,hs.TenHS

--6.Cho biết học sinh học môn tiếng anh
--b1:Danh sách học sinh
--b2:Học sinh đó học có MSMH là môn tiếng anh

--select hs.MSHS,hs.TenHS,mh.MSMH,mh.TenMH
--from HocSinh hs 
--left join HS_MH hm on hs.MSHS=hm.MSHS left join MonHoc mh on hm.MSMH=mh.MSMH
--where mh.TenMH='Anh'

--select *
--from MonHoc mh
--where mh.MSMH=999

--7.Thêm vào môn học lập trình
--insert MonHoc
--values ('',N'Nâng cao')
 

--8.Cho biết môn học không có học sinh theo học
--//Tức là những môn không có học sinh học(số lượng học =0 or null)
--Canh1:
--b1:Điếm số lượng học sinh
--b2:group MSMH theo lượng học điếm trên
--b3:Số lượng học điêm điếm = 0 or null

--select mh.MSMH,mh.TenMH, COUNT(hs.MSHS) so_học_sinh_hoc
--from HocSinh hs
--left join HS_MH hm on hs.MSHS=hm.MSHS right join MonHoc mh on hm.MSMH=mh.MSMH
--group by mh.TenMH,mh.MSMH
--having COUNT(hs.MSHS)=0

--Cach2:
--select*
--from MonHoc mh 
--left join HS_MH hm on mh.MSMH=hm.MSMH left join HocSinh hs on hm.MSHS=hs.MSHS
--where hs.MSHS is null

--10.Học sinh không học môn học nào
--select *
--from HocSinh hs 
--left join HS_MH hm on hs.MSHS = hm.MSHS left join MonHoc mh on hm.MSMH=mh.MSMH
--where mh.MSMH is null


