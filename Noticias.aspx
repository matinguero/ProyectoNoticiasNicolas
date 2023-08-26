  <%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Noticias.aspx.cs" Inherits="ProyectoNoticiasNicolas.Noticias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <main>
        <section class="row" aria-labelledby="aspnetTitle">
            
                <div class="container-fluid">


        
        <div class="row col-md-3">
            <asp:DropDownList ID="ddlCategorias" AutoPostBack="true" OnSelectedIndexChanged="ddlCategorias_SelectedIndexChanged" CssClass="form-select" runat="server"></asp:DropDownList>
        </div>

        <br />
       

        <div class="row col-md-4">
        <asp:Label ID="lblRegistros" runat="server" Text=""></asp:Label>
        </div>
        <br />

        <div class="row">

            <div class="table-responsive">
                <asp:GridView ID="gvNoticias" Visible="false" CssClass="table table-striped table-hover table-bordered table-sm" runat="server" AutoGenerateColumns="False" EmptyDataText="No se encontraron registros" AllowSorting="true" OnSorting="gvNoticias_Sorting"  > 
                <Columns>

                     <asp:BoundField DataField="id" HeaderText="Id de Noticia" SortExpression="id" />

                    <asp:BoundField DataField="titulo" HeaderText="Título" SortExpression="titulo" />

                    <asp:BoundField DataField="categoria" HeaderText="Categoría" SortExpression="categoria" />
                   
                    <asp:BoundField DataField="fecha" HeaderText="Fecha" DataFormatString="{0:D}" SortExpression="date" />
                   
                    <%--<asp:BoundField DataField="fecha" HeaderText="Fecha" DataFormatString="{0:dd/MM/yyyy}" />--%>
                   
                   <asp:TemplateField HeaderText="Imagen">
                        <ItemTemplate>
                            <asp:Image Width="100" ID="Image1" ImageUrl='<%# "uploads/" + Eval("imagen") %>' runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Ver detalle">
                        <ItemTemplate>
                            <asp:HyperLink ID="hlnkDetalle" NavigateUrl='<%#"DetalleNoticia?id=" + Eval("id") %>'  runat="server">>>></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                   






                </Columns>
                
            </asp:GridView>





            </div>
              

                                                                                                                                                                                                                                                                                                                                    
        </div>



    </div>
                <div>
              <asp:DataList ID="DataList1" runat="server" RepeatColumns="3" RepeatDirection="Vertical" RepeatLayout="Table">
                  <ItemTemplate>


                     <div class="card" style="width: 18rem;">
                      <img src='<%# "uploads/" + Eval("imagen") %>' class="card-img-top" alt='<%# Eval("titulo") %>'>
                      <div class="card-body">

                         <h5 class="card-title">
                            <asp:Label ID="lblTitulo" runat="server" Text='<%# Eval("titulo") %>'></asp:Label>
                        </h5>  
                        <p class="card-text">
                            <asp:Label ID="lblcopete" runat="server" Text='<%# Eval("copete") %>'></asp:Label>
                        </p>
                      
                           <asp:HyperLink Cssclass="btn boton-Login" ID="hlnkDetalle" NavigateUrl='<%#"DetalleNoticia?id=" + Eval("id") %>'  runat="server">Ver detalle</asp:HyperLink>
                     </div>
                    </div>
                  
                  
                  </ItemTemplate>
              </asp:DataList>
          </div>
                
            </section>
    </main>
</asp:Content>
