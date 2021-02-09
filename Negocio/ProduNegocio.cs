using Dominio;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Negocio
{
    public class ProduNegocio
    {

        public SqlCommand comando { set; get; }
        public List<Produ> listar()
        {
            List<Produ> listaProducto = new List<Produ>();
            AccesoDatos conexion = new AccesoDatos();
            conexion.conectar();

            conexion.setearQuery("select p.id, p.nombre,p.stock,p.precio,p.descripcion,p.imagenURL, m.nombre as Marca, c.nombre as Categoria from PRODUCTO p inner join categoria c on p.IdCategoria = c.id inner join marca m on p.marca = m.id");

            SqlDataReader lectura = conexion.leer();

            while (lectura.Read())
            {
                Produ aux = new Produ();
                aux.marca = new Marca();
                aux.categoria = new Categoria();

                aux.idProdu = lectura.GetInt32(0);
                aux.nombre = lectura.GetString(1);
                aux.stock = lectura.GetInt32(2);
                aux.precio = lectura.GetDecimal(3);
                aux.descripcion = lectura.GetString(4);
                aux.imagenURL = (string)lectura["ImagenUrl"];
                aux.marca.nombre = lectura.GetString(6);
                aux.categoria.Nombre = lectura.GetString(7);

                listaProducto.Add(aux);
            }
            conexion.cerrarConexion();
            return listaProducto;
        }
        public void Guardar(Produ produ)
        {
            AccesoDatos acceso = new AccesoDatos();
            try
            {
                acceso.setearSP("SP_AltaProducto");
                acceso.agregarParametro("@Nombre", produ.nombre);
                acceso.agregarParametro("@Stock", produ.stock);
                acceso.agregarParametro("@Precio", produ.precio);
                acceso.agregarParametro("@Descripcion", produ.descripcion);
                acceso.agregarParametro("@ImagenURL", produ.imagenURL);
                acceso.agregarParametro("@Marca", produ.marca.id);
                acceso.agregarParametro("@IdCategoria", produ.categoria.idCategoria);

                acceso.ejecutarAccion();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void Baja(Produ produ)
        {
            AccesoDatos acceso = new AccesoDatos();
            try
            {
                acceso.setearSP("SP_BajaProducto");
                acceso.agregarParametro("@Nombre", produ.nombre);

                acceso.ejecutarAccion();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void Modificar(Produ produ)
        {
            AccesoDatos acceso = new AccesoDatos();
            try
            {
                acceso.setearSP("SP_ModificarProducto");
                acceso.agregarParametro("@Nombre", produ.nombre);
                acceso.agregarParametro("@Stock", produ.stock);
                acceso.agregarParametro("@Precio", produ.precio);
                acceso.agregarParametro("@Descripcion", produ.descripcion);
                acceso.agregarParametro("@ImagenURL", produ.imagenURL);
                acceso.agregarParametro("@Marca", produ.marca.id);
                acceso.agregarParametro("@IdCategoria", produ.categoria.idCategoria);

                acceso.ejecutarAccion();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public Produ BuscarProdu(string Produ)
        {
            Produ produ = new Produ();
            Marca marca = new Marca();
            Categoria categoria = new Categoria();
            AccesoDatos acceso = new AccesoDatos();
            
            try
            {
                acceso.setearQuery("SELECT P.Id,P.Nombre,P.Stock,P.Precio,P.Descripcion,P.ImagenURL,M.Nombre AS Marca,C.Nombre AS Categoria FROM PRODUCTO AS P INNER JOIN MARCA AS M ON M.Id = P.Marca INNER JOIN CATEGORIA AS C ON C.Id = P.IdCategoria");
                SqlDataReader lector = acceso.leer();
                lector.Read();
                produ.idProdu = lector.GetInt32(0);
                produ.nombre = lector.GetString(1);
                produ.stock = lector.GetInt32(2);
                produ.precio = lector.GetDecimal(3);
                produ.descripcion = lector.GetString(4);
                produ.imagenURL = lector.GetString(5);
                produ.marca.nombre = lector.GetString(6);
                produ.categoria.Nombre = lector.GetString(7);
                acceso.cerrarConexion();
            }
            catch (Exception)
            {

                throw;
            }
            return produ;
        }
    }


}


