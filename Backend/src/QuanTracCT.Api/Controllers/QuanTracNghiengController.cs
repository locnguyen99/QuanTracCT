using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using QuanTracCT.Entity;
using QuanTracCT.Service;
using QuanTracCT.Service.DTO;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace QuanTracCT.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class QuanTracNghiengController : ControllerBase
    {
       [HttpGet("MocNs")]
       public List<MocNghieng> GetMocNgiengs()
        {
            var services = new QuanTracNghiengQueries();
            var mocns = services.GetMocNghiengs();
            return mocns;
        }

        [HttpGet("MocNCTs")]
        public List<QTNghieng> GetMocNghiengCTs(Guid mact)
        {
            var services = new QuanTracNghiengQueries();
            var mocncts = services.GetMocNghiengCTs(mact);
            return mocncts;
        }

        [HttpGet("MocNCKSANs")]
        public List<MocNghieng> GetMocNghiengSans(int san)
        {
            var services = new QuanTracNghiengQueries();
            var mocncksans = services.GetMocNghiengSans(san);
            return mocncksans;
        }

        [HttpGet("MocNLoais")]
        public List<MocNghieng> GetMocNghiengLoais(string loaimoc)
        {
            var services = new QuanTracNghiengQueries();
            var mocnloais = services.GetMocNghiengLoais(loaimoc);
            return mocnloais;
        }

        [HttpGet("MocN")]
        public MocNghieng GetMocNgieng(Guid mamocn)
        {
            var services = new QuanTracNghiengQueries();
            var mocn = services.GetMocNghieng(mamocn);
            return mocn;
        }

        [HttpGet("SumMocNCT")]
        public SumQTN GetSumMocNCT(Guid mact)
        {
            var services = new QuanTracNghiengQueries();
            var summocnct = services.GetSumMocNCT(mact);
            return summocnct;
        }

        [HttpGet("SumMocNCK")]
        public SumQTN GetSumMocNCK(Guid mack)
        {
            var services = new QuanTracNghiengQueries();
            var summocnck = services.GetSumMocNCK(mack);
            return summocnck;
        }

        [HttpGet("SumMocNCSCT")]
        public SumQTN GetSumMocNCSCT(Guid mact,string loaimoc)
        {
            var services = new QuanTracNghiengQueries();
            var summocncs = services.GetSumMocNCSCT(mact,loaimoc);
            return summocncs;
        }

        [HttpGet("SumMocNQTCT")]
        public SumQTN GetSumMocNQTCT(Guid mact, string loaimoc)
        {
            var services = new QuanTracNghiengQueries();
            var summocnqt = services.GetSumMocNQTCT(mact, loaimoc);
            return summocnqt;
        }

        [HttpGet("SumMocNQTCK")]
        public SumQTN GetSumMocNQTCK(Guid mack,string loaimoc)
        {
            var services = new QuanTracNghiengQueries();
            var summocnqtck = services.GetSumMocNQTCK(mack,loaimoc);
            return summocnqtck;
        }

        [HttpGet("SumMocNCSCK")]
        public SumQTN GetSumMocNCSCK(Guid mack, string loaimoc)
        {
            var services = new QuanTracNghiengQueries();
            var summocncsck = services.GetSumMocNCSCK(mack, loaimoc);
            return summocncsck;
        }

        [HttpGet("DiemNCTs")]
        public List<QTNghieng> GetDiemNghiengCTs(Guid mact)
        {
            var services = new QuanTracNghiengQueries();
            var diemncts = services.GetDiemNghiengCTs(mact);
            return diemncts;
        }

        [HttpGet("DiemNs")]
        public List<DiemNghieng> GetDiemNgiengs()
        {
            var services = new QuanTracNghiengQueries();
            var diemns = services.GetDiemNghiengs();
            return diemns;
        }

        [HttpGet("DiemNCKs")]
        public List<DiemNghieng> GetDiemNgiengCKs(Guid mack)
        {
            var services = new QuanTracNghiengQueries();
            var diemncks = services.GetDiemNghiengCKs(mack);
            return diemncks;
        }

        [HttpGet("DiemN")]
        public DiemNghieng GetDiemNgieng(Guid madiem)
        {
            var services = new QuanTracNghiengQueries();
            var diemn = services.GetDiemNghieng(madiem);
            return diemn;
        }

        [HttpGet("SumDiemNCT")]
        public SumQTN GetSumDiemNCT(Guid mact)
        {
            var services = new QuanTracNghiengQueries();
            var sumdiemnct = services.GetSumDiemNCT(mact);
            return sumdiemnct;
        }

        [HttpGet("SumDiemNCK")]
        public SumQTN GetSumDiemNCK(Guid mack)
        {
            var services = new QuanTracNghiengQueries();
            var sumdiemnck = services.GetSumDiemNCK(mack);
            return sumdiemnck;
        }

        [HttpGet("DinhNCTs")]
        public List<QTNghieng> GetDinhNghiengCTs(Guid mact)
        {
            var services = new QuanTracNghiengQueries();
            var dinhncts = services.GetDinhNghiengCTs(mact);
            return dinhncts;
        }

        [HttpGet("DinhNs")]
        public List<DinhNghieng> GetDinhNgiengs()
        {
            var services = new QuanTracNghiengQueries();
            var dinhns = services.GetDinhNghiengs();
            return dinhns;
        }

        [HttpGet("DinhNCKs")]
        public List<DinhNghieng> GetDinhNghiengCKs(Guid mack)
        {
            var services = new QuanTracNghiengQueries();
            var dinhcks = services.GetDinhNghiengCKs(mack);
            return dinhcks;
        }

        [HttpGet("DinhN")]
        public DinhNghieng GetDinhNgieng(Guid madinh)
        {
            var services = new QuanTracNghiengQueries();
            var dinhn = services.GetDinhNghieng(madinh);
            return dinhn;
        }

        [HttpGet("SumDinhNCT")]
        public SumQTN GetSumDinhNCT(Guid mact)
        {
            var services = new QuanTracNghiengQueries();
            var sumdinhnct = services.GetSumDiemNCT(mact);
            return sumdinhnct;
        }

        [HttpGet("SumDinhNCK")]
        public SumQTN GetSumDinhNCK(Guid mack)
        {
            var services = new QuanTracNghiengQueries();
            var sumdinhnck = services.GetSumDiemNCK(mack);
            return sumdinhnck;
        }

        [HttpGet("CanhNs")]
        public List<CanhNghieng> GetCanhNgiengs()
        {
            var services = new QuanTracNghiengQueries();
            var canhns = services.GetCanhNghiengs();
            return canhns;
        }

        [HttpGet("CanhNCTs")]
        public List<QTNghieng> GetCanhNghiengCTs(Guid mact)
        {
            var services = new QuanTracNghiengQueries();
            var canhncts = services.GetCanhNghiengCTs(mact);
            return canhncts;
        }

        [HttpGet("CanhN")]
        public CanhNghieng GetCanhNgieng(Guid macanh)
        {
            var services = new QuanTracNghiengQueries();
            var canhn = services.GetCanhNghieng(macanh);
            return canhn;
        }

        [HttpGet("SumCanhNCT")]
        public SumQTN GetSumCanhNCT(Guid mact)
        {
            var services = new QuanTracNghiengQueries();
            var sumcanhnct = services.GetSumDiemNCT(mact);
            return sumcanhnct;
        }

        [HttpGet("SumCanhNCK")]
        public SumQTN GetSumCanhNCK(Guid mack)
        {
            var services = new QuanTracNghiengQueries();
            var sumcanhnck = services.GetSumDiemNCT(mack);
            return sumcanhnck;
        }

    }
}
