using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using Ext.Net;
using Sigc_net.Controller.Seguridadlibro;



namespace Sigc_net.View.Private.biblioteca
{
    public partial class Desktop : System.Web.UI.Page
    {
     
        SeguridadCOD dato3 = new SeguridadCOD();
        
        protected void Page_Load(object sender, EventArgs e)
        {
         
            // Primer Registro
            GridPanel3.GetStore().DataSource = dato3.consultar_1();
            GridPanel3.DataBind();
          
            //Segundo Registro
            GridPanel1.GetStore().DataSource = dato3.consultar_2();
            GridPanel1.DataBind();

            //tercer registro
            GridPanel2.GetStore().DataSource = dato3.consultar_3();
            GridPanel2.DataBind();

     
        }


    

       protected void eliminar(object sender, DirectEventArgs e)
       {
           SeguridadCOD sc = new SeguridadCOD();
         
           if(codigo2.Text != "" && TextField21.Text == ""){
           sc.eliminar1(codigo2.Text);
           X.Msg.Notify("CONTROL RFID", " SE HA ELIMINADO CORRECTAMENTE UNA ETIQUETA   ").Show(); 
               codigo2.Text = "";
           }
           if (codigo2.Text != "" && TextField21.Text != "") {
               sc.eliminar2(codigo2.Text,TextField21.Text);
               X.Msg.Notify("CONTROL RFID", " SE HA DESVINCULADO CORRECTAMENTE UNA ETIQUETA DE UN LIBRO  ").Show(); 
               codigo2.Text = "";
               TextField21.Text = "";
               TextArea10.Text = "";
               TextArea20.Text = "";
           }
       }
      
 
       protected void asociar(object sender, DirectEventArgs e)
       {
           SeguridadCOD sc = new SeguridadCOD();
           if (codigo2.Text != "" && TextField21.Text != "")
           {
               sc.asociar_tag(codigo2.Text, TextField21.Text);
               X.Msg.Notify("CONTROL RFID", " SE HA REALIZADO CON EXITO UNA ASOCIACION RFID ").Show(); 
               codigo2.Text = "";
               TextField21.Text = "";
               TextArea10.Text = "";
               TextArea20.Text = "";
            
            }
           else {
               codigo2.Text = "";
               TextField21.Text = "";
               TextArea10.Text = "";
               TextArea20.Text = "";

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

       protected void consultar(object sender, DirectEventArgs e)
       {
           SeguridadCOD sc = new SeguridadCOD();
           sc.consultar_1();
       }


       protected void Logout_Click(object sender, DirectEventArgs e)
       {
           this.Response.Redirect("../../../Logon.aspx");
       }
   
       

       protected void vaciar(object sender, DirectEventArgs e)
       {
           codigo2.Text = "";
           TextField21.Text = "";
           TextArea10.Text = "";
           TextArea20.Text = "";
       }
    }
}