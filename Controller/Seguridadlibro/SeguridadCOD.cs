using System;
using System.Collections.Generic;
using System.Data;
using Sigc_net.Controller.Seguridadlibro.OAD;


namespace Sigc_net.Controller.Seguridadlibro
{
    //Permite controlar los OAD desde el COD
    //OAD: OBJETO ADMINISTRADOR DE DATOS, Existe un OAD en concordancia a las tablas en Base de Datos
    //COD: OBJETO CONTROLADOR DE DATOS, Existe un COD por modulo a desarrollar y que es llamado por la Vista.
    public class SeguridadCOD
    {

        private EtiquetaEjemplarOAD etiquetaEjemplar = new EtiquetaEjemplarOAD();
        
        private PermisoOAD permiso = new PermisoOAD();
        private EtiquetaOAD etiqueta = new EtiquetaOAD();
        private EjemplarOAD ejemplar=new EjemplarOAD();
        private UsuarioOAD usuario = new UsuarioOAD();
        private LibroOAD libro = new LibroOAD();
        


        //// FUNCIONES QUE MANIPULAN LOS OAD Y QUE LE COMUNICAN A LA VISTA

        public Boolean registrar(string ej){
            return etiqueta.insertar_tag(ej);
    }
        public Boolean validarEtiqueta(string codigo)
        {
            return etiqueta.validarEtiqueta(codigo);
        }

        public string asociar_tag(String da ,String ta) {
            return etiquetaEjemplar.asociar_tag(da,ta);
        }

        public void insertar_prestamo(string codigo,string ejem_id,string fecha_inicio,string fecha_fin,string descripcion , string estado_prestamo) {
            etiquetaEjemplar.insertar_prestamo( codigo,ejem_id,fecha_inicio,fecha_fin,descripcion,estado_prestamo);
        }

        public void eliminar1(string id) {
            etiqueta.Eliminar(id);
        }

        public void eliminar2(string dato1,string dato2) {
            etiquetaEjemplar.Eliminar2(dato1,dato2);
        }

        public void devolucion(string id_prestamo) {
            etiquetaEjemplar.devolucion(id_prestamo);
        }


        public DataSet consultar_1() {
            return etiquetaEjemplar.consultar_1();
        }

        public DataSet consultar_2()
        {
            return etiquetaEjemplar.consultar_2();
        }

        public DataSet consultar_3()
        {
            return etiquetaEjemplar.consultar_3();
        }


        public DataSet consultar_5()
        {
            return etiquetaEjemplar.consultar_5();
        }

        public DataSet consultar_6()
        {
            return etiquetaEjemplar.consultar_6();
        }


        public DataSet consultar_7()
        {
            return etiquetaEjemplar.consultar_7();
        }

        public DataSet buscar_Ejemplar(int id) {
            return ejemplar.buscar_ejemplar(id);
        }
    }
}