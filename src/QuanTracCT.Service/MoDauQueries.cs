﻿using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System.Data;
using System.Linq;
using QuanTracCT.Entity;

namespace QuanTracCT.Service
{
    public class MoDauQueries
    {
        //1.Lấy danh sách công trình
        public List<CongTrinh> GetCongTrinhs()
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from ct in dataContext.CongTrinhs
                        select ct;
            return query.ToList();
        }

        //2.Cho biết danh sách chu kỳ cua công trình
        public List<ChuKy> GetChuKys(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            var query = from ck in dataContext.ChuKys
                        where ck.MaCT == mact
                        select ck;
            return query.ToList();
        }

        //3.Cho biết tên mốc của mỗi chu kỳ
        public List<Moc> GetMocs(Guid mack)
        {
            var dataconText = new QuanTracLunCTContext();
            var query = from m in dataconText.Mocs
                        where m.MaCK == mack
                        select m;
            return query.ToList();
        }

    }   
}
