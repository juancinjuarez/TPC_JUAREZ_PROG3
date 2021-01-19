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
        public AccesoDatos acceso { get; set; }
        public void AgregarVenta(Venta venta)
        {
            try
            {
                acceso.conectar();
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
                acceso.conectar();
                acceso.setearSP("SP_AltaDetalleVenta");
                acceso.agregarParametro("@idVenta",detalle.idVenta);
                acceso.agregarParametro("@idProdu", detalle.idProducto);
                acceso.agregarParametro("@cantidad", detalle.cantidad);
                acceso.agregarParametro("@precio", detalle.precioUnitario);
                
                acceso.ejecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
