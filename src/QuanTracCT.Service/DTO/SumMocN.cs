using System;
using System.Collections.Generic;
using System.Text;

namespace QuanTracCT.Service.DTO
{
    public class SumMocN
    {
        public object TenCK { get; internal set; }
        public object MaCK { get; internal set; }
        public object TenCT { get; internal set; }
        public object MaCT { get; internal set; }
        public object MaMoc { get; internal set; }
        public int GroupCount { get; internal set; }
        public int SoMocN { get; internal set; }
        public string LoaiMoc { get; internal set; }
    }
}
