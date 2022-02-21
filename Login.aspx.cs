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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Usuario user = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            user = negocio.Buscar(txtUsuario.Text);

            if(user.idUser > 0/* && txtPassword.Text == user.contrasenia*/)
            {
                if(user.idt == 1)
                {
                    Response.Redirect("Administrator.aspx");
                }
                else
                {
                    Response.Redirect("Default.aspx");
                }
            }
            else
            {
                Response.Redirect("Contact.aspx");
            }
        }
    }
}