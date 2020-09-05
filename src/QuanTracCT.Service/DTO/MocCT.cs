using System;
using System.Collections.Generic;
using System.Text;

namespace QuanTracCT.Service.DTO
{
    public class MocCT
    {
        public Guid MaMoc { get; internal set; }
        public string TenMoc { get; internal set; }
        public Guid MaCT { get; internal set; }
        public string TenCT { get; internal set; }
        public string TenCK { get; internal set; }
        public Guid MaCK { get; internal set; }
    }
}
