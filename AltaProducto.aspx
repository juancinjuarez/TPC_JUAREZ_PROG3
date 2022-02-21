<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AltaProducto.aspx.cs" Inherits="TPC_Juarez.AltaProducto" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ALTA DE PRODUCTO</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="modal-dialog text-center">
            <div class="col-sm-8 main-section">
                <div class="modal-content">
                    <div class="col-12 ">
                        <asp:Label runat="server" ID="lblNombre" Text="Nombre"></asp:Label>
                        <div class="col">
                            <asp:TextBox runat="server" ID="txtNombre"></asp:TextBox>
                        </div>
                        <asp:Label Text="Stock" runat="server" ID="lblStock" />
                        <div class="col">
                            <asp:TextBox runat="server" ID="txtStock" />
                        </div>
                        <asp:Label Text="Precio" ID="lblPrecio" runat="server" />
                        <div class="col">
                            <asp:TextBox runat="server" ID="txtPrecio" />
                        </div>
                        <asp:Label Text="Descripcion" ID="lblDescripcion" runat="server" />
                        <div class="col">
                            <asp:TextBox runat="server" ID="txtDescripcion" />
                        </div>
                        <asp:Label Text="ImagenURL" ID="lblImagen" runat="server" />
                        <div class="col">
                            <asp:TextBox runat="server" ID="txtImagen" />
                        </div>
                        <label class="form-group">Marca</label>
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlMarca" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                        <label class="form-group">Categoria</label>
                        <div class="col">
                            <asp:DropDownList runat="server" ID="ddlCategoria" CssClass="form-control">
                            </asp:DropDownList>
                        </div>
                        <asp:Label Text="Eliminado" runat="server" ID="lblEliminado" />
                        <div class="col">
                            <asp:TextBox runat="server" ID="txtEliminado" />
                        </div>
                        <label class="form-control"></label>
                        <div class="col">
                            <asp:Button Text="Aceptar" runat="server" CssClass="btn btn-primary" OnClick="Unnamed_Click"/>
                            <a href="Administrator.aspx?idVolver">Cancelar</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
