using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dominio;
using System.Data.SqlClient;

namespace Negocio
{
    public class UsuarioNegocio
    {
        AccesoDatos conexion = new AccesoDatos();
        public Usuario Buscar(string usuario)
        {
            Usuario user = new Usuario();
            
            try
            {
                conexion.conectar();

                conexion.setearQuery("SELECT Id,Nombre,Contrasenia,IdTipo,IdPersona FROM Usuario WHERE Nombre = '" + usuario + "'");

                SqlDataReader lectura = conexion.leer();

                lectura.Read();

                user.idUser = lectura.GetInt32(0);
                user.nombre = lectura.GetString(1);
                user.contrasenia = lectura.GetString(2);
                user.idt = lectura.GetInt32(3);
                
                
                conexion.cerrarConexion();
            }
            catch
            {
                user.idUser = 0;
            }

            return user;
        }



    }
}
