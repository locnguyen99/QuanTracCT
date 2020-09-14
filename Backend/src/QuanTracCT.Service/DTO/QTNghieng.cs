using System;
using System.Collections.Generic;
using System.Text;

namespace QuanTracCT.Service.DTO
{
    public class QTNghieng
    {
        public string TenCK { get; internal set; }
        public Guid MaCK { get; internal set; }
        public string TenCT { get; internal set; }
        public Guid MaCT { get; internal set; }
        public Guid MaCanh { get; internal set; }
        public Guid MaDiem { get; internal set; }
        public string TenDiem { get; internal set; }
        public Guid MaDinh { get; internal set; }
        public Guid MaMocN { get; internal set; }
        public string TenMocN { get; internal set; }
    }
}
