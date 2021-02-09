<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RegistroUser.aspx.cs" Inherits="TPC_Juarez.RegistroUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="modal-dialog text-center">
        <div class="col-sm-8 main-section">
            <div class="modal-content">
                <div class="col-12 ">
                    <asp:Label runat="server" ID="lblNombre" Text="Nombre:"></asp:Label>
                    <div class="col">
                        <asp:TextBox runat="server" ID="txtNombre"></asp:TextBox>
                    </div>
                    <asp:Label Text="Apellido:" runat="server" ID="lblApellido" />
                    <div class="col">
                        <asp:TextBox runat="server" ID="txtApellido" />
                    </div>
                    <asp:Label Text="DNI:" ID="lblDNI" runat="server" />
                    <div class="col">
                        <asp:TextBox runat="server" ID="txtDNI" />
                    </div>
                    <asp:Label Text="Teléfono" ID="lblTeléfono" runat="server" />
                    <div class="col">
                        <asp:TextBox runat="server" ID="txtTeléfono" />
                    </div>
                    <asp:Label Text="Mail:" ID="lblMail" runat="server" />
                    <div class="col">
                        <asp:TextBox runat="server" ID="txtMail" />
                    </div>
                    <asp:Label Text="Dirección:" ID="lblDireccion" runat="server" />
                    <div class="col">
                        <asp:TextBox runat="server" ID="txtDireccion" />
                    </div>
                    <asp:Label Text="Contraseña:" ID="lblContrasenia" runat="server" />
                    <div class="col">
                        <asp:TextBox runat="server" ID="txtContrasenia" />
                    </div>
                </div>
            </div>
            <label class="form-control"></label>
            <div class="col">
                <asp:Button Text="Aceptar" runat="server" CssClass="btn btn-primary" ID="btnAceptar" OnClick="btnAceptar_Click" />
                <a href="Administrator.aspx?idVolver">Volver</a>
            </div>
        </div>
    </div>
</asp:Content>
