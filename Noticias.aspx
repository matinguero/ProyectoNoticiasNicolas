<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Noticias.aspx.cs" Inherits="ProyectoNoticiasNicolas.Noticias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            
                <div class="container-fluid">


        
        <div class="row col-md-3">
            <asp:DropDownList ID="ddlCategorias" AutoPostBack="true" CssClass="form-select" runat="server"></asp:DropDownList>
        </div>

        <br />
       

        <div class="row col-md-4">
        <asp:Label ID="lblRegistros" runat="server" Text=""></asp:Label>
        </div>
        <br />

        <div class="row">

            <div class="table-responsive">
            <asp:GridView ID="gvNoticias" CssClass="table table-striped table-hover table-bordered table-sm" runat="server" AutoGenerateColumns="False" EmptyDataText="No se encontraron registros">
                <Columns>


                    <asp:BoundField DataField="titulo" HeaderText="Título" />

                    <asp:BoundField DataField="categoria" HeaderText="Categoría" />
                   
                    <asp:BoundField DataField="fecha" HeaderText="Fecha" DataFormatString="{0:D}" />
                   






                </Columns>
                
            </asp:GridView>
            </div>



        </div>



    </div>
               
                
            </section>
    </main>
</asp:Content>
