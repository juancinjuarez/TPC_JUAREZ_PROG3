using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Carrito
    {
        public int id { get; set; }
        public decimal total { get; set; }
        public DateTime fecha { get; set; }
        public List<ItemCarrito> listaItem { get; set; }
        public Carrito()
        {
            listaItem = new List<ItemCarrito>();
        }
        public decimal SubTotal()
        {
            decimal subtotal = 0;

            foreach(var item in listaItem)
            {
                subtotal += item.PrecioItem();
            }
            total = subtotal;
            return subtotal;
        }
    }
}
