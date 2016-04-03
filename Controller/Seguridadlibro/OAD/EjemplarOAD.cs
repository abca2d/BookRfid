using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using Sigc_net.Conexion;



namespace Sigc_net.Controller.Seguridadlibro.OAD
{
    public class EjemplarOAD
    {
      
 
      DataSet datos_Ejemplar;
      cadconexion connect = new cadconexion();

        public DataSet buscar_ejemplar(int id){  
             try {
             string sql="select id_ejemplar, titulo, autor, from libro l inner join ejemplar e on e.ID_libro = l.ID_libro and id_ejemplar="+id;
              datos_Ejemplar=connect.EjecutarSelectMysql(sql);
       
            }catch(Exception ex){
                System.Console.Write(ex.Message);
            }
            return datos_Ejemplar;
        }




    }
}