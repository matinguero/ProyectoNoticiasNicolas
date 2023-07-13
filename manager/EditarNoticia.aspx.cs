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

        String sFolderUploads = "uploads";
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
                    CargarNoticia(int.Parse(ViewState["id"].ToString()));
                }


            }
            void CargarNoticia(int iIdNoticia)
            {
                string sRet = "";
                DataTable dt = new DataTable();
                sRet = Utilidades.datos.ObtenerNoticia(iIdNoticia, ref dt);
                if (sRet=="")
                {
                    if (dt.Rows.Count == 1)
                    {
                        txtTitulo.Text = dt.Rows[0]["titulo"].ToString();

                        txtCopete.Text = dt.Rows[0]["copete"].ToString();

                        txtTexto.Text = dt.Rows[0]["texto"].ToString();

                        txtFecha.Text = Convert.ToDateTime(dt.Rows[0]["fecha"]).ToString("yyyy-MM-dd");

                        if (dt.Rows[0]["activo"].ToString()== "0")
                        {
                            chkActivo.Checked = false;
                        }
                        else
                        {
                            chkActivo.Checked = true;
                        }

                        ddlCategoria.SelectedValue = dt.Rows[0]["categoria_id"].ToString();

                        imgFoto.ImageUrl = "../uploads/" + dt.Rows[0]["imagen"].ToString();

                        hNombreFoto.Value = dt.Rows[0]["imagen"].ToString();

                        //TODO: TERMINAR IMAGEN
                    }
                    else
                    {
                        Utils.ShowAlertAjax(this.Page, "No se encontro la noticia", "noticias");

                    }
                }

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
            string sRetornoValidar = "";
            sRetornoValidar = ValidarFormulario();

            if (sRetornoValidar != "")
            {
                Utils.ShowAlertAjax(this.Page, sRetornoValidar, "");
                return;
            }

            string sFileName = "";
            
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

                if( fuFotoNoticia.HasFile)
                {
                    sFileName = System.Guid.NewGuid().ToString() + ".jpg";
                    SubirFoto(sFileName);

                }

                sRetorno = datos.InsertarNoticia(txtTitulo.Text.Trim(), txtCopete.Text.Trim(), txtTexto.Text.Trim(), iActivo, int.Parse(ddlCategoria.SelectedValue.ToString()), sFileName);
              
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



                string sRetorno = "";

                int iActivo = 0;
                
                if (chkActivo.Checked)
                {
                    iActivo = 1; 
                }

                if (hNombreFoto.Value != "")
                {
                     sFileName = hNombreFoto.Value.ToString();
                }

                if(fuFotoNoticia.HasFile)
                {
                     if(sFileName !="")
                    {
                        try
                        {
                            System.IO.File.Delete(HttpContext.Current.Server.MapPath("/") + sFolderUploads + "/" + sFileName);
                        }
                        catch(Exception ex) 
                        { 
                            
                        }

                    }
                     sFileName = System.Guid.NewGuid().ToString() + ".jpg";
                    SubirFoto(sFileName);

                }

                sRetorno = datos.ModificarNoticia(int.Parse(ViewState["id"].ToString()),txtTitulo.Text.Trim(), txtCopete.Text.Trim(),txtTexto.Text.Trim(), iActivo, int.Parse(ddlCategoria.SelectedValue.ToString()));
                if (sRetorno == "")
                {
                    Utils.ShowAlertAjax(this.Page, "Noticia Insertada correctamente", "Noticias");
                  
                }
                else
                {
                    Utils.ShowAlertAjax(this.Page, "Error al insertar la noticia: " + sRetorno, "");
                }
                Response.Redirect("Noticias");


            }


        }
        string ValidarFormulario()
        {


            string sRet = "";

            if (txtTitulo.Text.Trim() == "")
            {
                sRet += "Debe completar el título";
            }

            if (txtCopete.Text.Trim() == "")
            {
                sRet += "Debe completar el copete";
            }

            if (ViewState["MODO"].ToString() == "I")
            {
                if (fuFotoNoticia.HasFile)
                {
                    if (System.IO.Path.GetExtension(fuFotoNoticia.FileName.ToString().ToUpper()) != ".JPG")
                    {
                        sRet += "el archivo debe ser un JPG!";
                    }

                }
                else
                {
                    sRet += "Debe subir una foto!";
                }
            }



            return sRet;
        }


        void SubirFoto(string sFileName)
        {
            if (fuFotoNoticia.HasFile)
            {
                if (System.IO.Path.GetExtension(fuFotoNoticia.FileName.ToString().ToUpper()) == ".JPG")
                {



                    fuFotoNoticia.PostedFile.SaveAs(HttpContext.Current.Server.MapPath("/") + sFolderUploads + "/" + sFileName);

                    //imgFoto.ImageUrl = "../uploads/" + sFileName;
                }
                else
                {
                    Utils.ShowAlertAjax(this.Page, "El archivo no es JPG", "");
                }
            }
            else
            {
                Utils.ShowAlertAjax(this.Page, "No subiste archivo", "");
            }
        }
          






    }
}