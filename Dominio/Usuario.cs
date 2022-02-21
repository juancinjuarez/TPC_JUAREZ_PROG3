    using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dominio
{
    public class Usuario
    {
        public int idUser { get; set; }
        public string Nombre { get; set; }
        public string contrasenia { get; set;}
        public int idTipo { get; set; }

        public Persona persona { get; set; }
    }
}
