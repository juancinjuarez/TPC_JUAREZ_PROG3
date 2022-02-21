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
    public partial class CambiarEstado : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuario = new Usuario();
            if (Session["userSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void btnCambioEstado_Click(object sender, EventArgs e)
        {
            EstadoNegocio negocio = new EstadoNegocio();
            Estado estado = new Estado();
            VentaNegocio ventaNegocio = new VentaNegocio();
            Venta venta = new Venta();
            venta.estadoVenta = new Estado();

            int idVenta = Convert.ToInt32(txtEstado.Text);
            venta = ventaNegocio.Listar().Find(x => x.id == idVenta);
            if (venta != null)
            {
                if (venta.estadoVenta.idEstado == 1)
                {
                    ventaNegocio.cambiarEstado(venta);
                    Response.Redirect("VentaRealizada.aspx");
                }
                else if (venta.estadoVenta.idEstado == 2)
                {
                    ventaNegocio.cambiarEstado2(venta);
                    Response.Redirect("VentaPendiente.aspx");
                }
            }
        }
    }
}