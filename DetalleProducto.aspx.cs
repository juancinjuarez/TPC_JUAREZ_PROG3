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
        public Produ producto { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ProduNegocio negocio = new ProduNegocio();
            try
            {
                int detalle = Convert.ToInt32(Request.QueryString["idDetalle"]);
                producto = negocio.listar().Find(X => X.idProdu == detalle);
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}