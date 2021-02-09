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
    public partial class IngresoUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (IsPostBack)
            //{
            //    Session.Add("userSession", new Usuario());
            //}
        }

        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            Page.Validate();
            if (!Page.IsValid)
                return;
            Usuario user = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            user = negocio.Buscar(txtUsuario.Text);
            if (user.idUser == 1)
            {
                Session["userSession"] = user;
                Response.Redirect("Administrator.aspx");
            }
            //else if (Session["carrito"] == null)
            //{
            //    Response.Redirect("Default.aspx");
            //}
            else
            {
                Session["userSession"] = user;
                Response.Redirect("Carrito.aspx");
            }
        }
    }
}
