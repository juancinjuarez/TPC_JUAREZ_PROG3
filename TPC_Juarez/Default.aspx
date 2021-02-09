<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Juarez._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--<%--<%--<%--<%--  <<%--section class="container-section-articulos">
        <div class="row">
            <div class="container">
                <article class="card-columns">
                    <%foreach (dominio.produ item in listaprodu)
                        {%>
                    <div class="card tarjeta-catalogo" style="width: 18rem;">
                        <img src="<%=item.imagenurl %>" class="card-img-top align-content-center" alt="alternative-text" width="280" height="250">
                        <h4 class="card-title"><%= item.nombre %> <span class="badge badge-secondary">nuevo</span></h4>
                        <p class="card-text"><%= item.marca.nombre %></p>
                        <p class="card-text"><%= item.categoria.nombre %></p>
                        <p class="card-text"><%= item.idprodu %></p>
                        <%--<p class="card-text">( <%= item.descripcion%> )</p>--%>
    <%--<p class="card-text">$<%= item.precio %></p>
                        <a href="carrito.aspx?idproducto=<%= item.idprodu%>" class="btn btn-primary">comprar</a>
                        <a href="detalleproducto.aspx?iddetalle=<%= item.idprodu %>" class="btn btn-primary">detalles</a>--%>
    <%--  <% }%>--%>
    <%--</div>
                </article>
            </div>
        </div>
    </section>--%>
    <div class="container">
        <div class="card-columns">

            <div class="card text-center border-info">
                <div class="card-body">
                    <%foreach (Dominio.Produ item in listaProdu)
                        {%>
                    <div class="card tarjeta-catalogo" style="width: 18rem;">
                        <img src="<%=item.imagenURL %>" class="card-img-top align-content-center" alt="alternative-text" width="280" height="250">
                        <h4 class="card-title"><%= item.nombre %> <span class="badge badge-secondary">Nuevo</span></h4>
                        <p class="card-text"><%= item.marca.nombre %></p>
                        <p class="card-text"><%= item.categoria.Nombre %></p>
                        <p class="card-text"><%= item.idProdu %></p>
                        <%--<p class="card-text">( <%= item.descripcion%> )</p>--%>
                        <p class="card-text">$<%= item.precio %></p>
                        <a href="Carrito.aspx?idProducto=<%= item.idProdu%>" class="btn btn-primary">Comprar</a>
                        <a href="DetalleProducto.aspx?idDetalle=<%= item.idProdu %>" class="btn btn-primary">Detalles</a>
                        <% }%>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</asp:Content>
