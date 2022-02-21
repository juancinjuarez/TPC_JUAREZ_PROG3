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
    public partial class EliminarProducto : System.Web.UI.Page
    {
        public List<Produ> listaProdu { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ProduNegocio negocio = new ProduNegocio();
            listaProdu = negocio.listar();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            ProduNegocio nego = new ProduNegocio();
            Produ produ = new Produ();
            try
            {
                int idEliminar = Convert.ToInt32(txtEliminar.Text);
                produ = nego.listar().Find(X => X.idProdu == idEliminar);
                if (produ != null)
                {
                    nego.Baja(produ);
                    Response.Redirect("Administrator.aspx");
                }
            }
            catch (Exception)
            {

                throw;
            }

        }
    }
}