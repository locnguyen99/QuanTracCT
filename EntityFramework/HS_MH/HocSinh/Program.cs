using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking.Internal;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Storage;
using Microsoft.Extensions.Logging.Abstractions;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Security.Cryptography;
using System.Threading;

namespace Entity
{
    [Table("HocSinh")]
    public class HocSinh
    {
        [Key]
        [Column("MSHS")]
        public int MSHS { get; set; }
        [Column("TenHS")]
        public string TenHS{ get; set; }
        [Column("Lop")]
        public string Lop { get; set; }
        public IList<HS_MH> HS_MHs { get; set; }

    }
    [Table("MonHoc")]
    public class MonHoc
    {
        [Key]
        [Column("MSMH")]
        public int MSMH { get; set; }
        [Column("TenMH")]
        public string TenMH { get; set; }
        public IList<HS_MH> HS_MHs { get; set; }
    }

    [Table("HS_MH")]
    public class HS_MH
    {
        [Key]
        [Column("MSHS",Order = 1)]
        [ForeignKey("HocSinh")]
        public int MSHS { get; set; }
        public HocSinh HocSinh { get; set; }

        [Column("MSMH", Order = 2)]
        [ForeignKey("MonHoc")]
        public int MSMH { get; set; }
        public MonHoc MonHoc { get; set; }
    }


    public class QLHSContext : DbContext
    {
        
        public DbSet<HocSinh> HocSinhs { get; set; }
        public DbSet<MonHoc> MonHocs{ get; set; }
        public DbSet<HS_MH> HS_MHs { get; set; }


        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<HS_MH>().HasKey(sc => new { sc.MSHS, sc.MSMH });

            //modelBuilder.Entity<HS_MH>()
            //    .HasOne<HocSinh>(sc => sc.HocSinh)
            //    .WithMany(s => s.HS_MHs)
            //    .HasForeignKey(sc => sc.MSHS);


            //modelBuilder.Entity<HS_MH>()
            //    .HasOne<MonHoc>(sc => sc.MonHoc)
            //    .WithMany(s => s.HS_MHs)
            //    .HasForeignKey(sc => sc.MSMH);

            base.OnModelCreating(modelBuilder);
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var connectionString = "Server=localhost;Database=QLHS;Trusted_Connection=True;";
            optionsBuilder
             .UseSqlServer(connectionString, providerOptions => providerOptions.CommandTimeout(60))
             .UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);

            

        }
    }
    class Program
    {
        static void Main(string[] args)
        {
            //1.Lấy học sinh không học môn nào
            //var query = from hs in dataContext.HocSinhs
            //            join hm in dataContext.HS_MHs on hs.MSHS equals hm.MSHS into tam
            //            from t in tam.DefaultIfEmpty()
            //            where t == null
            //            select new
            //            {
            //                hs.TenHS,
            //                hs.MSHS,
            //                monhoc = t.MonHoc
            //            };
            //2.Lấy học sinh học môn toán
            //var query = from hs in dataContext.HocSinhs
            //            join hm in dataContext.HS_MHs on hs.MSHS equals hm.MSHS
            //            join mh in dataContext.MonHocs on hm.MSMH equals mh.MSMH into tam
            //            from t in tam.DefaultIfEmpty()
            //            where t.TenMH == "Toán"
            //            select new
            //            {
            //                hs.TenHS,
            //                hm.MSHS,
            //                t.TenMH
            //            };
            //3.Điếm số học sinh từng môn học
            //var query = from mh in dataContext.MonHocs
            //            join hm in dataContext.HS_MHs on mh.MSMH equals hm.MSMH
            //            join hs in dataContext.HocSinhs on hm.MSHS equals hs.MSHS into tam
            //            from t in tam.DefaultIfEmpty()
            //            group mh by mh.MSMH into nhom
            //            select new
            //            {
            //                TenMH = nhom.Key,
            //                so_hs = nhom.Count()
            //            };
            //4.Cho biết môn học 2 học sinh trở lên            
            //var query = from mh in dataContext.MonHocs
            //            join hm in dataContext.HS_MHs on mh.MSMH equals hm.MSMH
            //            join hs in dataContext.HocSinhs on hm.MSHS equals hs.MSHS into tam
            //            from t in tam.DefaultIfEmpty()
            //            group mh by mh.TenMH into nhom
            //            select new
            //            {
            //                TenMH = nhom.Key,
            //                so_hs = nhom.Count() >=2
            //            };
            //5.Số lượng môn học của từng học sinh
            //var query = from hs in dataContext.HocSinhs
            //            join hm in dataContext.HS_MHs on hs.MSHS equals hm.MSHS
            //            join mh in dataContext.MonHocs on hm.MSMH equals mh.MSMH into tam
            //            from t in tam.DefaultIfEmpty()
            //            group hs by hs.TenHS into nhom
            //            select new
            //            {
            //                Tenhs=nhom.Key,
            //                so_mon =nhom.Count()
            //            };
            //6.Cho biết học sinh học môn tiếng anh
            //var query = from hs in dataContext.HocSinhs
            //            join hm in dataContext.HS_MHs on hs.MSHS equals hm.MSHS
            //            join mh in dataContext.MonHocs on hm.MSMH equals mh.MSMH into tam
            //            from t in tam.DefaultIfEmpty()
            //            where t.TenMH == "Anh"
            //            select new
            //            {
            //                hs.TenHS,
            //                hs.MSHS,
            //                t.TenMH
            //            };
            //7.Cho biết môn học không có học sinh theo học
            ////Cách 1:(SAI rồi @@) Sô học sinh học môn = 0 or null hoặc mshs của môn học đó ==0 or null
            //var query = from mh in dataContext.MonHocs
            //            join hm in dataContext.HS_MHs on mh.MSMH equals hm.MSMH into tam
            //            from t in tam.DefaultIfEmpty()
            //            group mh by mh.TenMH into nhom
            //            select new
            //            {
            //                MonHoc = nhom.Key,
            //                HocSinh = nhom.Count() ==0,
            //            };
            ///Cách 2:
            //var query = from mh in dataContext.MonHocs
            //            join hm in dataContext.HS_MHs on mh.MSMH equals hm.MSMH into tam
            //            from t in tam.DefaultIfEmpty()
            //            where t == null
            //            select new
            //            {
            //                mh.TenMH,
            //                t.MSHS
            //            };
            //8.Học sinh không học môn nào
            //var query = from hs in dataContext.HocSinhs
            //            join hm in dataContext.HS_MHs on hs.MSHS equals hm.MSHS into tam
            //            from t in tam.DefaultIfEmpty()
            //            where t == null
            //            select new
            //            {
            //                hs.TenHS,
            //                hs.MSHS,
            //                t.MSMH
            //            };
            //9.Thêm vào môn học lập trình
            var dataContext = new QLHSContext();
            //var LapTrinh7 = new MonHoc();
            //dataContext.MonHocs.Add(new MonHoc {MSMH = 123, TenMH="LapTrinh7" });
            //var LapTrinh1 = new MonHoc();
            //dataContext.MonHocs.Add(LapTrinh1);

            //MSMH = nhom.Sum(p => p.MSMH)
            //var query = dataContext.HocSinhs.Include(hs => hs.HS_MHs).First(hs => hs.MSHS == 222);
            //var ketqua = dataContext.MonHocs.Include(mh => mh.HS_MHs).FirstOrDefault(mh => mh.MSMH == 555);

            //var ketqua = query.ToList();
            Console.WriteLine("Hello World!");

        }

    }
}
