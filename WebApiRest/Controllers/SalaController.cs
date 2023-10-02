using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApiRest.Data;
using WebApiRest.Models;

namespace WebApiRest.Controllers
{
    [EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class SalaController : ControllerBase
    {

        readonly SalaData data = new();

        [HttpPost]
        [Route("create")]
        public IActionResult CreateItem([FromBody] Sala sala)
        {
            Response result = new();
            // Aqui Validar las expresiones regulares

            result = data.CreateSala(sala);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }
    }
}
