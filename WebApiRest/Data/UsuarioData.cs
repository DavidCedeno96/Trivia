using System.Data.SqlClient;
using System.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;
using Microsoft.OpenApi.Validations;
using System.Text;
using Microsoft.AspNetCore.DataProtection;
using System.Security.Claims;

namespace WebApiRest.Data
{
    public class UsuarioData
    {
        private readonly Conexion conexion = new();

        public UsuarioList GetUsuarioList(int estados)
        {
            UsuarioList usuarioList = new();
            List<Usuario> lista = new();
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
                    lista.Add(new Usuario()
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

                usuarioList.Info = WC.GetSatisfactorio();
                usuarioList.Error = 0;
                usuarioList.Lista = lista;
            }
            catch (Exception ex)
            {
                usuarioList.Info = ex.Message;
                usuarioList.Error = 1;
                usuarioList.Lista = null;
            }
            finally
            {
                sqlConnection.Close();
            }

            return usuarioList;
        }

        public UsuarioList Login(Usuario usuario)
        {
            UsuarioList usuarioList = new();
            List<Usuario> lista = new();
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_UsuarioLogin", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@correo", usuario.Correo);
            cmd.Parameters.AddWithValue("@clave", usuario.Contrasena);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    lista.Add(new Usuario()
                    {
                        IdUsuario = Convert.ToInt32(dr["idUsuario"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Correo = dr["correo"].ToString(),
                        IdRol = Convert.ToInt32(dr["idRol"].ToString()),
                        Rol = dr["rol"].ToString(),                        
                    });
                }
                dr.NextResult();

                usuarioList.Info = cmd.Parameters["@info"].Value.ToString();
                usuarioList.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());                
                usuarioList.Lista = lista;
            }
            catch (Exception ex)
            {
                usuarioList.Info = ex.Message;
                usuarioList.Error = 1;
                usuarioList.Lista = null;
            }
            finally
            {
                sqlConnection.Close();
            }

            return usuarioList;
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
            cmd.Parameters.AddWithValue("@correo", WC.GetTrim(usuario.Correo));
            cmd.Parameters.AddWithValue("@clave", WC.GetTrim(usuario.Contrasena));
            cmd.Parameters.AddWithValue("@idRol", usuario.IdRol);

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
