using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Runtime.InteropServices;
using System.Threading;

namespace HocLai
{
    public class HSContext : DbContext
    {
        public HSContext()
        // C# will call base class parameterless constructor by default
        {
        }
    }
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
            var congTrinhs = dataContext.CongTrinhs.ToList();
            var chuKies = dataContext.ChuKys.ToList();
            var mocs = dataContext.Mocs.ToList();
            var tuyenDos = dataContext.TuyenDos.ToList();

           
            //2.Cho biết số lượng mốc cơ sở trong CK6
            var query1 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6"
                        group m by m.TenMoc into tam
                        select new
                        {
                            TenMoc = tam.Key,
                            Count = tam.Count()

                        };
            //3.Số lượng mốc lưới quan trắc trong chu kỳ 6
            var query2 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6" && m.LoaiMoc == "MocQT"
                        group m by m.TenMoc into tam
                        select new
                        {
                            tenmoc = tam.Key,
                            Count = tam.Count()
                        };
            //4.Cho biết danh sách chu kỳ và thời gian đo mỗi chu kỳ
            var query3 = from ck in dataContext.ChuKys
                        select new
                        {
                            ck.TenCK,
                            ck.ThoiGianDo
                        };
            //5.Cho biết số mốc trong chu kỳ 6
            var query4 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6"
                        group m by m.TenMoc into tam
                        select new
                        {
                            so_moc = tam.Key,
                            count = tam.Count()
                        };
            //6.Cho biết mốc lưới quan trắc trong chu kỳ 6
            var query5 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6" && m.LoaiMoc == "MocQT"
                        select new
                        {
                            m.TenMoc,
                            m.TenCK
                        };
            //7.Danh sách mốc trong chu kỳ 6
            var query6 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6"
                        select new
                        {
                            m.TenMoc
                        };
            //8.Cho biết cao độ H mỗi mốc trong chu kỳ 6
            var query7 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6"
                        select new
                        {
                            m.TenMoc,
                            m.CaoDo_H
                        };
            //9.Cho biết mốc không có cao độ H trong chu kỳ 6
            var query8 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6" && m.CaoDo_H == null
                        select new
                        {
                            m.TenMoc,
                            m.CaoDo_H
                        };
            //10.Cho biết độ lún tuyệt đối, độ lún tương đối các mốc trong chu kỳ 6
            var query9 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6"
                        select new
                        {
                            m.TenMoc,
                            m.LunTuongDoi,
                            m.LunTuyetDoi
                        };
            //11.CHo biết độ lún trung bình trong chy kỳ 6
            var query10 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6"
                        select new
                        {
                            m.TenMoc,
                            m.LunTB
                        };
            //12.Cho biết độ lún trung bình tổng cộng trong chu kỳ 6
            var query12 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6"
                        select new
                        {
                            m.LunTBTong
                        };
            //13.Cho biết độ lún Max trong chu kỳ 6 tại mốc 6
            var query13 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6" && m.TenMoc == "M6"
                        select new
                        {
                            m.TenMoc,
                            m.LunMax
                        };
            //14.Cho biết độ lún Min trong chu kỳ 6 tại mốc 6
            var query14 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6" && m.TenMoc == "M6"
                        select new
                        {
                            m.TenMoc,
                            m.LunMin
                        };
            //15.Cho biết độ không lún Max trong chu kỳ 6 tại mốc 6
            var query15 = from m in dataContext.Mocs
                       where m.TenCK == "Chu Kỳ 6" && m.TenMoc == "M6"
                        select new
                        {
                            m.TenMoc,
                            m.DoKhongLunMax
                        };
            //16.Cho biết độ không lún Min trong chu kỳ 6 tại mốc 6
            var query16 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6" && m.TenMoc == "M6"
                        select new
                        {
                            m.TenMoc,
                            m.KhongLunMin
                        };
            //17.Cho biết độ lún tổng cộng Max trong chu kỳ 6 tại mốc 6
            var query17 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6" && m.TenMoc == "M6"
                        select new
                        {
                            m.TenMoc,
                            m.LunTongCongMax
                        };
            //18.Cho biết độ lún tổng cộng Min trong chu kỳ 6 tại mốc 6
            var query18 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6" && m.TenMoc == "M6"
                        select new
                        {
                            m.TenMoc,
                            m.LunTongCongMin
                        };
            //19.Cho biết tốc độ lún trung trình của chu kỳ 6
            var query19 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6" && m.TenMoc == "M6"
                        select new
                        {
                            m.TenMoc,
                            m.TocDoLunTB
                        };
            //20.Cho biết tốc độ lún trung trình tong của chu kỳ 6
            var query20 = from m in dataContext.Mocs
                        where m.TenCK == "Chu Kỳ 6" && m.TenMoc == "M6"
                        select new
                        {
                            m.TenMoc,
                            m.TocDoLunTBTong
                        };
            //21.Tổng số tuyến đo trong chu kỳ 6
            var query21 = from td in dataContext.TuyenDos
                        where td.TenCK == "Chu Kỳ 6"
                        group td by td.TenTuyen into tam
                        select new
                        {
                            so_tuyen = tam.Key,
                            count = tam.Count()

                        };
            //22.Cho biết tuyến đo mỗi lưới trong chu kỳ 6
            var query22 = from td in dataContext.TuyenDos
                        where td.TenCK == "Chu Kỳ 6"
                        select new
                        {
                            td.TenTuyen,
                            td.LoaiMoc
                        };
            //23.Danh sách các tuyến đo mốc cơ sở trong chy kỳ 6
            //var query = from td in dataContext.TuyenDos
            //            where td.TenCK == "Chu Kỳ 6" && td.LoaiMoc == "MocCS"
            //            select new
            //            {
            //                td.TenTuyen,
            //                td.LoaiMoc,
            //                td.TenCK
            //            };
            //24.Danh sách các tuyến đo mốc quan trắc trong chù kỳ 6
            //var query = from td in dataContext.TuyenDos
            //            where td.TenCK == "Chu Kỳ 6" && td.LoaiMoc == "MocQT"
            //            select new
            //            {
            //                td.TenTuyen,
            //                td.LoaiMoc,
            //                td.TenCK
            //            };
            //25.Cho biết khoảng cách đo của các tuyến trong chu kỳ 6
            //var query = from td in dataContext.TuyenDos
            //            where td.TenCK == "Chu Kỳ 6" 
            //            select new
            //            {
            //                td.TenTuyen,
            //                td.KhoangCach
            //            };
            //26.Cho biết khoảng cách đo của tuyến mốc cơ sở trong chu kỳ 6
            //var query = from td in dataContext.TuyenDos
            //            where td.TenCK == "Chu Kỳ 6" && td.LoaiMoc == "MocCS"
            //            select new
            //            {
            //                td.TenTuyen,
            //                td.KhoangCach,
            //                td.LoaiMoc
            //            };
            //27.Cho biết số máy trạm của mỗi tuyến đo trong chu kỳ 6
            //var query = from td in dataContext.TuyenDos
            //            where td.TenCK == "Chu Kỳ 6"
            //            select new
            //            {
            //                td.TenTuyen,
            //                td.SoMayTram,
            //                td.TenCK
            //            };
            //28.Danh sách chênh cao của các tuyến đo trong chu kỳ 6
            //var query = from td in dataContext.TuyenDos
            //            where td.TenCK == "Chu Kỳ 6"
            //            select new
            //            {
            //                td.TenTuyen,
            //                td.ChenhCao,
            //                td.TenCK
            //            };
            //29.Cho biết các điếm đầu và điểm cuối trong chu kỳ 6
            //var query = from td in dataContext.TuyenDos
            //            where td.TenCK == "Chu Kỳ 6"
            //            select new
            //            {
            //                td.TenTuyen,
            //                td.DiemDau,
            //                td.DiemCuoi
            //            };
            //30.Cho biết SSTP tuyến đo trong chy kỳ 6
            //var query = from td in dataContext.TuyenDos
            //            where td.TenCK == "Chu Kỳ 6"
            //            select new
            //            {
            //                td.SSTP,
            //                td.TenTuyen
            //            };
            //31.Cho biết SHC tuyến đo trong chy kỳ 6
            //var query = from td in dataContext.TuyenDos
            //            where td.TenCK == "Chu Kỳ 6"
            //            select new
            //            {
            //                td.SHC,
            //                td.TenTuyen
            //            };
            //32.Tổng khoảng cách tuyến đo trong chu kỳ 6
            //Sai kaka:
            //var query = from td in dataContext.TuyenDos
            //            where td.TenCK == "Chu Kỳ 6"
            //            select new
            //            {
            //                td.TenTuyen,
            //                KhoangCach = td.KhoangCach.
            //            };
            //Đúng :
            //var query = dataContext.TuyenDos.Where(t => t.TenCK == "Chu Kỳ 6").Sum(t => t.KhoangCach);

            ///33.Cho biết tuyến đo khoảng cách lớn nhất trong chu kỳ 6
            //var query = dataContext.TuyenDos
            //    .Where(t => t.TenCK == "Chu Kỳ 6")
            //    .Select(a => a.KhoangCach).Max();
            ///34.Cho biết tuyến đo khoảng cách be nhat trong chu kỳ 6
            ///
            //var query = dataContext.TuyenDos
            //    .Where(t => t.TenCK == "Chu Kỳ 6")
            //    .Select(a => a.KhoangCach).Min();

            //35.Cho biết tổng số máy trạm trong chu kỳ 6
            //var query = dataContext.TuyenDos.Where(t => t.TenCK == "Chu Kỳ 6").Sum(t => t.SoMayTram);
            //36.Cho biết tổng khoảng cách lưới cơ sở trong chu kỳ 6
            //var query = dataContext.TuyenDos.Where(t => t.TenCK == "Chu Kỳ 6" && t.LoaiMoc == "MocCS").Sum(t => t.KhoangCach);

            //37.Cho biết tổng số chênh cao trong chu kỳ 6
            //var query = dataContext.TuyenDos.Where(t => t.TenCK == "Chu Kỳ 6").Sum(a => a.ChenhCao);
            //38.Danh sách tổng khoảng cách, mỗi chu kỳ
            //var query = from td in dataContext.TuyenDos
            //            join ck in dataContext.ChuKys on td.TenCK equals ck.TenCK
            //            where td.LoaiMoc =="MocCS"
            //            group td by td.TenCK into nhom
            //            select new
            //            {
            //                tenCK = nhom.Key,
            //                tong_khoang = nhom.Sum(t => t.KhoangCach),
            //                tong_so_tram = nhom.Sum(t => t.SoMayTram),
            //                tong_chenh_cao = nhom.Sum(t => t.ChenhCao)
            //            };

            var ketqua = query.ToList();
            Console.WriteLine("Hello World!");
        }
    }
}
