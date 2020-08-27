using HocLai;
using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using System.Data;
using System.Linq;

namespace QuanTracCT.Services
{
    public class MoDauQueries
    {
        public List<CongTrinh> GetCongTrinh()
        {
            var dataContext = new QuanTracLunCTContext();
            //1.Cho biết tên, địa điểm công trình
            var query = from ct in dataContext.CongTrinhs
                        select ct;
            return query.ToList();
        }
    }   
}
