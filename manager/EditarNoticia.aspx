 <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditarNoticia.aspx.cs" Inherits="ProyectoNoticiasNicolas.manager.EditarNoticia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="container-fluid">


        <div class="panel panel-primary">

         <div class="panel-heading">
            <h3 class="panel-title">Edición de Noticias</h3>
        </div>



        <div class="panel-body">
         <div class="form-horizontal">



  <div class="col-md-4"></div>
         
  <div class="col-md-8">

      <asp:HiddenField ID="HiddenField1" runat="server" />

        <div class="form-group">
            <asp:TextBox ID="txtTitulo" class="form-control" placeholder="Título" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Falta Nombre"  ControlToValidate="txtTitulo" Display="Static" SetFocusOnError="True" CssClass="center-block text-center"></asp:RequiredFieldValidator>

       </div>

          <div class="form-group">
            <asp:TextBox ID="txtCopete" class="form-control" placeholder="Copete" TextMode="MultiLine" Rows="3" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Falta Copete"  ControlToValidate="txtCopete" Display="Static" SetFocusOnError="True" CssClass="center-block text-center"></asp:RequiredFieldValidator>

       </div>

              <div class="form-group">
              <asp:TextBox ID="txtTexto" class="form-control" TextMode="MultiLine" Rows="5" placeholder="Texto" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Falta Texto"  ControlToValidate="txtTexto" Display="Static" SetFocusOnError="True"  CssClass="center-block text-center"></asp:RequiredFieldValidator>
         </div>
     
            <div class="form-group">
            <asp:TextBox ID="txtFecha" TextMode="Date" Cssclass="form-control" placeholder="Fecha" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Falta Fecha"  ControlToValidate="txtFecha" Display="Static" SetFocusOnError="True"  CssClass="center-block text-center"></asp:RequiredFieldValidator>
        </div>
      <div class="form-group">
          Activo?
          <asp:CheckBox ID="chkActivo" runat="server" />

      
      </div>

      <div class="form-group">
          Subir Foto
          <br />
          <asp:Image ID="imgFoto" runat="server" />
          <br />
          <asp:FileUpload ID="fuFotoNoticia" runat="server" />
          <asp:HiddenField ID="hNombreFoto" runat="server" />
      
      </div>

       <div class="form-group">
           Categoría
    <asp:DropDownList ID="ddlCategoria" cssClass="form-select" runat="server">
       

    </asp:DropDownList>

    </div>
    

     

    </div>
    
     
   
       
<br /> 
<br />

       <div class="form-group">

          
            <div class="btn-group" role="group">

                <asp:Button ID="cmdEnviar" CssClass="btn btn-info" runat="server" Text="Guardar Noticia" OnClick="cmdEnviar_Click"  />

                           </div>

        </div>

      </div>



             </div>
        </div>
   </div>

</asp:Content>
