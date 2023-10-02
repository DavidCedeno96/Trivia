using System.Data;
using System.Data.SqlClient; // instalar => System.Data.SqlClient
using WebApiRest.Models;
using WebApiRest.Utilities;



namespace WebApiRest.Data
{
    public class RolData
    {
        private readonly Conexion conexion = new();

        public RolList GetRolList(int estados)
        {
            RolList rolList = new();
            List<Rol> lista = new();
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_Rol", sqlConnection)
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
                    lista.Add(new Rol()
                    {
                        IdRol = Convert.ToInt32(dr["idRol"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString())
                    });
                }

                rolList.Info = WC.GetSatisfactorio();
                rolList.Error = 0;
                rolList.Lista = lista;
            }           
            catch (Exception ex)
            {
                rolList.Info = ex.Message;
                rolList.Error = 1;
                rolList.Lista = null;
            }
            finally
            {
                sqlConnection.Close();
            }

            return rolList;
        }
    }
}
