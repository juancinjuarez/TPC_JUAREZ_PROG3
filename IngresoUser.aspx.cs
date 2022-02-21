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

        List<Usuario> listaUsuarios = new List<Usuario>();
        Usuario user = new Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["carrito"] == null)
            //{
            //    if (Session["userSession"] == null)
            //    {
            //        Response.Redirect("Default.aspx");
            //    }
            //    else
            //    {
            //        Response.Redirect("Carrito.aspx");
            //    }
            //}
        }
        protected void btnIngresar_Click(object sender, EventArgs e)
        {
            //Page.Validate();
            //if (!Page.IsValid)
            //    return;
            Usuario user = new Usuario();
            Usuario aux = new Usuario();
            UsuarioNegocio negocio = new UsuarioNegocio();

            aux.Nombre = txtUsuario.Text;
            aux.contrasenia = txtPassword.Text;


            user = negocio.Buscar(aux);
            if (user.idUser > 0)
            {
                listaUsuarios = negocio.listar();
                aux = listaUsuarios.Find(x => x.idUser == user.idUser);
                user.idUser = aux.idUser;
                user.Nombre = aux.Nombre;
                user.contrasenia = aux.contrasenia;
                user.idTipo = aux.idTipo;

                Session["UserSession"] = user;

                if (user.idUser == 1)
                {
                    Response.Redirect("Administrator.aspx");
                }
                else if (user.idTipo != 1)
                {
                    if (Session["Carrito"] == null)
                    {
                        Response.Redirect("Default.aspx");
                    }
                    else
                    {
                        Response.Redirect("Carrito.aspx");
                    }
                }
            }
        }
    }
}