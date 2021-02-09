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
    public partial class ModificarProducto : System.Web.UI.Page
    {
        public List<Produ> produ { get; set; }
        public Produ producto { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            MarcaNegocio negocio = new MarcaNegocio();
            CategoriaNegocio categoria = new CategoriaNegocio();
            try
            {
                if (!IsPostBack)
                {
                    List<Marca> listaMarca = negocio.listar();
                    //Session["listaMarcas"] = listaMarca;
                    ddlMarca.DataSource = listaMarca;
                    ddlMarca.DataValueField = "id";
                    ddlMarca.DataTextField = "nombre";
                    ddlMarca.DataTextField = "descripcion";
                    ddlMarca.DataBind();

                    List<Categoria> categorias = categoria.listar();
                    //Session["listaCategoria"] = categorias;
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

            produ.nombre = txtNombre.Text.Trim();
            produ.stock = Convert.ToInt32(txtStock.Text.Trim());
            produ.precio = Convert.ToDecimal(txtPrecio.Text.Trim());
            produ.descripcion = txtDescripcion.Text.Trim();
            produ.imagenURL = txtImagen.Text.Trim();
            produ.marca.id = int.Parse(ddlMarca.SelectedValue);
            produ.categoria.idCategoria = Convert.ToInt32(ddlCategoria.SelectedValue.Trim());
            produNegocio.Modificar(produ);
            Response.Redirect("Administrator.aspx");
        }
    }
}