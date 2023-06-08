<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCNavegacion.ascx.cs" Inherits="ProyectoNoticiasNicolas.UCNavegacion" %>
<nav class="navbar navbar-expand-sm navbar-toggleable-sm navbar-dark bg-dark">
            <div class="container">
                <a class="navbar-brand" runat="server" href="~/">Nombre de la aplicación</a>
                <button type="button" class="navbar-toggler" data-bs-toggle="collapse" data-bs-target=".navbar-collapse" title="Alternar navegación" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse d-sm-inline-flex justify-content-between">
                    <ul class="navbar-nav flex-grow-1">
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/">Inicio</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/About">Acerca de</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Contact">Contacto</a></li>
                         <li class="nav-item"><a class="nav-link" runat="server" href="~/manager/Login">Login</a></li>
                        <li class="nav-item"><a class="nav-link" runat="server" href="~/Noticias">Noticias</a></li>


                        <asp:PlaceHolder ID="plcManager" runat="server">

              <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown" aria-expanded="false">Administración</a>
                <ul class="dropdown-menu">

                   

                     <asp:PlaceHolder ID="plcUsuarios" runat="server">
                        <li class="nav-item"><a class="dropdown-item" runat="server" href="~/manager/Usuarios">Usuarios</a></li>
                    </asp:PlaceHolder>

                  <li class="nav-item"><a class="dropdown-item" runat="server" href="~/manager/Noticias">Noticias</a></li>
                   
                </ul>
              </li>

                <li class="nav-item"><asp:LinkButton CssClass="nav-link" ID="lnkSalir" runat="server" OnClick="lnkSalir_Click" OnClientClick="return confirm('Esta seguro que desea salir?');">Salir</asp:LinkButton></li>
        </asp:PlaceHolder>
                    </ul>
                </div>
            </div>
        </nav>