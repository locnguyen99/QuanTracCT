using System;
using System.Collections.Generic;
using System.Text;

namespace QuanTracCT.Service.DTO
{
    public class SumQTN
    {
        public object TenCK { get; internal set; }
        public Guid? MaCK { get; internal set; }
        public string TenCT { get; internal set; }
        public int SoCanhN { get; internal set; }
        public Guid MaCT { get; internal set; }
        public int SoMocN { get; internal set; }
        public int SoDiemN { get; internal set; }
        public int SoDinhN { get; internal set; }
        public object MaMoc { get; internal set; }
        public int GroupCount { get; internal set; }
        public string LoaiMoc { get; internal set; }
    }
}
