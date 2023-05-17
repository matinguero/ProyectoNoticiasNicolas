<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoNoticiasNicolas.manager.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <main>
        <div class="divflex">
        <h1>Titulo del login</h1>
            <p class="texto">Usuario</p>
            <input class="inputpass" type="email" placeholder="mail@ejemplo.com" />
           
            <p class="texto">Contraseña</p>
            <input class="inputpass" type="password" placeholder="Contraseña"/>
            </div>
            <button class="boton-login" type="submit">
                Login
            </button>
    </main>
</asp:Content>
