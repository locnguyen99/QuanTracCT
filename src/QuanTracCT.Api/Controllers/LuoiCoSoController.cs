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
        public Moc GetMoc(Guid mamoc)
        {
            var service = new LuoiCoSoQueries();
            var moc = service.GetMoc(mamoc);
            return moc;

        }
































    }
}
