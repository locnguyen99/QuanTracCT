using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HocLai
{
    [Table("ChuKy")]
    public class ChuKy
    {
        [Key]
        [Column("MaCK")]
        public Guid MaCK { get; set; }

        [Column("TenCK")]
        public string TenCK { get; set; }

        [Column("ThoiGianDo")]
        public DateTime ThoiGianDo { get; set; }

        [Column("MaCT")]
        [ForeignKey("CongTrinh")]
        public Guid MaCT { get; set; }

        public CongTrinh CongTrinh { get; set; }
        public virtual ICollection<Moc> Mocs { get; set; }
        public virtual ICollection<TuyenDo> TuyenDos { get; set; }

    }
}
