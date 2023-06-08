<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoNoticiasNicolas.manager.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <main>
         <asp:Label ID="lblMensajeError" runat="server" Text=""></asp:Label>

        <div class="divflex">
        <h1>Titulo del login</h1>
            <p class="texto">Usuario</p>
            <asp:TextBox ID="txtUsuario" TextMode="Email" runat="server" Class="inputpass"></asp:TextBox>
                    
           
            <p class="texto">Contraseña</p>
            <asp:TextBox ID="txtClave" TextMode="Password" runat="server"  Class="inputpass"></asp:TextBox>
            </div>

         <div class="">
                    <asp:Button ID="cmdLogin" class="boton-login" runat="server" Text="Ingresar"  OnClick="cmdLogin_Click"/>
                </div>
           
    </main>
</asp:Content>
