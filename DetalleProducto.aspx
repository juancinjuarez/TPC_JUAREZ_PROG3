<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleProducto.aspx.cs" Inherits="TPC_Juarez.DetalleProducto" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <%Dominio.Produ producto%>
    <div class="col-sm-4">
        <div class="card">
            <img src="<%=producto.imagenURL %>" class="card-img-top align-content-center" alt="alternative-text" width="280" height="250">
            <div class="card-body">
                <h4 class="card-title">Nombre:<%= producto.nombre %> <span class="badge badge-secondary"></span></h4>
                <h4 class="card-title">Categoria: <%= producto.marca.nombre %></h4>
                <h4 class="card-title">Marca: <%= producto.categoria.Nombre %></h4>
                <h4 class="card-title">Descripcion: <%= producto.descripcion %></h4>

                <%--<p class="card-text">( <%= item.descripcion%> )</p>--%>
                <p class="card-text">Precio: $<%= producto.precio %></p>

            </div>
        </div>
    </div>
</asp:Content>

