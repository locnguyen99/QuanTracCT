using HocLai;
using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Transactions;
using System.Reflection.Metadata.Ecma335;
using System.Security.Cryptography;
using Microsoft.EntityFrameworkCore.Query.SqlExpressions;
using System.Globalization;

namespace QuanTracCT.Services
{
    public class LuoiCoSoQueries
    {
        //1.Lấy các mốc của công trình
        public List<Moc> GetMocs(CongTrinh congTrinh) 
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from m in dataConText.Mocs
                        select m;
            return query.ToList();
        }

        //2.Danh sách thông tin của mốc lưới cơ sở (or quan trắc)
        public List<Moc> GetMocs (string loaimoc)
        {
            var datacContext = new QuanTracLunCTContext();
            var query = from m in datacContext.Mocs
                        where m.LoaiMoc == loaimoc
                        select m;
            return query.ToList();
        }

        //3.Lấy 1 mốc theo mã mốc
        public Moc GetMoc(Guid mamoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from m in dataConText.Mocs
                        where m.MaMoc == mamoc
                        select m;
            //var moc = query.FirstOrDefault();   //khai báo thêm tên moc return.
            return query.FirstOrDefault();     // trả về trực tiếp query
        }

        //4.Lay chu ky theo ma cong trinh
        public ChuKy GetChuKy(Guid mack)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from ck in dataConText.ChuKys
                        where ck.MaCK == mack
                        select ck;
            var chuKy = query.FirstOrDefault();
            return chuKy;
        }

        //5.Lấy danh sách tuyến đo 
        public List<TuyenDo> GetTuyenDos()
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        where td.LoaiMoc == "MocCS"
                        select td;
            return query.ToList();
        }

        //6.Lấy 1 tuyến đo theo mã tuyến đo       // theo ma la duy nhat' r k can + dk
        public TuyenDo GetTuyenDo(Guid matd)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        where td.MaTD == matd
                        select td;
            var tuyendo = query.FirstOrDefault();
            return tuyendo;
        }

        //7.Tổng khoảng cách tuyến đo theo chu ky (o day lay chu ky 6)

        public double GetSumtd(Guid mack6, string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = dataConText.TuyenDos.Where(t => t.LoaiMoc == loaimoc && t.MaCK == mack6).Select(t => t.KhoangCach).Sum();
            var tong = query;
            return tong;
                        
        }

        //8.Tổng số tam may của tuyến đo chu ky 6
        public double GetSumtm(Guid mack6, string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = dataConText.TuyenDos.Where(td => td.MaCK == mack6 && td.LoaiMoc == loaimoc).Sum(td => td.SoMayTram);
            var tongtm = query;
            return tongtm;
        }

        //9.Tổng chênh cao của tuyến đo chu ky 6
        public double GetSumcc(Guid mack6,string loaimoc)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = dataConText.TuyenDos.Where(td => td.MaCK == mack6 && td.LoaiMoc == loaimoc).Sum(td => td.ChenhCao);
            var tongcc = query;
            return tongcc;
                        
        }

        //19.Lấy tuyến đo theo công trình
        public List<TuyenDo> GetTuyenDos (CongTrinh congTrinh)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        select td;
            return query.ToList();
        }

        //11.Lấy tuyến đo theo chu kỳ
        public List<TuyenDo> GetTuyenDos(ChuKy chuKy)
        {
            var dataConText = new QuanTracLunCTContext();
            var query = from td in dataConText.TuyenDos
                        select td;
            return query.ToList();
        }
    }
}
