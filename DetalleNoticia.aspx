<%@ Page Title="Detalle de una noticia" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleNoticia.aspx.cs" Inherits="ProyectoNoticiasNicolas.DetalleNoticia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Aca vamos a ver el detalle de una noticia.</h3>
       
           <h1>  <asp:Label ID="lblTitulo" runat="server" Text="Label"></asp:Label></h1>
          <h1>   <asp:Label ID="lblcopete" runat="server" Text="Label"></asp:Label></h1>
         <h1>    <asp:Label ID="lblcategoria" runat="server" Text="Label"></asp:Label></h1>
            
        
    </main>
</asp:Content>
