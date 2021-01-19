<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleVenta.aspx.cs" Inherits="TPC_Juarez.DetalleVenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%Dominio.DetalleVenta item = detalleVenta%>
     <div class="card tarjeta-catalogo" style="width: 18rem;">
        <img src="<%=item.imagenURL %>" class="card-img-top align-content-center" alt="alternative-text" width="280" height="250">
        <h4 class="card-title">Nombre:<%= item.nombre %> <span class="badge badge-secondary"></span></h4>
        <h4 class="card-title">Categoria: <%= item.marca.nombre %></h4>
        <h4 class="card-title">Marca: <%= item.categoria.Nombre %></h4>
        <h4 class="card-title">Descripcion: <%= item.descripcion %></h4>
 
        <%--<p class="card-text">( <%= item.descripcion%> )</p>--%>
        <p class="card-text">Precio: $<%= item.precio %></p>
    </div>
</asp:Content>
