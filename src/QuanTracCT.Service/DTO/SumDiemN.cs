﻿using System;
using System.Collections.Generic;
using System.Text;

namespace QuanTracCT.Service.DTO
{
    public class SumDiemN
    {
        public object TenCK { get; internal set; }
        public string TenCT { get; internal set; }
        public Guid? MaCK { get; internal set; }
        public Guid MaCT { get; internal set; }
        public int SoMocN { get; internal set; }
        public int SoDiemN { get; internal set; }
    }
}
