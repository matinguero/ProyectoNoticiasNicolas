using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace ProyectoNoticiasNicolas.Utilidades
{
    public class datos
    {

        #region "Categorias"


        public static string ObtenerCategoriasNoticias(ref DataTable dt)
        {
            SqlConnection MyConnection = default(SqlConnection);
            SqlDataAdapter MyDataAdapter = default(SqlDataAdapter);

            try
            {
                MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString);
                MyDataAdapter = new SqlDataAdapter("SPCategorias", MyConnection);
                MyDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


                //dt = new DataTable();
                MyDataAdapter.Fill(dt);
                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        #endregion

        #region "Noticias"

        public static string ObtenerNoticias(int iActivoId, int iCategoria, ref DataTable dt)
        {
            SqlConnection MyConnection = default(SqlConnection);
            SqlDataAdapter MyDataAdapter = default(SqlDataAdapter);

            try
            {
                MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString);
                MyDataAdapter = new SqlDataAdapter("SPNoticias", MyConnection);
                MyDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


                MyDataAdapter.SelectCommand.Parameters.Add("@activo", SqlDbType.Int);
                MyDataAdapter.SelectCommand.Parameters["@activo"].Value = iActivoId;

                MyDataAdapter.SelectCommand.Parameters.Add("@categoria_id", SqlDbType.Int);
                MyDataAdapter.SelectCommand.Parameters["@categoria_id"].Value = iCategoria;


                dt = new DataTable();
                MyDataAdapter.Fill(dt);
                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }


        public static string ObtenerNoticia(int id, ref DataTable dt)
        {
            SqlConnection MyConnection = default(SqlConnection);
            SqlDataAdapter MyDataAdapter = default(SqlDataAdapter);

            try
            {
                MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString);
                MyDataAdapter = new SqlDataAdapter("SPNoticia", MyConnection);
                MyDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


                MyDataAdapter.SelectCommand.Parameters.Add("@id", SqlDbType.Int);
                MyDataAdapter.SelectCommand.Parameters["@id"].Value = id;



                dt = new DataTable();
                MyDataAdapter.Fill(dt);
                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }

        public static string EliminarNoticia(int iId)
        {
            SqlConnection MyConnection = default(SqlConnection);
            SqlCommand MyCommand = default(SqlCommand);

            try
            {
                MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString);
                MyCommand = new SqlCommand("spEliminarN", MyConnection);
                MyCommand.CommandType = CommandType.StoredProcedure;

                //AGREGO EL PARAMETRO CON EL VALOR DEL PARAMETRO AL COMANDO
                MyCommand.Parameters.AddWithValue("@Vid", iId);

                //ACCIONES A MANO
                MyConnection.Open(); //ABRO CONEXION
                MyCommand.ExecuteNonQuery(); //EJECUTO COMANDO
                MyConnection.Close(); //CIERRO CONEXION
                MyConnection.Dispose(); //DESCARTO CONEXION

                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        public static string InsertarNoticia(string sTitulo, string sCopete, string sTexto, int iActivo, int icategoria_id)
        {
            SqlConnection MyConnection = default(SqlConnection);
            SqlCommand MyCommand = default(SqlCommand);

            try
            {
                MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString);
                MyCommand = new SqlCommand("spInsertN", MyConnection);
                MyCommand.CommandType = CommandType.StoredProcedure;

                //AGREGO EL PARAMETRO CON EL VALOR DEL PARAMETRO AL COMANDO
                MyCommand.Parameters.AddWithValue("@vTitulo", sTitulo);
                MyCommand.Parameters.AddWithValue("@vcopete", sCopete);

                MyCommand.Parameters.AddWithValue("@vtexto", sTexto);
                MyCommand.Parameters.AddWithValue("@activo", iActivo);

                MyCommand.Parameters.AddWithValue("@vcategoria", icategoria_id);

                MyCommand.Parameters.AddWithValue("@fecha", DBNull.Value);

                //ACCIONES A MANO
                MyConnection.Open(); //ABRO CONEXION
                MyCommand.ExecuteNonQuery(); //EJECUTO COMANDO
                MyConnection.Close(); //CIERRO CONEXION
                MyConnection.Dispose(); //DESCARTO CONEXION

                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }
        public static string ModificarNoticia(int iId, string sTitulo, string sCopete, string sTexto, int iActivo, int icategoria_id)
        {
            SqlConnection MyConnection = default(SqlConnection);
            SqlCommand MyCommand = default(SqlCommand);

            try
            {
                MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString);
                MyCommand = new SqlCommand("SPUNoticia", MyConnection);
                MyCommand.CommandType = CommandType.StoredProcedure;

                //AGREGO EL PARAMETRO CON EL VALOR DEL PARAMETRO AL COMANDO

                MyCommand.Parameters.AddWithValue("@VId", iId);

                MyCommand.Parameters.AddWithValue("@VTitulo", sTitulo);
                MyCommand.Parameters.AddWithValue("@VCopete", sCopete);

                MyCommand.Parameters.AddWithValue("@VTexto", sTexto);
                MyCommand.Parameters.AddWithValue("@VBool", iActivo);

                MyCommand.Parameters.AddWithValue("@VCategoria", icategoria_id);

                MyCommand.Parameters.AddWithValue("@fecha", DBNull.Value);

                //ACCIONES A MANO
                MyConnection.Open(); //ABRO CONEXION
                MyCommand.ExecuteNonQuery(); //EJECUTO COMANDO
                MyConnection.Close(); //CIERRO CONEXION
                MyConnection.Dispose(); //DESCARTO CONEXION

                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }

        }

        #endregion

        #region "Usuarios"
        public static string LoginUsuario(string sUsuario, string sClave, ref DataTable dt)
        {
            SqlConnection MyConnection = default(SqlConnection);
            SqlDataAdapter MyDataAdapter = default(SqlDataAdapter);

            try
            {
                MyConnection = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionStringSQL"].ConnectionString);
                MyDataAdapter = new SqlDataAdapter("spLogin", MyConnection);
                MyDataAdapter.SelectCommand.CommandType = CommandType.StoredProcedure;


                MyDataAdapter.SelectCommand.Parameters.Add("@usuario", SqlDbType.VarChar, 50);
                MyDataAdapter.SelectCommand.Parameters["@usuario"].Value = sUsuario;

                MyDataAdapter.SelectCommand.Parameters.Add("@clave", SqlDbType.VarChar, 50);
                MyDataAdapter.SelectCommand.Parameters["@clave"].Value = sClave;



                dt = new DataTable();
                MyDataAdapter.Fill(dt);
                return "";
            }
            catch (Exception ex)
            {
                return ex.Message;
            }
        }
        #endregion
    }
}