﻿namespace Dominio
{
    public class Detalle
    {
        public Venta idVenta { get; set; }
        public Producto idProducto { get; set; }
        public int cantidad { get; set; }
        public decimal precioUnitario { get; set; }
    }
}
