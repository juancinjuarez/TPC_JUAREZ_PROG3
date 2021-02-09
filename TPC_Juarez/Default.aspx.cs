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
    public partial class _Default : Page
    {
        public List<Produ> listaProdu { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ProduNegocio negocio = new ProduNegocio();
            listaProdu = negocio.listar();
        }
    }
}