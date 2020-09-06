using System;
using System.Collections.Generic;
using System.Text;

namespace QuanTracCT.Service.DTO
{
    public class QTLun
    {
        public Guid MaTD { get; internal set; }
        public string TenTuyen { get; internal set; }
        public string TenCK { get; internal set; }
        public Guid MaCK { get; internal set; }
        public Guid MaCT { get; internal set; }
        public string TenCT { get; internal set; }
        public Guid MaMoc { get; internal set; }
        public string TenMoc { get; internal set; }
       
    }
}
