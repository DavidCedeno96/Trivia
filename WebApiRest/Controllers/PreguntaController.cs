using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using NPOI.SS.UserModel;
using NPOI.XSSF.UserModel;
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
            bool hayErrorlist = false;
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
                    if(result.List[i].Error > 0)
                    {
                        hayErrorlist = true;
                    }
                    if (hayErrorlist)
                    {
                        result.Error = 1;
                        result.Info = "En la lista hay errores";
                    }                    
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

        [HttpPost]
        [Route("import")]
        public IActionResult ImportList([FromForm] IFormFile archivo, [FromForm] int idSala)
        {
            bool hayErrorlist = false;
            Response result = new();
            PreguntaList_opciones response = new() 
            { 
                List = new() 
            };
            
            List<Pregunta_OpcionList> lista = new();

            if (archivo != null)
            {
                Stream stream = archivo.OpenReadStream();                
                if(Path.GetExtension(archivo.FileName).Equals(".xlsx"))
                {
                    try
                    {
                        IWorkbook archivoExcel = new XSSFWorkbook(stream);
                        ISheet hojaExcel = archivoExcel.GetSheetAt(0);
                        int cantidadFilas = hojaExcel.LastRowNum + 1;

                        for (int i = 0; i < cantidadFilas; i++)
                        {
                            if (i > 0)
                            {
                                IRow filaEncabezado = hojaExcel.GetRow(0);
                                IRow filaData = hojaExcel.GetRow(i);
                                Pregunta pregunta = new();
                                List<Opcion> listOp = new();
                                for (int j = 0; j < 6; j++)
                                {
                                    if (filaEncabezado.GetCell(j).ToString().ToLower().Contains("pregunta"))
                                    {
                                        pregunta.Nombre = filaData.GetCell(j).ToString();
                                        pregunta.IdSala = idSala;
                                    }
                                    else if (filaEncabezado.GetCell(j).ToString().ToLower().Contains("opcion"))
                                    {
                                        if (!filaData.GetCell(j).ToString().Trim().Equals(""))
                                        {
                                            listOp.Add(new Opcion
                                            {
                                                Nombre = filaData.GetCell(j).ToString().Trim(),
                                                Correcta = 0
                                            });
                                        }
                                    }
                                    else if (filaEncabezado.GetCell(j).ToString().ToLower().Contains("correcta"))
                                    {
                                        if (!filaData.GetCell(j).ToString().Trim().Equals(""))
                                        {
                                            string opcCorrecta = filaData.GetCell(j).ToString().ToLower().Trim();
                                            for (int k = 0; k < 4; k++)
                                            {
                                                if (filaEncabezado.GetCell(k + 1).ToString().ToLower().Trim().Equals(opcCorrecta))
                                                {
                                                    listOp[k].Correcta = 1;
                                                    break;
                                                }
                                            }
                                        }
                                    }
                                }

                                lista.Add(new Pregunta_OpcionList
                                {
                                    Pregunta = pregunta,
                                    OpcionList = listOp,
                                });
                            }
                        }

                        foreach (var item in lista)
                        {
                            Response resultPregunta = VF.ValidarPregunta(item.Pregunta);
                            Response resultOpcion = new();
                            foreach (var op in item.OpcionList)
                            {
                                resultOpcion = VF.ValidarOpcion(op);
                                if (resultOpcion.Error > 0)
                                {
                                    break;
                                }
                            }

                            if (resultPregunta.Error == 0 && resultOpcion.Error == 0)
                            {
                                result = dataPregunta.CreatePregunta(item.Pregunta);
                                if (result.Error == 0)
                                {
                                    int idPregunta = Convert.ToInt32(result.Info.Split(":")[1].ToString().Trim());
                                    foreach (var op in item.OpcionList)
                                    {
                                        op.IdPregunta = idPregunta;
                                        result = dataOpcion.CreateOpcion(op);
                                    }
                                    if (result.Error == 0)
                                    {
                                        result.Info = result.Info.Split(",")[0];
                                    }
                                }
                            }
                            else if (resultPregunta.Error > 0)
                            {
                                result.Error = 1;
                                result.Info = resultPregunta.Info;
                                result.Campo = resultPregunta.Campo;
                                hayErrorlist = true;
                            }
                            else if (resultOpcion.Error > 0)
                            {
                                result.Error = 1;
                                result.Info = resultOpcion.Info;
                                result.Campo = resultOpcion.Campo;
                                hayErrorlist = true;
                            }

                            if (hayErrorlist)
                            {
                                response.Error = 1;
                                response.Info = "En las preguntas u opciones no se permiten caracteres <, > o =";
                            }

                            response.List.Add(new Pregunta_OpcionList
                            {
                                Info = result.Info,
                                Error = result.Error,
                                Pregunta = item.Pregunta,
                                OpcionList = item.OpcionList,
                            });
                        }
                    }
                    catch (Exception ex)
                    {
                        response.Error = 1;
                        response.Info = ex.Message + "|Error en el formato preguntas y opciones";
                    }                             
                }
                else
                {
                    response.Error = 1;
                    response.Info = "Archivo no permitido";
                }
            }
            else
            {
                response.Error = 1;
                response.Info = "Falta el archivo";
            }

            return StatusCode(StatusCodes.Status200OK, new { response });
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
