using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using WebApiRest.Data;
using WebApiRest.Models;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using Microsoft.AspNetCore.Cors;

namespace WebApiRest.Controllers
{
    [EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        readonly UsuarioData data = new();
        private readonly string secretKey;

        public UsuarioController(IConfiguration configuration)
        {
            secretKey = configuration.GetSection("settings").GetSection("secretKey").ToString();
        }   

        [HttpGet]
        [Route("list/{estados}")] //{authorId:int:min(1)} {lcid:int=1033}
        public IActionResult GetList([FromRoute] int estados)
        {
            UsuarioList result = data.GetUsuarioList(estados);
            if (result.Error > 0)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { result });
            }
            else
            {
                return StatusCode(StatusCodes.Status200OK, new { result });
            }
        }

        [HttpPost]
        [Route("auth")]
        public IActionResult LoginUsuario([FromBody] Usuario usuario)
        {
            // Aqui Validar las expresiones regulares que sea un correo y la contraseña
            UsuarioList result = data.Login(usuario);
            if(result.Error > 0)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { result });
            }
            else
            {
                var keyBytes = Encoding.ASCII.GetBytes(secretKey);
                var claims = new ClaimsIdentity();
                claims.AddClaim(new Claim("correo", result.Lista[0].Correo));  //ClaimTypes.NameIdentifier
                claims.AddClaim(new Claim("id", result.Lista[0].IdUsuario.ToString()));                                                
                claims.AddClaim(new Claim("nombre", result.Lista[0].Nombre));
                claims.AddClaim(new Claim("rol", result.Lista[0].Rol));
                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = claims,
                    Expires = DateTime.UtcNow.AddMinutes(300), //Tiempo de expiracion del token en minutos
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(keyBytes), SecurityAlgorithms.HmacSha256Signature)
                };

                var tokenHandler = new JwtSecurityTokenHandler();
                var tokenConfig = tokenHandler.CreateToken(tokenDescriptor);
                string tokenCreado = tokenHandler.WriteToken(tokenConfig);
                result.Info = tokenCreado;
                result.Lista = null;
                return StatusCode(StatusCodes.Status200OK, new { result });
            }
        }

        [HttpPost]
        [Route("create")]
        public IActionResult CreateItem([FromBody] Usuario usuario)
        {
            Response result = new();
            // Aqui Validar las expresiones regulares

            result = data.CreateUsuario(usuario);
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
