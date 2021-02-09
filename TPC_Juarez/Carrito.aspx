<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Carrito.aspx.cs" Inherits="TPC_Juarez.WebForm1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Instrumentos Juarez</title>
</head>
<body>
    <%--    <form runat="server">--%>
    <div class="container pad ">
        <div class="row">
            <div class="col-9">
                <div class="jumbotron ">
                    <h1 class="display-4">¡Tu carrito de compras!</h1>
                    <table class="default">
                        <thead>
                            <tr>
                                <th scope="col">
                                    <h2>-Nombre-</h2>
                                </th>
                                <th scope="col">
                                    <h2>-Precio-</h2>
                                </th>
                                <th scope="col">
                                    <h2>-Cantidad-</h2>
                                </th>
                                <%--<th scope="col">
                                    <h2>Cantidad</h2>
                                </th>--%>
                                <th scope="col">
                                    <h2>-Eliminar</h2>
                                </th>
                            </tr>
                        </thead>
                        <%foreach (var item in carrito.listaItem)
                            { %>
                        <tbody>
                            <tr>
                                <td><%=item.producto.nombre %></td>
                                <td><%=item.producto.precio %></td>
                                <td><a class="btn btn-primary btn-lg" href="Carrito.aspx?idBajar=<%=item.producto.idProdu.ToString() %>" role="button">-</a></td>
                                <td><%=item.cantidad %></td>
                                <td><a class="btn btn-primary btn-lg" href="Carrito.aspx?idSumar=<%= item.producto.idProdu.ToString() %>" role="button">+</a></td>
                                <td><a class="btn btn-primary" href="Carrito.aspx?idCancelar=<%= item.producto.idProdu.ToString() %>" role="button">Eliminar</a></td>
                            </tr>
                        </tbody>
                        <%}%>
                    </table>
                    <div>
                    </div>
                    <a href="Default.aspx" class="btn btn-info btn lg">Ver mas Articulos</a>
                </div>
            </div>
            <div class="col 3">
                <div class="jumbotron">
                    <h3>Resumen de su compra</h3>
                    <h5>Total : $<asp:Label ID="lbtotal" Text="" runat="server" /></h5>
                    <form runat="server">

                    <asp:Button Text="Realizar Compra" ID="btnRealizarCompra" CssClass="btn btn-primary"  OnClick="btnRealizarCompra_Click" runat="server" BackColor="#66FF33" />
                    </form>

                </div>
            </div>
        </div>
    </div>
    <%--    </form>--%>
</body>
</html>
