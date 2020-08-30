using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using QuanTracCT.Services;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Xml.Linq;

namespace HocLai
{
   
    public class QuanTracLunCTContext : DbContext
    {
        public DbSet<CongTrinh> CongTrinhs { get; set; }
        public DbSet<ChuKy> ChuKys { get; set; }
        public DbSet<Moc> Mocs{ get; set; }
        public DbSet<TuyenDo> TuyenDos { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var connectionString = "Server=localhost;Database=QuanTracLunCT;Trusted_Connection=True;";
            optionsBuilder
             .UseSqlServer(connectionString, providerOptions => providerOptions.CommandTimeout(60))
             .UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            var dataContext = new QuanTracLunCTContext();

            var moDau = new MoDauQueries();
            var maCT = "F155E5BE-9364-4614-A106-B4D2CB8E8444";    //Mã người dùng cấp or data mình lấy để test
            var congTrinh = moDau.GetCongTrinh(new Guid(maCT));  //Lấy 1 công trình theo mã công trình type Guid
            var tenMoc = moDau.GetMocs();
            var tenCK = moDau.GetChuKies();

            var mocCS = new LuoiCoSoQueries();
            var mocct = mocCS.GetMocs(congTrinh.First());  //Lấy 1 mốc theo table khác tên công trình trong danh sách
            var luoics = mocCS.GetMocs("MocCS");            //type string
            var maMoc = new Guid("E212F0C1-E9EA-4398-93A4-03DFCAB38F19");
            var moc = mocCS.GetMoc(maMoc);
            var mack = new Guid("51B99F40-FA67-45EF-8BB0-18EAB8980B7F");
            var chukyck = mocCS.GetChuKy(mack);
            var tuyendo = mocCS.GetTuyenDos();
            var matd = "39CBAFCF-ACBA-4DA5-94EE-103B395ABB28";
            var tuyendomtd = mocCS.GetTuyenDo(new Guid(matd));
            var mack6 = "CE5288DB-0000-42DA-ABDB-9801D86DCA26";   // ma chu ky cua chy ky 6
            var sumtuyendo = mocCS.GetSumtd(new Guid(mack6),"MocCS");
            var sumtrammay = mocCS.GetSumtm(new Guid(mack6), "MocCS");
            var sumchenhcao = mocCS.GetSumcc(new Guid(mack6), "MocCS");
            var tuyendoct = mocCS.GetTuyenDos(congTrinh.First());
            var tuyendock = mocCS.GetTuyenDos(congTrinh.First());

            var mocQT = new LuoiQuanTracQueries();
            var mocqtck = mocQT.GetMocs(new Guid(mack6));
            var mocctqt = mocQT.GetMocs(congTrinh.First());
            var mocqt = mocQT.GetMocs("MocQT");
            var tuyendoat = mocQT.GetTuyenDos("MocQT");
            var mack6qt = "CE5288DB-0000-42DA-ABDB-9801D86DCA26";
            var tuyendocck = mocQT.GetTuyenDo(new Guid(mack6qt),"MocQT");
            var tuyendoctqt = mocQT.GetTuyenDos(congTrinh.FirstOrDefault());
            var matdqt = "7DBFF9C7-6562-4163-B221-109AFBAC5599";
            var tuyendotd = mocQT.GetTuyenDo(new Guid(matdqt));
            var sumkc = mocQT.GetSumtdkc("MocQT", new Guid(mack6qt));
            var sumst = mocQT.GetSumSoTram(new Guid(mack6qt), "MocQT");
            var sumcc = mocQT.GetSumCC(new Guid(mack6qt), "MocQT");


            //38.Danh sách tổng khoảng cách, mỗi chu kỳ
            //var query38 = from td in dataContext.TuyenDos
            //            join ck in dataContext.ChuKys on td.MaCK equals ck.TenCK
            //            where td.LoaiMoc == "MocCS"
            //            group td by td.MaCK into nhom
            //            select new                    // select len 1 or nhieu thuoc tinh
            //            {
            //                tenCK = nhom.Key,
            //                tong_khoang = nhom.Sum(t => t.KhoangCach),
            //                tong_so_tram = nhom.Sum(t => t.SoMayTram),
            //                tong_chenh_cao = nhom.Sum(t => t.ChenhCao)
            //            };

            ////var ketqua = query.ToList()

            Console.WriteLine("Hello World!");
        }
    }
}
