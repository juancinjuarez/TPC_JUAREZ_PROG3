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
    public partial class AltaProducto : System.Web.UI.Page
    {
        public List<Marca> listaMarca { get; set; }
        public List<Categoria> categorias { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            MarcaNegocio negocio = new MarcaNegocio();
            CategoriaNegocio categoria = new CategoriaNegocio();
            try
            {
                if (!IsPostBack)
                {
                    listaMarca = negocio.listar();
                    ddlMarca.DataSource = listaMarca;
                    ddlMarca.DataValueField = "id";
                    ddlMarca.DataTextField = "nombre";
                    ddlMarca.DataTextField = "descripcion";
                    ddlMarca.DataBind();

                    categorias = categoria.listar();
                    ddlCategoria.DataSource = categorias;
                    ddlCategoria.DataValueField = "idCategoria";
                    ddlCategoria.DataTextField = "Nombre";
                    ddlCategoria.DataBind();
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Produ produ = new Produ();
            ProduNegocio produNegocio = new ProduNegocio();
            produ.marca = new Marca();
            produ.categoria = new Categoria();

            produ.nombre = txtNombre.Text;
            produ.stock = Convert.ToInt32(txtStock.Text);
            produ.precio = Convert.ToDecimal(txtPrecio.Text);
            produ.descripcion = txtDescripcion.Text;
            produ.imagenURL = txtImagen.Text;

            produ.marca.id = Convert.ToInt32(ddlMarca.SelectedValue);
            produ.marca.nombre = Convert.ToString(ddlMarca.SelectedItem.Text);
            produ.marca.descripcion = Convert.ToString(ddlMarca.SelectedItem.Text);

            produ.categoria.idCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);
            produ.categoria.Nombre = Convert.ToString(ddlCategoria.SelectedItem.Text);

            produNegocio.Guardar(produ);

            Response.Redirect("Administrator.aspx");
        }
    }
}