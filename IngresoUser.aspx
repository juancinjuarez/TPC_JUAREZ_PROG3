<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IngresoUser.aspx.cs" Inherits="TPC_Juarez.IngresoUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <%--<script>
        function validar() {
            var usuario = document.getElementById("txtUsuario").value;
            var password = document.getElementById("txtPassword").value;
            var valido = 1;

            if (usuario === "") {
                $("#txtUsuario").removeClass("is-valid");
                $("#txtUsuario").addClass("is-invalid");
                valido = 0;
            }
            else {
                $("#txtUsuario").removeClass("is-invalid");
                $("#txtUsuario").addClass("is-valid");
            }
            if (password === "") {
                $("#txtPassword").removeClass("is-valid");
                $("#txtPassword").addClass("is-invalid");
                valido = 0;
            }
            else {
                $("#txtPassword").removeClass("is-invalid");
                $("#txtPassword").addClass("is-valid");
            }
            if (!valido) {
                return false;
            }
            return true;
        }
    </script>--%>
    <h1 style="text-align: center">Iniciar sesion</h1>
    <div class="form-group" style="text-align: center">
        <label style="text-align:center">Usuario</label>
        <asp:TextBox runat="server" ID="txtUsuario" ClientIDMode="Static" CssClass="align-content-sm-center"/>
        <asp:RequiredFieldValidator ErrorMessage="Ingrese un usuario" CssClass="alert-danger" ControlToValidate="txtUsuario" runat="server"></asp:RequiredFieldValidator>
    </div>
    <div class="form-group" style="text-align: center">
        <label>Contraseña</label>
        <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" ClientIDMode="Static" />
        <asp:RequiredFieldValidator ErrorMessage="Ingrese una contraseña" CssClass="alert-danger" ControlToValidate="txtPassword" runat="server"></asp:RequiredFieldValidator>
    </div>
    <asp:Label ID="errorIngreso" runat="server" CssClass="alert-danter d-flex" Text=""></asp:Label>

    <asp:Button runat="server" CssClass="btn btn-primary" Text="Ingresar" ID="btnIngresar" OnClick="btnIngresar_Click"></asp:Button>
    <a href="Default.aspx?idVolver" class="btn btn-primary">Volver</a>
    
    <div style="margin-top:15px;">
        <label style="text-align: center">¿No tienes cuenta?</label>
        <a href="RegistroUser.aspx" class="btn btn-primary">Registrate</a>
    </div>
</asp:Content>
