using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negocio
{
    public class EstadoNegocio
    {
        public List<Estado> listar()
        {

            List<Estado> estados = new List<Estado>();
            AccesoDatos acceso = new AccesoDatos();
            try
            {
                acceso.conectar();
                acceso.setearQuery("Select Id, nombre from ESTADO_VENTA");
                SqlDataReader lector = acceso.leer();
                while (lector.Read())
                {
                    Estado aux = new Estado();
                    aux.idEstado = lector.GetInt32(0);
                    aux.nombre = lector.GetString(1);

                    estados.Add(aux);
                }
                acceso.cerrarConexion();
                return estados;
            }
            catch (Exception)
            {

                throw;
            }

        }
    }
}
