using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Xml.Schema;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using QuanTracCT.Entity;
using QuanTracCT.Service;

namespace QuanTracCT.Api.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class WeatherForecastController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<WeatherForecastController> _logger;

        public WeatherForecastController(ILogger<WeatherForecastController> logger)
        {
            _logger = logger;
        }

        [HttpGet("")]
        public List<CongTrinh> Gets()
        {
            var servece = new MoDauQueries();
            var dsCongTrinhs = servece.GetCongTrinhs();
            return dsCongTrinhs;
        }
    }
}
