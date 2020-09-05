using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using QuanTracCT.Entity;
using QuanTracCT.Service;
using QuanTracCT.Service.DTO;

namespace QuanTracCT.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MoDauController : ControllerBase
    {
        [HttpGet("GetCT")]
        public List<CongTrinh> GetCongTrinhs()
        {
            var services = new MoDauQueries();
            var congTrinhs = services.GetCongTrinhs();
            return congTrinhs;
        }

        [HttpGet("GetCK")]
        public List<ChuKy> GetChuKys(Guid mact)
        {
            var services = new MoDauQueries();
            var chukys = services.GetChuKys(mact);
            return chukys.ToList();
        }

        [HttpGet("GetMoc")]
        public List<Moc> GetMocs(Guid mack)
        {
            var services = new MoDauQueries();
            var mocs = services.GetMocs(mack);
            return mocs.ToList();
        }

        [HttpGet("GetMocCT")]
        public List<MocCT> GetMocCTs(Guid mact)
        {
            var services = new MoDauQueries();
            var moct = services.GetMocCTs(mact);
            return moct;
        }

        [HttpGet("SumMocCK")]
        public List<MocCK> GetMocCKs(Guid mact)
        {
            var services = new MoDauQueries();
            var sumMoc = services.GetMocCKs(mact);
            return sumMoc;
        }
    }
}
