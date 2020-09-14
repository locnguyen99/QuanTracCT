using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace QuanTracCT.Entity
{
    [Table("DinhNghieng")]
    public class DinhNghieng
    {
        [Column("STT")]
        public int STT { get; set; }

        [Column("MaCK")]
        [ForeignKey("ChuKy")]
        public Guid? MaCK { get; set; }

        [Column("DinhTrai")]
        public string DinhTrai { get; set; }

        [Column("DinhGiua")]
        public string DinhGiua { get; set; }

        [Column("DinhPhai")]
        public string DinhPhai { get; set; }

        [Column("GocDo")]
        public string GocDo { get; set; }

        [Column("GocSauBS")]
        public string GocSauBS { get; set; }

        [Column("SHC")]
        public double? SHC { get; set; }

        [Key]
        [Column("MaDinh")]
        public Guid MaDinh { get; set; }
        public ChuKy ChuKy { get; set; }

    }
}
