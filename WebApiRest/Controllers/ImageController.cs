using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApiRest.Utilities;

namespace WebApiRest.Controllers
{
    [EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    //[Authorize]
    [ApiController]
    public class ImageController : ControllerBase
    {
        private readonly IWebHostEnvironment _environment;

        public ImageController(IWebHostEnvironment environment)
        {
            _environment = environment;
        }

        [HttpGet("{folder}/{imageName}")]
        public IActionResult GetImage(string folder, string imageName)
        {            
            string rutaArchivo = WC.GetRutaImagen(_environment, imageName, folder);

            if (System.IO.File.Exists(rutaArchivo))
            {
                var imageBytes = System.IO.File.ReadAllBytes(rutaArchivo);
                return File(imageBytes, WC.GetContentType(imageName)); // Ajusta el tipo MIME según el formato de tus imágenes.
            }

            return NotFound(); // Devuelve un 404 si la imagen no se encuentra.
        }
    }
}
