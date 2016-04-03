<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DesktopAdministrador.aspx.cs" Inherits="Sigc_net.View.Private.biblioteca.DesktopAdministrador" %>


<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>
<%@ Register assembly="Ext.Net.Utilities" namespace="Ext.Net.Utilities" tagprefix="ext" %>
<%@ Register assembly="Ext.Net.UX" namespace="Ext.Net.UX" tagprefix="ext" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Universidad de la Amazonia</title>    
      <link rel="Shortcut Icon" href="/Resources/mages/ua2.ico"/>
      <script type="text/javascript" src="/Resources/Scripts/Concurrent.Thread.js"></script> 
    <style type="text/css">        
        .start-button {
            background-image: url(/Resources/mages/btn-icon.jpg) !important;
            background-repeat: no-repeat;
         }
         .desktopEl {
            position: absolute !important;
        }
      
        #foto
        {
            float:right;
            padding-right:5px;
            }
         </style>
    
</head>
<body>
    <form id="Form1" runat="server">
        <ext:ResourceManager ID="ResourceManager1" runat="server">
            <Listeners>
                <DocumentReady Handler="Ext.Ajax.timeout = 2000;" />
            </Listeners>
        </ext:ResourceManager>
  <script type="text/javascript">
      function proceso() {
          while (true) {
              Ext.onReady(function () {
                  Ext.net.DirectMethods.DetectarTag();
              });
              Concurrent.Thread.sleep(1080);  
          }
      }

      Concurrent.Thread.create(proceso);

      var notifyEnter = function (ddSource, e, data) {
          FormPanel1.body.stopFx();
          FormPanel1.body.highlight();
      };

      var notifyDrop = function (ddSource, e, data) {
          var selectedRecord = ddSource.dragData.selections[0];
          FormPanel1.getForm().loadRecord(selectedRecord);
      }
    </script>
        <ext:Desktop 
            ID="MyDesktop" 
            runat="server" 
            wallpaper="/Resources/mages/desktop.jpg"
            BackgroundColor="white" 
            ShortcutTextColor="White">
            <StartButton Text=" ´´´´´´´´´´´´´´´´´´´´´´´´´´"  IconCls="start-button"  />
            <Listeners>
                <ShortcutClick Handler="var d=#{MyDesktop}.getDesktop(); if(id == 'scTile'){d.tile();}else if(id == 'scCascade'){d.cascade();}" />
            </Listeners>
            <StartMenu Width="450" Height="400" ToolsWidth="170" Title="Menu Inicio: Usuario" Icon="User">
                <ToolItems>
                    <ext:MenuItem Text="Configuracion" Icon="Wrench" ID="ctl146">
                          <Menu>
                                      <ext:Menu ID="Menu1" runat="server">
                                         <Items>
                                         <ext:MenuItem Text=" Cambiar Contraseña " Icon="lock"  >
                                        <Listeners>
                                            <Click Handler="" />
                                        </Listeners>
                                        </ext:MenuItem>
                                        <ext:MenuItem Text=" Temas " Icon="TextTab">
                                        <Listeners>
                                            <Click Handler="" />
                                        </Listeners>
                                        </ext:MenuItem>
                                        </Items>
                                        </ext:Menu>
                                       </Menu>
                    </ext:MenuItem>
                    <ext:MenuItem Text="Salir" Icon="Disconnect" ID="ctl148">
                    <DirectEvents>
                            <Click OnEvent="Logout_Click">                     
                                <EventMask ShowMask="true" Msg="  Saliendo de la plataforma CHAIRA  " MinDelay="1000" />
                                  </Click>
                        </DirectEvents>
                    </ext:MenuItem>
                    <ext:MenuSeparator ID="ctl150" />
            
                </ToolItems>
                <Items>
                    <%--  Menu de Administrador --%>
                    <ext:MenuItem ID="MenuItem1"  runat="server" Text=" Funcionario " Icon="FolderExplore" HideOnClick="false">
                        <Menu>
                            <ext:Menu ID="Menu2" runat="server">
                                <Items>
                                    <ext:MenuItem Text=" Biblioteca  UA " Icon="FolderExplore" ID="ctl152" >
                                    <Menu>
                                          <ext:Menu ID="Menu3" runat="server">
                                <Items>
                                         <ext:MenuItem Text=" Control RFID " Icon="Application"  >
                                        <Listeners>
                                        <Click Handler="#{winBrowser1}.show()"/>
                                        </Listeners>
                                        </ext:MenuItem>
                                        <ext:MenuItem Text=" Prestamo " Icon="Application"  >
                                        <Listeners>
                                        <Click Handler="#{configuration}.show()"/>
                                        </Listeners>
                                        </ext:MenuItem>
                                        </Items>
                                        </ext:Menu>
                                       </Menu>
                                    </ext:MenuItem>
                                </Items>
                            </ext:Menu>
                        </Menu>
                    </ext:MenuItem>
                    <ext:MenuSeparator ID="ctl156" />

            
                       <%-- Final de Menu --%>

                </Items>
            </StartMenu> 
        </ext:Desktop>  

  <ext:DesktopWindow 
            ID="winBrowser1" 
            runat="server" 
            Title="Sistema de Seguridad RFID" 
            Icon="lock"           
            Width="700"
            Height="480"
            PageX="250" 
            PageY="5">
                 <Content>
                  <ext:FormPanel 
                            ID="FormPanel1" 
                            runat="server"
                            BodyStyle="background-color: #DFE8F6"
                            Padding="10"
                            LabelWidth="100" Collapsible="true" Title="Asociacion de Etiquetas y Libros">       
                            <Items>  
                    <ext:TextField ID="TextField1" runat="server"  FieldLabel="N. del Ejemplar" ReadOnly="true"  DataIndex="ejem_id"/>   
                    <ext:TextArea ID="TextArea1" runat="server"  FieldLabel="Titulo" Width="500"  ReadOnly="true" Height="60"  DataIndex="titulo"></ext:TextArea>
                    <ext:TextArea ID="TextArea2" runat="server" FieldLabel=" Autor " Width="500" Height="60" ReadOnly="true" DataIndex="autor"></ext:TextArea>
                    <ext:TextField ID="codigo" runat="server" FieldLabel="  Codigo RFID  " ReadOnly="true" Width="300" DataIndex="etiq_id" ></ext:TextField>   
                    </Items>
               </ext:FormPanel>
            </Content>
        <Content>
        <ext:Panel ID="Panel1" runat="server">
          <Items>
                    <ext:TabPanel ID="TabPanel1" runat="server" Plain="true" Height="180" Width="680" >
                    <Items> 
                         <ext:GridPanel ID="GridPanel3"   Title="Etiquetas RFID"  runat="server" 
                            DDGroup="gridDDGroup"
                            EnableDragDrop="true"
                            StripeRows="true">
                    <Store>
                         <ext:Store ID="Store3" runat="server" >
                            <Reader>
                                  <ext:JsonReader>
                                       <Fields>
                                          <ext:RecordField Name="etiq_id" Type="String" />
                                          <ext:RecordField Name="etiq_fecha"  Type="Date" />
                                       </Fields>
                                  </ext:JsonReader>
                            </Reader>
                        </ext:Store>
                  </Store>

             <ColumnModel ID="ColumnModel3" runat="server">
                <Columns>
                   <ext:RowNumbererColumn />
                    <ext:Column ColumnID="etiq_id" Header="Codigo" Width="220" DataIndex="etiq_id" />
                    <ext:Column ColumnID="etiq_fecha" Header="Fecha lectura del tag" Width="190" DataIndex="etiq_fecha" />
                </Columns>
            </ColumnModel>
            <SelectionModel>
                <ext:RowSelectionModel ID="RowSelectionModel3" runat="server" >
                     <Listeners>
                                        <RowSelect Handler="#{FormPanel1}.getForm().loadRecord(record);" />
                        </Listeners>
                </ext:RowSelectionModel>
            </SelectionModel>
                <LoadMask ShowMask="true" />      
            <BottomBar>
                 <ext:PagingToolbar ID="PagingToolbar3" runat="server" PageSize="10">
                    <Items>
                        <ext:Label ID="Label3" runat="server" Text="Page size:" />
                        <ext:ToolbarSpacer ID="ToolbarSpacer3" runat="server" Width="10" />
                        <ext:ComboBox ID="ComboBox3" runat="server" Width="80">
                            <Items>
                                <ext:ListItem Text="1" />
                                <ext:ListItem Text="2" />
                                <ext:ListItem Text="10" />
                                <ext:ListItem Text="20" />
                            </Items>
                            <SelectedItem Value="10" />
                            <Listeners>
                                <Select Handler="#{PagingToolbar3}.pageSize = parseInt(this.getValue()); #{PagingToolbar3}.doLoad();" />
                            </Listeners>
                        </ext:ComboBox>
                    </Items>
                </ext:PagingToolbar>
            </BottomBar>
       </ext:GridPanel>
                        <%--** Entrada Articulos--%>
        <ext:GridPanel ID="GridPanel1" runat="server" Title="Ejemplares sin Tag RFID" 
        DDGroup="gridDDGroup"   EnableDragDrop="true"> 
          <Store>
                <ext:Store ID="Store1" runat="server">
                    <Reader>
                        <ext:JsonReader>
                            <Fields>
                                <ext:RecordField Name="ejem_id" />
                                <ext:RecordField Name="titulo" Type="String" />
                                <ext:RecordField Name="autor" Type="String" />
                                <ext:RecordField Name="ISBN" Type="String" />
                                <ext:RecordField Name="Num_etiq" Type="String" />
                            </Fields>
                     </ext:JsonReader>
                    </Reader>
                </ext:Store>
            </Store>
            
              <ColumnModel ID="ColumnModel2" runat="server">
                <Columns>
                   <ext:RowNumbererColumn />
                   <ext:Column ColumnID="ejem_id" Header="ID Ejemplar" Width="100" DataIndex="ejem_id" >
                   </ext:Column>
                   <ext:Column ColumnID="titulo" Header="Titulo" Width="190" DataIndex="titulo" >
                   </ext:Column>
                   <ext:Column ColumnID="autor" Header="Autor" Width="170" DataIndex="autor" >
                   </ext:Column>
                   <ext:Column ColumnID="ISBN" Header="ISBN" Width="90" DataIndex="ISBN" >
                   </ext:Column>
                   <ext:Column ColumnID="Num_etiq" Header="Num. Etiqueta" Width="160" DataIndex="Num_etiq" >
                   </ext:Column>
                </Columns>
            </ColumnModel>
            <SelectionModel>
                <ext:RowSelectionModel ID="RowSelectionModel2" runat="server"  SingleSelect="true">
                       <Listeners>
                            <RowSelect Handler="#{FormPanel1}.getForm().loadRecord(record);" />
                       </Listeners>
                </ext:RowSelectionModel>   
            </SelectionModel>
        <LoadMask ShowMask="true" />
            <BottomBar>
                 <ext:PagingToolbar ID="PagingToolbar2" runat="server" PageSize="10">
                    <Items>
                        <ext:Label ID="Label2" runat="server" Text="Page size:" />
                        <ext:ToolbarSpacer ID="ToolbarSpacer2" runat="server" Width="10" />
                        <ext:ComboBox ID="ComboBox2" runat="server" Width="80">
                            <Items>
                                <ext:ListItem Text="1" />
                                <ext:ListItem Text="2" />
                                <ext:ListItem Text="10" />
                                <ext:ListItem Text="20" />
                            </Items>
                            <SelectedItem Value="10" />
                            <Listeners>
                                <Select Handler="#{PagingToolbar2}.pageSize = parseInt(this.getValue()); #{PagingToolbar2}.doLoad();" />
                            </Listeners>
                        </ext:ComboBox>
                    </Items>
                </ext:PagingToolbar>
            </BottomBar>
      </ext:GridPanel>                     
                        <%--** segunda tab --%>
            <ext:GridPanel ID="GridPanel2" runat="server" Title="Ejemplares con Tag RFID" DDGroup="gridDDGroup"   EnableDragDrop="true">
          <Store>
                <ext:Store ID="Store2" runat="server" >
                    <Reader>
                      <ext:JsonReader>
                            <Fields>
                                <ext:RecordField Name="ejem_id" />
                                <ext:RecordField Name="titulo" Type="String" />
                                <ext:RecordField Name="autor" Type="String" />
                                <ext:RecordField Name="ISBN" Type="String" />
                                <ext:RecordField Name="etiq_id" Type="String" />
                                <ext:RecordField Name="perm_estado" Type="String"/>
                            </Fields>
                            </ext:JsonReader>
                    </Reader>
                </ext:Store>
            </Store>

                <ColumnModel ID="ColumnModel1" runat="server">
                <Columns>
                <ext:RowNumbererColumn />
                  <ext:Column ColumnID="ejem_id" Header="ID Ejemplar" Width="100" DataIndex="ejem_id" />
                  <ext:Column ColumnID="titulo" Header="Titulo" Width="190" DataIndex="titulo" />
                  <ext:Column ColumnID="autor" Header="Autor" Width="170" DataIndex="autor" />
                  <ext:Column ColumnID="ISBN" Header="ISBN" Width="90" DataIndex="ISBN" />
                  <ext:Column ColumnID="etiq_id" Header="Num. Etiqueta" Width="160" DataIndex="etiq_id" />
                  <ext:Column ColumnID="perm_estado" Header="Estado Permiso" Width="120" DataIndex="perm_estado" />
                </Columns>
            </ColumnModel>
            <SelectionModel>
                <ext:RowSelectionModel ID="RowSelectionModel1" runat="server">
                       <Listeners>
                                        <RowSelect Handler="#{FormPanel1}.getForm().loadRecord(record);" />
                       </Listeners>
                </ext:RowSelectionModel>
            </SelectionModel>
  <LoadMask ShowMask="true" />
             <BottomBar>
                 <ext:PagingToolbar ID="PagingToolbar1" runat="server" PageSize="10">
                    <Items>
                        <ext:Label ID="Label1" runat="server" Text="Page size:" />
                        <ext:ToolbarSpacer ID="ToolbarSpacer1" runat="server" Width="10" />
                        <ext:ComboBox ID="ComboBox1" runat="server" Width="80">
                            <Items>
                                <ext:ListItem Text="1" />
                                <ext:ListItem Text="2" />
                                <ext:ListItem Text="10" />
                                <ext:ListItem Text="20" />
                            </Items>
                            <SelectedItem Value="10" />
                            <Listeners>
                                <Select Handler="#{PagingToolbar1}.pageSize = parseInt(this.getValue()); #{PagingToolbar1}.doLoad();" />
                            </Listeners>
                        </ext:ComboBox>
                    </Items>
                </ext:PagingToolbar>
            </BottomBar>
                        </ext:GridPanel>
                              </Items>
                                  </ext:TabPanel>
                        </Items>
        </ext:Panel>
        </Content>

        
<Content>
                           <ext:GridPanel ID="GridPanel4"   Title="Visor de Eventos RFID"  runat="server" 
                            DDGroup="gridDDGroup"
                            EnableDragDrop="true"
                            StripeRows="true" Collapsible="true" Height="190">
                    <Store>
                         <ext:Store ID="Store4" runat="server" >
                            <Reader>
                                  <ext:JsonReader>
                                       <Fields>
                                          <ext:RecordField Name="etiq_id" Type="String" />
                                          <ext:RecordField Name="etiq_fecha"  Type="Date" />
                                       </Fields>
                                  </ext:JsonReader>
                            </Reader>
                        </ext:Store>
                  </Store>

             <ColumnModel ID="ColumnModel4" runat="server">
                <Columns>
                    <ext:RowNumbererColumn />
                    <ext:Column ColumnID="etiq_id" Header="Codigo" Width="220" DataIndex="etiq_id" />
                    <ext:Column ColumnID="etiq_fecha" Header="Evento" Width="190" DataIndex="etiq_fecha" />
                    <ext:Column ColumnID="etiq_fecha" Header="Fecha Lectura" Width="190" />
                </Columns>
            </ColumnModel>
            <SelectionModel>
                <ext:RowSelectionModel ID="RowSelectionModel4" runat="server" />
            </SelectionModel>
                <LoadMask ShowMask="true" />      
            <BottomBar>
                 <ext:PagingToolbar ID="PagingToolbar41" runat="server" PageSize="10">
                    <Items>
                        <ext:Label ID="Label4" runat="server" Text="Page size:" />
                        <ext:ToolbarSpacer ID="ToolbarSpacer4" runat="server" Width="10" />
                        <ext:ComboBox ID="ComboBox4" runat="server" Width="80">
                            <Items>
                                <ext:ListItem Text="1" />
                                <ext:ListItem Text="2" />
                                <ext:ListItem Text="10" />
                                <ext:ListItem Text="20" />
                            </Items>
                            <SelectedItem Value="10" />
                            <Listeners>
                                <Select Handler="#{PagingToolbar41}.pageSize = parseInt(this.getValue()); #{PagingToolbar41}.doLoad();" />
                            </Listeners>
                        </ext:ComboBox>
                    </Items>
                </ext:PagingToolbar>
            </BottomBar>
       </ext:GridPanel>
       </Content>
       
                      <Buttons>
                                <ext:Button ID="Button8" runat="server" Text="Registrar Tag"  Icon="Accept">
                                        <DirectEvents>
                                        <Click OnEvent="registrar">
                                            <EventMask ShowMask="true" Msg="Cargando  ..." Target="Page" />
                                        </Click>
                                    </DirectEvents>
                                   </ext:Button>
                                   <ext:Button ID="Button1" runat="server" Text=" Asociar " Icon="Accept">
                                       <DirectEvents>
                                        <Click OnEvent="asociar">
                                            <EventMask ShowMask="true" Msg="Cargando  ..." Target="Page" />
                                        </Click>
                                    </DirectEvents>
                                   </ext:Button>
                                  <ext:Button ID="Button2" runat="server" Text="Eliminar" Icon="cancel">
                                      <DirectEvents>
                                        <Click OnEvent="eliminar">
                                            <EventMask ShowMask="true" Msg="Cargando  ..." Target="Page" />
                                        </Click>
                                    </DirectEvents>
                                   </ext:Button>
                                     <ext:Button ID="Button4" runat="server" Text="Vaciar" Icon="DoorOut">
                                         <DirectEvents>
                                        <Click OnEvent="vaciar">
                                      </Click>
                                    </DirectEvents>
                                   </ext:Button>
                                   </Buttons>
                                 
                             </ext:DesktopWindow>
   <ext:DropTarget ID="DropTarget1" runat="server" Target="={FormPanel1.body.dom}" Group="gridDDGroup">  
            <NotifyEnter Fn="notifyEnter" /> 
            <NotifyDrop Fn="notifyDrop" />
   </ext:DropTarget>  

 <ext:DesktopWindow ID="configuration"  runat="server" 
            Title="Prestamo de Libros" 
            Icon="lock"           
            Width="880"
            Height="540"
            PageX="190" 
            PageY="5">
            <%-- contenido de los Estudiantes form + tabla--%>        
          <Content>
          <ext:FormPanel 
                            ID="FormPanel2" 
                            runat="server"
                            BodyStyle="background-color: #DFE8F6"
                            Padding="10"
                            LabelWidth="100" Collapsible="true" Title="Datos del Estudiante">   
<Content>
       <ext:Image ID="foto" Height="165" Width="170"   ImageUrl="/Resources/mages/images.jpg" runat="server"></ext:Image> 
       <ext:TextField ID="tf1" runat="server" class="derecha" FieldLabel=" Codigo " ReadOnly="true"  Width="290"  DataIndex="codigo" />
       <ext:TextField ID="tf2" runat="server" class="derecha" FieldLabel="Cedula "  Width="350" ReadOnly="true" DataIndex="cedula"/>
       <ext:TextField ID="tf3" runat="server" class="derecha" FieldLabel=" Nombre " Width="260" ReadOnly="true" DataIndex="nombre" />
       <ext:TextField ID="tf4" runat="server" class="derecha" FieldLabel="Apellido " Width="150" ReadOnly="true" DataIndex="apellido" />
       <ext:TextField ID="tf5" runat="server" class="derecha" FieldLabel=" Fecha " Width="150" ReadOnly="true" DataIndex="fecha" />
       <ext:TextField ID="tf6" runat="server" class="derecha" FieldLabel=" Vinculacion " Width="350" ReadOnly="true" DataIndex="vinculacion" />
       <ext:TextField ID="tf7" runat="server" class="derecha" FieldLabel=" Programa " Width="150" ReadOnly="true" DataIndex="programa" />
</Content>           
       </ext:FormPanel> 
       </Content>
<Content>
  <ext:GridPanel ID="GridPanel5" runat="server" Title="Listado de Estudiantes"  Height="180" Collapsible="true"   >
          <Store>
                <ext:Store ID="Store5" runat="server" >
                    <Reader>
                      <ext:JsonReader>
                            <Fields>
                                <ext:RecordField Name="codigo" />
                                <ext:RecordField Name="cedula" Type="String" />
                                <ext:RecordField Name="nombre" Type="String" />
                                <ext:RecordField Name="apellido" Type="String" />
                                <ext:RecordField Name="fecha" Type="Date" />
                                <ext:RecordField Name="vinculacion" Type="Date" />
                               <ext:RecordField Name="programa" Type="String"/>
                            </Fields>
                            </ext:JsonReader>
                    </Reader>
                </ext:Store>
            </Store>
                <ColumnModel ID="ColumnModel5" runat="server">
                <Columns>
                <ext:RowNumbererColumn />
                  <ext:Column ColumnID="codigo" Header=" Codigo " Width="100" DataIndex="codigo" />
                  <ext:Column ColumnID="cedula" Header=" Cedula  " Width="90" DataIndex="cedula" />
                  <ext:Column ColumnID="nombre" Header=" Nombres " Width="170" DataIndex="nombre" />
                  <ext:Column ColumnID="apellido" Header=" Apellidos " Width="170" DataIndex="apellido" />
                  <ext:Column ColumnID="fecha" Header=" Fecha " Width="170" DataIndex="fecha" />
                  <ext:Column ColumnID="vinculacion" Header="  Vinculacion " Width="170" DataIndex="vinculacion" />
                  <ext:Column ColumnID="programa" Header=" Programa " Width="120" DataIndex="programa" />
                </Columns>
            </ColumnModel>
            <SelectionModel>
                <ext:RowSelectionModel ID="RowSelectionModel5" runat="server">
                       <Listeners>
                          <RowSelect Handler="#{FormPanel2}.getForm().loadRecord(record); if(codigo==172005243){nombre='adriancho' };" />
                       </Listeners>
                </ext:RowSelectionModel>
            </SelectionModel>
  <LoadMask ShowMask="true" />
             <BottomBar>
                 <ext:PagingToolbar ID="PagingToolbar4" runat="server" PageSize="10">
                    <Items>
                        <ext:Label ID="Label5" runat="server" Text="Page size:" />
                        <ext:ToolbarSpacer ID="ToolbarSpacer5" runat="server" Width="10" />
                        <ext:ComboBox ID="ComboBox5" runat="server" Width="80">
                            <Items>
                                <ext:ListItem Text="1" />
                                <ext:ListItem Text="2" />
                                <ext:ListItem Text="10" />
                                <ext:ListItem Text="20" />
                            </Items>
                            <SelectedItem Value="10" />
                            <Listeners>
                                <Select Handler="#{PagingToolbar4}.pageSize = parseInt(this.getValue()); #{PagingToolbar4}.doLoad();" />
                            </Listeners>
                        </ext:ComboBox>
                    </Items>
                </ext:PagingToolbar>
            </BottomBar>
                        </ext:GridPanel>
</Content>
<%-- contenido del segundo form + table de ejemplares  --%>
          <Content>
                  <ext:FormPanel 
                            ID="FormPanel3" 
                            runat="server"
                            BodyStyle="background-color: #DFE8F6"
                            Padding="10"
                            LabelWidth="100" Collapsible="true" Title="Datos del Ejemplar">   
                            <Items>   
       <ext:TextField ID="ejem_id" runat="server" FieldLabel=" Codigo " DataIndex="ejem_id" Width="290"></ext:TextField>
       <ext:TextField ID="titulo" runat="server" FieldLabel="Titulo " DataIndex="titulo" Width="350"></ext:TextField>
       <ext:TextField ID="autor" runat="server" FieldLabel=" Autor " DataIndex="autor" Width="320"></ext:TextField>
        <ext:TextField ID="isbn" runat="server" FieldLabel=" ISBN " DataIndex="ISBN" Width="250"></ext:TextField>
       </Items>
       </ext:FormPanel> 
        </Content>
<Content>
  <ext:GridPanel ID="GridPanel6" runat="server" Title="Listado de Los Ejemplares"   Height="180"  Collapsible="true">
          <Store>
                <ext:Store ID="Store6" runat="server" >
                    <Reader>
                      <ext:JsonReader>
                            <Fields>
                                <ext:RecordField Name="ejem_id" />
                                <ext:RecordField Name="titulo" Type="String" />
                                <ext:RecordField Name="autor" Type="String" />
                                <ext:RecordField Name="ISBN" Type="String" />
                            </Fields>
                            </ext:JsonReader>
                    </Reader>
                </ext:Store>
            </Store>
                <ColumnModel ID="ColumnModel6" runat="server">
                <Columns>
                <ext:RowNumbererColumn />
                  <ext:Column ColumnID="codigo3" Header="N° Ejemplar" Width="100" DataIndex="ejem_id" />
                  <ext:Column ColumnID="titulo" Header="Titulo" Width="290" DataIndex="titulo" />
                  <ext:Column ColumnID="autor" Header="Autor" Width="250" DataIndex="autor" />
                  <ext:Column ColumnID="isbn" Header="ISBN" Width="170" DataIndex="ISBN" />
               </Columns>
            </ColumnModel>
            <SelectionModel>
                <ext:RowSelectionModel ID="RowSelectionModel6" runat="server" >
                      <Listeners>
                          <RowSelect Handler="#{FormPanel3}.getForm().loadRecord(record);" />
                       </Listeners>
                </ext:RowSelectionModel>
            </SelectionModel>
  <LoadMask ShowMask="true" />
             <BottomBar>
                 <ext:PagingToolbar ID="PagingToolbar51" runat="server" PageSize="10">
                    <Items>
                        <ext:Label ID="Label6" runat="server" Text="Page size:" />
                        <ext:ToolbarSpacer ID="ToolbarSpacer6" runat="server" Width="10" />
                        <ext:ComboBox ID="ComboBox6" runat="server" Width="80">
                            <Items>
                                <ext:ListItem Text="1" />
                                <ext:ListItem Text="2" />
                                <ext:ListItem Text="10" />
                                <ext:ListItem Text="20" />
                            </Items>
                            <SelectedItem Value="10" />
                            <Listeners>
                                <Select Handler="#{PagingToolbar51}.pageSize = parseInt(this.getValue()); #{PagingToolbar51}.doLoad();" />
                            </Listeners>
                        </ext:ComboBox>
                    </Items>
                </ext:PagingToolbar>
            </BottomBar>
                        </ext:GridPanel>
</Content>
<%-- Prestamo de libros--%>








<%-- contenido de los Estudiantes form + tabla--%>           
              <Content>
                  <ext:FormPanel 
                            ID="FormPanel4" 
                            runat="server"
                            BodyStyle="background-color: #DFE8F6"
                            Padding="10"
                            LabelWidth="100" Collapsible="true" Title="Prestamo de Libros" >   
                            <Items>   

  <ext:ComboBox ID="ComboBox8"  runat="server"  Width="100" Editable="false" DataIndex="Title" FieldLabel="Control">
      <Items>
                                    <ext:ListItem Text="Prestamo" Value="Prestamo" />
                                    <ext:ListItem Text="Devolucion" Value="Devolucion" />                        
     </Items>
                           <SelectedItem Value="Prestamo" />
  </ext:ComboBox>
  <ext:CompositeField ID="CompositeField1" runat="server">
  <Items>
   <ext:TextField ID="fecha_inicio" runat="server"  ReadOnly="true " Width="80" FieldStyle="text-align: center;" Format="yyyy-MM-dd" FieldLabel="Fecha Inicio" Flex="1"></ext:TextField>
      
       <ext:DateField ID="fecha_fin" runat="server" Editable="false" Width="80"   Format="yyyy-MM-dd" FieldLabel="Fecha Fin" Flex="1" />
  </Items>
  </ext:CompositeField>
      
   <ext:TextArea ID="descripcion" runat="server" FieldLabel=" Descripcion " Width="280" DataIndex="descripcion"></ext:TextArea>
  <ext:Hidden ID="id_prestamo" runat="server"></ext:Hidden>
  
   </Items>
       </ext:FormPanel> 
        </Content>
<Content>
   <ext:GridPanel ID="GridPanel7" runat="server" Title="Listado de Prestamos" Collapsible="true"  Height="180"   DDGroup="gridDGroup"   EnableDragDrop="true"  StripeRows="true" >
           <Store>
                <ext:Store ID="Store7" runat="server" >
                    <Reader>
                      <ext:JsonReader>
                            <Fields>
                                <ext:RecordField Name="id_prestamo" />
                                <ext:RecordField Name="estado" />
                                <ext:RecordField Name="nombre" Type="String" />
                                <ext:RecordField Name="apellido" Type="String" />
                                <ext:RecordField Name="codigo" Type="String" />
                                <ext:RecordField Name="cedula" Type="String" />
                                <ext:RecordField Name="fecha_inicio" Type="Date" />
                               <ext:RecordField Name="fecha_fin" Type="Date"/>
                                <ext:RecordField Name="titulo" Type="String" />
                                <ext:RecordField Name="autor" Type="String" />                           
                            </Fields>
                            </ext:JsonReader>
                    </Reader>
                </ext:Store>
            </Store>

                <ColumnModel ID="ColumnModel7" runat="server">
                <Columns>
                <ext:RowNumbererColumn />
                  <ext:Column ColumnID="id_prestamo" Header=" N° Prestamo " Width="80" DataIndex="id_prestamo" />
                    <ext:Column ColumnID="Estado" Header=" Estado Prest.  " Width="142" DataIndex="estado" />
                  <ext:Column ColumnID="nombre" Header=" Nombre Est.  " Width="140" DataIndex="nombre" />
                  <ext:Column ColumnID="apellido" Header=" Apellido Est. " Width="170" DataIndex="apellido" />
                  <ext:Column ColumnID="codigo" Header=" Codigo Est. " Width="130" DataIndex="codigo" />
                  <ext:Column ColumnID="cedula" Header=" Identificacion " Width="130" DataIndex="cedula" />
                  <ext:Column ColumnID="fecha_inicio" Header="  Fecha Prestamo " Width="170" DataIndex="fecha_inicio" />
                  <ext:Column ColumnID="fecha_fin" Header=" Fecha Fin Prestamo " Width="120" DataIndex="fecha_fin" />
                  <ext:Column ColumnID="titulo" Header=" Titulo Libro " Width="190" DataIndex="titulo" />
                  <ext:Column ColumnID="autor" Header=" Autor Libro " Width="170" DataIndex="autor" />
                 </Columns>
            </ColumnModel>
            <SelectionModel>
             <ext:RowSelectionModel ID="RowSelectionModel7" runat="server">
                       <Listeners>
                          <RowSelect Handler="#{FormPanel4}.getForm().loadRecord(record);" />
                       </Listeners>
                </ext:RowSelectionModel>
              </SelectionModel>
                    <LoadMask ShowMask="true" />
             <BottomBar>
                 <ext:PagingToolbar ID="PagingToolbar7" runat="server" PageSize="10">
                    <Items>
                        <ext:Label ID="Label7" runat="server" Text="Page size:" />
                        <ext:ToolbarSpacer ID="ToolbarSpacer7" runat="server" Width="10" />
                        <ext:ComboBox ID="ComboBox7" runat="server" Width="80">
                            <Items>
                                <ext:ListItem Text="1" />
                                <ext:ListItem Text="2" />
                                <ext:ListItem Text="10" />
                                <ext:ListItem Text="20" />
                            </Items>
                            <SelectedItem Value="10" />
                            <Listeners>
                                <Select Handler="#{PagingToolbar7}.pageSize = parseInt(this.getValue()); #{PagingToolbar7}.doLoad();" />
                            </Listeners>
                        </ext:ComboBox>
                    </Items>
                </ext:PagingToolbar>
            </BottomBar>
                        </ext:GridPanel>
</Content>

<%--  botones de Gestion --%>
  <Buttons>
                                   <ext:Button ID="Button5" runat="server" Text="Registrar" Icon="Accept">
                                      <DirectEvents>
                                        <Click OnEvent="insertar_prestamo">
                                            <EventMask ShowMask="true" Msg="Cargando  ..." Target="Page" />
                                        </Click>
                                    </DirectEvents>
                                   </ext:Button>
                                  <ext:Button ID="Button6" runat="server" Text="Eliminar" Icon="cancel">
                                     <DirectEvents>
                                        <Click OnEvent="desconectar">
                                            <EventMask ShowMask="true" Msg="Cargando  ..." Target="Page" />
                                        </Click>
                                    </DirectEvents>
                                   </ext:Button>
                                     <ext:Button ID="Button7" runat="server" Text="Salir" Icon="DoorOut">
                                        <DirectEvents>
                                        <Click OnEvent="Salir">
                                            <EventMask ShowMask="true" Msg="Cargando  ..." Target="Page" />
                                        </Click>
                                    </DirectEvents>
                                   </ext:Button>
  </Buttons>  
 </ext:DesktopWindow>
    <ext:DropTarget ID="DropTarget2" runat="server"  Target="={FormPanel4.body.dom}" Group="gridDGroup">
            <NotifyEnter Fn="notifyEnter" /> 
            <NotifyDrop Fn="notifyDrop" />
   </ext:DropTarget> 
    </form>
</body>
</html>

