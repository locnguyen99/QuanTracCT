
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Transactions;
using System.Reflection.Metadata.Ecma335;
using System.Security.Cryptography;
using System.Globalization;
using QuanTracCT.Entity;

namespace QuanTracCT.Service
{
    public class LuoiCoSoQueries
    {

        //1.Lấy danh sách mốc lưới cơ sở
        public List<Moc> GetMocs(string loaimoc)
        {
            var datacContext = new QuanTracLunCTContext();
            var query = from m in datacContext.Mocs
                        where m.LoaiMoc == loaimoc
                        select m;
            return query.ToList();
        }
        //2.Lấy danh sách tuyến đo lưới cơ sở
        public List<TuyenDo> GetTuyenDos(string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        where td.LoaiMoc == loaimoc
                        select td;
            return query.ToList();
        }
        //3.Tổng khoảng cách tuyến đo lưới cơ sở mỗi chu kỳ
        public double GetSumtd(Guid mack6, string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = dataConText.TuyenDos
                .Where(t => t.LoaiMoc == loaimoc && t.MaCK == mack6)
                .Select(t => t.KhoangCach)
                .Sum();
            var sum = query;
            return sum;
        }
        //4.Tổng số trạm máy tuyến đo lưới cơ sở mỗi chy kỳ
        public double GetSumtm(Guid mack6, string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = dataConText.TuyenDos
                .Where(td => td.MaCK == mack6 && td.LoaiMoc == loaimoc)
                .Sum(td => td.SoMayTram);
            var sumtm = query;
            return sumtm;
        }
        //5.Tổng chênh cao tuyến đo lưới cơ sở mỗi chu kỳ
        public double GetSumcc(Guid mack6, string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = dataConText.TuyenDos
                .Where(td => td.MaCK == mack6 && td.LoaiMoc == loaimoc)
                .Sum(td => td.ChenhCao);
            var sumcc = query;
            return sumcc;
        }
        //6.Tổng khoảng cách tuyến đo lưới cơ sở mỗi công trình
        //7.Tổng số trạm máy tuyến đo lưới cơ sở mỗi công trình
        //8.Tổng chênh cao tuyến đo lưới cơ sở mỗi công trình
        //9.Tổng số mốc cơ sở công trình
        //10.Tổng số mốc cơ sở chy kỳ
        //11.Tổng số tuyến cơ sở công trình
        //12.Tổng số tuyến cơ sở chu kỳ

        
    }
}
