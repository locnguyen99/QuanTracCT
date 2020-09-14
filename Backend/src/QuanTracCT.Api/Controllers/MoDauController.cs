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
       [HttpGet("CongTrinhs")]
       public List<CongTrinh> GetCongTrinhs()
       {
            var services = new MoDauQueries();
            var congtrinhs = services.GetCongTrinhs();
            return congtrinhs;
       }

       [HttpGet("CongTrinh")]
        public CongTrinh GetCongTrinh(Guid mact)
        {
            var services = new MoDauQueries(); 
            var congtrinh = services.GetCongTrinh(mact);
            return congtrinh;
        }

        [HttpGet("ChuKies")]
        public List<ChuKy> GetChuKies()
        {
            var services = new MoDauQueries();
            var chukies = services.GetChuKies();
            return chukies;
        }

        [HttpGet("ChuKyCTs")]
        public List<ChuKy> GetChuKieCTs(Guid mact)
        {
            var services = new MoDauQueries();
            var chukycts = services.GetChuKieCTs(mact);
            return chukycts;
        }

        [HttpGet("ChuKy")]
        public ChuKy GetChuKy(Guid mack)
        {
            var services = new MoDauQueries();
            var chuky = services.GetChuKy(mack);
            return chuky;
        }

        [HttpGet("MocCTs")]
        public List<QTLun> GetMocCTs(Guid mact)
        {
            var services = new MoDauQueries();
            var moccts = services.GetMocCTs(mact);
            return moccts;
        }

        [HttpGet("MocCKs")]
        public List<Moc> GetMocCKs(Guid mack)
        {
            var services = new MoDauQueries();
            var moccks = services.GetMocCKs(mack);
            return moccks;
        }

        [HttpGet("Mocs")]
        public List<Moc> GetMocs()
        {
            var services = new MoDauQueries();
            var mocs = services.GetMocs();
            return mocs;
        }

        [HttpGet("Moc")]
        public Moc GetMoc(Guid mamoc)
        {
            var services = new MoDauQueries();
            var moc = services.GetMoc(mamoc);
            return moc;
        }

        [HttpGet("TuyenDoCTs")]
        public List<QTLun> GetTuyenDoCTs(Guid mact)
        {
            var services = new MoDauQueries();
            var tuyendocts = services.GetTuyenDoCTs(mact);
            return tuyendocts;
        }

        [HttpGet("TuyenDoCKs")]
        public List<TuyenDo> GetTuyenDocCKs(Guid mack)
        {
            var services = new MoDauQueries();
            var tuyendocks = services.GetTuyenDocCKs(mack);
            return tuyendocks;
                
        }

        [HttpGet("TuyenDos")]
        public List<TuyenDo> GetTuyenDos()
        {
            var serivces = new MoDauQueries();
            var tuyendos = serivces.GetTuyenDos();
            return tuyendos;
        }

        [HttpGet("TuyenDo")]
        public TuyenDo GetTuyenDo(Guid matd)
        {
            var services = new MoDauQueries();
            var tuyendo = services.GetTuyenDo(matd);
            return tuyendo;
        }

        [HttpGet("SumCKCT")]
        public SumQTL GetSumCKCT(Guid mact)
        {
            var services = new MoDauQueries();
            var sumckct = services.GetSumCKCT(mact);
            return sumckct;
        }

        [HttpGet("SumMocCT")]
        public SumQTL GetSumMocCT (Guid mact)
        {
            var services = new MoDauQueries();
            var summocct = services.GetSumMocCT(mact);
            return summocct;
        }

        [HttpGet("SumMocCK")]
        public SumQTL GetSumMocCK(Guid mack)
        {
            var services = new MoDauQueries();
            var summocck = services.GetSumMocCK(mack);
            return summocck;
        }

        [HttpGet("SumTuyenDoCK")]
        public SumQTL GetSumTuyenCK(Guid mack)
        {
            var services = new MoDauQueries();
            var sumtdck = services.GetSumTuyenCK(mack);
            return sumtdck;
        }

        [HttpGet("SumTuyenDoCT")]
        public SumQTL GetSumTuyenCT(Guid mact)
        {
            var services = new MoDauQueries();
            var sumtdct = services.GetSumTuyenCT(mact);
            return sumtdct;
        }

    }
    
}
