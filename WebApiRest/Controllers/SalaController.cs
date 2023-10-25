using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using WebApiRest.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;

namespace WebApiRest.Controllers
{
    [EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class SalaController : ControllerBase
    {

        readonly SalaData data = new();
        private readonly IWebHostEnvironment _env;
        private readonly string nombreCarpeta = "Sala";

        public SalaController(IWebHostEnvironment env)
        {
            _env = env;
        }        

        [HttpGet]
        [Route("list/{estados}")] //{authorId:int:min(1)} {lcid:int=1033}
        public IActionResult GetList([FromRoute] int estados)
        {
            SalaList result = data.GetSalaList(estados);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpGet]
        [Route("list/{estados}/{idSala}/{idUsuario}")] //{authorId:int:min(1)} {lcid:int=1033}
        public IActionResult GetItem([FromRoute] int estados, [FromRoute] int idSala, [FromRoute] int idUsuario)
        {
            SalaItem result = data.GetSala(estados, idSala, idUsuario);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpGet]
        [Route("list")]
        public IActionResult GetSearch([FromQuery] int estados, [FromQuery] string buscar)
        {
            SalaList result = data.GetSalaList(estados, buscar);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }


        [HttpPost]
        [Route("create")]
        public IActionResult CreateItem([FromForm] IFormFile archivo, [FromForm] Sala sala)
        {
            Response result = VF.ValidarSala(sala);
            string rutaArchivo = "";

            if (archivo != null && result.Error == 0)
            {
                result = VF.ValidarArchivo(_env, archivo, "jpg/jpeg/png", nombreCarpeta);
                rutaArchivo = WC.GetRutaImagen(_env, archivo.FileName, nombreCarpeta);

                sala.Imagen = archivo.FileName.Trim();
            }
            else
            {
                sala.Imagen = "";
            }            

            if (result.Error == 0)
            {
                result = data.CreateSala(sala);
                if (result.Error == 0 && !rutaArchivo.Equals(""))
                {
                    //Aqui creamos una nueva imagen
                    FileStream fileStream = new(rutaArchivo, FileMode.Create);
                    archivo.CopyTo(fileStream);
                }
            }

            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPut]
        [Route("update")]
        public IActionResult UpdateItem([FromForm] IFormFile archivo, [FromForm] Sala sala)
        {
            Response result = VF.ValidarSala(sala);
            string rutaArchivo = "";

            if (archivo != null && result.Error == 0)
            {
                result = VF.ValidarArchivo(_env, archivo, "jpg/jpeg/png", nombreCarpeta);
                rutaArchivo = WC.GetRutaImagen(_env, archivo.FileName, nombreCarpeta);

                sala.Imagen = WC.GetTrim(archivo.FileName);
            }
            else
            {
                sala.Imagen = "";
            }

            if (result.Error == 0)
            {
                result = data.UpdateSala(sala);
                if (result.Error == 0 && !rutaArchivo.Equals("")) {
                    string imagenAnterior = result.Info.Split(":")[1];
                    result.Info = result.Info.Split(",")[0];

                    //Aqui eliminamos el archivo anterior
                    string rutaArchivoAnterior = WC.GetRutaImagen(_env, imagenAnterior, nombreCarpeta);
                    if (System.IO.File.Exists(rutaArchivoAnterior)) {
                        System.IO.File.Delete(rutaArchivoAnterior);
                    }

                    //Aqui creamos una nueva imagen
                    FileStream fileStream = new(rutaArchivo, FileMode.Create);
                    archivo.CopyTo(fileStream);
                }
            }        

            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPut]
        [Route("updateEstado")]
        public IActionResult UpdateItemEstado([FromBody] Sala sala)
        {
            Response result = data.UpdateSalaEstado(sala);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpDelete]
        [Route("delete")]
        public IActionResult DeleteItem([FromQuery] int idSala)
        {
            Response result = data.DeleteSala(idSala);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }
    }
}
