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


        [HttpPost]
        [Route("create")]
        public IActionResult CreateItem([FromForm] IFormFile archivo, [FromForm] Sala sala)
        {
            Response result = VF.ValidarSala(sala);
            string rutaArchivo = "";

            if (archivo != null)
            {
                if (!WC.GetArchivoPermitido("jpg/jpeg/png", archivo.FileName))
                {
                    result.Error = 1;
                    result.Info = WC.GetErrorArchivo();
                }

                rutaArchivo = WC.GetRutaImagen(_env, archivo.FileName, nombreCarpeta);
                if (System.IO.File.Exists(rutaArchivo))
                {
                    result.Error = 1;
                    result.Info = WC.GetArchivoExistente();
                }

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
                    FileStream fileStream = new(rutaArchivo, FileMode.Create); // => Aqui creamos la imagen
                    archivo.CopyTo(fileStream); // => Aqui guarda la imagen en el path                  
                }
            }

            return StatusCode(StatusCodes.Status200OK, new { result });
        }
    }
}
