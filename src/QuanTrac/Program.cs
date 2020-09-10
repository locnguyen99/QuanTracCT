﻿using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using QuanTracCT.Entity;
//﻿using QuanTracCT.Entity;
using QuanTracCT.Service;
//using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
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

            //var moDau = new MoDauQueries();
            //var congtrinhs = moDau.GetCongTrinhs();
            //var mact = "F155E5BE-9364-4614-A106-B4D2CB8E8444";
            //var congtrinh = moDau.GetCongTrinh(new Guid(mact));
            //var chukies = moDau.GetChuKies();
            //var chukiects = moDau.GetChuKieCTs(new Guid(mact));
            //var mack = "CE5288DB-0000-42DA-ABDB-9801D86DCA26";
            //var chuky = moDau.GetChuKy(new Guid(mack));
            //var moccts = moDau.GetMocCTs(new Guid(mact));
            //var moccks = moDau.GetMocCKs(new Guid(mack));
            //var mocs = moDau.GetMocs();
            //var mamoc = "209B79FF-80B2-4496-92D2-0F6F38FCDB09";
            //var moc = moDau.GetMoc(new Guid(mamoc));
            //var tuyendocts = moDau.GetTuyenDoCTs(new Guid(mact));
            //var tuyendocks = moDau.GetTuyenDocCKs(new Guid(mack));
            //var tuyendos = moDau.GetTuyenDos();
            //var matd = "30DB095E-8525-403C-BE9E-10E1230AECCA";
            //var tuyendo = moDau.GetTuyenDo(new Guid(matd));
            //var sumchukyct = moDau.GetSumCKCT(new Guid(mact));
            //var summocct = moDau.GetSumMocCT(new Guid(mact));
            //var summocck = moDau.GetSumMocCK(new Guid(mack));
            //var sumtuyenck = moDau.GetSumTuyenCK(new Guid(mack));
            //var sumtuyenct = moDau.GetSumTuyenCT(new Guid(mact));


            var mocCS = new LuoiCoSoQueries();
            var moccss = mocCS.GetMocCSs("MocCS");
            var tuyendocss = mocCS.GetTuyenDoCSs("MocCS");
            var mack = "CE5288DB-0000-42DA-ABDB-9801D86DCA26";
            var sumkctdcs = mocCS.GetSumKCTDCS(new Guid(mack), "MocCS");
            var sumtmtdcs = mocCS.GetSumTMTDCS(new Guid(mack), "MocCS");
            var sumcctdcs = mocCS.GetSumCCTDCS(new Guid(mack), "MocCS");
            var mact = "F155E5BE-9364-4614-A106-B4D2CB8E8444";
            var sumkctdcsct = mocCS.GetSumKCTDCSCT(new Guid(mact), "MocCS", new Guid(mack));
            var sumtmtdcsct = mocCS.GetSumTMTDCSCT(new Guid(mact), "MocCS", new Guid(mack));
            var sumcctdcsct = mocCS.GetSumCCTDCSCT(new Guid(mact), "MocCS", new Guid(mack));
            var summoccsct = mocCS.GetSumMocCSCT(new Guid(mact), "MocCS");
            var summoccsck = mocCS.GetSumMocCSCK(new Guid(mack), "MocCS");
            var sumtuyencsct = mocCS.GetSumTuyenCSCT(new Guid(mact), "MocCS");
            var sumtuyencsck = mocCS.GetSumTuyenCSCK(new Guid(mack), "MocCS");


            //var mocQT = new LuoiQuanTracQueries();
            //var mocqts = mocQT.GetMocQTs("MocQT");
            //var tuyendoqts = mocQT.GetTuyenDoQTs("MocQT");
            //var mack = "CE5288DB-0000-42DA-ABDB-9801D86DCA26";
            //var sumkctdqt = mocQT.GetSumKCTDQT(new Guid(mack), "MocQT");
            //var sumtmtdqt = mocQT.GetSumTMTDQT(new Guid(mack), "MocQT");
            //var sumcctdqt = mocQT.GetSumCCTDQT(new Guid(mack), "MocQT");
            //var mact = "F155E5BE-9364-4614-A106-B4D2CB8E8444";
            //var sumkctdqtct = mocQT.GetSumKCTDQTCT(new Guid (mact), "MocQT",new Guid(mack));
            //var sumtmtdqtct = mocQT.GetSumTMTDQTCT(new Guid(mact), "MocQT", new Guid(mack));
            //var sumcctdqtct = mocQT.GetSumCCTDQTCT(new Guid(mact), "MocQT", new Guid(mack));
            //var summocqtct = mocQT.GetSumMocQTCT(new Guid(mact), "MocQT");
            //var summocqtck = mocQT.GetSumMocQTCK(new Guid(mack), "MocQT");
            //var sumtuyenqtct = mocQT.GetSumTuyenQTCT(new Guid(mact), "MocQT");
            //var sumtuyenqtck = mocQT.GetSumTuyenQTCK(new Guid(mack), "MocQT");


            //var tracNghieng = new QuanTracNghiengQueries();
            //var mocns = tracNghieng.GetMocNghiengs();
            //var mact = "F155E5BE-9364-4614-A106-B4D2CB8E8444";
            //var mocncts = tracNghieng.GetMocNghiengCTs(new Guid(mact));
            //var mack = "3637E195-24EE-4269-A91B-D8A2B21ABA5B";
            //var mocnsans = tracNghieng.GetMocNghiengSans(4);
            //var mocnloais = tracNghieng.GetMocNghiengLoais("MocCS");
            //var mamocn = "455D83A1-3467-4F26-95D7-79067CC87E1B";
            //var mocn = tracNghieng.GetMocNghieng(new Guid(mamocn));
            //var summocnct = tracNghieng.GetSumMocNCT(new Guid(mact));
            //var summocnck = tracNghieng.GetSumMocNCK(new Guid(mack));
            //var summocnloaicsct = tracNghieng.GetSumMocNLoaiCSCT(new Guid(mact), "MocCS");
            //var summocnloaiqtck = tracNghieng.GetSumMocNLoaiQTCK(new Guid(mack), "MocQT");
            //var summocnloaiqtct = tracNghieng.GetSumMocNLoaiQTCT(new Guid(mact), "MocQT");
            //var summocnloaicsck = tracNghieng.GetSumMocNLoaiCSCK(new Guid(mack), "MocCS");
            //var diemncts = tracNghieng.GetDiemNghiengCTs(new Guid(mact));
            //var diemns = tracNghieng.GetDiemNghiengs();
            //var diemncks = tracNghieng.GetDiemNghiengCKs(new Guid(mack));
            //var madiem = "7B10979B-41DB-411D-9E96-0F6C1F0FDC9D";
            //var diemn = tracNghieng.GetDiemNghieng(new Guid(madiem));
            //var sumdiemnct = tracNghieng.GetSumDiemNCT(new Guid(mact));
            //var sumdiemnck = tracNghieng.GetSumDiemNCK(new Guid(mack));
            //var dinhncts = tracNghieng.GetDinhNghiengCTs(new Guid(mact));
            //var dinhns = tracNghieng.GetDinhNghiengs();
            //var dinhncks = tracNghieng.GetDinhNghiengCKs(new Guid(mack));
            //var madinh = "FD374F9F-D412-4680-94F6-05ED613C8FAD";
            //var dinhn = tracNghieng.GetDinhNghieng(new Guid(madinh));
            //var sumdinhnct = tracNghieng.GetSumDinhNCT(new Guid(mact));
            //var sumdinhnck = tracNghieng.GetSumDinhNCK(new Guid(mack));
            //var canhns = tracNghieng.GetCanhNghiengs();
            //var canhncts = tracNghieng.GetCanhNghiengCTs(new Guid(mact));
            //var macanh = "A88B0012-5710-471A-A295-2C942DE4394A";
            //var canhn = tracNghieng.GetCanhNghieng(new Guid(macanh));
            //var sumcanhnct = tracNghieng.GetSumCanhNCT(new Guid(mact));
            //var sumcanhnck = tracNghieng.GetSumCanhNCK(new Guid(mack));

            //var a = dataContext.Mocs.ToList();
            //var a1 = dataContext.MocNghiengs.ToList();
            //var a2= dataContext.CongTrinhs.ToList();
            //var a3 = dataContext.CanhNghiengs.ToList();
            //var a4 = dataContext.DinhNghiengs.ToList();
            //var a5 = dataContext.ChuKys.ToList();
            //var a6 = dataContext.DiemNghiengs.ToList();
            //var a7 = dataContext.TuyenDos.ToList();

            //var query = new MoDauQueries();
            //var moc = query.AddMoc();




            //var moctable = dataContext.Mocs;
            //var moc = moctable.FirstOrDefault(m => m.MaMoc == new Guid("D12E8E01-D5B3-43DD-9703-BBEBFDB2C65F"));
            //moc.TenMoc = "M222";
            //dataContext.Entry<Moc>(moc).State = EntityState.Modified;
            //dataContext.Mocs.Update(moc);
            //dataContext.SaveChanges();

            //using (var dataContext = new QuanTracLunCTContext())
            //{
            //    var moc = dataContext.Mocs.First(m => m.MaMoc == new Guid("D12E8E01-D5B3-43DD-9703-BBEBFDB2C65F"));
            //    moc.TenMoc = "M44";
            //    dataContext.SaveChanges();
            //}


            Console.WriteLine("Hello World!");
        }
    }
}
