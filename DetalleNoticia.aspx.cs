using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoNoticiasNicolas
{
    public partial class DetalleNoticia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(Request.QueryString["id"]))
            {
                ObtenerNoticia(int.Parse(Request.QueryString["id"]));
            }

        }
        /// <summary>
        /// metodo que obtiene notiica
        /// </summary>
        /// <param name="id">el id de la noticia a traer</param>

        void ObtenerNoticia(int id)
        {
            string sRet = "";
            DataTable dt = new DataTable();
            sRet = Utilidades.datos.ObtenerNoticia(id, ref dt);


            if (sRet == "")
            {
                if(dt.Rows.Count == 1)
                {
                    lblTitulo.Text = dt.Rows[0]["Titulo"].ToString();
                    lblcopete.Text = dt.Rows[0]["copete"].ToString();
                    lblcategoria.Text = dt.Rows[0]["categoria"].ToString();
                }
                else
                {
                    lblTitulo.Text = "No se encontro la noticia";
                }
            }
        }
    }
}