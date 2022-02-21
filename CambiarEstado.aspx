<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CambiarEstado.aspx.cs" Inherits="TPC_Juarez.CambiarEstado" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title></title>
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
                            <li><a class="dropdown-item" href="VentaRealizada.aspx">Ventas pendientes</a></li>
                            <li><a class="dropdown-item" href="VentaPendiente.aspx">Ventas en camino</a></li>
                            <li><a class="dropdown-item" href="VentaEntregada.aspx">Ventas entregadas</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <form id="form1" runat="server">
        <div style="margin-top:15px;text-align:center">
            <label>Ingrese el codigo de la venta: </label>
            <asp:TextBox ID="txtEstado" runat="server"></asp:TextBox>
            <asp:Button runat="server" ID="btnCambioEstado" Text="Cambiar estado" OnClick="btnCambioEstado_Click"/>
            <a href="Administrator.aspx" class="btn btn-primary">Volver</a>
        </div> 
    </form>
</body>
</html>
