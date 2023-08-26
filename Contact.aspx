<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="ProyectoNoticiasNicolas.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main aria-labelledby="title">
        <h2 id="title"><%: Title %>.</h2>
        <h3>Ejemplo de pagina de contacto</h3>
        <address>
            Direccion<br />
            Redmond, WA 98052-6399<br />
            <abbr title="Phone">P:</abbr>
           +54 9 11-6005-4285

        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:nicolasdelponte2012@gmail.com">nicolasdelponte2012@gmail.com</a><br />
            <strong>Marketing:</strong> <a href="mailto:ndelponte@americavirtualsa.com">ndelponte@americavirtualsa.com</a>
        </address>
    </main>
</asp:Content>
