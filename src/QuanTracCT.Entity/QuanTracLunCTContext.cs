using Microsoft.EntityFrameworkCore;
using QuanTracCT.Entity;

namespace QuanTracCT.Entity
{
    public class QuanTracLunCTContext : DbContext
    {
        public DbSet<CongTrinh> CongTrinhs { get; set; }
        public DbSet<ChuKy> ChuKys { get; set; }
        public DbSet<Moc> Mocs{ get; set; }
        public DbSet<TuyenDo> TuyenDos { get; set; }
        public DbSet<MocNghieng> MocNghiengs { get; set; }
        public DbSet<DiemNghieng> DiemNghiengs { get; set; }
        public DbSet<DinhNghieng> DinhNghiengs { get; set; }
        public DbSet<CanhNghieng> CanhNghiengs { get; set; }


        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var connectionString =@"Server=DESKTOP-GN0O6IE\SQL2019;Database=QuanTracLunCT;User Id=sa; Password=23456789;";

            optionsBuilder
             .UseSqlServer(connectionString, providerOptions => providerOptions.CommandTimeout(60))
             .UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
        }
    }
}
