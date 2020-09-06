using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Globalization;
using System.Transactions;
using QuanTracCT.Entity;
using QuanTracCT.Service.DTO;

namespace QuanTracCT.Service
{
    public class LuoiQuanTracQueries
    {
        //1.Lấy danh sách mốc lưới quang trắc
        public List<Moc> GetMocQTs(string loaimoc)
        {
            var datacContext = new QuanTracLunCTContext();
            var query = from m in datacContext.Mocs
                        where m.LoaiMoc == loaimoc
                        select m;
            return query.ToList();
        }

        //2.Lấy danh sách tuyến đo lưới quang trắc
        public List<TuyenDo> GetTuyenDoQTs(string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        where td.LoaiMoc == loaimoc
                        select td;
            return query.ToList();
        }

        //3.Tổng khoảng cách tuyến đo lưới quang trắc mỗi chu kỳ
        public double GetSumKCTDQT(Guid mack, string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = dataConText.TuyenDos
                .Where(td => td.LoaiMoc == loaimoc && td.MaCK == mack)
                .Select(td => td.KhoangCach)
                .Sum();
            return query;
        }

        //4.Tổng số trạm máy tuyến đo lưới quang trắc mỗi chy kỳ
        public double GetSumTMTDQT(Guid mack, string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = dataConText.TuyenDos
                .Where(td => td.MaCK == mack && td.LoaiMoc == loaimoc)
                .Sum(td => td.SoMayTram);
            return query;
        }

        //5.Tổng chênh cao tuyến đo lưới quang trắc mỗi chu kỳ
        public double GetSumCCTDQT(Guid mack, string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = dataConText.TuyenDos
                .Where(td => td.MaCK == mack && td.LoaiMoc == loaimoc)
                .Sum(td => td.ChenhCao);
            return query;
        }

        //6.Tổng khoảng cách tuyến đo lưới quang trắc mỗi công trình
        public SumQTL GetSumKCTDQTCT(Guid mact, string loaimoc, Guid mack)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ct in dataContext.CongTrinhs
                         join ck in dataContext.ChuKys on ct.MaCT equals ck.MaCT
                         join td in dataContext.TuyenDos on ck.MaCK equals td.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         where ct.MaCT == mact && t.LoaiMoc == loaimoc && t.MaCK == mack
                         group new { ct.MaCT, ct.TenCT, ck.MaCK, ck.TenCK, t.KhoangCach }
                            by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK } into nhom
                         select new SumQTL
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             SoMocQTCT = nhom.Sum(gSelect => gSelect.KhoangCach)
                         });
            return query.FirstOrDefault();
        }

        //7.Tổng số trạm máy tuyến đo lưới quang trắc mỗi công trình
        public SumQTL GetSumTMTDQTCT(Guid mact, string loaimoc, Guid mack)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ct in dataContext.CongTrinhs
                         join ck in dataContext.ChuKys on ct.MaCT equals ck.MaCT
                         join td in dataContext.TuyenDos on ck.MaCK equals td.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         where ct.MaCT == mact && t.LoaiMoc == loaimoc && t.MaCK == mack
                         group new { ct.MaCT, ct.TenCT, ck.MaCK, ck.TenCK, t.SoMayTram }
                            by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK } into nhom
                         select new SumQTL
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             SoMocQTCT = nhom.Sum(gSelect => gSelect.SoMayTram)
                         });
            return query.FirstOrDefault();
        }

        //8.Tổng chênh cao tuyến đo lưới quang trắc mỗi công trình
        public SumQTL GetSumCCTDQTCT(Guid mact, string loaimoc, Guid mack)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ct in dataContext.CongTrinhs
                         join ck in dataContext.ChuKys on ct.MaCT equals ck.MaCT
                         join td in dataContext.TuyenDos on ck.MaCK equals td.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         where ct.MaCT == mact && t.LoaiMoc == loaimoc && t.MaCK == mack
                         group new { ct.MaCT, ct.TenCT, ck.MaCK, ck.TenCK, t.ChenhCao }
                            by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK } into nhom
                         select new SumQTL
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             SoMocQTCT = nhom.Sum(gSelect => gSelect.ChenhCao)
                         });
            return query.FirstOrDefault();
        }

        //9.Tổng số mốc quan trắc công trình
        public SumQTL GetSumMocQTCT(Guid mact, string loaimoc)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join m in dataContext.Mocs on ck.MaCK equals m.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ct.MaCT == mact && t.LoaiMoc == loaimoc
                         group new { ck = t.MaCK, ct = ct.MaCT } by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK } into nhom
                         select new SumQTL
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             SoMocQTCT = nhom.Count()
                         });
            return query.FirstOrDefault();
        }

        //10.Tổng số mốc quang trắc chy kỳ
        public SumQTL GetSumMocQTCK(Guid mact, string loaimoc)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join m in dataContext.Mocs on ck.MaCK equals m.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         where t.MaCK == mact && t.LoaiMoc == loaimoc
                         group new { ck } by new { t.MaCK, ck.TenCK } into nhom
                         select new SumQTL
                         {
                             MaCK = nhom.Key,
                             TenCK = nhom.Key,
                             SoMocQTCK = nhom.Count()
                         });
            return query.FirstOrDefault();
        }

        //11.Tổng số tuyến quang trắc công trình
        public SumQTL GetSumTuyenQTCT(Guid mact, string loaimoc)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join td in dataContext.TuyenDos on ck.MaCK equals td.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         join ct in dataContext.CongTrinhs on ck.MaCT equals ct.MaCT
                         where ct.MaCT == mact && t.LoaiMoc == loaimoc
                         group new { ck = t.MaCK, ct = ct.MaCT } by new { t.MaCK, ct.MaCT, ct.TenCT, ck.TenCK } into nhom
                         select new SumQTL
                         {
                             TenCK = nhom.Key.TenCK,
                             TenCT = nhom.Key.TenCT,
                             MaCK = nhom.Key.MaCK,
                             MaCT = nhom.Key.MaCT,
                             SoTuyenQTCT = nhom.Count()

                         });
            return query.FirstOrDefault();
        }

        //12.Tổng số tuyến quang trắc chy kỳ
        public SumQTL GetSumTuyenQTCK(Guid mact, string loaimoc)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = (from ck in dataContext.ChuKys
                         join td in dataContext.TuyenDos on ck.MaCK equals td.MaCK into tam
                         from t in tam.DefaultIfEmpty()
                         where t.MaCK == mact && t.LoaiMoc == loaimoc
                         group new { ck } by new { t.MaCK, ck.TenCK } into nhom
                         select new SumQTL
                         {
                             MaCK = nhom.Key,
                             TenCK = nhom.Key,
                             SoTuyenQTCK = nhom.Count()
                         });
            return query.FirstOrDefault();
        }
    }
}
