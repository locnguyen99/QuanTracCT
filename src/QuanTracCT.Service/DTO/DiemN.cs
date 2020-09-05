using System;
using System.Collections.Generic;
using System.Text;

namespace QuanTracCT.Service.DTO
{
    public class DiemN
    {
        public Guid MaDiem { get; internal set; }
        public string TenDiem { get; internal set; }
        public Guid MaCK { get; internal set; }
        public Guid MaCT { get; internal set; }
        public string TenCK { get; internal set; }
        public string TenCT { get; internal set; }
    }
}
