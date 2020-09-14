using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace QuanTracCT.Entity
{
    [Table("CanhNghieng")]
    public  class CanhNghieng
    {
        [Column("STT")]
        public int STT { get; set; }

        [Column("MaCK")]
        [ForeignKey("ChuKy")]
        public Guid? MaCK { get; set; }

        [Column("DiemDau")]
        public string DiemDau { get; set; }

        [Column("DiemCuoi")]
        public string DiemCuoi { get; set; }

        [Column("CanhDo")]
        public double? CanhDo { get; set; }

        [Column("ChieuDai")]
        public double? ChieuDai { get; set; }

        [Column("CanhBS")]
        public double? CanhBS { get; set; }

        [Column("PhuongNghieng")]
        public string PhuongNghieng { get; set; }

        [Column("msDivisionS")]
        public string msDivisionS { get; set; }

        [Column("m_alpha")]
        public double? m_alpha { get; set; }

        [Column("m")]
        public double? m { get; set; }

        [Column("SHC")]
        public double? SHC { get; set; }

        [Key]
        [Column("MaCanh")]
        public Guid MaCanh { get; set; }
        public ChuKy ChuKy { get; set; }

    }
}
