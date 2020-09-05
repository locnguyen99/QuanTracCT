using System;
using System.Collections.Generic;
using System.Text;

namespace QuanTracCT.Service.DTO
{
    public class DinhN
    {
        public string TenCK { get; internal set; }
        public Guid MaCK { get; internal set; }
        public string TenCT { get; internal set; }
        public Guid MaCT { get; internal set; }
        public Guid MaDinh { get; internal set; }
    }
}
