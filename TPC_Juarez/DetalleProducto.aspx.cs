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
    public partial class DetalleProducto : System.Web.UI.Page
    {
        public Producto producto { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocio = new ProductoNegocio();
            try
            {
                int detalle = Convert.ToInt32(Request.QueryString["idDetalle"]);
                producto = negocio.listar().Find(X => X.id == detalle);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}