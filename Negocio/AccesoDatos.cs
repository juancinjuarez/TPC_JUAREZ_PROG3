using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Negocio
{
    public class AccesoDatos
    {
        public SqlDataReader lectora { get; set; }

        public SqlConnection conexion { get; set; }

        public SqlCommand comando { get; set; }

        public AccesoDatos()
        {

            conexion = new SqlConnection("data source=ARWS2622\\SQLEXPRESS; initial catalog=JUAREZ_DB; integrated security=sspi");

            comando = new SqlCommand();
            comando.Connection = conexion;
        }
        public void conectar()
        {
            conexion.Open();
        }

        public void setearQuery(string consulta)
        {
            comando.CommandType = System.Data.CommandType.Text;
            comando.CommandText = consulta;
        }
        public void setearSP(string sp)
        {
            comando.CommandType = System.Data.CommandType.StoredProcedure;
            comando.CommandText = sp;
        }
        public void agregarParametro(string nombre, object valor)
        {
            comando.Parameters.AddWithValue(nombre, valor);
        }

        public SqlDataReader leer()
        {
            lectora = comando.ExecuteReader();
            return lectora;
        }
        public void ejecutaLector()
        {
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }

        }
        public void cerrarConexion()
        {
            conexion.Close();
        }

        internal void ejecutarAccion()
        {
            try
            {
                conexion.Open();
                comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                conexion.Close();
            }
        }
    }
}

