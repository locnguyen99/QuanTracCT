using System;
using System.Collections.Generic;
using System.Text;

namespace QuanTracCT.Service.DTO
{
    public class MocN
    {
        public Guid MaMocN { get; internal set; }
        public string TenCK { get; internal set; }
        public string TenMocN { get; internal set; }
        public Guid MaCK { get; internal set; }
        public Guid MaCT { get; internal set; }
        public string TenCT { get; internal set; }
    }
}
