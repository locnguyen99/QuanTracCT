using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanTracCT.Entity
{
    [Table("TuyenDo")]
    public class TuyenDo
    {
        [Column("TenTuyen")]
        public string TenTuyen { get; set; }

        [Column("KhoangCach")]
        public double KhoangCach { get; set; }

        [Column("SoMayTram")]
        public int SoMayTram { get; set; }

        [Column("ChenhCao")]
        public double ChenhCao { get; set; }

        [Column("DanhGia")]
        public string DanhGia { get; set; }

        [Column("GhiChu")]
        public string GhiChu { get; set; }

        [Column("MaCK")]
        [ForeignKey("ChuKy")]
        public Guid? MaCK { get; set; }

        [Column("LoaiMoc")]
        public string LoaiMoc { get; set; } 

        [Column("DiemDau")]
        public string DiemDau { get; set; }

        [Column("DiemCuoi")]
        public string DiemCuoi { get; set; } 

        [Column("SSTP")]
        public double? SSTP { get; set; }

        [Column("SHC")]
        public double? SHC { get; set; }

        [Key]
        [Column("MaTD")]
        public  Guid MaTD { get; set; }

        public ChuKy ChuKy { get; set; }
    }
}
