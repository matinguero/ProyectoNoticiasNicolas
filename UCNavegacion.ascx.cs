using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProyectoNoticiasNicolas
{
    public partial class UCNavegacion : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (System.Web.HttpContext.Current.User.Identity.IsAuthenticated)

            {
                plcManager.Visible = true;
                if (Session["PERFIL_ID"] != null)
                {

                    if (int.Parse(Session["PERFIL_ID"].ToString()) != 1)
                    {
                        plcUsuarios.Visible = false;
                    }
                }
            }

            else
            {
                plcManager.Visible = false;
            }
        }
        protected void lnkSalir_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Redirect("/Default");
        }


    }
}