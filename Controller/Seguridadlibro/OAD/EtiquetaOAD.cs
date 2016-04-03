using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Sigc_net.Conexion;

namespace Sigc_net.Controller.Seguridadlibro.OAD
{
    public class EtiquetaOAD
    {
        private cadconexion connect = new cadconexion();
        Boolean respuesta;
        public Boolean validarEtiqueta(string codigo)
        {
            try
            {
               string sql = "select * from prestamo p inner join ejemplar e on p.fk_ejem_id=e.ID_libro inner join etiquetaejemplar eet on eet.ejem_id=e.ejem_id where p.estado ='Prestamo' and eet.etiq_id='"+codigo+"';";
               respuesta=connect.Grabar_mysql(sql);
            }
            catch (Exception ex)
            {
                System.Console.Write(ex.Message);
            }
            return respuesta;
        }

        public void Eliminar(string id)
        {

            try
            {
                string sql = "delete from etiqueta where etiq_id='" + id + "'";
                connect.Grabar_mysql(sql);

            }
            catch (Exception ex)
            {
                System.Console.Write(ex.Message);
            }
            //  return datos_Ejemplar;
        }

        public Boolean insertar_tag(string id)
        {
            Boolean rspta = false;
            try
            {
                string sql = "insert into etiqueta(etiq_id,etiq_fecha) values('" + id + "',now());";
                rspta = connect.Grabar_mysql(sql);

            }
            catch (Exception ex)
            {
                System.Console.Write(ex.Message);
            }
            return rspta;
        }


    }
}