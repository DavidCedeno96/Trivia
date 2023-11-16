using System.Data.SqlClient;
using System.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;

namespace WebApiRest.Data
{
    public class UsuarioData
    {
        private readonly Conexion conexion = new();

        public UsuarioList GetUsuarioList(int estados)
        {
            UsuarioList list = new() {
                Lista = new()
            };
            
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_Usuario", sqlConnection)
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
                    list.Lista.Add(new Usuario()
                    {
                        IdUsuario = Convert.ToInt32(dr["IdUsuario"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Correo = dr["correo"].ToString(),   
                        Contrasena = dr["clave"].ToString(),
                        Rol = dr["rol"].ToString(),
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
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

        public UsuarioList GetUsuarioList(int estados, string buscar)
        {
            UsuarioList list = new()
            {
                Lista = new()
            };

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_UsuarioByAll", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure            
            };
            cmd.Parameters.AddWithValue("@buscar", WC.GetTrim(buscar));
            cmd.Parameters.AddWithValue("@estados", estados);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    list.Lista.Add(new Usuario()
                    {
                        IdUsuario = Convert.ToInt32(dr["IdUsuario"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Correo = dr["correo"].ToString(),
                        Contrasena = dr["clave"].ToString(),
                        Rol = dr["rol"].ToString(),
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
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

        public UsuarioItem GetUsuario(int estados, int idUsuario)
        {
            UsuarioItem item = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_UsuarioById", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@estados", estados);
            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    item.Usuario = new Usuario()
                    {
                        IdUsuario = Convert.ToInt32(dr["IdUsuario"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Correo = dr["correo"].ToString(),
                        Contrasena = dr["clave"].ToString(),
                        IdRol = Convert.ToInt16(dr["idRol"].ToString()),
                        Rol = dr["rol"].ToString(),
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString())
                    };
                }
                dr.NextResult();

                item.Info = cmd.Parameters["@info"].Value.ToString();
                item.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());
            }
            catch (Exception ex)
            {
                item.Info = ex.Message;
                item.Error = 1;
                item.Usuario = null;
            }
            finally
            {
                sqlConnection.Close();
            }

            return item;
        }        

        public UsuarioItem Login(Usuario usuario, int tipoLogin)
        {
            UsuarioItem item = new();
            
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_UsuarioLogin", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@nombre", WC.GetTrim(usuario.Nombre));            
            cmd.Parameters.AddWithValue("@clave", WC.GetTrim(usuario.Contrasena));
            cmd.Parameters.AddWithValue("@correo", WC.GetTrim(usuario.Correo));
            cmd.Parameters.AddWithValue("@tipoLogin", tipoLogin);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    item.Usuario = new Usuario()
                    {
                        IdUsuario = Convert.ToInt32(dr["idUsuario"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Correo = dr["correo"].ToString(),
                        IdRol = Convert.ToInt32(dr["idRol"].ToString()),
                        Rol = dr["rol"].ToString(),                        
                    };
                }
                dr.NextResult();

                item.Info = cmd.Parameters["@info"].Value.ToString();
                item.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());                
            }
            catch (Exception ex)
            {
                item.Info = ex.Message;
                item.Error = 1;
                item.Usuario = null;
            }
            finally
            {
                sqlConnection.Close();
            }

            return item;
        }

        public Response CreateUsuario (Usuario usuario)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_C_Usuario", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@nombre", WC.GetTrim(usuario.Nombre));            
            cmd.Parameters.AddWithValue("@clave", WC.GetTrim(usuario.Contrasena));
            cmd.Parameters.AddWithValue("@correo", WC.GetTrim(usuario.Correo));
            cmd.Parameters.AddWithValue("@idRol", usuario.IdRol);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                cmd.ExecuteNonQuery();

                string info = cmd.Parameters["@info"].Value.ToString();
                int error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

                response.Info = info.Split(',')[0];
                response.Error = error;
                if (info.Contains(','))
                {
                    response.Campo = WC.GetTrim(info.Split(',')[1]);
                }
                
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

        public Response UpdateUsuario(Usuario usuario)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_U_Usuario", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idUsuario", usuario.IdUsuario);
            cmd.Parameters.AddWithValue("@nombre", WC.GetTrim(usuario.Nombre));
            cmd.Parameters.AddWithValue("@clave", WC.GetTrim(usuario.Contrasena));
            cmd.Parameters.AddWithValue("@correo", WC.GetTrim(usuario.Correo));
            cmd.Parameters.AddWithValue("@idRol", usuario.IdRol);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                cmd.ExecuteNonQuery();
                
                string info = cmd.Parameters["@info"].Value.ToString();
                int error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());

                response.Info = info.Split(',')[0];
                response.Error = error;
                if (info.Contains(','))
                {
                    response.Campo = WC.GetTrim(info.Split(',')[1]);
                }

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

        public Response DeleteUsuario(int idUsuario)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_D_Usuario", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);            

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
