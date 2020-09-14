using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace QuanTracCT.Entity
{
    [Table("DiemNghieng")]
    public  class DiemNghieng
    {
        [Column("STT")]
        public int STT { get; set; }

        [Column("TenDiem")]
        public string TenDiem { get; set; }

        [Column("MaCK")]
        [ForeignKey("ChuKy")]
        public Guid? MaCK { get; set; }

        [Column("X")]
        public double? X { get; set; }

        [Column("Y")]
        public double? Y { get; set; }

        [Column("Mx")]
        public double? Mx { get; set; }

        [Column("My")]
        public double? My { get; set; }

        [Column("Mp")]
        public double? Mp { get; set; }

        [Key]
        [Column("MaDiem")]
        public Guid MaDiem { get; set; }
        public ChuKy ChuKy { get; set; }

    }
}
