using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using QuanTracCT.Entity;
using QuanTracCT.Service;

namespace QuanTracCT.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LuoiQuanTracController : ControllerBase
    {
        [HttpGet("MocQT")]
        public Moc GetMoc(Guid mamocqt,string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var mocqt = services.GetMoc(mamocqt, loaimoc);
            return mocqt;
        }

        [HttpGet("MocCK")]
        public List<Moc> GetMocs(Guid maqtck6)
        {
            var services = new LuoiQuanTracQueries();
            var mocCK = services.GetMocs(maqtck6);
            return mocCK;
        }

        [HttpGet("TuyenDoQT")]
        public List<TuyenDo> GetTuyenDos(string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var tuyenDos = services.GetTuyenDos(loaimoc);
            return tuyenDos;
        }

        [HttpGet("TuyenDoCT")]
        public List<TuyenDo> GetTuyenDos()
        {
            var services = new LuoiQuanTracQueries();
            var tuyenDoCT = services.GetTuyenDos();
            return tuyenDoCT;
        }

        [HttpGet("TuyenDoTD")]
        public TuyenDo GetTuyenDo(Guid matdqt)
        {
            var services = new LuoiQuanTracQueries();
            var tuyenDo = services.GetTuyenDo(matdqt);
            return tuyenDo;
        }

        [HttpGet("SumKCQT")]
        public double GetSumtdqt(string loaimoc,Guid mack6qt)
        {
            var services = new LuoiQuanTracQueries();
            var SumKC = services.GetSumtdqt(loaimoc, mack6qt);
            return SumKC;
        }

        [HttpGet("SumTMQT")]
        public double GetSumTM(Guid mack6qt , string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var SumTM = services.GetSumTM(mack6qt,loaimoc);
            return SumTM;
        }

        [HttpGet("SumCCQT")]
        public double GetSumCC(Guid mack6qt, string loaimoc)
        {
            var services = new LuoiQuanTracQueries();
            var SumCC = services.GetSumCC(mack6qt, loaimoc);
            return SumCC;
        }
    }
}
