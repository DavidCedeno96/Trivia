using System.Data.SqlClient;
using System.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;

namespace WebApiRest.Data {
    public class OpcionData {

        private readonly Conexion conexion = new();

        public OpcionList GetOpcionList(int estados, int idPregunta)
        {
            OpcionList list = new()
            {
                Lista = new()
            };
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_OpcionByIdPregunta", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@idPregunta", idPregunta);
            cmd.Parameters.AddWithValue("@estados", estados);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    list.Lista.Add(new Opcion()
                    {
                        IdOpcion = Convert.ToInt32(dr["idOpcion"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Correcta = Convert.ToInt32(dr["correcta"].ToString()),
                        IdPregunta = Convert.ToInt32(dr["idPregunta"].ToString()),                                                
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString())
                    });
                }
                dr.NextResult();

                list.Info = cmd.Parameters["@info"].Value.ToString();
                list.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

            }
            catch (Exception ex)
            {
                list.Info = ex.Message;
                list.Error = 1;
                list.Lista = null;
            }
            finally
            {
                sqlConnection.Close();
            }

            return list;
        }

        public Response CreateOpcion(Opcion opcion) {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_C_Opcion", sqlConnection) {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@nombre", WC.GetTrim(opcion.Nombre));
            cmd.Parameters.AddWithValue("@correcta", opcion.Correcta);
            cmd.Parameters.AddWithValue("@idPregunta", opcion.IdPregunta);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try {
                sqlConnection.Open();
                cmd.ExecuteNonQuery();

                response.Info = cmd.Parameters["@info"].Value.ToString();
                response.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

            } catch (Exception ex) {
                response.Info = ex.Message;
                response.Error = 1;
            } finally {
                sqlConnection.Close();
            }

            return response;
        }

        public Response UpdateOpcion(Opcion opcion)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_U_Opcion", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idOpcion", opcion.IdOpcion);
            cmd.Parameters.AddWithValue("@nombre", WC.GetTrim(opcion.Nombre));
            cmd.Parameters.AddWithValue("@correcta", opcion.Correcta);            

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
