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
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!Utilidades.Utils.TieneAcceso("USUARIOS", int.Parse(Session["PERFIL_ID"].ToString())))
            {
                Utilidades.Utils.ShowAlertAjax(this.Page, "No tiene acceso a esta pagina", "default.aspx");
              
            }


            if (Page.IsPostBack == false)
            {
                CargarUsuarios((string)ViewState["sSort1"], (string)ViewState["sDirection1"]);
            }


        }

        void CargarUsuarios(string sSort, string sDirection)
        {
            string sRet = "";
            DataTable dt = new DataTable();
            sRet = Utilidades.datos.ObtenerUsuariosRegistrados(ref dt);

            if ((ViewState["sSort1"] == null))
            {
                ViewState["sSort1"] = "";
                sSort = "";
            }

            if ((ViewState["sDirection1"] == null))
            {
                ViewState["sDirection1"] = "";
                sDirection = "";
            }


            if (sRet == "")
            {

                DataView dv = new DataView();
                dv = dt.DefaultView;

                if (((sSort != "") && (sDirection != "")))
                {
                    dv.Sort = (sSort + (" " + sDirection));
                }




                gvUsuarios.DataSource = dv;
                gvUsuarios.DataBind();
                 
                lblRegistros.Text = "Hay " + dt.Rows.Count.ToString() + " usuarios.";
            }






        }

        protected void gvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsuarios.PageIndex = e.NewPageIndex;

            gvUsuarios.SelectedIndex = -1;
            //CargarUsuariosRegistrados((string)ViewState["sSort1"], (string)ViewState["sDirection1"]);
            CargarUsuarios((string)ViewState["sSort1"], (string)ViewState["sDirection1"]);
        }

        protected void gvUsuarios_Sorting(object sender, GridViewSortEventArgs e)
        {
            string sortExpression = e.SortExpression;
            ViewState["sSort1"] = sortExpression.ToString();
            string sortDirection = Convert.ToString(ViewState["sDirection1"]);


            Utilidades.datos.SortGridView(ref sortExpression, ref sortDirection);
            ViewState["sSort1"] = sortExpression.ToString();
            ViewState["sDirection1"] = sortDirection.ToString();

            CargarUsuarios((string)ViewState["sSort1"], (string)ViewState["sDirection1"]);
        }

        protected void gvUsuarios_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "EDITAR")
            {
                Response.Redirect("ABMusuarios?id=" + e.CommandArgument.ToString());
            }

            if(e.CommandName == "ELIMINAR")
            {
                string sRetorno = "";
                sRetorno = datos.EliminarUsuario(Convert.ToInt32(e.CommandArgument.ToString()));

                if (sRetorno == "")
                {
                    Utils.ShowAlertAjax(this.Page, "Usuario eliminado exitosamente", "");

                }
                else
                {
                    Utils.ShowAlertAjax(this.Page, "Error al eliminar: " + sRetorno, "");
                }

                CargarUsuarios((string)ViewState["sSort1"], (string)ViewState["sDirection1"]);
            }

        }

        protected void BtnNuevoUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("ABMusuarios?id=0");
        }
    }
}