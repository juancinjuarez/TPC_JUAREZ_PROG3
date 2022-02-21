<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetalleCompra.aspx.cs" Inherits="TPC_Juarez.DetalleCompra" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .letra {
            color: forestgreen;
            font-size: 1.2rem;
        }
    </style>
    <div class="container-fluid p-3">
        <div class="row">
            <div class="col-lg-4 col-md-12 mx-3 mx-4"></div>
            <label class="letra" style="display: inline-block">
            Nombre:
            </label>
            <asp:Label BorderColor="Black" runat="server" ID="lblNombre" Text="Nombre"></asp:Label>
            <%--
                <asp:Label Text="Stock" runat="server" ID="lblStock" />
                <div class="col">
                    <asp:TextBox runat="server" ID="txtStock" />
                </div>
                <div class="col">
                    <asp:TextBox runat="server" ID="txtPrecio" />
                </div>
                <asp:Label Text="Descripcion" ID="lblDescripcion" runat="server" />
                <div class="col">
                    <asp:TextBox runat="server" ID="txtDescripcion" />
                </div>--%>
            <div>
                <label class="letra">Forma de pago</label>
            </div>
            <div class="col" style="margin-left:450px">
                <asp:DropDownList runat="server" ID="ddlFormaDePago" CssClass="form-control">
                </asp:DropDownList>
            </div>
            
        </div>
    </div>
    <asp:Button runat="server" ID="btnComprar" Text="Finalizar pedido" OnClick="btnComprar_Click" />
</asp:Content>
