﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Sigc_net
{
    public class Global : System.Web.HttpApplication
    {
        //** Cadenas de Conexion
     
        //---------------
      //** data_Empresa
        public static Boolean Combus = false;
        public static string Empresa = "GAS CAQUETA S.A.";
        public static string Nit = "828000499";

        /**/
        public static String path = "";
        public static Dictionary<string, string> _user = new Dictionary<string, string>();


        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}