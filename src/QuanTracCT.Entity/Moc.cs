using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.CompilerServices;

namespace QuanTracCT.Entity
{
    [Table("Moc")]
    public class Moc
    {
        [Column("TenMoc")]
        public string TenMoc { get; set; }

        //[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [Column("MaCK")]
        [ForeignKey("ChuKy")]
        public Guid? MaCK { get; set; }

        [Column("S")]
        public double? S { get; set; }

        [Column("CaoDo_H")]
        public double? CaoDo_H { get; set; }

        [Column("LunTuongDoi")]
        public double? LunTuongDoi { get; set; }

        [Column("LunTuyetDoi")]
        public double? LunTuyetDoi { get; set; }

        [Column("LunTB")]
        public double? LunTB { get; set; }

        [Column("LunTBTong")]
        public double? LunTBTong { get; set; }

        [Column("LunMax")]
        public double? LunMax { get; set; }

        [Column("LunMin")]
        public double? LunMin { get; set; }

        [Column("KhongLunMax")]
        public double? DoKhongLunMax { get; set; }

        [Column("KhongLunMin")]
        public double? KhongLunMin { get; set; }

        [Column("LunTongCongMax")]
        public double? LunTongCongMax { get; set; }

        [Column("LunTongCongMin")]
        public double? LunTongCongMin { get; set; }

        [Column("TocDoLunTB")]
        public double? TocDoLunTB { get; set; }

        [Column("TocDoLunTBTong")]
        public double? TocDoLunTBTong { get; set; }

        [Column("GhiChu")]
        public string GhiChu { get; set; }

        [Column("LoaiMoc")]
        public string LoaiMoc { get; set; }

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [ConcurrencyCheck]
        [Key]
        [Column("MaMoc")]
        public Guid MaMoc { get; set; }

        [Column("STT")]
        public int STT { get; set; }

        public ChuKy ChuKy { get; set; }
    }
}
