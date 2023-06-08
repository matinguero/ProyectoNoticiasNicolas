using ProyectoNoticiasNicolas.Utilidades;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoNoticiasNicolas.manager
{
    public partial class Noticias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                //CARGO CATEGORIAS
                CargarCategoriasNoticia();
                CargarNoticias();
            }

        }
        void CargarCategoriasNoticia()
        {
            string sRet = "";
            DataTable dt = new DataTable();
            sRet = Utilidades.datos.ObtenerCategoriasNoticias(ref dt);

            dlCategorias.DataTextField = "categoria";
            dlCategorias.DataValueField = "id";

            dlCategorias.DataSource = dt;
            dlCategorias.DataBind();


            //AGREGO UN ITEM A MANO, MAS, PARA MOSTRAR TODAS LAS CATEGORIAS
            ListItem li = new ListItem();
            li.Text = "Todas las categorías";
            li.Value = "-1";
            li.Selected = true;
            dlCategorias.Items.Insert(0, li);





        }


        void CargarNoticias()
        {
            string sRet = "";
            DataTable dt = new DataTable();
            sRet = Utilidades.datos.ObtenerNoticias(-1, int.Parse(dlCategorias.SelectedValue), ref dt);


            if (sRet == "")
            {
                gvNoticias.DataSource = dt;
                gvNoticias.DataBind();

                lblRegistros.Text = "Hay " + dt.Rows.Count.ToString() + " noticias para la categoría seleccionada";
            }






        }

        protected void dlCategorias_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarNoticias();
        }

        protected void gvNoticias_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EDITAR")
            {
                Utils.ShowAlertAjax(this.Page, "HICIERON CLICK EN EDITAR EN LA NOTICIA: " + e.CommandArgument.ToString(), "");
            }

            if (e.CommandName == "ELIMINAR")
            {
                ///TODO: Acá eliminamos noticias

                string sRetorno = "";
                sRetorno = datos.EliminarNoticia(Convert.ToInt32(e.CommandArgument.ToString()));

                if (sRetorno == "")
                {
                    Utils.ShowAlertAjax(this.Page, "Noticia eliminada exitosamente", "");

                }
                else
                {
                    Utils.ShowAlertAjax(this.Page, "Error al borrar: " + sRetorno, "");
                }

                CargarNoticias();
            }
        }

        protected void cmdNuevaNoticia_Click(object sender, EventArgs e)
        {
            //Utils.ShowAlertAjax(this.Page, "HICIERON CLICK NUEVA NOTICIA", "");
            Response.Redirect("EditarNoticia?id=0");
        }

        protected void cmdEditarNoticia_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditarNoticia?id=0");
        }
    }
}