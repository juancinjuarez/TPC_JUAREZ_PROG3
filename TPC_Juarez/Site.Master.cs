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
    public partial class SiteMaster : MasterPage
    {
        public List<Producto> listaBusqueda { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            listaBusqueda = (List<Producto>)Session["listaprodu"];
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            List<Producto> lista = new List<Producto>();
            ProductoNegocio produNegocio = new ProductoNegocio();

            try
            {
                lista = produNegocio.listar();
                listaBusqueda = lista.FindAll(x => x.nombre.ToLower().Contains(txtBuscar.Text.ToLower()) || x.marca.nombre.ToLower().Contains(txtBuscar.Text.ToLower()));
                Session.Add("listaProdu", listaBusqueda);
                Response.Redirect("Productos.aspx");
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

    }
}
