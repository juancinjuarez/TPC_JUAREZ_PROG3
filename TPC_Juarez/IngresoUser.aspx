<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="IngresoUser.aspx.cs" Inherits="TPC_Juarez.IngresoUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
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
    </script>
    <h1>Iniciar sesion</h1>
    <div class="form-group">
            <label>Usuario</label>
            <asp:TextBox runat="server" CssClass="form" ID="txtUsuario" ClientIDMode="Static"/>
        </div>
        <div class="form-group">
            <label>Contraseña</label>
            <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" ClientIDMode="Static"/>
        </div>
        <asp:Button runat="server" CssClass="btn btn-primary" Text="Ingresar" ID="btnIngresar" OnClick="btnIngresar_Click" OnClientClick="return validar()"></asp:Button>
        <a href="Default.aspx?idVolver" class="btn btn-primary">Volver</a>
        <div></div>
        <div>
            <label>¿No tienes cuenta?</label>
            <a href="RegistroUser.aspx" class="btn btn-primary">Registrate</a>
        </div>
        <div>
        </div>
</asp:Content>
