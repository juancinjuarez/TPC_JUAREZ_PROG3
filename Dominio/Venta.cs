        using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Venta
    {
        public int id { get; set; }
        public DateTime fecha { get; set; }
        public string formaPago { get; set; }
        public Usuario usuario { get; set; }
        public decimal precioTotal { get; set; }
    }
}
