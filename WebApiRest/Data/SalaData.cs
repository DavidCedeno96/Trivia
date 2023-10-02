using System.Data.SqlClient;
using System.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;

namespace WebApiRest.Data
{
    public class SalaData
    {
        private readonly Conexion conexion = new();

        public SalaList GetSalaList(int estados)
        {
            SalaList salaList = new();
            List<Sala> lista = new();
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_Sala", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@estados", estados);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lista.Add(new Sala()
                    {
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),
                        Nombre = dr["nombre"].ToString(),                        
                        Imagen = dr["imagen"].ToString(),
                        Descripcion = dr["descripcion"].ToString(),
                        ModoJuego = dr["modoJuego"].ToString(),
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString())
                    });
                }

                salaList.Info = WC.GetSatisfactorio();
                salaList.Error = 0;
                salaList.Lista = lista;
            }
            catch (Exception ex)
            {
                salaList.Info = ex.Message;
                salaList.Error = 1;
                salaList.Lista = null;
            }
            finally
            {
                sqlConnection.Close();
            }

            return salaList;
        }

        public Response CreateSala(Sala sala)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_C_Sala", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@nombre", sala.Nombre);
            cmd.Parameters.AddWithValue("@imagen", sala.Imagen);
            cmd.Parameters.AddWithValue("@descripcion", sala.Descripcion);
            cmd.Parameters.AddWithValue("@idModoJuego", sala.IdModoJuego);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                cmd.ExecuteNonQuery();

                response.Info = cmd.Parameters["@info"].Value.ToString();
                response.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

            }
            catch (Exception ex)
            {
                response.Info = ex.Message;
                response.Error = 1;
            }
            finally
            {
                sqlConnection.Close();
            }

            return response;

        }
    }
}
