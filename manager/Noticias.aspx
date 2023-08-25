<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Noticias.aspx.cs" Inherits="ProyectoNoticiasNicolas.manager.Noticias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <section class="row" aria-labelledby="aspnetTitle">
            
                <div class="container-fluid">


        
        <div class="row col-md-3">
            <asp:DropDownList CssClass="form-select"  ID="dlCategorias" runat="server" AutoPostBack="true" OnSelectedIndexChanged="dlCategorias_SelectedIndexChanged"></asp:DropDownList>
        
        </div>

        <br />
       

        <div class="row col-md-4">
        <asp:Label ID="lblRegistros" runat="server" Text=""></asp:Label>

            
        </div>

        <div class="row col-md-2">
            <asp:Button ID="cmdNuevaNoticia" CssClass="btn btn-info" OnClick="cmdNuevaNoticia_Click" runat="server" Text="Agregar Noticia" />
        </div>
        <br />

        <div class="row">

            <div class="table-responsive">
            <asp:GridView ID="gvNoticias" CssClass="table table-striped table-hover table-bordered table-sm" runat="server" AutoGenerateColumns="False" EmptyDataText="No se encontraron registros" OnRowCommand="gvNoticias_RowCommand">
                <Columns>

                    <asp:BoundField DataField="id" HeaderText="Id" />

                    <asp:BoundField DataField="titulo" HeaderText="Título" />

                    <asp:BoundField DataField="categoria" HeaderText="Categoría" />

                    <asp:BoundField DataField="activo" HeaderText="Activo" />
                   
                    <asp:BoundField DataField="fecha" HeaderText="Fecha" DataFormatString="{0:dd-MM-yy}" />
                   



                    
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:Button ID="cmdEditarNoticia" runat="server" CssClass="btn btn-info" Text="Editar Noticia" CommandName="EDITAR" CommandArgument='<%#Eval("id") %>' />
                        </ItemTemplate>
                        
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:Button ID="cmdEliminarNoticia" runat="server" CssClass="btn btn-danger" Text="Eliminar Noticia" CommandName="ELIMINAR" CommandArgument='<%#Eval("id") %>' OnClientClick="return confirm('Está seguro que desea eliminar la noticia?');"  />
                        </ItemTemplate>
                        
                    </asp:TemplateField>



                </Columns>
                
            </asp:GridView>
            </div>



        </div>



    </div>

         

               
                
            </section>
</asp:Content>
