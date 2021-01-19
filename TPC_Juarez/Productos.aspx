<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Productos.aspx.cs" Inherits="TPC_Juarez.Productos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <section class="Container-section-articulos">
        <div class="row">
            <div class="col-sm-12">
                <article class="card-columns">
                    <%foreach (Dominio.Producto item in listaProductos)
                        {%>
                    <div class="card tarjeta-catalogo" style="width: 18rem;">
                        <img src="<%=item.imagenURL %>" class="card-img-top align-content-center" alt="alternative-text" width="280" height="250">
                        <h4 class="card-title"><%= item.nombre %> <span class="badge badge-secondary">Nuevo</span></h4>
                        <p class="card-text"><%= item.marca.nombre %></p>
                        <p class="card-text">( <%= item.categoria.Nombre %> )</p>
                        <%--<p class="card-text">( <%= item.descripcion%> )</p>--%>
                        <p class="card-text">$<%= item.precio %></p>
                    <% }%>
                    </div>
                </article>
            </div>
        </div>
    </section>
</asp:Content>
