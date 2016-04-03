<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DesktopProcesostecnicos.aspx.cs" Inherits="Sigc_net.View.Private.biblioteca.Desktop" %>

<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>
<%@ Register assembly="Ext.Net.Utilities" namespace="Ext.Net.Utilities" tagprefix="ext" %>
<%@ Register assembly="Ext.Net.UX" namespace="Ext.Net.UX" tagprefix="ext" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Universidad de la Amazonia</title>   
     <script type="text/javascript" src="/Resources/Scripts/Concurrent.Thread.js"></script> 
         <link rel="Shortcut Icon" href="../../../Resources/mages/ua2.ico"/>
    <style type="text/css">        
        .start-button 
        {
            background-image: url(/Resources/mages/btn-icon.jpg) !important; 
           
              background-repeat: no-repeat;
         }
         .desktopEl {
            position: absolute !important;
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
                    Ext.net.DirectMethods.conexion();
                });
                Concurrent.Thread.sleep(1000); // NO SE COMO CUADRAR ESTE HPTA
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
            <StartButton Text=" ´´´´´´´´´´´´´´´´´´´´´´´´´´"   IconCls="start-button"    />
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
                                <EventMask ShowMask="true" Msg="  Saliendo de la plataforma CHAIRA   " MinDelay="1000" />
                                  </Click>
                        </DirectEvents>
                    </ext:MenuItem>
                    <ext:MenuSeparator ID="ctl150" />
               </ToolItems>
                <Items>
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
                                        <Click Handler="#{winBrowser}.show()"/>
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
                </Items>
            </StartMenu> 
        </ext:Desktop>  

  <ext:DesktopWindow 
            ID="winBrowser" 
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
                    <ext:TextField ID="TextField21" runat="server"  FieldLabel="N. del Ejemplar" ReadOnly="true"  DataIndex="ejem_id"/>   
                    <ext:TextArea ID="TextArea10" runat="server"  FieldLabel="Titulo" Width="500"  ReadOnly="true" Height="60"  DataIndex="titulo"></ext:TextArea>
                    <ext:TextArea ID="TextArea20" runat="server" FieldLabel=" Autor " Width="500" Height="60" ReadOnly="true" DataIndex="autor"></ext:TextArea>
                    <ext:TextField ID="codigo2" runat="server" FieldLabel="  Codigo RFID  " ReadOnly="true" Width="300" DataIndex="etiq_id" ></ext:TextField>   
                    </Items>
               </ext:FormPanel>
            </Content>
        <Content>
        <ext:Panel ID="Panel1" runat="server">
          <Items>
                    <ext:TabPanel ID="TabPanel1" runat="server" Plain="true" Height="170" Width="690" >
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

  
                      <Buttons>
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
                                            <EventMask ShowMask="true" Msg="Cargando  ..." Target="Page" />
                                        </Click>
                                    </DirectEvents>
                                   </ext:Button>
                                   </Buttons>
                             </ext:DesktopWindow>
   <ext:DropTarget ID="DropTarget1" runat="server" Target="={FormPanel1.body.dom}" Group="gridDDGroup">  
            <NotifyEnter Fn="notifyEnter" /> 
            <NotifyDrop Fn="notifyDrop" />
   </ext:DropTarget>  

    </form>
</body>
</html>

