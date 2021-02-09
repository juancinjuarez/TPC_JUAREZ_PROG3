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
    public partial class WebForm1 : System.Web.UI.Page
    {
        public Produ producto { get; set; }
        public List<Carrito> listaCarrito { get; set; }
        public Carrito carrito = new Carrito();
        public ItemCarrito itemCarrito = new ItemCarrito();
        //public DetalleVenta detalle { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                carrito.listaItem = (List<ItemCarrito>)Session["carrito"];
                if (carrito.listaItem == null)
                {
                    carrito.listaItem = new List<ItemCarrito>();
                }

                if (Request.QueryString["idProducto"] != null)
                {
                    producto = new Produ();
                    ProduNegocio negocio = new ProduNegocio();
                    int idProd = Convert.ToInt32(Request.QueryString["idProducto"]);

                    producto = negocio.listar().Find(X => X.idProdu == idProd);
                    ItemCarrito item = carrito.listaItem.Find(H => H.producto.idProdu == producto.idProdu);

                    if (item == null)
                    {
                        itemCarrito.producto = producto;
                        itemCarrito.cantidad++;
                        carrito.total += itemCarrito.producto.precio;
                        carrito.listaItem.Add(itemCarrito);
                        Session["carrito"] = carrito.listaItem;
                    }
                    Response.Redirect("Carrito.aspx");
                }
                var sumar = Request.QueryString["idSumar"];
                if (sumar != null)
                {
                    ItemCarrito itemSumar = carrito.listaItem.Find(X => X.producto.idProdu == int.Parse(sumar));
                    itemSumar.cantidad += 1;
                    Session["carrito"] = carrito.listaItem;
                    Response.Redirect("Carrito.aspx");
                }
                var restar = Request.QueryString["idBajar"];
                if (restar != null)
                {
                    ItemCarrito item = carrito.listaItem.Find(K => K.producto.idProdu == int.Parse(restar));
                    if (item.cantidad > 1)
                    {
                        item.cantidad--;
                    }
                    Session["carrito"] = carrito.listaItem;
                    Response.Redirect("Carrito.aspx");

                }

                if (Request.QueryString["idCancelar"] != null)
                {
                    int cancelar = Convert.ToInt32(Request.QueryString["idCancelar"]);

                    ItemCarrito item = carrito.listaItem.Find(F => F.producto.idProdu == cancelar);
                    if (item != null)
                    {
                        carrito.listaItem.Remove(item);
                        Session["carrito"] = carrito.listaItem;
                        Response.Redirect("Carrito.aspx");
                    }
                }
            }
            catch (Exception)
            {
                throw;
            }
            lbtotal.Text = carrito.SubTotal().ToString();
        }

        protected void btnRealizarCompra_Click(object sender, EventArgs e)
        {
            Usuario usuario = (Usuario)Session["userSession"];

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
                VentaNegocio ventaNegocio = new VentaNegocio();
                venta.usuario = new Usuario();
                detalle.idProducto = new Produ();
                detalle.idVenta = new Venta();

                decimal totalCompra = carrito.SubTotal();
                venta.usuario.idUser = usuario.idUser;
                DateTime fechaCompra = DateTime.Now;
                venta.fecha = fechaCompra;
                venta.formaPago = "1";
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
                Response.Redirect("FinCompra.aspx");
            }
        }
    }
}

