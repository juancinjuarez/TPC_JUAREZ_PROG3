<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="TPC_Juarez._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div id="carouselExampleControls" class="carousel slide carousel-fade" data-bs-ride="carousel" style="margin-top:15px;">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="Imagenes/imagen1.jpg" class="d-block w-100" alt="..." style="width:900px; height:300px;">
            </div>
            <div class="carousel-item">
                <img src="Imagenes/imagen2.jfif" class="d-block w-100" alt="..." style="width:900px; height:300px;">
            </div>
            <div class="carousel-item">
                <img src="Imagenes/imagen3.jfif" class="d-block w-100" alt="..." style="width:900px; height:300px;">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <img src="https://woodandsteel.taylorguitars.com/wp-content/uploads/2020/08/AD-Group-Details0006-1-1200x800.jpg" style="width:300px; height:300px; border-radius:150px; margin-top:15px; margin-right:20px;"/>
    <img src="https://resources.claroshop.com/medios-plazavip/mkt/5f07c0c4b68d8_1jpg.jpg?scale=350" style="width: 300px; height: 300px; border-radius:150px; margin-top:15px;margin-right:20px;"/>
    <img src="https://promocionmusical.es/wp-content/uploads/2017/12/fender_bass_wallpaper_001.jpg" style="width:300px; height:300px; border-radius:150px;margin-top:15px;"/>
<div class="container" style="margin-top:15px">
    <div class="row-fluid">
        <%foreach (Dominio.Produ item in listaProdu)
            {%>
        <div class="col-sm-4" style="margin-top:15px">
            <div class="card">
                <img src="<%=item.imagenURL %>" class="card-img-top align-content-center" alt="alternative-text" width="280" height="250">
                <div class="card-body">
                    <h4 class="card-title"><%= item.nombre %> <span class="badge badge-secondary">Nuevo</span></h4>
                    <p class="card-text"><%= item.marca.nombre %></p>
                    <p class="card-text"><%= item.categoria.Nombre %></p>
                    <p class="card-text" style="display: none"><%= item.idProdu %></p>
                    <p class="card-text">$<%= item.precio %></p>
                    <a href="Carrito.aspx?idProducto=<%= item.idProdu%>" class="btn btn-primary">Comprar</a>
                    <a href="DetalleProducto.aspx?idDetalle=<%= item.idProdu %>" class="btn btn-primary">Detalles</a>
                </div>
            </div>
        </div>
        <% }%>
    </div>
</div>
</asp:Content>

