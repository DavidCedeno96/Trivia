using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApiRest.Data;
using WebApiRest.Models;

namespace WebApiRest.Controllers
{
    [EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    [ApiController]
    public class SalaJuegoController : ControllerBase
    {

        readonly SalaJuegoData data = new();

        [HttpGet]
        [Route("list/{idSala}/{idJugador}")] //{authorId:int:min(1)} {lcid:int=1033}
        public IActionResult GetList([FromRoute] int idSala, [FromRoute] int idJugador)
        {
            SalaJuegoList result = data.GetSalaJuegoList(idSala, idJugador);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("create")]
        public IActionResult CreateItem([FromBody] SalaJuego salaJuego)
        {
            Response result = data.CreateSalaJuego(salaJuego);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("update")]
        public IActionResult UpdateItem([FromBody] SalaJuego salaJuego)
        {
            Response result = data.UpdateSalaJuego(salaJuego);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }
    }
}
