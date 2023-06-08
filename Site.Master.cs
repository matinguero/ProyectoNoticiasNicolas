using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoNoticiasNicolas
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USUARIO_ID"] is null)
            {
                lblBienvenida.Text = "Usuario sin autenticar";

            }
            else
            {
                lblBienvenida.Text = Session["NOMBRE_USUARIO"].ToString() + " (" + Session["PERFIL"] + ")";
            }
        }
    }
}