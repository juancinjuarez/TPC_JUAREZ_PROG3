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
    public partial class DetalleCompra : System.Web.UI.Page
    {
        public List<FormaDePago> listaFormaPago = new List<FormaDePago>();
        protected void Page_Load(object sender, EventArgs e)
        {
            PagoNegocio negocio = new PagoNegocio();
            Usuario user = new Usuario();
            user.persona = new Persona();
            UsuarioNegocio nego = new UsuarioNegocio();
            if (Session["userSession"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else
            {
                user = (Usuario)Session["userSession"];
                lblNombre.Text = user.Nombre;

                listaFormaPago = negocio.listar();

                ddlFormaDePago.DataSource = listaFormaPago;
                ddlFormaDePago.DataValueField = "idFormaPago";
                ddlFormaDePago.DataTextField = "formaDePago";
                ddlFormaDePago.SelectedIndex = -1;
                ddlFormaDePago.DataBind();
            }
        }

        protected void btnComprar_Click(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["userSession"];
            Carrito carrito = new Carrito();

            if ((List<ItemCarrito>)Session["carrito"] == null)
            {
                Session["error"] = "Error al intentar realizar la compra";
                Response.Redirect("Error.aspx");
            }
            else if (usuario == null)
            {
                Response.Redirect("IngresoUser.aspx", false);
            }
            else
            {
                carrito.listaItem = (List<ItemCarrito>)Session["carrito"];
                List<Venta> listaVentas = new List<Venta>();
                Detalle detalle = new Detalle();
                Venta venta = new Venta();
                Produ producto = new Produ();
                FormaDePago forma = new FormaDePago();

                VentaNegocio ventaNegocio = new VentaNegocio();

                venta.usuario = new Usuario();
                detalle.idProducto = new Produ();
                detalle.idVenta = new Venta();
                venta.formaPago = new FormaDePago();
                venta.estadoVenta = new Estado();

                decimal totalCompra = carrito.SubTotal();
                venta.usuario.idUser = usuario.idUser;
                DateTime fechaCompra = DateTime.Now;
                venta.fecha = fechaCompra;
                venta.formaPago.idFormaPago = Convert.ToInt32(ddlFormaDePago.SelectedValue); 
                venta.formaPago.formaDePago = Convert.ToString(ddlFormaDePago.Text);
                venta.estadoVenta.idEstado = 1;

                ventaNegocio.AgregarVenta(venta);

                listaVentas = ventaNegocio.Listar();
                int idVenta = 0;

                foreach (var item in listaVentas)
                {
                    if (item.usuario.idUser == usuario.idUser)
                    {
                        idVenta = item.id;
                    }
                }
                venta.id = idVenta;

                foreach (var item in carrito.listaItem)
                {
                    detalle.precioUnitario = item.producto.precio;
                    detalle.cantidad = item.cantidad;
                    detalle.idProducto.idProdu = item.producto.idProdu;
                    detalle.idVenta.id = idVenta;

                    ventaNegocio.AgregarDetalleVenta(detalle);
                }
                Session["carrito"] = null;
                Response.Redirect("FinCompra.aspx");
            }
        }
    }
}