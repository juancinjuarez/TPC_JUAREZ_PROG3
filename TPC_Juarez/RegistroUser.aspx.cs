using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;
using Negocio;

namespace TPC_Juarez
{
    public partial class RegistroUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            Usuario user = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            user.Nombre = txtNombre.Text;
            user.Apellido = txtApellido.Text;
            user.dni = txtDNI.Text;
            user.telefono = txtTeléfono.Text;
            user.mail = txtMail.Text;
            user.direccion = txtDireccion.Text;
            user.contrasenia = txtContrasenia.Text;
            negocio.RegistrarUser(user);

            Response.Redirect("IngresoUser.aspx");
        }
    }
}