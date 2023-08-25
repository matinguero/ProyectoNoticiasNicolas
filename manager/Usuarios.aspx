<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="ProyectoNoticiasNicolas.manager.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    ADMIN USUARIOS
    
    <div class="row col-md-12">
       <h2>USUARIOS</h2>
            
        </div>

    <div class="row col-md-4">
        <asp:Label ID="lblRegistros" runat="server" Text=""></asp:Label>
         
        </div>
     <div class="row">

            <div class="table-responsive">
            <asp:GridView ID="gvUsuarios" CssClass="table table-striped table-hover table-bordered table-sm" runat="server" AutoGenerateColumns="False" EmptyDataText="No se encontraron registros" PageSize="10" AllowPaging="true" OnPageIndexChanging="gvUsuarios_PageIndexChanging" PagerSettings-Mode="Numeric" AllowSorting="true" OnSorting="gvUsuarios_Sorting" OnRowCommand="gvUsuarios_RowCommand">
                <Columns>

                    <asp:BoundField DataField="id" HeaderText="Id" SortExpression="id" />

                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" SortExpression="nombre" />

                    <asp:BoundField DataField="Apellido" HeaderText="Apellido" SortExpression="apellido" />

                    <asp:BoundField DataField="Perfil" HeaderText="Perfil" SortExpression="perfil_id" />
                   
                    
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:Button ID="cmdEditarUsuario" runat="server" CssClass="btn btn-info" Text="Editar Usuario" CommandName="EDITAR" CommandArgument='<%#Eval("id") %>'  />
                        </ItemTemplate>
                        
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Eliminar">
                        <ItemTemplate>
                            <asp:Button ID="cmdEliminarUsuario" runat="server" CssClass="btn btn-danger" Text="Eliminar Usuario" CommandName="ELIMINAR" CommandArgument='<%#Eval("id") %>' OnClientClick="return confirm('Está seguro que desea eliminar el usuario?');"  />
                        </ItemTemplate>
                        
                    </asp:TemplateField>



                </Columns>
                
            </asp:GridView>
            </div>



        </div>
</asp:Content>
