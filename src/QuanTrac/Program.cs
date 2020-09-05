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
            var congtrinhs = moDau.GetCongTrinhs();
            var mact = "F155E5BE-9364-4614-A106-B4D2CB8E8444";
            var chukys = moDau.GetChuKys(new Guid(mact));
            var mack = "CE5288DB-0000-42DA-ABDB-9801D86DCA26";
            var mocs = moDau.GetMocs(new Guid(mack));
            var moccts = moDau.GetMocCTs(new Guid(mact));
            var macks = moDau.GetMocCKs(new Guid(mact));

            //var mocCS = new LuoiCoSoQueries();
            //var mocct = mocCS.GetMocs();
            //var moccss = mocCS.GetMocs("MocCS");
            //var mamoccs = "1D5676C6-8216-4AFE-A7CA-08AEE7F0994D";
            //var moccs = mocCS.GetMoc(new Guid(mamoccs));
            //var tuyendocss = mocCS.GetTuyenDos("MocCS");
            //var matdcs = "39CBAFCF-ACBA-4DA5-94EE-103B395ABB28";
            //var tuyendocs = mocCS.GetTuyenDo(new Guid(matdcs));
            //var macsck6 = "CE5288DB-0000-42DA-ABDB-9801D86DCA26";
            //var sumtd = mocCS.GetSumtd(new Guid(macsck6), "MocCS");
            //var sumtm = mocCS.GetSumtm(new Guid(macsck6), "MocCS");
            //var sumcc = mocCS.GetSumcc(new Guid(macsck6), "MocCS");
            //var tuyendock = mocCS.GetTuyenDocks(new Guid(macsck6));

            //var mocQT = new LuoiQuanTracQueries();
            //var mamocqt = "F75B5A24-FACA-4FD8-88FB-0D2B4A8AAAD5";
            //var mocqt = mocQT.GetMoc(new Guid(mamocqt), "MocQT");
            //var maqtck6 = "7A78D299-34B7-4CA9-AC05-42EDD74B5CAC";
            //var mocqts = mocQT.GetMocs(new Guid(maqtck6));
            //var tuyendoqts = mocQT.GetTuyenDos("MocQT");
            //var tuyendos = mocQT.GetTuyenDos();
            //var matdqt = "84B84C01-3D20-429A-9A45-15EBA449FEC5";
            //var tuyendoqt = mocQT.GetTuyenDo(new Guid(matdqt));
            //var mack6qt = "CE5288DB-0000-42DA-ABDB-9801D86DCA26";
            //var sumtdqt = mocQT.GetSumtdqt("MocQT", new Guid(mack6qt));
            //var sumTM = mocQT.GetSumTM(new Guid(mack6qt), "MocQT");
            //var sumCC = mocQT.GetSumCC(new Guid(mack6qt), "MocQT"); 

            var tracNghieng = new QuanTracNghiengQueries();
            var mocns = tracNghieng.GetMocNghiengs();
            var mact = "F155E5BE-9364-4614-A106-B4D2CB8E8444";
            var mocncts = tracNghieng.GetMocNghiengCTs(new Guid(mact));
            var mack = "3637E195-24EE-4269-A91B-D8A2B21ABA5B";
            var mocnsans = tracNghieng.GetMocNghiengSans(4);
            var mocnloais = tracNghieng.GetMocNghiengLoais("MocCS");
            var mamocn = "455D83A1-3467-4F26-95D7-79067CC87E1B";
            var mocn = tracNghieng.GetMocNghieng(new Guid(mamocn));
            var summocnct = tracNghieng.GetSumMocNCT(new Guid(mact));
            var summocnck = tracNghieng.GetSumMocNCK(new Guid(mack));
            var summocnloaicsct = tracNghieng.GetSumMocNLoaiCSCT(new Guid(mact), "MocCS");
            var summocnloaiqtck = tracNghieng.GetSumMocNLoaiQTCK(new Guid(mack), "MocQT");
            var summocnloaiqtct = tracNghieng.GetSumMocNLoaiQTCT(new Guid(mact), "MocQT");
            var summocnloaicsck = tracNghieng.GetSumMocNLoaiCSCK(new Guid(mack), "MocCS");
            var diemncts = tracNghieng.GetDiemNghiengCTs(new Guid(mact));
            var diemns = tracNghieng.GetDiemNghiengs();
            var diemncks = tracNghieng.GetDiemNghiengCKs(new Guid(mack));
            var madiem = "7B10979B-41DB-411D-9E96-0F6C1F0FDC9D";
            var diemn = tracNghieng.GetDiemNghieng(new Guid(madiem));
            var sumdiemnct = tracNghieng.GetSumDiemNCT(new Guid(mact));
            var sumdiemnck = tracNghieng.GetSumDiemNCK(new Guid(mack));
            var dinhncts = tracNghieng.GetDinhNghiengCTs(new Guid(mact));
            var dinhns = tracNghieng.GetDinhNghiengs();
            var dinhncks = tracNghieng.GetDinhNghiengCKs(new Guid(mack));
            var madinh = "FD374F9F-D412-4680-94F6-05ED613C8FAD";
            var dinhn = tracNghieng.GetCanhNghieng(new Guid(madinh));
            var sumdinhnct = tracNghieng.GetSumDinhNCT(new Guid(mact));
            var sumdinhnck = tracNghieng.GetSumDinhNCK(new Guid(mack));
            var canhns = tracNghieng.GetCanhNghiengs();
            var canhncts = tracNghieng.GetCanhNghiengCTs(new Guid(mact));
            var macanh = "A88B0012-5710-471A-A295-2C942DE4394A";
            var canhn = tracNghieng.GetCanhNghieng(new Guid(macanh));
            var sumcanhnct = tracNghieng.GetSumCanhNCT(new Guid(mact));
            var sumcanhnck = tracNghieng.GetSumCanhNCK(new Guid(mack));


            //38.Danh sách tổng khoảng cách, mỗi chu kỳ
            //var query38 = from td in dataContext.TuyenDos
            //              join ck in dataContext.ChuKys on td.MaCK equals ck.MaCK
            //              where td.LoaiMoc == "MocCS"
            //              group td by td.MaCK into nhom
            //              select new                    // select len 1 or nhieu thuoc tinh
            //              {
            //                  tenCK = nhom.Key,
            //                  tong_khoang = nhom.Sum(t => t.KhoangCach),
            //                  tong_so_tram = nhom.Sum(t => t.SoMayTram),
            //                  tong_chenh_cao = nhom.Sum(t => t.ChenhCao)
            //              };
            //var ketqua = query38.ToList();
            //var kq = dataContext.DiemNghiengs.ToList();
            //var kq1 = dataContext.CanhNghiengs.ToList();
            //var kq2 = dataContext.DinhNghiengs.ToList();
            //var kq3 = dataContext.MocNghiengs.ToList();

            Console.WriteLine("Hello World!");
        }
    }
}
