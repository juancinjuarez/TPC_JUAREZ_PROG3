using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;

namespace Negocio
{
    public class VentaNegocio
    {
        public SqlCommand comando { get; set; }

        AccesoDatos acceso = new AccesoDatos();
        public void AgregarVenta(Venta venta)
        {
            try
            {
                acceso.setearSP("SP_AltaVenta");
                acceso.agregarParametro("@Fecha", venta.fecha);
                acceso.agregarParametro("@formaPago", venta.formaPago);
                acceso.agregarParametro("@idUsuario", venta.usuario.idUser);

                acceso.ejecutarAccion();
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void AgregarDetalleVenta(Detalle detalle)
        {
            try
            {
                acceso.setearSP("SP_AltaDetalleVenta");
                acceso.agregarParametro("@precio", detalle.precioUnitario);
                acceso.agregarParametro("@cantidad", detalle.cantidad);
                acceso.agregarParametro("@idProdu", detalle.idProducto.idProdu);
                acceso.agregarParametro("@idVenta", detalle.idVenta.id);

                acceso.ejecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
        }

        public List<Venta> Listar()
        {
            List<Venta> ventas = new List<Venta>();
            AccesoDatos acceso = new AccesoDatos();
            try
            {
                acceso.conectar();
                acceso.setearQuery("SELECT Id,Fecha,formaPago,Usuario FROM VENTA");
                SqlDataReader lector = acceso.leer();

                while (lector.Read())
                {
                    Venta venta = new Venta();
                    venta.usuario = new Usuario();

                    venta.id = lector.GetInt32(0);
                    venta.usuario.idUser = (int)lector["Usuario"];
                    ventas.Add(venta);
                }
                acceso.cerrarConexion();
                return ventas;
            }
            catch (Exception)
            {

                throw;
            }
        }

        //public List<Detalle> listarDetalle()
        //{
        //    List<Detalle> detalles = new List<Detalle>();
        //    try
        //    {
        //        acceso.conectar();
        //        acceso.setearQuery("SELECT Id,Precio,Cantidad,IdProdu,IdVenta FROM DETALLE_VENTA");
        //        SqlDataReader lector = acceso.leer();

        //        while (lector.Read())
        //        {
        //            Detalle detalle = new Detalle();
        //            detalle.idProducto = new Produ();
        //            detalle.idVenta = new Venta();

        //            detalle.id = lector.GetInt32(0);
        //            detalle.precioUnitario = lector.GetDecimal(1);
        //            detalle.cantidad = lector.GetInt32(2);
        //            detalle.idProducto.idProdu = lector.GetInt32(3);
        //            detalle.idVenta.id = lector.GetInt32(4);

        //            detalles.Add(detalle);
        //        }
        //        acceso.cerrarConexion();
        //    }
        //    catch (Exception)
        //    {

        //        throw;
        //    }
        //    return detalles;
        //}
    }
}
