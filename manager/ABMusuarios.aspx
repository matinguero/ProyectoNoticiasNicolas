<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ABMusuarios.aspx.cs" Inherits="ProyectoNoticiasNicolas.manager.ABMusuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
     <asp:Label ID="Titulo" runat="server" Text="Label">Edicion de usuarios</asp:Label>
    <div>
    <asp:Label ID="Label1" runat="server" Text="Label">Nombre de usuario</asp:Label>
        <br>

    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    </div>

    <div>
    <asp:Label ID="Label2" runat="server" Text="Label">Apellido</asp:Label>
        <br>

    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
    </div>

    <div>
    <asp:Label ID="Label3" runat="server" Text="Label">Perfil</asp:Label>
        <br>

    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
    </div>

    <div>
    <asp:Label ID="Label4" runat="server" Text="Label">Fecha de alta</asp:Label>
        <br>

    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
    </div>

    <div>
        <br>

    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
    </div>

    <div>
    <asp:Label ID="Label6" runat="server" Text="Label">Email</asp:Label>
        <br>

    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
    </div>

    
     
     
     

</asp:Content>
