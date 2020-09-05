﻿using QuanTracCT.Entity;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using QuanTracCT.Service.DTO;

namespace QuanTracCT.Service
{
    public class QuanTracNghiengQueries
    {
        //1.Lấy danh sách mốc nghiêng công trình
        public List<MocNghieng> GetMocNghiengs()
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from mn in dataContext.MocNghiengs
                        select mn;
            return query.ToList();
        }

        //2.Lấy danh sách mốc nghiêng theo công trình
        public List<MocN> GetMocNghiengCTs( Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from mn in dataContext.MocNghiengs
                        join ck in dataContext.ChuKys on mn.MaCK equals ck.MaCK into tam
                        from t in tam.DefaultIfEmpty()
                        join ct in dataContext.CongTrinhs on t.MaCT equals ct.MaCT
                        where ct.MaCT == mact
                        select new MocN
                        {
                            MaMocN = mn.MaMocN,
                            TenMocN = mn.TenMocN,
                            TenCK = t.TenCK,
                            MaCK = t.MaCK,
                            TenCT = ct.TenCT,
                            MaCT = ct.MaCT
                        };
            return query.ToList();
        }

        //3.Lấy danh sách mốc nghiêng theo chu kỳ mỗi sàn
        public List<MocNghieng> GetMocNghiengSans(int san)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from mn in dataContext.MocNghiengs
                        where mn.San == san
                        select mn;
            return query.ToList();
        }

        //4.Lấy danh sách mốc nghiêng mỗi loại lưới(CS or QT)
        public List<MocNghieng> GetMocNghiengLoais(string loaimoc)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from mn in dataContext.MocNghiengs
                        where mn.LoaiMoc == loaimoc
                        select mn;
            return query.ToList();
        }

        //5.Lấy mốc nghiêng theo mã mốc
        public MocNghieng GetMocNghieng(Guid mamocn)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from mn in dataContext.MocNghiengs
                        where mn.MaMocN == mamocn
                        select mn;
            return query.FirstOrDefault();
        }

        //6.Tính tổng số mốc nghiêng của công trình
        public SumMocN GetSumMocNCT(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join mn in dataContext.MocNghiengs on ck.MaCK equals mn.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ct.MaCT == mact
                         group new { ck = t.MaCK, ct = ct.MaCT } by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK } into nhom
                         select new SumMocN
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             SoMocN = nhom.Count()
                         });
            return query.FirstOrDefault();
        }

        //7.Tính tổng số mốc nghiêng của chu kỳ
        public SumMocN GetSumMocNCK (Guid mack)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from mn in dataContext.MocNghiengs
                        join ck in dataContext.ChuKys on mn.MaCK equals ck.MaCK
                        where ck.MaCK == mack
                        group ck by ck.MaCK into nhom
                        select new SumMocN
                        {
                            MaCK = nhom.Key,
                            TenCK = nhom.Key,
                            SoMocN = nhom.Count()
                        };
            return query.FirstOrDefault();
        }

        //8.Tổng số mốc nghiêng lưới cơ sở công trình
        public SumMocN GetSumMocNLoaiCSCT(Guid mact, string loaimoc)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join mn in dataContext.MocNghiengs on ck.MaCK equals mn.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ct.MaCT == mact && t.LoaiMoc == loaimoc
                         group new { ck = t.MaCK, ct = ct.MaCT } by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK,t.LoaiMoc } into nhom
                         select new SumMocN
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             LoaiMoc = nhom.Key.LoaiMoc,
                             SoMocN = nhom.Count()
                         });
            return query.FirstOrDefault();
        }

        //9.Tổng số mốc nghiêng lưới quan trắc chu kỳ
        public SumMocN GetSumMocNLoaiQTCK(Guid mack, string loaimoc)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join mn in dataContext.MocNghiengs on ck.MaCK equals mn.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ck.MaCK == mack && t.LoaiMoc == loaimoc
                         group new { ck = t.MaCK, ct = ct.MaCT } by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK, t.LoaiMoc } into nhom
                         select new SumMocN
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             LoaiMoc = nhom.Key.LoaiMoc,
                             SoMocN = nhom.Count()
                         });
            return query.FirstOrDefault();
        }

        //10.Tổng số mốc nghiêng lưới quan trắc công trình
        public SumMocN GetSumMocNLoaiQTCT(Guid mact, string loaimoc)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join mn in dataContext.MocNghiengs on ck.MaCK equals mn.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ct.MaCT == mact && t.LoaiMoc == loaimoc
                         group new { ck = t.MaCK, ct = ct.MaCT } by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK, t.LoaiMoc } into nhom
                         select new SumMocN
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             LoaiMoc = nhom.Key.LoaiMoc,
                             SoMocN = nhom.Count()
                         });
            return query.FirstOrDefault();
        }

        //11.Tổng số mốc nghiêng lưới cơ sở chu kỳ
        public SumMocN GetSumMocNLoaiCSCK(Guid mack, string loaimoc)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join mn in dataContext.MocNghiengs on ck.MaCK equals mn.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ck.MaCK == mack && t.LoaiMoc == loaimoc
                         group new { ck = t.MaCK, ct = ct.MaCT } by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK, t.LoaiMoc } into nhom
                         select new SumMocN
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             LoaiMoc = nhom.Key.LoaiMoc,
                             SoMocN = nhom.Count()
                         });
            return query.FirstOrDefault();
        }

        //12.Lấy danh sách các điểm nghiêng theo công trình
        public List<DiemN> GetDiemNghiengCTs(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from dm in dataContext.DiemNghiengs
                        join ck in dataContext.ChuKys on dm.MaCK equals ck.MaCK into tam
                        from t in tam.DefaultIfEmpty()
                        join ct in dataContext.CongTrinhs on t.MaCT equals ct.MaCT
                        where ct.MaCT == mact
                        select new DiemN
                        {
                            MaDiem = dm.MaDiem,
                            TenDiem = dm.TenDiem,
                            TenCK = t.TenCK,
                            MaCK = t.MaCK,
                            TenCT = ct.TenCT,
                            MaCT = ct.MaCT
                        };
            return query.ToList();
        }

        //13.Lấy danh sách các điểm nghiêng của công trình
        public List<DiemNghieng> GetDiemNghiengs()
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from dm in dataContext.DiemNghiengs
                        select dm;
            return query.ToList();
        }
        //14.Lấy danh sách các điểm nghiêng theo chu kỳ
        public List<DiemNghieng> GetDiemNghiengCKs(Guid mack)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from dm in dataContext.DiemNghiengs
                        where dm.MaCK == mack
                        select dm;
            return query.ToList();
        }
        //15.Lấy điểm nghiêng theo mã điểm nghiêng
        public DiemNghieng GetDiemNghieng(Guid madiem)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from dm in dataContext.DiemNghiengs
                        where dm.MaDiem == madiem
                        select dm;
            return query.FirstOrDefault();
        }
        //16.Số điểm nghiêng của công trình
        public SumDiemN GetSumDiemNCT(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join dm in dataContext.DiemNghiengs on ck.MaCK equals dm.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ct.MaCT == mact
                         group new { ck = t.MaCK, ct = ct.MaCT } by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK } into nhom
                         select new SumDiemN
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             SoDiemN = nhom.Count()
                         });
            return query.FirstOrDefault();
        }

        //17.Số điểm nghiêng của chu kỳ
        public SumDiemN GetSumDiemNCK(Guid mack)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from dm in dataContext.DiemNghiengs
                        join ck in dataContext.ChuKys on dm.MaCK equals ck.MaCK
                        where ck.MaCK == mack
                        group ck by ck.MaCK into nhom
                        select new SumDiemN
                        {
                            MaCK = nhom.Key,
                            TenCK = nhom.Key,
                            SoDiemN = nhom.Count()
                        };
            return query.FirstOrDefault();
        }
        //18.Lấy danh sách các đỉnh nghiêng theo công trình
        public List<DinhN> GetDinhNghiengCTs(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from dh in dataContext.DinhNghiengs
                        join ck in dataContext.ChuKys on dh.MaCK equals ck.MaCK into tam
                        from t in tam.DefaultIfEmpty()
                        join ct in dataContext.CongTrinhs on t.MaCT equals ct.MaCT
                        where ct.MaCT == mact
                        select new DinhN
                        {
                            MaDinh = dh.MaDinh,
                            TenCK = t.TenCK,
                            MaCK = t.MaCK,
                            TenCT = ct.TenCT,
                            MaCT = ct.MaCT
                        };
            return query.ToList();
        }
        //19.Lấy danh sách các đỉnh nghiêng của công trình
        public List<DinhNghieng> GetDinhNghiengs()
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from dh in dataContext.DinhNghiengs
                        select dh;
            return query.ToList();
        }
        //20.Lấy danh sách các đỉnh nghiêng theo chu kỳ
        public List<DinhNghieng> GetDinhNghiengCKs(Guid mack)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from dh in dataContext.DinhNghiengs
                        where dh.MaCK == mack
                        select dh;
            return query.ToList();
        }

        //21.Lấy đỉnh nghiêng theo mã điểm nghiêng
        public DinhNghieng GetDinhNghieng(Guid madinh)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from dh in dataContext.DinhNghiengs
                        where dh.MaDinh == madinh
                        select dh;
            return query.FirstOrDefault();
        }
        //22.Số đỉnh nghiêng của công trình
        public SumDinhN GetSumDinhNCT(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join dh in dataContext.DinhNghiengs on ck.MaCK equals dh.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ct.MaCT == mact
                         group new { ck = t.MaCK, ct = ct.MaCT } by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK } into nhom
                         select new SumDinhN
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             SoDinhN = nhom.Count()
                         });
            return query.FirstOrDefault();
        }

        //23.Số đỉnh nghiêng của chu kỳ
        public SumDinhN GetSumDinhNCK(Guid mack)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from dh in dataContext.DinhNghiengs
                        join ck in dataContext.ChuKys on dh.MaCK equals ck.MaCK
                        where ck.MaCK == mack
                        group ck by ck.MaCK into nhom
                        select new SumDinhN
                        {
                            MaCK = nhom.Key,
                            TenCK = nhom.Key,
                            SoDinhN = nhom.Count()
                        };
            return query.FirstOrDefault();
        }
        //24.Lấy danh sách cạnh nghiêng công trình
        public List<CanhNghieng> GetCanhNghiengs()
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from cn in dataContext.CanhNghiengs
                        select cn;
            return query.ToList();
        }
        //25.Lấy danh sách cạnh nghiêng theo công trình
        public List<CanhN> GetCanhNghiengCTs(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from cn in dataContext.CanhNghiengs
                        join ck in dataContext.ChuKys on cn.MaCK equals ck.MaCK into tam
                        from t in tam.DefaultIfEmpty()
                        join ct in dataContext.CongTrinhs on t.MaCT equals ct.MaCT
                        where ct.MaCT == mact
                        select new CanhN
                        {
                            MaCanh = cn.MaCanh,
                            TenCK = t.TenCK,
                            MaCK = t.MaCK,
                            TenCT = ct.TenCT,
                            MaCT = ct.MaCT
                        };
            return query.ToList();
        }
        
        //26.Lấy cạnh nghiêng theo mã cạnh nghiêng
        public CanhNghieng GetCanhNghieng(Guid macanh)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from cn in dataContext.CanhNghiengs
                        where cn.MaCanh == macanh
                        select cn;
            return query.FirstOrDefault();
        }
        //27.Tính tổng số cạnh nghiêng của công trình
        public SumCanhN GetSumCanhNCT(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join cn in dataContext.CanhNghiengs on ck.MaCK equals cn.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ct.MaCT == mact
                         group new { ck = t.MaCK, ct = ct.MaCT } by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK } into nhom
                         select new SumCanhN
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             SoCanhN = nhom.Count()
                         });
            return query.FirstOrDefault();
        }
        //28.Tính tổng số cạnh nghiêng của chu kỳ
        public SumCanhN GetSumCanhNCK(Guid mack)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from cn in dataContext.CanhNghiengs
                        join ck in dataContext.ChuKys on cn.MaCK equals ck.MaCK
                        where ck.MaCK == mack
                        group ck by ck.MaCK into nhom
                        select new SumCanhN
                        {
                            MaCK = nhom.Key,
                            TenCK = nhom.Key,
                            SoCanhN = nhom.Count()
                        };
            return query.FirstOrDefault();
        }
    }
}
