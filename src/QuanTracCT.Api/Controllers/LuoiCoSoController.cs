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
    public class LuoiCoSoController : ControllerBase
    {
        [HttpGet("GetMoc")]
        public List<Moc> GetMocs()
        {
            var service = new LuoiCoSoQueries();
            var moc = service.GetMocs();
            return moc;
        }

        [HttpGet("GetMocCS")]
        public List<Moc> GetMocs(string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var mocCS = services.GetMocs(loaimoc);
            return mocCS;
        }

        [HttpGet("GetMocm")]
        public Moc GetMoc(Guid mamoc)
        {
            var services = new LuoiCoSoQueries();
            var mocm = services.GetMoc(mamoc);
            return mocm;
        }

        [HttpGet("GetTDMoc")]
        public List<TuyenDo> GetTuyenDos(string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var tuyenDos = services.GetTuyenDos(loaimoc);
            return tuyenDos;
        }

        [HttpGet("TuyenDoTD")]
        public TuyenDo GetTuyenDo(Guid matdcs)
        {
            var services = new LuoiCoSoQueries();
            var tuyenDo = services.GetTuyenDo(matdcs);
            return tuyenDo;
        }

        [HttpGet("GetSumTD")]
        public double GetSumtd(Guid mack6,string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var SumKC = services.GetSumtd(mack6,loaimoc);
            return SumKC;
        }

        [HttpGet("SumTM")]
        public double GetSumtm(Guid mack6,string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var SumTM = services.GetSumtm(mack6, loaimoc);
            return SumTM;
        }

        [HttpGet("SumCC")]
        public double GetSumcc(Guid mack6 , string loaimoc)
        {
            var services = new LuoiCoSoQueries();
            var SumCC = services.GetSumcc(mack6, loaimoc);
            return SumCC;
        }

        [HttpGet("GetTDCS")]
        public List<TuyenDo> GetTuyenDocks(Guid macsck6)
        {
            var services = new LuoiCoSoQueries();
            var tuyenDoCS = services.GetTuyenDocks(macsck6);
            return tuyenDoCS;
        }






















    }
}
