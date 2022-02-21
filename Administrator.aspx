<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Administrator.aspx.cs" Inherits="TPC_Juarez.Administrator" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous" />
    <title>Admin</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">¡Bienvenido administrador!</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="administrator.aspx">Inicio</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Altas
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="AltaProducto.aspx?idAlta">Alta de producto</a></li>
                            <li><a class="dropdown-item" href="AltaCategoria.aspx?idAlta">Alta de categoria</a></li>
                            <li><a class="dropdown-item" href="AltaMarca.aspx">Alta de marca</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-bs-toggle="dropdown" aria-expanded="false">Bajas
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="EliminarProducto.aspx?idAlta">Baja de producto</a></li>
                            <li><a class="dropdown-item" href="EliminarCategoria.aspx?idAlta">Baja de categoria</a></li>
                            <li><a class="dropdown-item" href="EliminarMarca.aspx">Baja de marca</a></li>
                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown3" role="button" data-bs-toggle="dropdown" aria-expanded="false">Ventas
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="VentaRealizada.aspx">Ventas realizadas</a></li>
                            <li><a class="dropdown-item" href="VentaPendiente.aspx">Ventas en camino</a></li>
                            <li><a class="dropdown-item" href="VentaEntregada.aspx">Ventas entregadas</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <form id="form1" runat="server">
        <div class="container" style="margin-top: 15px;">
            <div class="row">
                <%foreach (Dominio.Produ item in listaProdus)
                    {%>
                <div class="col-lg-4">
                    <div class="card" style="margin-top: 15px">
                        <div class="header">
                            <img src="<%=item.imagenURL %>" class="card-img-top align-content-center" alt="alternative-text" width="280" height="250" />
                        </div>
                        <div class="card-body">
                            <h4 class="card-title"><%= item.nombre %> <span class="badge badge-secondary">Nuevo</span></h4>
                            <p class="card-text">Marca: <%= item.marca.nombre %></p>
                            <p class="card-text">Categoria: <%= item.categoria.Nombre %></p>
                            <p class="card-text">Código de producto: <%= item.idProdu %></p>
                            <p class="card-text">Stock: <%= item.stock%></p>
                            <p class="card-text">$<%= item.precio %></p>
                            <a href="ModificarProducto.aspx?idProducto=<%= item.idProdu%>" class="btn btn-primary">Modificar Producto</a>
                        </div>
                    </div>
                </div>
                <% }%>
            </div>
        </div>
        <div style="margin-top:15px;margin-bottom:15px; text-align:center;">
            <asp:Button runat="server" ID="salirAdmin" OnClick="salirAdmin_Click" Text="Cerrar Sesión" CssClass="btn btn-danger" />
        </div>
    </form>
</body>
</html>
