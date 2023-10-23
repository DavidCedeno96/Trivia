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
    public class JuegoChallengerController : ControllerBase
    {

        readonly JuegoChallengerData data = new();

        [HttpGet]
        [Route("list/{idSala}/{idJugador}")] //{authorId:int:min(1)} {lcid:int=1033}
        public IActionResult GetList([FromRoute] int idSala, [FromRoute] int idJugador)
        {
            JuegoChallengerList result = data.GetJuegoChallengerList(idSala, idJugador);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("create")]
        public IActionResult CreateItem([FromBody] JuegoChallenger juegoChallenger)
        {
            Response result = data.CreateJuegoChallenger(juegoChallenger);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("update")]
        public IActionResult UpdateItem([FromBody] JuegoChallenger juegoChallenger)
        {
            Response result = data.UpdateJuegoChallenger(juegoChallenger);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }
    }
}
