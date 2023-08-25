<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABMusuarios.aspx.cs" Inherits="ProyectoNoticiasNicolas.manager.ABMusuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      
                <br />
       
            <div class="row">
                <div class="col-md-4">
                    Perfil: <asp:DropDownList ID="ddlPerfil" runat="server"  CssClass="form-select"  >
                    
                           </asp:DropDownList>
                      </div>
        
            </div>
            <br />

               <div class="row">
                <div class=" mb-3">

                   <asp:TextBox ID="txtNombre" CssClass="form-control" placeholder="Nombre" runat="server" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Falta Nombre"  ControlToValidate="txtNombre" Display="Static" SetFocusOnError="True"  CssClass="center-block text-center"></asp:RequiredFieldValidator>
            
            </div>
                </div>
                   <br />
                   <div class= "row">               <div class="mb-3">
                    <asp:TextBox ID="txtApellido" CssClass="form-control" placeholder="Apellido" runat="server" ></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta Apellido"  ControlToValidate="txtApellido" Display="Static" SetFocusOnError="True"  CssClass="center-block text-center"></asp:RequiredFieldValidator>
                </div>
       
            </div>
            <br />

            <div class="row">
                <div class="mb-3">
                     <asp:TextBox ID="txtMail"  CssClass="form-control" placeholder="Mail" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta Mail"  ControlToValidate="txtMail" Display="Static" SetFocusOnError="True"  CssClass="center-block text-center"></asp:RequiredFieldValidator>
                      </div>
        
            </div>
            <br />

            <div class="row">
                <div class="mb-3">
                     <asp:TextBox ID="txtClave"  TextMode="Password" placeholder="Clave" CssClass="form-control" runat="server"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Falta Clave"  ControlToValidate="txtClave" Display="Static" SetFocusOnError="True"  CssClass="center-block text-center"></asp:RequiredFieldValidator>
           </div>
                </div>
                 <br />

     <div class="form-group">
            <asp:TextBox ID="txtFecha" TextMode="Date" Cssclass="form-control" placeholder="Fecha" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Falta Fecha"  ControlToValidate="txtFecha" Display="Static" SetFocusOnError="True"  CssClass="center-block text-center"></asp:RequiredFieldValidator>
        </div>
                <br /> 

          
                    <div class="btn-group" role="group">

                        <asp:Button ID="cmdEnviar" CssClass="btn btn-info" runat="server" Text="Guardar Usuario" OnClick="cmdEnviar_Click"  />

                    </div>
</asp:Content>
