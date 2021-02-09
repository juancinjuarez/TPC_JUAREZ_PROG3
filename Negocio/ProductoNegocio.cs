using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negocio
{
    public class ProductoNegocio
    {
        public List<Producto> listar()
        {
            List<Producto> lista = new List<Producto>();
            AccesoDatos acceso = new AccesoDatos();
            acceso.conectar();
            acceso.setearQuery("SELECT P.Id,P.Nombre,P.Stock,P.Precio,P.Descripcion,P.ImagenURL,M.Nombre AS Marca,C.Nombre AS Categoria FROM PRODUCTO AS P INNER JOIN MARCA AS M ON M.Id = P.Marca INNER JOIN CATEGORIA AS C ON C.Id = P.IdCategoria");
            
            SqlDataReader lector = acceso.leer();

            while (lector.Read())
            {
                Producto aux = new Producto();
                aux.marca = new Marca();
                aux.categoria = new Categoria();

                aux.id = lector.GetInt32(0);
                aux.nombre = lector.GetString(1);
                aux.stock = lector.GetInt32(2);
                aux.precio = lector.GetDecimal(3);
                aux.descripcion = lector.GetString(4);
                aux.imagenURL = (string)lector["ImagenUrl"];
                aux.categoria.Nombre = lector.GetString(6);
                aux.marca.nombre = lector.GetString(7);

                lista.Add(aux);
            }
            acceso.cerrarConexion();
            return lista;
        }
        public Producto BuscarProducto(string producto)
        {
            Producto produ = new Producto();
            Marca marca = new Marca();
            Categoria categoria = new Categoria();
            AccesoDatos acceso = new AccesoDatos();

            try
            {

            }
            catch (Exception)
            {

                throw;
            }
            return produ;
        }
    }
}


