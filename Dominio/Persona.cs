using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Persona
    {
        public Int32 id { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int dni { get; set; }
        public string fechaNac { get; set; }
        public int telefono { get; set; }
        public string mail { get; set; }
        public string direccion { get; set; }
    }
}
