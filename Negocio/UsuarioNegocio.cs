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

                conexion.setearQuery("SELECT Id,Nombre,Apellido,DNI,Telefono,Mail,Direccion,Contrasenia FROM Usuario WHERE Nombre = '" + usuario + "'");

                SqlDataReader lectura = conexion.leer();

                lectura.Read();

                user.idUser = lectura.GetInt32(0);
                user.Nombre = lectura.GetString(1);
                user.Apellido = lectura.GetString(2);
                user.dni = lectura.GetString(3);
                user.telefono = lectura.GetString(4);
                user.mail = lectura.GetString(5);
                user.direccion = lectura.GetString(6);
                user.contrasenia = lectura.GetString(7);
                
                conexion.cerrarConexion();
            }
            catch
            {
                user.idUser = 0;
            }

            return user;
        }

        public void RegistrarUser(Usuario user)
        {
            try
            {
                conexion.setearSP("SP_RegistroUser");
                conexion.agregarParametro("@Nombre", user.Nombre);
                conexion.agregarParametro("@Apellido", user.Apellido);
                conexion.agregarParametro("@DNI", user.dni);
                conexion.agregarParametro("@Telefono", user.telefono);
                conexion.agregarParametro("@Mail", user.mail);
                conexion.agregarParametro("@Direccion", user.direccion);
                conexion.agregarParametro("@Contrasenia", user.contrasenia);
                conexion.ejecutarAccion();
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
