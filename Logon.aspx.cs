using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Ext.Net;


namespace Sigc_net
{
    public partial class Logon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

       
        protected void btnIngresar_Click(object sender, DirectEventArgs e)
        {
            //View/Private/Biblioteca/Desktop.aspx
            if (Usuario.Text == "Prestamista"){
                Response.Redirect("Redirecting.htm?page=View/Private/Biblioteca/DesktopPrestamo.aspx");
            }
            if(Usuario.Text == "Administrador"){
              Response.Redirect("Redirecting.htm?page=View/Private/Biblioteca/DesktopAdministrador.aspx");
            }
            if (Usuario.Text == "Procesostecnicos"){
                Response.Redirect("Redirecting.htm?page=View/Private/Biblioteca/DesktopProcesostecnicos.aspx");
            }
          
        }

    }
}