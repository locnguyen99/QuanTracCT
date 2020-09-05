using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace HocLai
{
    [Table("CongTrinh")]
    public class CongTrinh 
    {
        [Key]
        [Column("MaCT")]
        public Guid MaCT { get; set; }
        [Column("TenCT")]
        public string TenCT { get; set; }
        [Column("DiaDiem")]
        public string DiaDiem { get; set; }
        //public virtual ICollection<ChuKy> ChuKys { get; set; }
    }
}
