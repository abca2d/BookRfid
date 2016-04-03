using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Ext.Net;
using Sigc_net.Controller.Seguridadlibro;
using RFID.CLASE;
using ReaderB;

namespace Sigc_net.View.Private.biblioteca
{
    public partial class DesktopPrestamo : System.Web.UI.Page
    {
        SeguridadCOD dato2 = new SeguridadCOD();
       
        protected void Page_Load(object sender, EventArgs e)
        {

            fecha_inicio.Text = DateTime.Now.ToString("yyyy-MM-dd");
        
            //El listado de estudiantes
            GridPanel15.GetStore().DataSource = dato2.consultar_5();
            GridPanel15.DataBind();

            GridPanel16.GetStore().DataSource = dato2.consultar_6();
            GridPanel16.DataBind();

             GridPanel17.GetStore().DataSource = dato2.consultar_7();
             GridPanel17.DataBind();

            

            // foto.ImageUrl("/Resources/mages/images.jpg");
        }



        [DirectMethod]
        public void ValidarTag()
        {
            string response;
            RFID.CLASE.RFID del = new RFID.CLASE.RFID("192.168.1.250", "27011");
            string etiqueta;
            Boolean valor = false;
            int i = 0;
              response = del.iniciarDeteccion();
          
            if (response == "YES")
           {
             etiqueta = del.Tag;
             del.detenerDeteccion();
             valor = dato2.validarEtiqueta(etiqueta);
               if (valor == true)
               {
                   X.MessageBox.Show(new MessageBoxConfig
                    {
                        Title = "Advertencia .",
                        Message = "Acceso no authorizad de salida para el TAG ",
                        Buttons = MessageBox.Button.OK,
                        Icon = MessageBox.Icon.ERROR,
                        Closable = false
                    });
               }
           }
           else {
               X.MessageBox.Notify("Control RFID",response).Show();
           }
        }

       protected void conexion(object sender, DirectEventArgs e)
       {
           X.MessageBox.Show(new MessageBoxConfig
           {
               Title = "Error.",
               Message = "No se pudo conectar al lector RFID",
               Buttons = MessageBox.Button.OK,
               Icon = MessageBox.Icon.ERROR,
               Closable = false
           }); 
       
       }


       protected void Logout_Click(object sender, DirectEventArgs e)
       {
        this.Response.Redirect("../../../Logon.aspx");
       }


       protected void consultar(object sender, DirectEventArgs e)
       {
           SeguridadCOD sc = new SeguridadCOD();
           sc.consultar_1();
       }


   

       protected void desconectar(object sender, DirectEventArgs e)
       { }

       protected void insertar_prestamo(object sender, DirectEventArgs e) {
           SeguridadCOD sc = new SeguridadCOD();
           if (ComboBox80.Text == "Devolucion")
           {
               sc.devolucion(id_prestamo.Text);
               id_prestamo.Text = "";
           }
           else {
               if (tf10.Text == "")
               {
                   X.MessageBox.Show(new MessageBoxConfig
                   {
                       Title = "Advertencia .",
                       Message = "Seleccione un Estudiante Para El Proceso de Prestamo",
                       Buttons = MessageBox.Button.OK,
                       Icon = MessageBox.Icon.ERROR,
                       Closable = false
                   });
                   if (ejem_id1.Text == "")
                   {
                       X.MessageBox.Show(new MessageBoxConfig
                       {
                           Title = "Advertencia .",
                           Message = "Seleccione un Libro Para El Proceso de Prestamo",
                           Buttons = MessageBox.Button.OK,
                           Icon = MessageBox.Icon.ERROR,
                           Closable = false
                       });
                   }
               }
               else
               {
                   sc.insertar_prestamo(tf10.Text, ejem_id1.Text, fecha_inicio.Text, fecha_fin.Text, descripcion.Text, ComboBox80.Text);
                   X.MessageBox.Notify(" SISTEMA CHAIRA "," SE REALIZO CON EXITO EÑ REGISTRO DE UN PRESTAMO / DEVOLUCION").Show();
                   tf10.Text = "";
                   tf20.Text = "";
                   tf30.Text = "";
                   tf40.Text = "";
                   tf50.Text = "";
                   tf60.Text = "";
                   tf70.Text = "";
                   titulo1.Text = "";
                   autor1.Text = "";
                   isbn1.Text = "";
                   ejem_id1.Text = "";
                   fecha_inicio.Text = "";
                   fecha_fin.Text = "";
                   descripcion.Text = "";
               }
           }
       }
    }
}


