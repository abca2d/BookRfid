using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Ext.Net;
using Sigc_net.Controller.Seguridadlibro;
using ReaderB;
using RFID.CLASE;



namespace Sigc_net.View.Private.biblioteca
{
    public partial class DesktopAdministrador : System.Web.UI.Page
    {
        SeguridadCOD dato1 = new SeguridadCOD();
        RFID.CLASE.RFID del = new RFID.CLASE.RFID("192.168.1.250", "27011");
        protected void Page_Load(object sender, EventArgs e)
        {
            fecha_inicio.Text = DateTime.Now.ToString("yyyy-MM-dd");
            // Primer Registro
            GridPanel3.GetStore().DataSource = dato1.consultar_1();
            GridPanel3.DataBind();

            //Segundo Registro
            GridPanel1.GetStore().DataSource = dato1.consultar_2();
            GridPanel1.DataBind();

            //tercer registro
            GridPanel2.GetStore().DataSource = dato1.consultar_3();
            GridPanel2.DataBind();

            //El listado de estudiantes
            GridPanel5.GetStore().DataSource = dato1.consultar_5();
            GridPanel5.DataBind();

            GridPanel6.GetStore().DataSource = dato1.consultar_6();
            GridPanel6.DataBind();

            GridPanel7.GetStore().DataSource = dato1.consultar_7();
            GridPanel7.DataBind();
        }

    [DirectMethod]
     public void DetectarTag()
        {
         string etiqueta="";
         string response = "";
      
           response=del.iniciarDeteccion();
           if (response.Equals("YES")) {
              etiqueta = del.Tag;
            if(etiqueta!=""){
              X.MessageBox.Notify("Control RFID", " Se detecto con exito la etiqueta " + etiqueta).Show();
              codigo.SetValue(etiqueta);
            }
              del.detenerDeteccion(); ;  
            }
    }

    protected void desconectar(object sender, DirectEventArgs e)
    { }


    protected void insertar_prestamo(object sender, DirectEventArgs e)
    {
        SeguridadCOD sc = new SeguridadCOD();
        if (ComboBox8.Text == "Devolucion")
        {
            sc.devolucion(id_prestamo.Text);
            id_prestamo.Text = "";
        }
        else
        {
            if (tf1.Text == "")
            {
                X.MessageBox.Show(new MessageBoxConfig
                {
                    Title = "Advertencia .",
                    Message = "Seleccione un Estudiante Para El Proceso de Prestamo",
                    Buttons = MessageBox.Button.OK,
                    Icon = MessageBox.Icon.ERROR,
                    Closable = false
                });
                if (ejem_id.Text == "")
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
                sc.insertar_prestamo(tf1.Text, ejem_id.Text, fecha_inicio.Text, fecha_fin.Text, descripcion.Text, ComboBox8.Text);
                X.MessageBox.Notify(" SISTEMA CHAIRA ", " SE REALIZO CON EXITO EÑ REGISTRO DE UN PRESTAMO / DEVOLUCION").Show();
                tf1.Text = "";
                tf2.Text = "";
                tf3.Text = "";
                tf4.Text = "";
                tf5.Text = "";
                tf6.Text = "";
                tf7.Text = "";
                titulo.Text = "";
                autor.Text = "";
                isbn.Text = "";
                ejem_id.Text = "";
                fecha_inicio.Text = "";
                fecha_fin.Text = "";
                descripcion.Text = "";
            }
        }
    }



        protected void registrar(object sender, DirectEventArgs e)
        {
             SeguridadCOD sc = new SeguridadCOD();
            Boolean respuesta;
            if (codigo.Text != "")
            {
               respuesta = sc.registrar(codigo.Text);
              if (respuesta == false)
                               {
                                   X.MessageBox.Show(new MessageBoxConfig
                                   {
                                       Title = "Error.",
                                       Message = "Codigo RFID ya existe",
                                       Buttons = MessageBox.Button.OK,
                                       Icon = MessageBox.Icon.ERROR,
                                       Closable = false
                                   });
                               }
                               if (respuesta == true)
                               {
                               X.Msg.Notify("Se ha producido una evento RFID", "Codigo de Etiqueta RFID registrado correctamentte").Show(); 
                               }
                           }
                           else
                           {
                               X.MessageBox.Show(new MessageBoxConfig
                               {
                                   Title = "Advertencia.",
                                   Message = "Seleccione un codigo RFID ",
                                   Buttons = MessageBox.Button.OK,
                                   Icon = MessageBox.Icon.ERROR,
                                   Closable = false
                               });
                               
            }
            codigo.Text = "";
      }


        protected void asociar(object sender, DirectEventArgs e)
        {
            SeguridadCOD sc = new SeguridadCOD();
            if (codigo.Text != "" && TextField1.Text != "")
            {
                sc.asociar_tag(codigo.Text, TextField1.Text);
                X.Msg.Notify("CONTROL RFID","SE HA REALIZADO CON EXITO UNA ASOCIACION RFID").Show();
                codigo.Text = "";
                TextField1.Text = "";
                TextArea1.Text = "";
                TextArea2.Text = "";
            }
            else
            {
                X.MessageBox.Show(new MessageBoxConfig
                {
                    Title = "Advertencia .",
                    Message = "Seleccione un Codigo  RFID  y codigo de ejemplar validos",
                    Buttons = MessageBox.Button.OK,
                    Icon = MessageBox.Icon.ERROR,
                    Closable = false
                });
            }
        }

        protected void eliminar(object sender, DirectEventArgs e)
        {
            SeguridadCOD sc = new SeguridadCOD();

            if (codigo.Text != "" && TextField1.Text == "")
            {
                sc.eliminar1(codigo.Text);
                codigo.Text = "";
            }
            if (codigo.Text != "" && TextField1.Text != "")
            {
                sc.eliminar2(codigo.Text, TextField1.Text);
                codigo.Text = " ";
                TextField1.Text = " ";
                TextArea1.Text = "";
                TextArea2.Text = "";
            }
        }

  

        protected void Salir(object sender, DirectEventArgs e)
        {
            this.winBrowser1.Close();
        }

 
        protected void Logout_Click(object sender, DirectEventArgs e)
        {
          this.Response.Redirect("../../../Logon.aspx");
        }

        protected void vaciar(object sender, DirectEventArgs e)
        {
         codigo.Text = "";
            TextField1.Text = "";
            TextArea1.Text = "";
            TextArea2.Text = "";
        }
    }
}