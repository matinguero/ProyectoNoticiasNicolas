using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoNoticiasNicolas
{
    public partial class Noticias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarCategoriasNoticia();
            }
            else
            {

                //COMENTARIO
                //Response.Write(ddlCategorias.SelectedValue);
                //Response.Write("<br>");
                //Response.Write(ddlCategorias.SelectedItem.ToString());
            }
        }
        void CargarCategoriasNoticia()
        {
            string sRet = "";
            DataTable dt = new DataTable();
            sRet = Utilidades.datos.ObtenerCategoriasNoticias(ref dt);


            if (sRet == "")
            {
                ddlCategorias.DataTextField = "categoria";
                ddlCategorias.DataValueField = "id";

                ddlCategorias.DataSource = dt;
                ddlCategorias.DataBind();


                //AGREGO UN ITEM A MANO, MAS, PARA MOSTRAR TODAS LAS CATEGORIAS
                ListItem li = new ListItem();
                li.Text = "Todas las categorías";
                li.Value = "-1";
                li.Selected = true;
                ddlCategorias.Items.Insert(0, li);


            }
            else
            {
                Response.Write(sRet);
            }









        }

    }
}