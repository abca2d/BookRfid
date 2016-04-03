<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DesktopPrestamo.aspx.cs" Inherits="Sigc_net.View.Private.biblioteca.DesktopPrestamo" %>

<%@ Register assembly="Ext.Net" namespace="Ext.Net" tagprefix="ext" %>
<%@ Register assembly="Ext.Net.Utilities" namespace="Ext.Net.Utilities" tagprefix="ext" %>
<%@ Register assembly="Ext.Net.UX" namespace="Ext.Net.UX" tagprefix="ext" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Universidad de la Amazonia</title>    
         <link rel="Shortcut Icon" href="../../../Resources/mages/ua2.ico"/>
         <script type="text/javascript" src="/Resources/Scripts/Concurrent.Thread.js"></script> 
    <style type="text/css">        
        .start-button 
        {
            background-image: url(/Resources/mages/btn-icon.jpg) !important; 
            background-repeat : no-repeat;
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
                <DocumentReady Handler="Ext.Ajax.timeout = 1000;" />
            </Listeners>
        </ext:ResourceManager>
     <script type="text/javascript">
         function proceso() {
                   while (true) {
                          Ext.onReady(function () {
                              Ext.net.DirectMethods.ValidarTag();
                          });
                          Concurrent.Thread.sleep(4080);
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
            <StartButton Text="--------------------------"   IconCls="start-button"    />
            <Listeners>
                <ShortcutClick Handler="var d=#{MyDesktop}.getDesktop(); if(id == 'scTile'){d.tile();}else if(id == 'scCascade'){d.cascade();}" />
            </Listeners>
            <StartMenu Width="450" Height="400" ToolsWidth="170" Title="Menu Inicio: Usuario" Icon="User">
                <ToolItems>
                    <ext:MenuItem Text="Configuracion" Icon="Wrench" ID="ctl146">
                          <Menu>
                                      <ext:Menu ID="Menu1" runat="server">
                                         <Items>
                                         <ext:MenuItem Text=" Cambiar Contrase�a " Icon="lock"  >
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
                    <ext:MenuItem Text=" Salir " Icon="Disconnect" ID="ctl148">
           
                        <DirectEvents>
                            <Click OnEvent="Logout_Click">                     
                                <EventMask ShowMask="true" Msg="  Realmente Deseas Salir  " MinDelay="1000" />
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
                </Items>
            </StartMenu> 
        </ext:Desktop>  








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
             <content>   
             <ext:Image Height="165" Width="170"  ID="foto"  ImageUrl="/Resources/mages/images.jpg" runat="server"></ext:Image>           
       <ext:TextField ID="tf10"  runat="server" FieldLabel=" Codigo " ReadOnly="true"  Width="290"  DataIndex="codigo" />
       <ext:TextField ID="tf20" runat="server" FieldLabel="Cedula "  Width="350" ReadOnly="true" DataIndex="cedula"/>
       <ext:TextField ID="tf30"  runat="server" FieldLabel=" Nombre " Width="260" ReadOnly="true" DataIndex="nombre" />
       <ext:TextField ID="tf40"  runat="server" FieldLabel="Apellido " Width="150" ReadOnly="true" DataIndex="apellido" />
       <ext:TextField ID="tf50" runat="server" FieldLabel=" Fecha " Width="150" ReadOnly="true" DataIndex="fecha" />
       <ext:TextField ID="tf60"  runat="server" FieldLabel=" Vinculacion " Width="350" ReadOnly="true" DataIndex="vinculacion" />
       <ext:TextField ID="tf70"  runat="server" FieldLabel=" Programa " Width="150" ReadOnly="true" DataIndex="programa" />              
              </content>         
       </ext:FormPanel>              
   </Content>
<Content>
  <ext:GridPanel ID="GridPanel15" runat="server" Title="Listado de Estudiantes"  Height="180" Collapsible="true"   >
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
                 <ext:PagingToolbar ID="PagingToolbar5" runat="server" PageSize="10">
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
                                <Select Handler="#{PagingToolbar5}.pageSize = parseInt(this.getValue()); #{PagingToolbar5}.doLoad();" />
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
       <ext:TextField ID="ejem_id1" runat="server" FieldLabel=" Codigo " DataIndex="ejem_id" Width="290"></ext:TextField>
       <ext:TextField ID="titulo1" runat="server" FieldLabel="Titulo " DataIndex="titulo" Width="350"></ext:TextField>
       <ext:TextField ID="autor1" runat="server" FieldLabel=" Autor " DataIndex="autor" Width="320"></ext:TextField>
        <ext:TextField ID="isbn1" runat="server" FieldLabel=" ISBN " DataIndex="ISBN" Width="250"></ext:TextField>
       </Items>
       </ext:FormPanel> 
        </Content>
<Content>
  <ext:GridPanel ID="GridPanel16" runat="server" Title="Listado de Los Ejemplares"   Height="180"  Collapsible="true">
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
                 <ext:PagingToolbar ID="PagingToolbar6" runat="server" PageSize="10">
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
                                <Select Handler="#{PagingToolbar6}.pageSize = parseInt(this.getValue()); #{PagingToolbar6}.doLoad();" />
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
                            ID="FormPanel42" 
                            runat="server"
                            BodyStyle="background-color: #DFE8F6"
                            Padding="10"
                            LabelWidth="100" Collapsible="true" Title="Prestamo de Libros" >   
                            <Items>   

  <ext:ComboBox ID="ComboBox80"  runat="server"  Width="100" Editable="false" DataIndex="Title" FieldLabel="Control">
      <Items>
                                    <ext:ListItem Text="Prestamo" Value="Prestamo" />
                                    <ext:ListItem Text="Devolucion" Value="Devolucion" />                        
     </Items>
                           <SelectedItem Value="Prestamo" />
  </ext:ComboBox>
  <ext:CompositeField ID="CompositeField1" runat="server">
  <Items>
  
       <ext:TextField ID="fecha_inicio" runat="server"  ReadOnly="true " Width="80" FieldStyle="text-align: center;"  Format="yyyy-MM-dd" FieldLabel="Fecha Inicio" Flex="1" />
       <ext:DateField ID="fecha_fin" runat="server" Editable="false" Width="110" FieldStyle="text-align: center;"  Format="yyyy-MM-dd" FieldLabel="Fecha Fin" Flex="1" />
  </Items>
  </ext:CompositeField>
      
   <ext:TextArea ID="descripcion" runat="server" FieldLabel=" Descripcion " Width="280" DataIndex="descripcion"></ext:TextArea>
  <ext:Hidden ID="id_prestamo" runat="server"></ext:Hidden>
  
   </Items>
       </ext:FormPanel> 
        </Content>
<Content>
   <ext:GridPanel ID="GridPanel17" runat="server" Title="Listado de Prestamos" Collapsible="true"  Height="180"   DDGroup="gridDGroup"   EnableDragDrop="true"  StripeRows="true" >
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
                          <RowSelect Handler="#{FormPanel42}.getForm().loadRecord(record);" />
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
                             
  </Buttons>
 </ext:DesktopWindow>
    <ext:DropTarget ID="DropTarget2" runat="server"  Target="={FormPanel42.body.dom}" Group="gridDGroup">
            <NotifyEnter Fn="notifyEnter" /> 
            <NotifyDrop Fn="notifyDrop" />
   </ext:DropTarget> 
    </form>
</body>
</html>

<%-- metodo
     <ext:ComboBox ID="ComboBox8" 
                                runat="server"
                                Width="50"
                                Editable="false"
                                DataIndex="Title">
                                <Items>
                                    <ext:ListItem Text="Mr" Value="mr" />
                                    <ext:ListItem Text="Mrs" Value="mrs" />
                                    <ext:ListItem Text="Miss" Value="miss" />
                                </Items>
                                <SelectedItem Value="mr" />
                            </ext:ComboBox>

                            --%>