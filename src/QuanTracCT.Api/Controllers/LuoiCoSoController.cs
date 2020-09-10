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
    public class LuoiCoSoController : ControllerBase
    {
        [HttpGet("MocCSs")]
        public List<Moc> GetMocCSs(string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var moccss = services.GetMocCSs(loaimoc);
            return moccss;
        }

        [HttpGet("TuyenDoCSs")]
        public List<TuyenDo> GetTuyenDoCSs(string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var tuyendocss= services.GetTuyenDoCSs(loaimoc);
            return tuyendocss;
        }

        [HttpGet("SumKCTDCS")]
        public double GetSumKCTDCS(Guid mack, string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var sumkctdcs = services.GetSumKCTDCS(mack, loaimoc);
            return sumkctdcs;
        }

        [HttpGet("SumTMTDCS")]
        public double GetSumTMTDCS(Guid mack, string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var sumtmtdcs = services.GetSumTMTDCS(mack, loaimoc);
            return sumtmtdcs;
        }

        [HttpGet("SumCCTDCS")]
        public double GetSumCCTDCS(Guid mack, string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var sumcctdcs = services.GetSumCCTDCS(mack, loaimoc);
            return sumcctdcs;
        }

        [HttpGet("SumKCTDCSCT")]
        public SumQTL GetSumKCTDCSCT(Guid mact, string loaimoc, Guid mack)
        {
            var services = new LuoiCoSoQueries();
            var sumkctdcsct = services.GetSumKCTDCSCT(mact, loaimoc, mack);
            return sumkctdcsct;
        }

        [HttpGet("SumTMTDCSCT")]
        public SumQTL GetSumTMTDCSCT(Guid mact, string loaimoc, Guid mack)
        {
            var services = new LuoiCoSoQueries();
            var sumtmtdcsct = services.GetSumTMTDCSCT(mact, loaimoc, mack);
            return sumtmtdcsct;
        }

        [HttpGet("SumCCTDCSCT")]
        public SumQTL GetSumCCTDCSCT(Guid mact, string loaimoc, Guid mack)
        {
            var services = new LuoiCoSoQueries();
            var sumcctdcsct = services.GetSumCCTDCSCT(mact, loaimoc, mack);
            return sumcctdcsct;
        }

        [HttpGet("SumMocCSCT")]
        public SumQTL GetSumMocCSCT(Guid mact, string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var summoccsct = services.GetSumMocCSCT(mact, loaimoc);
            return summoccsct;
        }

        [HttpGet("SumMocCSCK")]
        public SumQTL GetSumMocCSCK(Guid mack, string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var summoccsck = services.GetSumMocCSCK(mack, loaimoc);
            return summoccsck;
        }

        [HttpGet("SumTuyenCSCT")]
        public SumQTL GetSumTuyenCSCT(Guid mact, string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var sumtdcsct = services.GetSumTuyenCSCT(mact, loaimoc);
            return sumtdcsct;
        }

        [HttpGet("SumTuyenCSCK")]
        public SumQTL GetSumTuyenCSCK(Guid mack, string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var sumtdcsck = services.GetSumTuyenCSCK(mack, loaimoc);
            return sumtdcsck;
        }
    }
}
