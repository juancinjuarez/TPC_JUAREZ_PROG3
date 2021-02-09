using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class ItemCarrito
    {
        public int id { get; set; }
        public Produ producto { get; set; }
        public int cantidad { get; set; }
        public decimal precio { get; set; }
        public decimal PrecioItem()
        {
            return producto.precio * cantidad;
        }
    }
}
