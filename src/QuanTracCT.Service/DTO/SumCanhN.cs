using System;
using System.Collections.Generic;
using System.Text;

namespace QuanTracCT.Service.DTO
{
    public class SumCanhN
    {
        public object TenCK { get; internal set; }
        public Guid? MaCK { get; internal set; }
        public string TenCT { get; internal set; }
        public int SoCanhN { get; internal set; }
        public Guid MaCT { get; internal set; }
    }
}
