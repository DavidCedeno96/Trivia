﻿using System.Data.SqlClient;
using System.Data;
using WebApiRest.Models;
using WebApiRest.Utilities;
using Microsoft.Extensions.Options;

namespace WebApiRest.Data
{
    public class JuegoChallengerData
    {
        private readonly Conexion conexion = new();

        public JuegoChallengerList GetJuegoChallengerList(int idSala, int idJugador)
        {
            JuegoChallengerList list = new()
            {
                Lista = new()
            };
            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());

            SqlCommand cmd = new("sp_B_JuegoChallenger", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@idSala", idSala);
            cmd.Parameters.AddWithValue("@idJugador", idJugador);

            cmd.Parameters.Add("@info", SqlDbType.VarChar, int.MaxValue).Direction = ParameterDirection.Output;
            cmd.Parameters.Add("@error", SqlDbType.Int).Direction = ParameterDirection.Output;

            try
            {
                sqlConnection.Open();
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    list.Lista.Add(new JuegoChallenger()
                    {
                        IdSala = Convert.ToInt32(dr["idSala"].ToString()),
                        IdJugador = Convert.ToInt32(dr["idJugador"].ToString()),
                        Iniciales = dr["iniciales"].ToString(),
                        Posicion = Convert.ToInt32(dr["posicion"].ToString()),                        
                    });
                }
                dr.NextResult();

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

        public Response CreateJuegoChallenger(JuegoChallenger juego)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_C_JuegoChallenger", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idSala", juego.IdSala);
            cmd.Parameters.AddWithValue("@idJugador", juego.IdJugador);
            cmd.Parameters.AddWithValue("@iniciales", WC.GetTrim(juego.Iniciales));

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

        public Response UpdateJuegoChallenger(JuegoChallenger juego)
        {
            Response response = new();

            SqlConnection sqlConnection = new(conexion.GetConnectionSqlServer());
            SqlCommand cmd = new("sp_U_JuegoChallenger", sqlConnection)
            {
                CommandType = CommandType.StoredProcedure
            };

            cmd.Parameters.AddWithValue("@idSala", juego.IdSala);
            cmd.Parameters.AddWithValue("@idJugador", juego.IdJugador);

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