using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Runtime.CompilerServices;

namespace QuanTracCT.Entity
{
    [Table("Test")]
    public class Test
    {
        [Column("TenMoc")]
        public string TenMoc { get; set; }

        [ConcurrencyCheck]
        [Key]
        [Column("MaMoc")]
        public Guid MaMoc { get; set; }



    }
}
