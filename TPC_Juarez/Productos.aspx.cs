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
    public partial class Productos : System.Web.UI.Page
    {
        public List<Producto> listaProductos { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ProductoNegocio negocioP = new ProductoNegocio();
            listaProductos = negocioP.listar();
        }
    }
}