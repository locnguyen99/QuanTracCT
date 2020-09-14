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
    public class LuoiQuanTracController : ControllerBase
    {
        [HttpGet("MocQTs")]
        public List<Moc> GetMocQTs(string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var mocqts = services.GetMocQTs(loaimoc);
            return mocqts;
        }

        [HttpGet("TuyenDoQTs")]
        public List<TuyenDo> GetTuyenDoQTs(string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var tuyendoqts = services.GetTuyenDoQTs(loaimoc);
            return tuyendoqts;
        }

        [HttpGet("SumKCTDQT")]
        public double GetSumKCTDQT(Guid mack, string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var sumkctdqt = services.GetSumKCTDQT(mack, loaimoc);
            return sumkctdqt;
        }

        [HttpGet("SumTMTDQT")]
        public double GetSumTMTDQT(Guid mack, string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var sumtmtdqt = services.GetSumTMTDQT(mack, loaimoc);
            return sumtmtdqt;
        }

        [HttpGet("SumCCTDQT")]
        public double GetSumCCTDQT(Guid mack, string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var sumcctdqt = services.GetSumCCTDQT(mack, loaimoc);
            return sumcctdqt;
        }

        [HttpGet("SumKCTDQTCT")]
        public SumQTL GetSumKCTDQTCT(Guid mact, string loaimoc, Guid mack)
        {
            var services = new LuoiQuanTracQueries();
            var sumkctdqtct = services.GetSumKCTDQTCT(mact, loaimoc, mack);
            return sumkctdqtct;
        }

        [HttpGet("SumTMTDQTCT")]
        public SumQTL GetSumTMTDQTCT(Guid mact, string loaimoc, Guid mack)
        {
            var services = new LuoiQuanTracQueries();
            var sumtmtdqtct = services.GetSumTMTDQTCT(mact, loaimoc, mack);
            return sumtmtdqtct;
        }

        [HttpGet("SumCCTDQTCT")]
        public SumQTL GetSumCCTDQTCT(Guid mact, string loaimoc, Guid mack)
        {
            var services = new LuoiQuanTracQueries();
            var sumcctdqtct = services.GetSumCCTDQTCT(mact, loaimoc, mack);
            return sumcctdqtct;
        }

        [HttpGet("SumMocQTCT")]
        public SumQTL GetSumMocQTCT(Guid mact, string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var summocqtct = services.GetSumMocQTCT(mact, loaimoc);
            return summocqtct;
        }

        [HttpGet("SumMocQTCK")]
        public SumQTL GetSumMocQTCK(Guid mack, string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var summocqtck = services.GetSumMocQTCK(mack, loaimoc);
            return summocqtck;
        }

        [HttpGet("SumTuyenQTCT")]
        public SumQTL GetSumTuyenQTCT(Guid mact, string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var sumtdqtct = services.GetSumTuyenQTCT(mact, loaimoc);
            return sumtdqtct;
        }

        [HttpGet("SumTuyenQTCK")]
        public SumQTL GetSumTuyenQTCK(Guid mack, string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var sumtdqtck = services.GetSumTuyenQTCK(mack, loaimoc);
            return sumtdqtck;
        }
    }
}
