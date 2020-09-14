using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace QuanTracCT.Entity
{
    [Table("MocNghieng")]
    public class MocNghieng
    {
        [Column("STT")]
        public int STT { get; set; }

        [Column("TenMocN")]
        public string TenMocN { get; set; }

        [Column("MaCK")]
        [ForeignKey("ChuKy")]
        public Guid? MaCK { get; set; }

        [Column("X")]
        public double? X { get; set; }

        [Column("Y")]
        public double? Y { get; set; }

        [Column("San")]
        public int? San { get; set; }

        [Column("LoaiMoc")]
        public string LoaiMoc { get; set; }

        [Column("e")]
        public double? e { get; set; }

        [Column("h")]
        public double? h { get; set; }

        [Column("Epsilon")]
        public double? Epsilon { get; set; }

        [Column("Alpha")]
        public double? Alpha { get; set; }

        [Column("Delta_X")]
        public double? Delta_X { get; set; }

        [Column("Delta_Y")]
        public double? Delta_Y { get; set; }

        [Key]
        [Column("MaMocN")]
        public Guid MaMocN { get; set; }
        public ChuKy ChuKy { get; set; }


    }
}
