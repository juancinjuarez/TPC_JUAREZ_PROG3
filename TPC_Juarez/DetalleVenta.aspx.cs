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
    public partial class DetalleVenta : System.Web.UI.Page
    {
        public List<Detalle> listaDetalle { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //VentaNegocio detalle = new VentaNegocio();

            //listaDetalle = detalle.listarDetalle();
        }
    }
}