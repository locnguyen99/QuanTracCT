using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Globalization;
using System.Transactions;
using QuanTracCT.Entity;

namespace QuanTracCT.Service
{
    public class LuoiQuanTracQueries
    {

        //1.Lấy danh sách mốc lưới quang trắc
        //2.Lấy danh sách tuyến đo lưới quang trắc
        //3.Tổng khoảng cách tuyến đo lưới quang trắc mỗi chu kỳ
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
        //4.Tổng số trạm máy tuyến đo lưới quang trắc mỗi chy kỳ
        //5.Tổng chênh cao tuyến đo lưới quang trắc mỗi chu kỳ
        //6.Tổng khoảng cách tuyến đo lưới quang trắc mỗi công trình
        //7.Tổng số trạm máy tuyến đo lưới quang trắc mỗi công trình
        //8.Tổng chênh cao tuyến đo lưới quang trắc mỗi công trình
        //9.Tổng số mốc quang trắc công trình
        //10.Tổng số mốc quang trắc chy kỳ
        //11.Tổng số tuyến quang trắc công trình
        //12.Tổng số tuyến quang trắc chy kỳ



        //1.Lấy mốc theo mã mốc của lưới quan trắc
        public Moc GetMoc(Guid mamocqt,string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from m in dataConText.Mocs
                        where m.MaMoc == mamocqt && m.LoaiMoc == loaimoc
                        select m;
            return query.FirstOrDefault();
        }

        //2.Lấy mốc của chu kỳ 6
        public List<Moc> GetMocs(Guid maqtck6)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from m in dataConText.Mocs
                        where m.MaCK == maqtck6
                        select m;
            var moc = query;
            return moc.ToList();
        }

        //3.Danh sách tuyến đo lưới quan trắc
        public List<TuyenDo> GetTuyenDos(string loaimoc)
        {
            var datacontext = new QuanTracLunCTContext();
            var query = from td in datacontext.TuyenDos
                        where td.LoaiMoc == loaimoc
                        select td;
            return query.ToList();
        }

        //4.Danh sách tuyến đo của công trình
        public List<TuyenDo> GetTuyenDos()
        {
            var datacontex = new QuanTracLunCTContext();
            var query = from td in datacontex.TuyenDos
                        select td;
            return query.ToList();
        }

        //5.Lấy tuyến đo theo mã tuyến đo lươi quan trắc
        public TuyenDo GetTuyenDo(Guid matdqt)
        {
            var datacontext = new QuanTracLunCTContext();
            var query = from td in datacontext.TuyenDos
                        where td.MaTD == matdqt
                        select td;
            return query.FirstOrDefault();
        }
            
        //6.Lấy tổng khoảng cách tuyến đo quan trac
        public double GetSumtdqt(string loaimoc, Guid mack6qt)
        {
            var datacontext = new QuanTracLunCTContext();
            var query = datacontext.TuyenDos
                .Where(td => td.LoaiMoc == loaimoc && td.MaCK == mack6qt)
                .Sum(td => td.KhoangCach);
            var sumtdqt = query;
            return sumtdqt;
        }

        //7.Lấy tổng số trạm máy tuyến đo quan trac
        public double GetSumTM(Guid mack6qt,string loaimoc)
        {
            var datacontext = new QuanTracLunCTContext();
            var query = datacontext.TuyenDos
                .Where(td => td.MaCK == mack6qt && td.LoaiMoc == loaimoc)
                .Sum(td => td.SoMayTram);
            var sumtm = query;
            return sumtm;
        }

        //8.Lấy tổng chênh cao tuyến quan trac
        public double GetSumCC ( Guid mack6qt,string loaimoc)
        {
            var datacontext = new QuanTracLunCTContext();
            var query = datacontext.TuyenDos
                .Where(td => td.MaCK == mack6qt && td.LoaiMoc == loaimoc)
                .Sum(td => td.ChenhCao);
            var sumCC = query;
            return query;
        }










    }
}
