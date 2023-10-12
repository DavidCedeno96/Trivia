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

        [HttpGet]
        [Route("pregOpc/{estados}/{idPregunta}")] //{authorId:int:min(1)} {lcid:int=1033}
        public IActionResult GetPregunta_OpcionList([FromRoute] int estados, [FromRoute] int idPregunta)
        {
            PreguntaItem resultPregunta = dataPregunta.GetPregunta(estados, idPregunta);
            OpcionList resultOpcion = dataOpcion.GetOpcionList(estados, idPregunta);

            return StatusCode(StatusCodes.Status200OK, new { resultPregunta, resultOpcion });
        }

        [HttpGet]
        [Route("listPregOpc/{estados}/{idSala}")] //{authorId:int:min(1)} {lcid:int=1033}
        public IActionResult GetPreguntaList_opcionList([FromRoute] int estados, [FromRoute] int idSala)
        {
            PreguntaList resultPregList = dataPregunta.GetPreguntaList(estados, idSala);            
            PreguntaList_opciones result = new()
            {
                List = new(),
                Info = resultPregList.Info,
                Error = resultPregList.Error
            };

            if (result.Error == 0)
            {                
                for (int i = 0; i < resultPregList.Lista.Count; i++)
                {
                    int idPregunta = resultPregList.Lista[i].IdPregunta;
                    PreguntaItem resultPregunta = dataPregunta.GetPregunta(estados, idPregunta);
                    OpcionList resultOpcion = dataOpcion.GetOpcionList(estados, idPregunta);

                    result.List.Add(new Pregunta_OpcionList()
                    {
                        Info = resultPregunta.Info + " - " + resultOpcion.Info,                        
                        Error = resultPregunta.Error == 0 && resultOpcion.Error == 0 ? 0 : 1,
                        Pregunta = resultPregunta.Pregunta,
                        OpcionList = resultOpcion.Lista
                    });
                }
            }            
             
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
                result.Campo = resultPregunta.Campo;
            } else if (resultOpcion.Error > 0) {
                result.Error = 1;
                result.Info = resultOpcion.Info;
                result.Campo = resultOpcion.Campo;
            }

            return StatusCode(StatusCodes.Status200OK, new { result });            
        }

        [HttpPut]
        [Route("update")]
        public IActionResult UpdateItem([FromBody] Pregunta_OpcionList pregunta_opcionList) {

            Response resultPregunta = VF.ValidarPregunta(pregunta_opcionList.Pregunta);
            Response resultOpcion = new();
            Response result = new();
            foreach (var item in pregunta_opcionList.OpcionList)
            {
                resultOpcion = VF.ValidarOpcion(item);
                if (resultOpcion.Error > 0)
                {
                    break;
                }
            }

            if (resultPregunta.Error == 0 && resultOpcion.Error == 0)
            {
                result = dataPregunta.UpdatePregunta(pregunta_opcionList.Pregunta);
                if (result.Error == 0)
                {                    
                    foreach (var item in pregunta_opcionList.OpcionList)
                    {                        
                        result = dataOpcion.UpdateOpcion(item);                        
                    }
                    if(result.Error == 0)
                    {
                        int ultimoIdOpcion = Convert.ToInt32(result.Info.Split(":")[1]);
                        int idPregunta = pregunta_opcionList.Pregunta.IdPregunta;
                        //Aqui elimina los que no pertencen
                        result = dataOpcion.DeleteOpcion(ultimoIdOpcion, idPregunta);
                    }
                }
            }
            else if (resultPregunta.Error > 0)
            {
                result.Error = 1;
                result.Info = resultPregunta.Info;
                result.Campo = resultPregunta.Campo;
            }
            else if (resultOpcion.Error > 0)
            {
                result.Error = 1;
                result.Info = resultOpcion.Info;
                result.Campo = resultOpcion.Campo;
            }

            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpDelete]
        [Route("delete")]
        public IActionResult DeleteItem([FromQuery] int idPregunta) {
            Response result = dataPregunta.DeletePregunta(idPregunta);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }
    }
}
