using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using WebApiRest.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;

namespace WebApiRest.Controllers {

    [EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]    
    public class PreguntaController : ControllerBase {

        readonly PreguntaData dataPregunta = new();
        readonly OpcionData dataOpcion = new();

        [HttpGet]
        [Route("list/{estados}")] //{authorId:int:min(1)} {lcid:int=1033}
        public IActionResult GetList([FromRoute] int estados) {
            PreguntaList result = dataPregunta.GetPreguntaList(estados);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpGet]
        [Route("list/{estados}/{idSala}")] //{authorId:int:min(1)} {lcid:int=1033}
        public IActionResult GetList([FromRoute] int estados, [FromRoute] int idSala) {
            PreguntaList result = dataPregunta.GetPreguntaList(estados, idSala);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("create")]
        public IActionResult CreateItem([FromBody] Pregunta_OpcionList pregunta_opcionList) {

            Response resultPregunta = VF.ValidarPregunta(pregunta_opcionList.Pregunta);
            Response resultOpcion = new();
            Response result = new();
            foreach (var item in pregunta_opcionList.OpcionList) {                
                resultOpcion = VF.ValidarOpcion(item);
                if (resultOpcion.Error > 0) {
                    break;
                }
            }

            if(resultPregunta.Error == 0 && resultOpcion.Error == 0) {
                result = dataPregunta.CreatePregunta(pregunta_opcionList.Pregunta);
                if(result.Error == 0) {
                    int idPregunta = Convert.ToInt32(result.Info.Split(":")[1].ToString().Trim());
                    foreach (var item in pregunta_opcionList.OpcionList) {
                        item.IdPregunta = idPregunta;
                        result = dataOpcion.CreateOpcion(item);                        
                    }                               
                }
            } else if(resultPregunta.Error > 0) {
                result.Error = 1;
                result.Info = resultPregunta.Info;
            } else if (resultOpcion.Error > 0) {
                result.Error = 1;
                result.Info = resultOpcion.Info;
            }

            return StatusCode(StatusCodes.Status200OK, new { result });

            //return StatusCode(StatusCodes.Status200OK, new { pregunta_opcionList });
        }

        [HttpPut]
        [Route("update")]
        public IActionResult UpdateItem([FromBody] Pregunta pregunta) {
            Response result = VF.ValidarPregunta(pregunta);

            if (result.Error == 0) {
                result = dataPregunta.UpdatePregunta(pregunta);
            }

            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpDelete]
        [Route("delete")]
        public IActionResult DeleteItem([FromBody] int idPregunta) {
            Response result = dataPregunta.DeletePregunta(idPregunta);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }
    }
}
