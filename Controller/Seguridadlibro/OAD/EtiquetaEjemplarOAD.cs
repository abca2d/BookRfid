using System;
using System.Collections.Generic;
using System.Data;
using System.Configuration;
using MySql.Data.MySqlClient;
using MySql.Data;
using Sigc_net.Conexion;

namespace Sigc_net.Controller.Seguridadlibro.OAD
{
    //OAD: OBJETO ADMINISTRADOR DE DATOS, Existe un OAD en concordancia a las tablas en Base de Datos
    public class EtiquetaEjemplarOAD
    {
   
        private cadconexion connect = new cadconexion();
        DataSet datos_Ejemplar;
        DataSet datos_Ejemplar2;
        DataSet datos_Ejemplar3;
        DataSet datos_Ejemplar5;
        DataSet datos_Ejemplar6;
        DataSet datos_Ejemplar7;
        DataSet datos_Ejemplar8;
        private String cadena = ConfigurationManager.ConnectionStrings["Mysql_conn"].ConnectionString;
        
        String rpta="";

   

        public void devolucion(string id_prestamo) {
            try
            {
                int id_prestam = Convert.ToInt16(id_prestamo);
                string sql = "update prestamo set estado='Devolucion' where id_prestamo='"+id_prestam+"';";
                connect.Grabar_mysql(sql);
              
            }
            catch (Exception ex)
            {
                System.Console.Write(ex.Message);
            }
        }

        public void Eliminar2(string dato,string dato2)
        {
           try
            {
                string sql = "delete from etiquetaejemplar  where etiq_id='"+dato+"' and  ejem_id='"+dato2+"';";
                connect.Grabar_mysql(sql);

            }
            catch (Exception ex)
            {
                System.Console.Write(ex.Message);
            }
            //  return datos_Ejemplar;

        }


      
        public DataSet consultar_1(){
            try{
            string sql="select e.etiq_id,e.etiq_fecha from etiqueta e left join etiquetaejemplar etej on e.etiq_id = etej.etiq_id where etej.etiq_id is null;";
            datos_Ejemplar = connect.EjecutarSelectMysql(sql);

            }catch(Exception ex){
            System.Console.Write(ex.Message);
            }
            return datos_Ejemplar;
        }


        public DataSet consultar_2()
        {
            try
            {
                string sql = "select e.ejem_id, l.titulo, l.autor, l.ISBN,etej.etiq_id from Ficha l inner join ejemplar e on l.ID_libro = e.ID_libro left join etiquetaejemplar etej on e.ejem_id = etej.ejem_id where etej.etiq_id is null;";
                datos_Ejemplar2 = connect.EjecutarSelectMysql(sql);
            }
            catch (Exception ex)
            {
                System.Console.Write(ex.Message);
            }
            return datos_Ejemplar2;
        }


        public DataSet consultar_3()
        {
            try
            {
                string sql = "select e.ejem_id, l.titulo, l.autor, l.ISBN, et.etiq_id from Ficha l inner join ejemplar e on l.ID_libro = e.ID_libro inner join etiquetaejemplar etej on e.ejem_id = etej.ejem_id inner join etiqueta et on et.etiq_id = etej.etiq_id;";
                datos_Ejemplar3 = connect.EjecutarSelectMysql(sql);
            }
            catch (Exception ex)
            {
                System.Console.Write(ex.Message);
            }
            return datos_Ejemplar3;
        }

        public DataSet consultar_5()
        {
            try
            {
                string sql = " select u.codigo,u.cedula,u.nombre,u.apellido,u.fecha,u.vinculacion,p.nombre as programa from usuario u inner join estudianteprograma ep on u.codigo=ep.fk_codigo inner join programa p on p.id_programa = ep.fk_id_programa where ep.estado=true; ";
                datos_Ejemplar5 = connect.EjecutarSelectMysql(sql);
            }
            catch (Exception ex)
            {
                System.Console.Write(ex.Message);
            }
            return datos_Ejemplar5;
        }


        public DataSet consultar_6()
        {
            try
            {
                string sql = "select e.ejem_id, l.titulo, l.autor, l.ISBN from Ficha l inner join ejemplar e on l.ID_libro = e.ID_libro inner join etiquetaejemplar ee on ee.ejem_id=e.ejem_id where e.ejem_id not in( select fk_ejem_id from prestamo where estado='Prestamo');"; 
                datos_Ejemplar6 = connect.EjecutarSelectMysql(sql);
            }
            catch (Exception ex)
            {
                System.Console.Write(ex.Message);
            }
            return datos_Ejemplar6;
        }

        public DataSet consultar_7()
        {
            try
            {
                string sql = "select p.id_prestamo,u.nombre,u.apellido, u.codigo,u.cedula,p.fecha_inicio,p.fecha_fin,l.titulo,l.autor,p.descripcion,p.estado,u.fecha,u.vinculacion,l.ISBN from usuario u inner join prestamo p on u.codigo=p.fk_codigo  inner join ejemplar e on e.ejem_id=p.fk_ejem_id inner join Ficha l on l.ID_libro=e.ID_libro;";
                datos_Ejemplar7 = connect.EjecutarSelectMysql(sql);
            }
            catch (Exception ex)
            {
                System.Console.Write(ex.Message);
            }
            return datos_Ejemplar7;
        }



       public string asociar_tag(string da , string id)
        {
            int  idi;
            idi = Convert.ToInt16(id);
           try
            {
                string sql = "insert into etiquetaejemplar values('" + da + "','"+idi+"',user(),now());";
                connect.Grabar_mysql(sql);

            }
            catch (Exception ex)
            {
                System.Console.Write(ex.Message);
            }
    
            return rpta;
        }


       public void insertar_prestamo(string codigo, string ejem_id, string fecha_inicio, string fecha_fin,string descripcion,string estado_prestamo) 
       {

           try
           {
               string fecha_inici = DateTime.Now.ToString("yyyy-MM-dd");
               string fecha_fi =  DateTime.Now.ToString("yyyy-MM-dd");
            
               string sql1 = "insert into prestamo(fk_codigo,fk_ejem_id,fecha_inicio,fecha_fin,estado,descripcion) values('" + codigo + "','" + ejem_id + "','"+fecha_inici+"','"+fecha_fi+"','"+estado_prestamo+"','"+descripcion + "');";
               connect.Grabar_mysql(sql1);

           }
           catch (Exception ex)
           {
               System.Console.Write(ex.Message);
           }
       }


        public DataSet buscar_ejemplar(int id){
          
            try {
             string sql="select id_ejemplar, titulo, autor, from Ficha l inner join ejemplar e on e.ID_libro = l.ID_libro and id_ejemplar="+id;
              datos_Ejemplar8=connect.EjecutarSelectMysql(sql);
       
            }catch(Exception ex){
                System.Console.Write(ex.Message);
            }
            return datos_Ejemplar8;
        }

    }
}