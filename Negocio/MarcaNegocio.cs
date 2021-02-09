using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Dominio;

namespace Negocio
{
    public class MarcaNegocio
    {
        public List<Marca> listar()
        {
            List<Marca> marcas = new List<Marca>();
            AccesoDatos acceso = new AccesoDatos();
            acceso.conectar();
            acceso.setearQuery("Select id, nombre,descripcion from MARCA");
            SqlDataReader lector = acceso.leer();
            while (lector.Read())
            {
                Marca aux = new Marca();
                aux.id = lector.GetInt32(0);
                aux.nombre = lector.GetString(1);
                aux.descripcion = lector.GetString(2);

                marcas.Add(aux);
            }
            acceso.cerrarConexion();
            return marcas;
        }

        public void Guardar(Marca marca)
        {
            AccesoDatos acceso = new AccesoDatos();

            try
            {
                acceso.setearSP("SP_AltaMarca");
                acceso.agregarParametro("@Nombre", marca.nombre);
                acceso.agregarParametro("@Descripcion", marca.descripcion);
                acceso.ejecutarAccion();
            }
            catch (Exception)
            {
                throw;
            }
        }

        public void Baja(Marca marca)
        {
            AccesoDatos acceso = new AccesoDatos();

            try
            {
                acceso.setearSP("SP_BajaMarca");
                acceso.agregarParametro("@Nombre", marca.nombre);
                acceso.ejecutarAccion();
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
