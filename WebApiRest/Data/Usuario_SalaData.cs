using System.Data.SqlClient;
using System.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;

namespace WebApiRest.Data
{
    public class Usuario_SalaData
    {
        private readonly Conexion conexion = new();

        public Usuario_SalaList GetUsuario_SalaList(int estados)
        {
            Usuario_SalaList list = new()
            {
                Lista = new()
            };
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_Usuario_Sala", sqlConnection)
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
                    list.Lista.Add(new Usuario_Sala()
                    {
                        Usuario = dr["usuario"].ToString(),
                        Dpi = dr["clave"].ToString(),
                        Correo = dr["correo"].ToString(),
                        Rol = dr["rol"].ToString(),
                        Sala = dr["sala"].ToString(),                        
                        Descripcion = dr["descripcion"].ToString(),
                        Puntaje = Convert.ToInt32(dr["puntaje"].ToString()),
                        Tiempo = Convert.ToInt32(dr["tiempo"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString())
                    });
                }

                list.Info = WC.GetSatisfactorio();
                list.Error = 0;

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

        public Usuario_SalaList GetUsuario_SalaList(int estados, int idSala)
        {
            Usuario_SalaList list = new()
            {
                Lista = new()
            };
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_Usuario_SalaByIdSala", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@idSala", idSala);
            cmd.Parameters.AddWithValue("@estados", estados);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    list.Lista.Add(new Usuario_Sala()
                    {
                        Usuario = dr["usuario"].ToString(),
                        Dpi = dr["clave"].ToString(),
                        Correo = dr["correo"].ToString(),
                        Rol = dr["rol"].ToString(),
                        Sala = dr["sala"].ToString(),                        
                        Puntaje = Convert.ToInt32(dr["puntaje"].ToString()),                        
                        Tiempo = Convert.ToInt32(dr["tiempo"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString())
                    });
                }

                list.Info = WC.GetSatisfactorio();
                list.Error = 0;

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

        public Response CreateUsuario_Sala(Usuario_Sala usuario_sala)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_C_Usuario_Sala", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idUsuario", usuario_sala.IdUsuario);
            cmd.Parameters.AddWithValue("@idSala", usuario_sala.IdSala);
            cmd.Parameters.AddWithValue("@puntaje", usuario_sala.Puntaje);
            cmd.Parameters.AddWithValue("@tiempo", usuario_sala.Tiempo);            

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

        public Response DeleteUsuario_Sala(int idSala)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_D_Usuario_Sala", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idSala", idSala);            

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
