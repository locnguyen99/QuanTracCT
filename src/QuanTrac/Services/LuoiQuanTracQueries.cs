using HocLai;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Reflection.Metadata.Ecma335;
using System.Globalization;
using System.Transactions;

namespace QuanTracCT.Services
{
    public class LuoiQuanTracQueries
    {
        //1.Lấy mốc theo mã mốc 
        public List<Moc> GetMocs()
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from m in dataConText.Mocs
                        select m;
            return query.ToList();
        }

        //2.Lấy mốc theo chu kỳ
        public List<Moc> GetMocs(Guid mack6)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from m in dataConText.Mocs
                        where m.MaCK == mack6
                        select m;
            var moc = query;
            return moc.ToList();
        }

        //4.Lấy mốc theo công trình
        public List<Moc> GetMocs(CongTrinh congTrinh)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from m in dataConText.Mocs
                        select m;
            return query.ToList();
        }

        //5.Lấy danh sách mốc
        public List<Moc> GetMocs(string loaimoc)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from m in dataContext.Mocs
                        where m.LoaiMoc == loaimoc
                        select m;
            return query.ToList();
        }

        //6.Danh sách tuyến đo
        public List<TuyenDo> GetTuyenDos(string loaimoc)
        {
            var datacontext = new QuanTracLunCTContext();
            var query = from td in datacontext.TuyenDos
                        where td.LoaiMoc == loaimoc
                        select td;
            return query.ToList();
        }

        //7.Lấy tuyến đo theo chu kỳ
        public TuyenDo GetTuyenDo(Guid mack6,string loaimoc)
        {
            var datacontext = new QuanTracLunCTContext();
            var query = from td in datacontext.TuyenDos
                        where td.LoaiMoc == loaimoc && td.MaCK == mack6
                        select td;
            return query.FirstOrDefault();
        }

        //8.Lấy tuyến đo theo công trình
        public List<TuyenDo> GetTuyenDos(CongTrinh congTrinh)
        {
            var datacontex = new QuanTracLunCTContext();
            var query = from td in datacontex.TuyenDos
                        select td;
            return query.ToList();
        }

        //9.Lấy tuyến đo theo mã tuyến đo

        public TuyenDo GetTuyenDo(Guid matdqt)
        {
            var datacontext = new QuanTracLunCTContext();
            var query = from td in datacontext.TuyenDos
                        where td.MaTD == matdqt
                        select td;
            return query.FirstOrDefault();
        }
            
        //10.Lấy tổng khoảng cách tuyến đo quan trac
        public double GetSumtdkc(string loaimoc, Guid mack6qt)
        {
            var datacontext = new QuanTracLunCTContext();
            var query = datacontext.TuyenDos.Where(td => td.LoaiMoc == loaimoc && td.MaCK == mack6qt).Sum(td => td.KhoangCach);
            var sumkc = query;
            return sumkc;
        }

        //11.Lấy tổng số trạm máy tuyến đo quan trac

        public double GetSumSoTram(Guid mack6qt,string loaimoc)
        {
            var datacontext = new QuanTracLunCTContext();
            var query = datacontext.TuyenDos.Where(td => td.MaCK == mack6qt && td.LoaiMoc == loaimoc).Sum(td => td.SoMayTram);
            var sumst = query;
            return sumst;
        }

        //12.Lấy tổng chênh cao tuyến quan trac
        public double GetSumCC ( Guid mack6qt,string loaimoc)
        {
            var datacontext = new QuanTracLunCTContext();
            var query = datacontext.TuyenDos.Where(td => td.MaCK == mack6qt && td.LoaiMoc == loaimoc).Sum(td => td.ChenhCao);
            var tongcc = query;
            return query;
        }










    }
}
