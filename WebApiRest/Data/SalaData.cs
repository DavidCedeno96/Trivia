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
            SalaList list = new() {
                Lista = new()
            };

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
                    list.Lista.Add(new Sala()
                    {
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),
                        Nombre = dr["nombre"].ToString(),                        
                        Imagen = dr["imagen"].ToString(),
                        Descripcion = dr["descripcion"].ToString(),
                        ModoJuego = dr["modoJuego"].ToString(),
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
                        TotalPreguntas = Convert.ToInt32(dr["totalPreguntas"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString()),
                        FechaActivacion = Convert.ToDateTime(dr["fecha_activacion"].ToString())
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

        public SalaList GetSalaList(int estados, string buscar)
        {
            SalaList list = new()
            {
                Lista = new()
            };

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_SalaByAll", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@buscar", buscar);
            cmd.Parameters.AddWithValue("@estados", estados);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    list.Lista.Add(new Sala()
                    {
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Imagen = dr["imagen"].ToString(),
                        Descripcion = dr["descripcion"].ToString(),
                        ModoJuego = dr["modoJuego"].ToString(),
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
                        TotalPreguntas = Convert.ToInt32(dr["totalPreguntas"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString()),
                        FechaActivacion = Convert.ToDateTime(dr["fecha_activacion"].ToString())
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


        public SalaItem GetSala(int estados, int idSala, int idUsuario)
        {
            SalaItem item = new();
            
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_SalaById", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@idSala", idSala);
            cmd.Parameters.AddWithValue("@idUsuario", idUsuario);
            cmd.Parameters.AddWithValue("@estados", estados);            

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    item.Sala = new Sala()
                    {
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Imagen = dr["imagen"].ToString(),
                        Descripcion = dr["descripcion"].ToString(),
                        IdModoJuego = Convert.ToInt32(dr["idModoJuego"].ToString()),
                        ModoJuego = dr["modoJuego"].ToString(),
                        Estado = Convert.ToInt16(dr["estado"].ToString()),
                        TotalPreguntas = Convert.ToInt32(dr["totalPreguntas"].ToString()),
                        CantJugadas = Convert.ToInt32(dr["cantJugadas"].ToString()),
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString()),
                        FechaActivacion = Convert.ToDateTime(dr["fecha_activacion"].ToString())
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
                item.Sala = null;
            }
            finally
            {
                sqlConnection.Close();
            }

            return item;
        }

        public SalaList GetSalaRecienteList(int estados, int idUsuario)
        {
            SalaList list = new()
            {
                Lista = new()
            };

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_SalaReciente", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@estados", estados);
            cmd.Parameters.AddWithValue("@idJugador", idUsuario);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    list.Lista.Add(new Sala()
                    {
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),
                        Nombre = dr["nombre"].ToString(),
                        Imagen = dr["imagen"].ToString(),
                        Descripcion = dr["descripcion"].ToString(),
                        ModoJuego = dr["modoJuego"].ToString(),
                        Estado = Convert.ToInt16(dr["estado"].ToString()),                        
                        FechaCreacion = Convert.ToDateTime(dr["fecha_creacion"].ToString()),
                        FechaModificacion = Convert.ToDateTime(dr["fecha_modificacion"].ToString()),
                        FechaActivacion = Convert.ToDateTime(dr["fecha_activacion"].ToString())
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

        public Response CreateSalaReciente(SalaReciente salaReciente)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_C_SalaReciente", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idSala", salaReciente.IdSala);
            cmd.Parameters.AddWithValue("@idJugador", salaReciente.IdUsuario);

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

        public Response UpdateSalaEstado(Sala sala) 
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_U_SalaByEstado", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            
            cmd.Parameters.AddWithValue("@idSala", sala.IdSala);
            cmd.Parameters.AddWithValue("@estado", sala.Estado);            

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

        public Response DeleteSala(int idSala) {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_D_Sala", sqlConnection) {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idSala", idSala);            

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

    }
}
