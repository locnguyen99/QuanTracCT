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

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            var connectionString = "Server=localhost;Database=QuanTracLunCT;Trusted_Connection=True;";
            optionsBuilder
             .UseSqlServer(connectionString, providerOptions => providerOptions.CommandTimeout(60))
             .UseQueryTrackingBehavior(QueryTrackingBehavior.NoTracking);
        }
    }
}
