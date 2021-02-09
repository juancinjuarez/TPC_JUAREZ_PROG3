<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="TPC_Juarez.Administrator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Admin</title>
</head>
<body>
    <form id="form1" runat="server">
        <section class="Container-section-articulos">
            <div class="row">
                <div class="col-sm-12">
                    <article class="card-columns">
                        <%foreach (Dominio.Produ item in listaProdus)
                            {%>
                        <div class="card tarjeta-catalogo" style="width: 18rem;">
                            <img src="<%=item.imagenURL %>" class="card-img-top align-content-center" alt="alternative-text" width="280" height="250" />
                            <h4 class="card-title"><%= item.nombre %> <span class="badge badge-secondary">Nuevo</span></h4>
                            <p class="card-text"><%= item.marca.nombre %></p>
                            <p class="card-text"><%= item.categoria.Nombre %></p>
                            <p class="card-text"><%= item.idProdu %></p>
                            <%--<p class="card-text">( <%= item.descripcion%> )</p>--%>
                            <p class="card-text">$<%= item.precio %></p>
                            <a href="ModificarProducto.aspx?idProducto=<%= item.idProdu%>" class="btn btn-primary">Modificar Producto</a>
                            <a href="EliminarProducto.aspx?idDetalle=<%= item.idProdu %>" class="btn btn-primary">Eliminar Producto</a>
                            <% }%>
                        </div>
                    </article>
                </div>
            </div>
        </section>
        <a style="text-align:center;" href="AltaProducto.aspx?idAlta" class="btn btn-primary">Alta Producto</a> 
        <a style="text-align:center;" href="Default.aspx" class="btn btn-primary">Salir</a>

        <%--<div class="form-group">
            <h2 style="text-align: center; color: mediumspringgreen; background: darkcyan;">¡Bienvenido administrador!</h2>
            <%foreach (Dominio.Produ item in listaProdus)
                {%>
       
            <div class="col" style="margin-left: 20px;">
                <a href="ModificarIntermedia.aspx?idModProdu" class="btn btn-primary">Modificar Producto</a>
                <a href="EliminarProducto.aspx?idBajaProdu" class="btn btn-primary">Baja Producto</a>
            </div>
            <div class="col" style="margin-left: 20px; margin-top: 20px;">
                <a href="AltaMarca.aspx?idAltaMarca" class="btn btn-primary">Alta Marca</a>
                <a href="ModificarMarca.aspx?idModMarca" class="btn btn-primary">Modificar Marca</a>
                <a href="EliminarMarca.aspx?idBajaMarca" class="btn btn-primary">Baja Marca</a>
            </div>
            <div class="col" style="margin-left: 20px; margin-top: 20px;">
                <a href="AltaCategoria.aspx?idAltaCat" class="btn btn-primary">Alta Categoria</a>
                <a href="ModificarCategoria.aspx?idModCat" class="btn btn-primary">Modificar Categoria</a>
                <a href="EliminarCategoria.aspx?idBajaCat" class="btn btn-primary">Baja Categoria</a>
            </div>
            <%} %>
        </div>--%>
    </form>
</body>
</html>
