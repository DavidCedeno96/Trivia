using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Mvc;
using NPOI.HSSF.UserModel;
using NPOI.SS.UserModel;
using System.Data;
using WebApiRest.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;

namespace WebApiRest.Controllers
{
    [EnableCors("ReglasCors")]
    [Route("api/[controller]")]
    [Authorize]
    [ApiController]
    public class Usuario_SalaController : ControllerBase
    {
        readonly Usuario_SalaData data = new();
        private readonly IWebHostEnvironment _env;
        private readonly string nombreCarpeta = "Ranking";

        public Usuario_SalaController(IWebHostEnvironment env)
        {
            _env = env;
        }

        [HttpGet]
        [Route("list/{estados}/{idSala}")] //{authorId:int:min(1)} {lcid:int=1033}
        public IActionResult GetList([FromRoute] int estados, [FromRoute] int idSala)
        {
            Usuario_SalaList result = data.GetUsuario_SalaList(estados, idSala);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpGet]
        [Route("reporte/ranking/{estados}/{idSala}")]
        public IActionResult Report([FromRoute] int estados, [FromRoute] int idSala)
        {
            Response result = new();
            DataTable dt = new();
            string nombreArchivo = "Ranking_sala_" + idSala.ToString() + ".xls";

            string rutaArchivo = WC.GetRutaArchivo(_env, nombreArchivo, nombreCarpeta);
            if (System.IO.File.Exists(rutaArchivo))
            {
                System.IO.File.Delete(rutaArchivo);
            }            

            dt.Columns.Add("USUARIO", typeof(string));
            dt.Columns.Add("SALA", typeof(string));
            dt.Columns.Add("PUNTAJE", typeof(int));
            dt.Columns.Add("TIEMPO (ms)", typeof(int));
            dt.Columns.Add("FECHA", typeof(DateTime));

            Usuario_SalaList response = data.GetUsuario_SalaList(estados, idSala);

            if (response.Error == 0)
            {
                if (response.Lista.Count > 0)
                {
                    foreach (var item in response.Lista)
                    {
                        DataRow row = dt.NewRow();
                        row[0] = item.Usuario;
                        row[1] = item.Sala;
                        row[2] = item.Puntaje;
                        row[3] = item.Tiempo;
                        row[4] = item.FechaCreacion;
                        dt.Rows.Add(row);
                    }

                    HSSFWorkbook workbook = new();
                    ISheet hoja = workbook.CreateSheet("Ranking");
                    IRow headerRow = hoja.CreateRow(0);

                    for (int i = 0; i < dt.Columns.Count; i++)
                    {
                        headerRow.CreateCell(i).SetCellValue(dt.Columns[i].ColumnName);
                    }

                    for (int rowIndex = 0; rowIndex < dt.Rows.Count; rowIndex++)
                    {
                        IRow dataRow = hoja.CreateRow(rowIndex + 1);

                        for (int columnIndex = 0; columnIndex < dt.Columns.Count; columnIndex++)
                        {
                            dataRow.CreateCell(columnIndex).SetCellValue(dt.Rows[rowIndex][columnIndex].ToString());
                        }
                    }

                    //Aqui crea el archivo
                    FileStream fileStream = new(rutaArchivo, FileMode.Create);
                    workbook.Write(fileStream);

                    result.Info = nombreArchivo;
                    result.Error = 0;
                }
                else
                {
                    result.Info = "La lista esta vacia";
                    result.Error = 1;
                }
            }
            else
            {
                result.Info = response.Info;
                result.Error = 1;
            }

            return StatusCode(StatusCodes.Status200OK, new { result });
        }

        [HttpPost]
        [Route("create")]
        public IActionResult CreateItem([FromBody] Usuario_Sala usuario_sala)
        {
            Response result = data.CreateUsuario_Sala(usuario_sala);
            return StatusCode(StatusCodes.Status200OK, new { result });
        }        
    }
}
