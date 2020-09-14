using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanTracCT.Entity
{
    [Table("CongTrinh")]
    public class CongTrinh 
    {
        [ConcurrencyCheck]  // truong hop 2 nguoi cung update mot property
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
