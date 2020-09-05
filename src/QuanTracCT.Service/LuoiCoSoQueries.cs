
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
        //2.Lấy danh sách tuyến đo lưới cơ sở
        //3.Tổng khoảng cách tuyến đo lưới cơ sở mỗi chu kỳ
        //4.Tổng số trạm máy tuyến đo lưới cơ sở mỗi chy kỳ
        //5.Tổng chênh cao tuyến đo lưới cơ sở mỗi chu kỳ
        //6.Tổng khoảng cách tuyến đo lưới cơ sở mỗi công trình
        //7.Tổng số trạm máy tuyến đo lưới cơ sở mỗi công trình
        //8.Tổng chênh cao tuyến đo lưới cơ sở mỗi công trình
        //9.Tổng số mốc cơ sở công trình
        //10.Tổng số mốc cơ sở chy kỳ
        //11.Tổng số tuyến cơ sở công trình
        //12.Tổng số tuyến cơ sở chu kỳ







        //1.Lấy các mốc của công trình
        public List<Moc> GetMocs() 
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from m in dataConText.Mocs
                        select m;
            return query.ToList();
        }

        //2.Danh mốc lưới cơ sở của công trình
        public List<Moc> GetMocs (string loaimoc)
        {
            var datacContext = new QuanTracLunCTContext();
            var query = from m in datacContext.Mocs
                        where m.LoaiMoc == loaimoc
                        select m;
            return query.ToList();
        }

        //3.Lấy mốc theo mã mốc
        public Moc GetMoc(Guid mamoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from m in dataConText.Mocs
                        where m.MaMoc == mamoc
                        select m;
            return query.FirstOrDefault();     
        }

        //4.Lấy danh sách tuyến đo móc cơ sở công trình
        public List<TuyenDo> GetTuyenDos(string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        where td.LoaiMoc == loaimoc
                        select td;
            return query.ToList();
        }

        //5.Lấy tuyến đo theo mã tuyến đo
        public TuyenDo GetTuyenDo(Guid matdcs)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        where td.MaTD == matdcs
                        select td;
            return query.FirstOrDefault();
        }

        //6.Tổng khoảng cách tuyến đo của chu kỳ 6

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

        //7.Tổng số trạm máy chu kỳ 6
        public double GetSumtm(Guid mack6, string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = dataConText.TuyenDos
                .Where(td => td.MaCK == mack6 && td.LoaiMoc == loaimoc)
                .Sum(td => td.SoMayTram);
            var sumtm = query;
            return sumtm;
        }

        //8.Tổng chênh cao tuyến đo cua chu ky 6
        public double GetSumcc(Guid mack6,string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = dataConText.TuyenDos
                .Where(td => td.MaCK == mack6 && td.LoaiMoc == loaimoc)
                .Sum(td => td.ChenhCao);
            var sumcc = query;
            return sumcc;
        }

        //9.Lấy danh sách tuyến đo của chu kỳ 6
        public List<TuyenDo> GetTuyenDocks(Guid macsck6)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        where td.MaCK == macsck6
                        select td;
            return query.ToList();
        }
    }
}
