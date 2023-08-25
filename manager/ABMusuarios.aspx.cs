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
    public partial class ABMusuarios : System.Web.UI.Page
    {
        //TODO: CREAR REGISTRO USUARIO

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                if (!string.IsNullOrEmpty(Request.QueryString["id"]))
                {
                    ViewState["id"] = Request.QueryString["id"];
                }


                CargarPerfiles();


                if (ViewState["id"].ToString() == "0")
                {
                    //INSERT
                    ViewState["MODO"] = "I";
                }
                else
                {
                    //UPDATE
                    ViewState["MODO"] = "U";
                    CargarUsuario(int.Parse(ViewState["id"].ToString()));
                }


            }
        }
        void CargarUsuario(int iId)
        {
            string sRet = "";
            DataTable dt = new DataTable();
            sRet = Utilidades.datos.ObtenerUsuario(int.Parse(ViewState["id"].ToString()), ref dt);


            if (sRet == "")
            {

                if (dt.Rows.Count != 0)
                {
                    txtMail.Text = dt.Rows[0]["email"].ToString();

                    txtNombre.Text = dt.Rows[0]["nombre"].ToString();

                    txtApellido.Text = dt.Rows[0]["apellido"].ToString();

                    txtClave.Text = dt.Rows[0]["clave"].ToString();

                    txtFecha.Text = dt.Rows[0]["fechaAlta"].ToString();

                    ddlPerfil.SelectedValue = dt.Rows[0]["perfil_id"].ToString();

                }
                else
                {
                    //lblIdNoticia.Text = "No se encontró Usuario";
                    Utils.ShowAlertAjax(this.Page, "No se encontró el Usuario", "Usuarios");
                }
            }
        }

        protected void cmdEnviar_Click(object sender, EventArgs e)
        {

            string sRetornoValidar = "";
            sRetornoValidar = ValidarFormulario();

            if (sRetornoValidar != "")
            {
                Utils.ShowAlertAjax(this.Page, sRetornoValidar, "");
                return;
            }

            if (ViewState["MODO"].ToString() == "I")
            {
                //INSERT
                //Utils.ShowAlertAjax(this.Page, "ES UN INSERT", "");

                string sRetorno = "";


                sRetorno = datos.InsertarUsuario(txtNombre.Text.Trim(), txtApellido.Text.Trim(), txtClave.Text.Trim(), txtMail.Text.Trim(), txtFecha.Text.Trim(), int.Parse(ddlPerfil.SelectedValue.ToString()));

                if (sRetorno == "")
                {
                    Utils.ShowAlertAjax(this.Page, "Usuario Insertado correctamente", "Usuarios");
                    return;
                }
                else
                {
                    Utils.ShowAlertAjax(this.Page, "Error al insertar el Usuario: " + sRetorno, "");
                }



            }
            if (ViewState["MODO"].ToString() == "U")
            {
                //UPDATE
                //Utils.ShowAlertAjax(this.Page, "ES UN UPDATE", "");

                string sRetorno = "";



                sRetorno = datos.ModificarUsuario(txtMail.Text.Trim(), txtClave.Text.Trim(), txtNombre.Text.Trim(), txtApellido.Text.Trim(), int.Parse(ddlPerfil.SelectedValue.ToString()), int.Parse(ViewState["id"].ToString()));

                if (sRetorno == "")
                {
                    Utils.ShowAlertAjax(this.Page, "Usuario Actualizado correctamente", "Usuarios");
                }
                else
                {
                    Utils.ShowAlertAjax(this.Page, "Error al actualizar el Usuario: " + sRetorno, "");
                }
            }
            string ValidarFormulario()
            {
                string sRet = "";

                if (txtNombre.Text.Trim() == "")
                {
                    sRet += "Debe completar el nombre";
                }

                if (txtApellido.Text.Trim() == "")
                {
                    sRet += "Debe completar el apellido";
                }
                if (txtMail.Text.Trim() == "")
                {
                    sRet += "Debe completar el email";
                }
                if (txtClave.Text.Trim() == "")
                {
                    sRet += "Debe completar la clave";
                }
                if (txtFecha.Text.Trim() == "")
                {
                    sRet += "Debe completar la fecha";
                }

                return sRet;
            }
        }





        void CargarPerfiles()
        {
            string sRet = "";
            DataTable dt = new DataTable();
            sRet = Utilidades.datos.ObtenerPerfiles(ref dt);

            ddlPerfil.DataValueField = "id";
            ddlPerfil.DataTextField = "Perfil";


            ddlPerfil.DataSource = dt;
            ddlPerfil.DataBind();
        }
    }
} 