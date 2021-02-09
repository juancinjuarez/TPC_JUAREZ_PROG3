using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negocio
{
    public class CategoriaNegocio
    {
        public List<Categoria> listar()
        {
            List<Categoria> categorias = new List<Categoria>();
            AccesoDatos acceso = new AccesoDatos();
            acceso.conectar();
            acceso.setearQuery("Select id, nombre from CATEGORIA");
            SqlDataReader lector = acceso.leer();
            while (lector.Read())
            {
                Categoria aux = new Categoria();
                aux.idCategoria = lector.GetInt32(0);
                aux.Nombre = lector.GetString(1);

                categorias.Add(aux);
            }
            acceso.cerrarConexion();
            return categorias;
        }
        public void Guardar(Categoria categoria)
        {
            AccesoDatos acceso = new AccesoDatos();
            try
            {
                acceso.setearSP("SP_AltaCategoria");
                acceso.agregarParametro("@Nombre", categoria.Nombre);
                acceso.ejecutarAccion();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void Baja(Categoria categoria)
        {
            AccesoDatos acceso = new AccesoDatos();
            try
            {
                acceso.setearSP("SP_BajaCategorias");
                acceso.agregarParametro("@Nombre", categoria.Nombre);
                acceso.ejecutarAccion();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
