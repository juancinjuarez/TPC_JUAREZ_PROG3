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
        public Producto producto { get; set; }
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
                    producto = new Producto();
                    ProductoNegocio negocio = new ProductoNegocio();
                    int idProd = Convert.ToInt32(Request.QueryString["idProducto"]);

                    producto = negocio.listar().Find(X => X.id == idProd);
                    ItemCarrito item = carrito.listaItem.Find(H => H.producto.id == producto.id);

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
                    ItemCarrito itemSumar = carrito.listaItem.Find(X => X.producto.id == int.Parse(sumar));
                    itemSumar.cantidad += 1;
                    Session["carrito"] = carrito.listaItem;
                    Response.Redirect("Carrito.aspx");
                }
                var restar = Request.QueryString["idBajar"];
                if (restar != null)
                {
                    ItemCarrito item = carrito.listaItem.Find(K => K.producto.id == int.Parse(restar));
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

                    ItemCarrito item = carrito.listaItem.Find(F => F.producto.id == cancelar);
                    if (item != null)
                    {
                        carrito.listaItem.Remove(item);
                        Session["carrito"] = carrito.listaItem;
                        Response.Redirect("Carrito.aspx");
                    }
                }
                var comprar = Convert.ToInt32(Request.QueryString["idCompra"]);
                if (comprar != 0)
                {
                    Producto producto = new Producto();
                    Venta venta = new Venta();
                    Detalle detalle = new Detalle();
                    VentaNegocio ventaNegocio = new VentaNegocio();

                    //DateTime fechaCompra = DateTime.Now();

                    Usuario usuario = (Usuario)Session["carrito"];
                    decimal totalCompra = carrito.SubTotal();
                    venta.usuario.idUser = usuario.idUser;
                    //venta.fecha = fechaCompra;
                    venta.formaPago = "1";
                    ventaNegocio.AgregarVenta(venta);

                    if (usuario == null)
                    {
                        Response.Redirect("Login.aspx");
                    }
                    else
                    {
                        foreach (var item in carrito.listaItem)
                        {
                            detalle.idVenta.id = venta.id;
                            detalle.idProducto.id = item.id;
                            detalle.cantidad = item.cantidad;
                            detalle.precioUnitario = item.precio;

                            ventaNegocio.AgregarDetalleVenta(detalle);
                        }
                    }
                    Response.Redirect("DetalleVenta.aspx");
                }
            }
            catch (Exception)
            {
                throw;
            }
            lbtotal.Text = carrito.SubTotal().ToString();
        }

    }
}
