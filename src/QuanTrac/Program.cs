using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using QuanTracCT.Entity;
using QuanTracCT.Service;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Xml.Linq;

namespace HocLai
{
    class Program
    {
        static void Main(string[] args)
        {
            var dataContext = new QuanTracLunCTContext();

            var moDau = new MoDauQueries();                         
            var congTrinhs = moDau.GetCongTrinhs();
            var mact = "F155E5BE-9364-4614-A106-B4D2CB8E8444";
            var chukys = moDau.GetChuKys(new Guid(mact));
            var mack = "CE5288DB-0000-42DA-ABDB-9801D86DCA26";
            var mocs = moDau.GetMocs(new Guid(mack));

            var mocCS = new LuoiCoSoQueries();
            var mocct = mocCS.GetMocs();
            var moccss = mocCS.GetMocs("MocCS");
            var mamoccs = "1D5676C6-8216-4AFE-A7CA-08AEE7F0994D";
            var moccs = mocCS.GetMoc(new Guid(mamoccs));
            var tuyendocss = mocCS.GetTuyenDos("MocCS");
            var matdcs = "39CBAFCF-ACBA-4DA5-94EE-103B395ABB28";
            var tuyendocs = mocCS.GetTuyenDo(new Guid(matdcs));
            var macsck6 = "CE5288DB-0000-42DA-ABDB-9801D86DCA26";
            var sumtd = mocCS.GetSumtd(new Guid(macsck6), "MocCS");
            var sumtm = mocCS.GetSumtm(new Guid(macsck6), "MocCS");
            var sumcc = mocCS.GetSumcc(new Guid(macsck6), "MocCS");
            var tuyendock = mocCS.GetTuyenDocks(new Guid(macsck6));

            var mocQT = new LuoiQuanTracQueries();
            var mamocqt = "F75B5A24-FACA-4FD8-88FB-0D2B4A8AAAD5";
            var mocqt = mocQT.GetMoc(new Guid(mamocqt), "MocQT");
            var maqtck6 = "7A78D299-34B7-4CA9-AC05-42EDD74B5CAC";
            var mocqts = mocQT.GetMocs(new Guid(maqtck6));
            var tuyendoqts = mocQT.GetTuyenDos("MocQT");
            var tuyendos = mocQT.GetTuyenDos();
            var matdqt = "84B84C01-3D20-429A-9A45-15EBA449FEC5";
            var tuyendoqt = mocQT.GetTuyenDo(new Guid(matdqt));
            var mack6qt = "CE5288DB-0000-42DA-ABDB-9801D86DCA26";
            var sumtdqt = mocQT.GetSumtdqt("MocQT", new Guid(mack6qt));
            var sumTM = mocQT.GetSumTM(new Guid(mack6qt), "MocQT");
            var sumCC = mocQT.GetSumCC(new Guid(mack6qt), "MocQT");

            //38.Danh sách tổng khoảng cách, mỗi chu kỳ
            //var query38 = from td in dataContext.TuyenDos
            //              join ck in dataContext.ChuKys on td.MaCK equals ck.TenCK
            //              where td.LoaiMoc == "MocCS"
            //              group td by td.MaCK into nhom
            //              select new                    // select len 1 or nhieu thuoc tinh
            //              {
            //                  tenCK = nhom.Key,
            //                  tong_khoang = nhom.Sum(t => t.KhoangCach),
            //                  tong_so_tram = nhom.Sum(t => t.SoMayTram),
            //                  tong_chenh_cao = nhom.Sum(t => t.ChenhCao)
            //              };
            //var ketqua = query.ToList()

            Console.WriteLine("Hello World!");
        }
    }
}
