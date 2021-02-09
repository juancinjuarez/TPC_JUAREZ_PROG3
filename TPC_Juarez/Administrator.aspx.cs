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
    public partial class Administrator : System.Web.UI.Page
    {
        public List<Produ> listaProdus { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario user = new Usuario();
            user = (Usuario)Session["userSession"];
            ProduNegocio negocio = new ProduNegocio();
            listaProdus = negocio.listar();
        }

        protected void dgvProductos_RowCommand(object sender, GridViewCommandEventArgs e)
        {

        }

        protected void dgvProductos_SelectedIndexChanged(object sender, EventArgs e)
        {
            //    int index = Convert.ToInt32(e.CommandArgument);
            //    string idPoke = dgvProductos.Rows[index].Cells[1].Text;
        }
    }
}