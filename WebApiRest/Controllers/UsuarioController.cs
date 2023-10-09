using Microsoft.AspNetCore.Mvc;
using WebApiRest.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Text;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Authorization;

namespace WebApiRest.Controllers
{
    [EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    [ApiController]
    public class UsuarioController : ControllerBase
    {
        readonly UsuarioData data = new();        
        readonly Settings settings = new();    

        public UsuarioController(IConfiguration configuration)
        {
            settings = configuration.GetSection("settings").Get<Settings>();            
        }
        
        [HttpGet]
        [Route("list/{estados}")] //{authorId:int:min(1)} {lcid:int=1033}
        [Authorize]
        public IActionResult GetList([FromRoute] int estados)
        {
            UsuarioList result = data.GetUsuarioList(estados);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("auth")]
        public IActionResult LoginUsuario([FromBody] Usuario usuario)
        {            
            UsuarioItem result = data.Login(usuario);

            if(result.Error == 0)
            {                
                var keyBytes = Encoding.ASCII.GetBytes(settings.SecretKey);
                var claims = new ClaimsIdentity();
                claims.AddClaim(new Claim("correo", result.Usuario.Correo));  //ClaimTypes.NameIdentifier
                claims.AddClaim(new Claim("id", result.Usuario.IdUsuario.ToString()));
                claims.AddClaim(new Claim("nombre", result.Usuario.Nombre));
                claims.AddClaim(new Claim("idRol", result.Usuario.IdRol.ToString()));
                claims.AddClaim(new Claim("rol", result.Usuario.Rol));
                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = claims,
                    Expires = DateTime.UtcNow.AddMinutes(settings.TimeExpTokenMin), //Tiempo de expiracion del token en minutos
                    SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(keyBytes), SecurityAlgorithms.HmacSha256Signature)
                };

                var tokenHandler = new JwtSecurityTokenHandler();
                var tokenConfig = tokenHandler.CreateToken(tokenDescriptor);
                string tokenCreado = tokenHandler.WriteToken(tokenConfig);
                result.Info = tokenCreado;
                result.Usuario = null;
            }

            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("create")]
        public IActionResult CreateItem([FromBody] Usuario usuario)
        {
            Response result = VF.ValidarUsuario(usuario);

            if(result.Error == 0)
            {
                result = data.CreateUsuario(usuario);
            }
            
            return StatusCode(StatusCodes.Status200OK, new { result });
        }        
    }
}
