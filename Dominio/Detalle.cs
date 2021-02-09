namespace Dominio
{
    public class Detalle
    {
        public int id { get; set; }
        public decimal precioUnitario { get; set; }
        public int cantidad { get; set; }
        public Produ idProducto { get; set; }
        public Venta idVenta { get; set; }
    }
}
