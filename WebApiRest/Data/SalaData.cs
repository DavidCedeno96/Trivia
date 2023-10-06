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


        public SalaItem GetSala(int estados, int idSala)
        {
            SalaItem salaItem = new();
            Sala item = new();
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_SalaById", sqlConnection)
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
                    item = new Sala()
                    {
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Imagen = dr["imagen"].ToString(),
                        Descripcion = dr["descripcion"].ToString(),
                        IdModoJuego = Convert.ToInt32(dr["idModoJuego"].ToString()),
                        ModoJuego = dr["modoJuego"].ToString(),
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString())
                    };                    
                }
                dr.NextResult();

                salaItem.Info = cmd.Parameters["@info"].Value.ToString();
                salaItem.Error = Convert.ToInt16(cmd.Parameters["@error"].Value.ToString());                
                salaItem.Sala = item;
            }
            catch (Exception ex)
            {
                salaItem.Info = ex.Message;
                salaItem.Error = 1;
                salaItem.Sala = null;
            }
            finally
            {
                sqlConnection.Close();
            }

            return salaItem;
        }

        public Response CreateSala(Sala sala)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_C_Sala", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@nombre", WC.GetTrim(sala.Nombre));
            cmd.Parameters.AddWithValue("@imagen", WC.GetTrim(sala.Imagen));
            cmd.Parameters.AddWithValue("@descripcion", WC.GetTrim(sala.Descripcion));
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

        public Response UpdateSala(Sala sala)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_U_Sala", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idSala", sala.IdSala);
            cmd.Parameters.AddWithValue("@nombre", WC.GetTrim(sala.Nombre));
            cmd.Parameters.AddWithValue("@imagen", WC.GetTrim(sala.Imagen));
            cmd.Parameters.AddWithValue("@descripcion", WC.GetTrim(sala.Descripcion));
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
