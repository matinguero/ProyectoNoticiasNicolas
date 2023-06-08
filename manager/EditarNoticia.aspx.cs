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
    public partial class EditarNoticia : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ///TODO: HACER EL UPDATE
            if (!Page.IsPostBack)
            {

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    ViewState["id"] = Request.QueryString["id"];
                }


                CargarCategoriasNoticia();


                if (ViewState["id"].ToString() == "0")
                {
                    //INSERT
                    ViewState["MODO"] = "I";
                }
                else
                {
                    //UPDATE
                    ViewState["MODO"] = "U";
                    CargarNoticia();
                }


            }
            void CargarNoticia()
            {
                //CARGAR DATOS DE LA BASE DE DATOS

            }

            void CargarCategoriasNoticia()
            {
                string sRet = "";
                DataTable dt = new DataTable();
                sRet = Utilidades.datos.ObtenerCategoriasNoticias(ref dt);

                ddlCategoria.DataTextField = "categoria";
                ddlCategoria.DataValueField = "id";

                ddlCategoria.DataSource = dt;
                ddlCategoria.DataBind();






            }


            
        }
        protected void cmdEnviar_Click(object sender, EventArgs e)
        {
            if (ViewState["MODO"].ToString() == "I")
            {
                //INSERT
                //Utils.ShowAlertAjax(this.Page, "ES UN INSERT", "");

                string sRetorno = "";

                int iActivo = 0;
                if (chkActivo.Checked)
                {
                    iActivo = 1;
                }

                sRetorno = datos.InsertarNoticia(txtTitulo.Text.Trim(), txtCopete.Text.Trim(), txtTexto.Text.Trim(), iActivo, int.Parse(ddlCategoria.SelectedValue.ToString()));

                if (sRetorno == "")
                {
                    Utils.ShowAlertAjax(this.Page, "Noticia Insertada correctamente", "Noticias");
                }
                else
                {
                    Utils.ShowAlertAjax(this.Page, "Error al insertar la noticia: " + sRetorno, "");
                }



            }

            if (ViewState["MODO"].ToString() == "U")
            {
                //UPDATE
                //Utils.ShowAlertAjax(this.Page, "ES UN UPDATE", "");
            }


        }
    }
}