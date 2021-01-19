<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Juarez._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <section class="Container-section-articulos">
        <div class="row">
            <div class="col-sm-12">
                <article class="card-columns">
                    <%foreach (Dominio.Producto item in listaProducto)
                        {%>
                    <div class="card tarjeta-catalogo" style="width: 18rem;">
                        <img src="<%=item.imagenURL %>" class="card-img-top align-content-center" alt="alternative-text" width="280" height="250">
                        <h4 class="card-title"><%= item.nombre %> <span class="badge badge-secondary">Nuevo</span></h4>
                        <p class="card-text"><%= item.marca.nombre %></p>
                        <p class="card-text"><%= item.categoria.Nombre %></p>
                        <p class="card-text"><%= item.id %></p>
                        <%--<p class="card-text">( <%= item.descripcion%> )</p>--%>
                        <p class="card-text">$<%= item.precio %></p>
                        <a href="Carrito.aspx?idProducto=<%= item.id.ToString()%>" class="btn btn-primary">Comprar</a>
                        <a href="DetalleProducto.aspx?idDetalle=<%= item.id.ToString()%>" class="btn btn-primary">Detalles</a>
                    <% }%>
                    </div>
                </article>
            </div>
        </div>
    </section>
</asp:Content>
