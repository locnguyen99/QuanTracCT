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
            var dataContext = QuanTracLunCTContext();
            var query = from
        }
        //3.Lấy danh sách chu kỳ
        //4.Lây danh sách chu kỳ theo công trình
        //5.Lấy chu kỳ theo mã chu kỳ
        //6.Lấy danh sách mốc theo công trình

        //7.Lấy danh sách mốc theo chu kỳ
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
        //11.Lấy danh sách tuyến đo theo chu kỳ
        public List<TuyenDo> GetTuyenDocks(Guid macsck6)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        where td.MaCK == macsck6
                        select td;
            return query.ToList();
        }
        //12.Lấy danh sách tuyến đo
        //13.Lấy tuyến đo theo tuyến đo
        public TuyenDo GetTuyenDo(Guid matdcs)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        where td.MaTD == matdcs
                        select td;
            return query.FirstOrDefault();
        }
        //14.Tổng số chu kỳ công trình
        //15.Tổng số chu kỳ theo một công trình
        //16.Tổng số mốc của công trình
        //17.Tổng số mốc của chu kỳ
        //18.Tổng số tuyến của công trình
        //19.Tổng số tuyến của chu kỳ











        //2.Cho biết danh sách chu kỳ cua công trình
        public List<ChuKy> GetChuKys(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from ck in dataContext.ChuKys
                        where ck.MaCT == mact
                        select ck;
            return query.ToList();
        }

        //3.Cho biết tên mốc của mỗi chu kỳ
        public List<Moc> GetMocs(Guid mack)
        {
            var dataconText = new QuanTracLunCTContext();
            var query = from m in dataconText.Mocs
                        where m.MaCK == mack
                        select m;
            return query.ToList();
        }

        //4.Danh sach moc theo cong trinh
        public List<MocCT> GetMocCTs(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();

            var query = (from m in dataContext.Mocs
                         join ck in dataContext.ChuKys on m.MaCK equals ck.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on t.MaCT equals ct.MaCT
                         where t.MaCT == mact
                         select new MocCT
                         {
                             MaMoc=m.MaMoc,
                             TenMoc=m.TenMoc,
                             MaCT=ct.MaCT,
                             TenCT=ct.TenCT,
                             TenCK=t.TenCK,
                             MaCK=t.MaCK
                         });

            return query.ToList();
        }



        //var dataContext = new QuanTracLunCTContext();
        //public List<Moc> GetMocs(Guid mact)
        //{
        //    using (dataContext = new QuanTracLunCTContext(Dbset.GetConnectionString()))
        //    {
        //        var query = (from m in dataContext.Mocs
        //                     join ck in dataContext.ChuKys on m.MaCK equals ck.MaCK into tam
        //                     from t in tam.DefaultIfEmpty()
        //                     where t.MaCT == mact
        //                     select new
        //                     {
        //                         m.MaMoc,
        //                         t.MaCT
        //                     });
        //        return query.ToList();
        //    }
        //}

        //public List<MocCK> GetMocCKs(Guid mact)
        //{
        //    var dataContext = new QuanTracLunCTContext();
        //    var query = from ck in dataContext.ChuKys
        //                join m in dataContext.Mocs on ck.MaCK equals m.MaCK
        //                join ct in dataContext.CongTrinhs on ck.MaCK equals ct.MaCT into tam
        //                from t in tam.DefaultIfEmpty()
        //                where t.MaCT == mact
        //                group m by m.MaMoc into nhom
        //                select new MocCK
        //                {
        //                    TenCK=ck.TenCK,
        //                    MaCK=ck.MaCK,
        //                    TenCT=t.TenCT,
        //                    MaCT=t.MaCT
                            
        //                };
        //    return query.ToList();
        //}

        public List<MocCK> GetMocCKs(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join m in dataContext.Mocs on ck.MaCK equals m.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ct.MaCT == mact
                         group new { ck = t.MaCK,ct=ct.MaCT } by new { t.MaCK,ct.MaCT,ct.TenCT,ck.TenCK } into nhom
                         select new MocCK
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             SoMoc = nhom.Count()

                         }) ;
            return query.ToList();
        }

    }   
    
}
