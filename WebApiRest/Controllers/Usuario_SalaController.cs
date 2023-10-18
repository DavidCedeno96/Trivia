using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using WebApiRest.Data;
using WebApiRest.Models;

namespace WebApiRest.Controllers
{
    [EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class Usuario_SalaController : ControllerBase
    {
        readonly Usuario_SalaData data = new();

        [HttpGet]
        [Route("list/{estados}/{idSala}")] //{authorId:int:min(1)} {lcid:int=1033}
        public IActionResult GetList([FromRoute] int estados, [FromRoute] int idSala)
        {
            Usuario_SalaList result = data.GetUsuario_SalaList(estados, idSala);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("create")]
        public IActionResult CreateItem([FromBody] Usuario_Sala usuario_sala)
        {
            Response result = data.CreateUsuario_Sala(usuario_sala);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }
    }
}
