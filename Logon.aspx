<%@ Page Language="C#"  AutoEventWireup="true" CodeBehind="Logon.aspx.cs" Inherits="Sigc_net.Logon"  %>
<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>
<%@ Register assembly="Ext.Net.Utilities" namespace="Ext.Net.Utilities" tagprefix="ext" %>
<%@ Register assembly="Newtonsoft.Json" namespace="Newtonsoft.Json" tagprefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Universidad de la Amazonia 2010</title>
        <link rel="Shortcut Icon" href="/Resources/mages/ua2.ico"/>
    <link href="/Resources/Css/Desktop.css" rel="stylesheet" type="text/css" />
    <link href="/Resources/Css/jquery-ui-1.9.2.custom.css" rel="stylesheet" type="text/css" />
  
</head>
<body>
    <form id="form2" runat="server">
    <ext:ResourceManager ID="ResourceManager1" runat="server" Theme="Default">
    </ext:ResourceManager>

       <ext:window ID="win" runat="server" 
       Width="400" Height="250" 
       Title="Autenticacion de usuario"
     Icon="Lock"  Padding="15"  Closable="false"> 
    
     <Items>
     <ext:TextField ID="Usuario"  runat="server"  Width="280" ReadOnly="false"  AnchorHorizontal="80%" FieldLabel="        Usuario  "  AllowBlank="false"/>
               <ext:TextField ID="password"  InputType="Password"   Width="280"  ReadOnly="false" AnchorHorizontal="80%" runat="server"  FieldLabel="        Contraseña" AllowBlank="false"/>
                <ext:CheckBox ID="ComboBox1" runat="server" Margins="19"  FieldLabel=" No cerrar sesion"/>
                       <ext:Button ID="Ingresar" runat="server" Text="Ingresar" Icon="Accept" Scale="Medium" Flex="1">
                                  <DirectEvents>
                                        <Click OnEvent="btnIngresar_Click">
                                            <EventMask ShowMask="true" Msg="Cargando  ..." Target="Page" />
                                        </Click>
                                    </DirectEvents>
          </ext:Button>
    </Items>  
    <Content>
    <br />
        <p>
         <a href="#"> ¿Olvidó su nombre de usuario? </a>  
        </p>  
        <p>
            <a href="#"> ¿Necesita ayuda? </a>
        </p>   
        <p>
           <a href="#"> ¿Olvidó su contraseña? </a>
        </p>     
    
    </Content>
    </ext:window>
    </form>
</body>
</html>