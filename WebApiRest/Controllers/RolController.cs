using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using WebApiRest.Data;
using WebApiRest.Models;

namespace WebApiRest.Controllers
{
    [EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    [ApiController]
    public class RolController : ControllerBase
    {
        readonly RolData data = new();

        [HttpGet]
        [Route("list/{estados}")] //{authorId:int:min(1)} {lcid:int=1033}
        public IActionResult GetList([FromRoute] int estados)
        {
            RolList result = data.GetRolList(estados);
            if(result.Error > 0)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { result });
            }
            else
            {
                return StatusCode(StatusCodes.Status200OK, new { result });
            }
        }
    }
}
