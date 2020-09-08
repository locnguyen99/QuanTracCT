using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System.Data;
using System.Linq;
using QuanTracCT.Entity;
using Accord.Compat;
using QuanTracCT.Service.DTO;

namespace QuanTracCT.Service
{
    public class MoDauQueries
    {
        //1.Lấy danh sách công trình
        public List<CongTrinh> GetCongTrinhs()
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from ct in dataContext.CongTrinhs
                        select ct;
            return query.ToList();
        }

        //2.Lấy công trình theo mã công trình
        public CongTrinh GetCongTrinh(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from ct in dataContext.CongTrinhs
                        where ct.MaCT == mact
                        select ct;
            return query.FirstOrDefault();
        }

        //3.Lấy danh sách chu kỳ
        public List<ChuKy> GetChuKies()
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from ck in dataContext.ChuKys
                        select ck;
            return query.ToList();
        }

        //4.Lây danh sách chu kỳ theo công trình
        public List<ChuKy> GetChuKieCTs(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from ck in dataContext.ChuKys
                        join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT into tam
                        from t in tam.DefaultIfEmpty()
                        where t.MaCT == mact
                        select ck;
            return query.ToList();
        }

        //5.Lấy chu kỳ theo mã chu kỳ
        public ChuKy GetChuKy(Guid mack)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from ck in dataContext.ChuKys
                        where ck.MaCK == mack
                        select ck;
            return query.FirstOrDefault();
        }

        //6.Lấy danh sách mốc theo công trình
        public List<QTLun> GetMocCTs(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from m in dataContext.Mocs
                        join ck in dataContext.ChuKys on m.MaCK equals ck.MaCK into tam
                        from t in tam.DefaultIfEmpty()
                        join ct in dataContext.CongTrinhs on t.MaCT equals ct.MaCT
                        where ct.MaCT == mact
                        select new QTLun
                        {
                            MaMoc = m.MaMoc,
                            TenMoc = m.TenMoc,
                            TenCK = t.TenCK,
                            MaCK = t.MaCK,
                            MaCT = ct.MaCT,
                            TenCT = ct.TenCT
                        };
            return query.ToList();
        }

        //7.Lấy danh sách mốc theo chu kỳ
        public List<Moc> GetMocCKs(Guid mack)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from m in dataContext.Mocs
                        join ck in dataContext.ChuKys on m.MaCK equals ck.MaCK into tam
                        from t in tam.DefaultIfEmpty()
                        where t.MaCK == mack
                        select m;
            return query.ToList();
        }

        //8.Lấy danh sách mốc 
        public List<Moc> GetMocs()
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from m in dataConText.Mocs
                        select m;
            return query.ToList();
        }

        //9.Lấy mốc theo mã mốc
        public Moc GetMoc(Guid mamoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from m in dataConText.Mocs
                        where m.MaMoc == mamoc
                        select m;
            return query.FirstOrDefault();
        }

        //10.Lấy danh sách tuyến đo theo công trình
        public List<QTLun> GetTuyenDoCTs(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from td in dataContext.TuyenDos
                        join ck in dataContext.ChuKys on td.MaCK equals ck.MaCK into tam
                        from t in tam.DefaultIfEmpty()
                        join ct in dataContext.CongTrinhs on t.MaCT equals ct.MaCT
                        where ct.MaCT == mact
                        select new QTLun
                        {
                            MaTD = td.MaTD,
                            TenTuyen = td.TenTuyen,
                            TenCK = t.TenCK,
                            MaCK = t.MaCK,
                            MaCT = ct.MaCT,
                            TenCT = ct.TenCT
                        };
            return query.ToList();
        }

        //11.Lấy danh sách tuyến đo theo chu kỳ
        public List<TuyenDo> GetTuyenDocCKs(Guid mack)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        join ck in dataConText.ChuKys on td.MaCK equals ck.MaCK into tam
                        from t in tam.DefaultIfEmpty()
                        where t.MaCK == mack
                        select td;
            return query.ToList();
        }

        //12.Lấy danh sách tuyến đo
        public List<TuyenDo> GetTuyenDos()
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from td in dataContext.TuyenDos
                        select td;
            return query.ToList();
        }

        //13.Lấy tuyến đo theo tuyến đo
        public TuyenDo GetTuyenDo(Guid matd)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        where td.MaTD == matd
                        select td;
            return query.FirstOrDefault();
        }

        //14.Tổng số chu kỳ theo một công trình
        public SumQTL GetSumCKCT(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ct in dataContext.CongTrinhs
                        join ck in dataContext.ChuKys on ct.MaCT equals ck.MaCT into tam
                        from t in tam.DefaultIfEmpty()
                        where ct.MaCT == mact
                        group new {ct.MaCT} by new {ct.MaCT,ct.TenCT} into nhom
                        select new SumQTL
                        {
                            MaCT = nhom.Key,
                            TenCT = nhom.Key,
                            SoCKCT = nhom.Count()
                        });
            return query.FirstOrDefault();
        }

        //15. Tổng số mốc theo một công trình
        public SumQTL GetSumMocCT(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join m in dataContext.Mocs on ck.MaCK equals m.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ct.MaCT == mact
                         group new { ck = t.MaCK, ct = ct.MaCT } by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK } into nhom
                         select new SumQTL
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             SoMocCT = nhom.Count()

                         });
            return query.FirstOrDefault();
        }

        //16.Tổng số mốc của mỗi chu kỳ
        public SumQTL GetSumMocCK(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join m in dataContext.Mocs on ck.MaCK equals m.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         where t.MaCK == mact
                         group new { ck } by new { t.MaCK, ck.TenCK } into nhom
                         select new SumQTL
                         {
                             MaCK = nhom.Key,
                             TenCK = nhom.Key,
                             SoMocCK = nhom.Count()
                         });
            return query.FirstOrDefault();
        }


        //17.Tổng số tuyến của mỗi chu kỳ
        public SumQTL GetSumTuyenCK(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join td in dataContext.TuyenDos on ck.MaCK equals td.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         where t.MaCK == mact
                         group new { ck } by new { t.MaCK, ck.TenCK } into nhom
                         select new SumQTL
                         {
                             MaCK = nhom.Key,
                             TenCK = nhom.Key,
                             SoTuyenCK = nhom.Count()
                         });
            return query.FirstOrDefault();
        }

        //18.Tổng số tuyến của mỗi công trình
        public SumQTL GetSumTuyenCT(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join td in dataContext.TuyenDos on ck.MaCK equals td.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ct.MaCT == mact
                         group new { ct } by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK } into nhom
                         select new SumQTL
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             SoTuyenCT = nhom.Count()

                         });
            return query.FirstOrDefault();
        }

            //19.Them moc vao ban moc
        //public Moc AddMoc()
        //{
        //    var dataContext = new QuanTracLunCTContext();
        //    var moc = new Moc();
        //    moc.TenMoc = "M223";
        //    moc.MaCK = new Guid("7A78D299-34B7-4CA9-AC05-42EDD74B5CAC");
        //    dataContext.Mocs.Add(moc);
        //    dataContext.SaveChanges();
        //    return moc;
        //}
        //public Moc UpdateMoc()
        //{
        //    var dataContext = new QuanTracLunCTContext();
        //    var moctable = dataContext.Mocs;
        //    var moc = moctable.FirstOrDefault(m => m.MaMoc == new Guid("D12E8E01-D5B3-43DD-9703-BBEBFDB2C65F"));
        //    moc.TenMoc = "M222";
        //    dataContext.Entry<Moc>(moc).State = EntityState.Modified;
        //    context.Products.Update(entity)
        //    dataContext.SaveChanges();
        //    return moc;
        //}

        //public Moc UpdateMoc()
        //{
        //    var dataContext = new QuanTracLunCTContext();
        //    var moc = (from m in dataContext.Mocs
        //               where m.TenMoc == "M223"
        //               select m).First();
        //    moc.TenMoc = "M222";
        //    dataContext.SaveChanges();
        //    return moc;
        //}
    }
}
