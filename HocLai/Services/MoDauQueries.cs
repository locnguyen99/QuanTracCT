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
        public List<CongTrinh> GetCongTrinh(Guid mact)
        {
            var dataContext = new QuanTracLunCTContext();
            //1.Cho biết tên, địa điểm công trình
            var query = from ct in dataContext.CongTrinhs
                        where ct.MaCT == mact
                        select ct;
            return query.ToList();
        }



















        
        public List<ChuKy> GetChuKies()
        {
            //2.Cho biết danh sách chu kỳ công trình
            var dataContext = new QuanTracLunCTContext();
            var query = from ck in dataContext.ChuKys
                        select ck;
            return query.ToList();
        }
























        public List<Moc> GetMocs()
        {
            //3.Cho biết tên mốc của mỗi chu kỳ
            var dataconText = new QuanTracLunCTContext();
            var query = from m in dataconText.Mocs
                        select m;
            return query.ToList();
        }

    }   
}
