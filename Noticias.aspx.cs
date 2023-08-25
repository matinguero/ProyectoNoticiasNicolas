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
                CargarNoticias();
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

            
            void CargarNoticias()
            {
                string sRet = "";
                DataTable dt = new DataTable();
                sRet = Utilidades.datos.ObtenerNoticias(1, int.Parse(ddlCategorias.SelectedValue), ref dt);


                if (sRet == "")
                {

                DataView dv = new DataView();
                dv = dt.DefaultView;



                    gvNoticias.DataSource = dt;
                    gvNoticias.DataBind();
                DataList1.DataSource = dt;
                DataList1.DataBind();

                lblRegistros.Text = "Hay " + dt.Rows.Count.ToString() + " noticias para la categoría seleccionada";
                }






            }

            protected void ddlCategorias_SelectedIndexChanged(object sender, EventArgs e)
            {
                CargarNoticias();
            }

        protected void gvNoticias_Sorting(object sender, GridViewSortEventArgs e)
        {
        }
    }

    }
