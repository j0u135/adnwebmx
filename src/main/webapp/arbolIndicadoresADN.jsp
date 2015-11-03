<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	 
	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
	<LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/jquery-ui.css">
	<link rel="stylesheet" href="EstilosADN/bootstrap.min.css" type="text/css">
	<link href="EstilosADN/ui.css" rel="stylesheet">
	<link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css" type='text/css'>
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">   
    <link rel="stylesheet" href="EstilosADN/dis.css" type="text/css"> 
    <link rel="stylesheet" href="js/jquery/ui-lightness/jquery-ui-1.10.2.custom.css" />
	<link href="css/primitives.latest.css?207" media="screen" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="css/colpick.css" type="text/css"/>
	<link rel="stylesheet" href="css/colorpicker-adn.css" type="text/css"/>
	<link rel="stylesheet" href="css/bootstrap-toggle.min.css" type="text/css"/>
    
  
    <script src="js/jquery.min.js"></script>  
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.js"></script>
	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/jquery/jquery-ui-1.10.2.custom.js"></script>
	<script type="text/javascript" src="js/primitives.min.js?207"></script>
	<script type="text/javascript" src="js/angular.js"></script>
	<script type="text/javascript" src="js/diagrama-organigrama.js"></script>	
	<script src="js/bootstrap-modal.js"></script>
	<script src="js/bootstrap-toggle.min.js"></script>
	<script src="js/colpick.js" type="text/javascript"></script>
	
	

<title>Arbol Indicadores</title>

<%@ page session="true" %>
<%
String usuario = "";
String nombre1 = "";
String puesto = "";
String tipo = "";
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
	 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
} else {
usuario = (String)sesionOk.getAttribute("usuario");
nombre1 = (String)sesionOk.getAttribute("nombre");
puesto = (String)sesionOk.getAttribute("puesto");
tipo = (String)sesionOk.getAttribute("tipo");
}
%>

<%@ page import = "com.adn.conexion.ClaseArbol"%> 
<%@ page import = "com.adn.controlador.Area"%> 
<%@ page import = "com.adn.controlador.Departamento"%> 
<%@ page import = "com.adn.conexion.ClaseDiagrama"%> 
<!-- Filtro ind -->
<%@ page import = "com.adn.conexion.ClaseIndicador"%> 
<%@page import="java.util.ArrayList"%>

<script>

var variableInd="";

function inicio(){
	var diag = (String)((request.getAttribute("diagMost")!=(null))?request.getAttribute("diagMost"): "");
	if(diag!=null && diag!=""){
		if(diag="NIs"){
			document.getElementById("diagramaVisible").value="Diagrama";
		}else if(diag="Org"){
			document.getElementById("diagramaVisible").value="Indicadores";
		}
		cambiarDiagrama();
	}
	
	recibe=document.getElementById("mensajeMostrar").value;
	if(recibe!=""){
		alert(recibe);
	}
}

function cambiar(){
	diagramaActivo=document.getElementById("diagramaVisible").value;
	if(diagramaActivo=="Indicadores"){
		document.getElementById("diagramaVisible").value="Diagrama";
		//document.getElementById("cargaDeptos").submit();
	}else{
		document.getElementById("diagramaVisible").value="Indicadores";	
		//document.getElementById("cargaDeptos").submit();
	}
}
</script>

<script>
//Filtro indicadores


function buscaDiagrama(){
	var areaUsu = document.getElementById("area").value;
	var deptoUsu = document.getElementById("depto").value;
	document.getElementById("idArea").value=areaUsu;
	document.getElementById("idDepto").value=deptoUsu;
	if(areaUsu>0){
		document.getElementById("cargaDeptos").submit();
	}else{
		alert("Debe seleccionar un área");
	}
}

function altaDiagrama(){
	document.getElementById("idArea").value = "";
	document.getElementById("cargaDeptos").submit();
}

function cargarDeptos(){
	var areaUsu = document.getElementById("area").value;
	document.getElementById("idArea").value = areaUsu;
	document.getElementById("cargaDeptos").submit();
}

</script>
</head>
<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
		<jsp:param name="tipo" value="<%=tipo%>" />
	</jsp:include>
</div>

	
<div class="principal">
			<div ng-app="appADN_org" data-ng-controller="controllerADN_org">
			<br>
				
			<div style="float:none; position: absolute; left: 15px; width:92%;" >	
				<div class="barratitulo" style="width: 30%;" ng-model="texto_titulo">{{texto_titulo}}</div>
				<div class="barraopciones" style="width:70%; padding: 0px 0px 20px 20px;">
				  
				   <table width="100%">
				   <tr>
				   <td class="textBarra">
				   Area
				   </td>
				   <td width=200px>
				   <select class="form-selectm grande" id="area" name="area" onchange="cargarDeptos()">
						<option id="listaAreas" name="listaAreas"></option>
							<option value="0">seleccione</option>
							<%
							String areaUs = (String)((request.getAttribute("idArea")!=(null))?request.getAttribute("idArea"): "");
							ArrayList<Area> arrArea = (ArrayList<Area>)request.getAttribute("areas");
							String cvArea, nombreArea;
							if(arrArea!=null && arrArea.size()>0){
								for(int i=0; i<arrArea.size();i++){
									Area area = arrArea.get(i);
									cvArea = area.getIdArea();
									nombreArea=area.getArea();
									if(areaUs!= null && !areaUs.equals("") && areaUs.equals(cvArea)){
									%>
									 	<option value="<%=cvArea%>" selected="selected" ><%=nombreArea%></option>
									<%}else{%>
										<option value="<%=cvArea%>" ><%=nombreArea%></option>
									<%}
								}
							}%>	
						</select>
				   </td>
				   
				   <td class="textBarra">
				   Departamento
				   </td>
				   <td>
				   <select class="form-selectm grande" id="depto" name="depto">
						<option value="0">seleccione</option>
							<%
							String json="";
							String deptoUs = (String)((request.getAttribute("idDepto")!=(null))?request.getAttribute("idDepto"): "");
							ArrayList<Departamento> arrDeptos = (ArrayList<Departamento>)request.getAttribute("deptos");
							String cvDepto, nombreDepto;
							if(arrDeptos!=null){
								for(int i=0; i<arrDeptos.size();i++){
									Departamento depto = arrDeptos.get(i);
									cvDepto = depto.getIdDepto()+"";
									nombreDepto = depto.getNbDepto();
									if(i==0){
										json = nombreDepto;
									}else{
										json = json+"|"+nombreDepto;
									}
									if(deptoUs!= null && !deptoUs.equals("") && deptoUs.equals(cvDepto)){
									%>
									 	<option value="<%=cvDepto%>" selected="selected" ><%=nombreDepto%></option>
									<%}else{%>
										<option value="<%=cvDepto%>" ><%=nombreDepto%></option>
									<%}
	
								}
								
							}%>
						</select>
						<input type="hidden" id="deptos" name="deptos" value="<%=json%>">
				   </td>
				   
				   
				   <td>
				   <a href="#" class="boton" onclick="buscaDiagrama()" title="Busca Diagrama" alt="Busca Diagrama"><i class="fa fa-search"></i></a>
				   <%if(!tipo.equals("Usr")){%>
				   <a href="#" class="boton" onclick="altaDiagrama()" title="Alta Diagrama" alt="Alta Diagrama"><i class="fa fa-plus"></i></a>
				   <a href="#" class="boton" onclick="borraDiagrama()" title="Borra Diagrama" alt="Borra Diagrama" style="display: none"><i class="fa fa-times"></i></a>
				  <%}%>
				   </td>
				   
					<td align="right">
					<%if(!tipo.equals("Usr")){%>
					<a href=""> <img src="ImagenesADN/guardar.png" id="botonGuardar" width="25px" height="27px" ng-click="guardarEstructuras()"/></a>
					 <%}%>
					</td>
					<td width="10px"><td>
					</tr>
					<tr>
					<td height="40px">
					</td>
					</tr>
					</table>
					
					<form method="POST" id="guardaArbol" action="GuardarArbolIndicadores">
						<input type="hidden" id="diagramaVisible" value="Indicadores">
						<input type="hidden" id="valorRecibidoIndicadores" value="<%=(request.getAttribute("arbolInd")!=(null))?request.getAttribute("arbolInd"): ""%>">
						<input type="hidden" id="valorRecibidoDiagrama" value="<%=(request.getAttribute("arbolOrg")!=(null))?request.getAttribute("arbolOrg"): ""%>">
						<input type="hidden" id="stream_identificadores" name="stream_identificadores" value="">
						<input type="hidden" id="stream_organigrama" name="stream_organigrama" value="">
						<input type="hidden" id="mensajeMostrar" name="mensajeMostrar" value="<%=(request.getAttribute("mensajeMostrar")!=(null))?request.getAttribute("mensajeMostrar"): ""%>">
						<input type="hidden" id="idAreaSel" name="idAreaSel" value="">
						<input type="hidden" id="idDeptoSel" name="idDeptoSel" value="">
						<input type="hidden" id="usuarioSes" name="usuarioSes" value="<%=nombre1%>">
					</form>
				
				</div>
				</div>
		
			<div class="sombra" style= " width:92%; position: absolute; left: 15px; top: 156px">
				<div ng-show="mostrar_organigrama">
										
	
						<div class="containernuevo" style="padding: 0px 0px 0px 0px;">
						 <table><tr>
				         <td>
							<div class="control">
								<div class="modnuevo control2" >
									<a href="" class="puestosmas"><i class="fa fa-pie-chart"></i></a>
									<a href="" class="puestosmas">Ver Indicadores Asociados:</a>
									<a href="" id="menos"><i class="fa fa-minus"></i></a>
									
									
								</div>
								
								<div class="modnuevo" style="width: 300px; display:none;"  id="puestos">
									
									<table align="center" width="100%" class="tablanueva">
									<tr style="border: 0px;">
									<td>
										<ul style="list-style-type: none;">
											<li ng-repeat="indicador in lista_indicadores">-{{indicador}}</li>
										</ul>
									</td>
									</tr>
									</table>
									
								</div>  
							</div>
							</td>
				           <td style="width: 100px"></td>
							<td style="width: 200px">
			   					<div style="display: inline; font-size: 12px; color: #2e5a99;">
			    					Orientación:
			    					
                	                  <a href="#"  class="boton-sm"  id="Top" ><i class="fa fa-arrow-up"></i></a>
				                      <a href="#"  class= "boton-sm" id="Right" ><i class="fa fa-arrow-right"></i></a>
				                     
				                    
			    				</div>
			  				</td>
			  				
			  				<td>  
			    				<div style="font-size: 12px; top:15px; color: #2e5a99;">Zoom:</div><div id="slider" style="width: 200px; height: 13px; font-size: 62.5%;"></div>
			  				</td>
			  		
			  		         <td style="width: 50px"></td>
							<td>
					
							<table width=100px style="display: inline">
							   <tr >
									<td align="center" style="font-size: 12px; top:15px; color: #2e5a99;">Color</td>
									<td align="left">
										<div class="color-box bd-9"></div>
									</td>
								</tr>
							</table>
			  				
			  				</td>
			  				<td>  
			    				
                                <div style="display:none;">
			    				<input id="toggle-tipo" type="checkbox" data-toggle="toggle" data-on="Editar-on" data-off="Editar-off" data-size="mini" data-width="70" >
			    				</div>
			  				</td>
			  				
			  				<td>  
			    				
			    				<input id="toggle-colapsar" type="checkbox" data-toggle="toggle" data-on="Expandir-on" data-off="Expandir-off" data-size="mini" data-width="85" >
			    				
			  				</td>			
			  					
						</tr>
					</table>
							<div id="centerpanel_org"  style="overflow: hidden; float:right; width: 100%;">
								<div bp-org-diagram data-nombresasociados="lista_indicadores" data-options="myOptions" data-on-highlight-changed="onMyHighlightChanged()"  data-on-cursor-changed="onMyCursorChanged()" style="height: 680px;"></div>
							</div>
						</div>
					</div>
					<div ng-show="mostrar_identificadores" style="overflow: hidden;">
						<iframe id="iframe" src="interfazidentificadores.jsp" style="width: 100%; height: 600px;"></iframe> 
					</div>	
				</div>
             <div style= "width:50px; position: absolute; top: 165px; right:40px;">
             <table>
             <td width="50px" align="center" valign="top">
			
            <table width="100%" class="sidebar" border="0">
                <tr>
					<td align="center">
						<img src="ImagenesADN/BSC.png" title="BSC" width="25" height="25"  alt="BSC" onclick="linkDir('BSC.jsp')">
					  <p style="text-align:center;">Balanced Scorecard</p>
					</td>
				</tr>
				
				
				<tr>
					<td align="center">
						<a href=""> <img src="ImagenesADN/arbolC.png" title="Control" width="25" height="20" alt="Nis Control" ng-click="cambiarDiagrama()"/></a>
					<p style="text-align:center;">Arbol de NIs</p>
					</td>
				</tr>
				
				<tr>
					<td align="center">
					  <a href=""> <img src="ImagenesADN/arbolOrg.png" title="Organigrama" width="25" height="25" alt="Organigrama" ng-click="cambiarDiagrama()"/></a>
				    <p style="text-align:center;">Organigrama</p>	
					</td>
				</tr>
				<tr>
					<td align="center">
						<a href=""><img src="ImagenesADN/listaNis.png" title="Lista NIs" width="30" height="30" alt="Lista Nis" onclick="linkDir2()"/></a>
					<p style="text-align:center;">Consulta de NIs</p>
					</td>
				</tr>
			</table>       
		</td>
             </table>
             </div>
	

      <div id="editar" class="modal fade ">
       <div class="modal-dialog ">
       <div class="modal-content fondoadn sombramodal">

       <div class="modal-header headeradn">
       
        	<a class="close" data-dismiss="modal" onclick=""><i class="fa fa-times fa-md" style="color:#ff0000; padding:10px 0px 0px 0px;"></i></a>
            <h5 class="negritas m-t-15">Editar Puesto</h5>
        
       </div>    		    
       <div class="modal-body" style="border-top: 2px solid #B5B7B9;">
       	
					
		<table name="tablamaestra" width=100%>
     
       	 <tr class="nopadding" style="height:20px;">
       	   <td class="textBarra resalta nopadding" style="text-align:left;">Nombre del Puesto</td>
       	 </tr>
       			
       	 <tr ng-show="mostrarItem(item)" ng-repeat="item in myOptions.items">
       		<td >
       	     <div class="input-group margin-bottom-sm">
               <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-check-square-o fa-fw"></i></span>
               <input class="form-control input-xs"  type="text"  ng-model="item.title" ng-required></input>
             </div>
            </td>
       	  </tr>
       	
       	  <tr class="nopadding" style="height:20px;">
       	    <td class="textBarra resalta nopadding" style="text-align:left;">Descripción</td>
          </tr>
       			
          <tr ng-show="mostrarItem(item)" ng-repeat="item in myOptions.items">
       		 <td >
       	       <div class="input-group margin-bottom-sm">
                 <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-check-square-o fa-fw"></i></span>
                 <input class="form-control input-xs"  type="text"  ng-model="item.description" ng-required></input>
               </div>
             </td>
       	  </tr>
       	  <tr class="nopadding" style="height:20px;">
       	    <td class="textBarra resalta nopadding" style="text-align:left;">Departamento</td>
          </tr>
       			
          <tr ng-show="mostrarItem(item)" ng-repeat="item in myOptions.items">
       		 <td >
       	       <div class="input-group margin-bottom-sm">
                 <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-check-square-o fa-fw"></i></span>
                 <select class="form-control input-xs"  id="deptoOrg" name="deptoOrg" ng-options="obj for obj in myOptions.deptos" ng-model="item.itemDepto" ng-required></select>
               </div>
             </td>
       	  </tr>
       	</table><!-- tablamaestra -->
       		       	
       	</div>
        
        <div class="modal-footer" style="border-top: 2px solid #B5B7B9; ">
        	<a onclick="" id="btnAceptar" class="btn btn-success " data-dismiss="modal">Guardar</a>
           
		</div>
	
	</div>
	</div>
   </div><!-- Modal Editar -->


   <div id="asocia" class="modal fade ">
       <div class="modal-dialog ">
       <div class="modal-content fondoadn sombramodal">
       <div class="modal-header headeradn">    
        	<a class="close" data-dismiss="modal" onclick=""><i class="fa fa-times fa-md" style="color:#ff0000; padding:10px 0px 0px 0px;"></i></a>
            <h5 class="negritas m-t-15">Asociar Números inteligentes</h5>
       </div>    		    
        <div class="modal-body" style="border-top: 2px solid #B5B7B9;">
         
						  <table>
						     <tr>
						       <td class="textBarra resalta nopadding" style="text-align:left;">Seleccione un Número Inteligente</td>
						     </tr>
						     <tr>
						     <td align="left">
							 <div class="input-group margin-bottom-sm">
                                <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-dashboard fa-fw"></i></span>
                                <select class="form-control input-xs width-400" ng-model="puesto_seleccionado" ng-options="item_identificador.title for item_identificador in items_identificadores" ></select>
                               </div>		
					        		
							</td>
							<td width=50px>
							<span class="boton" style="padding: 2px 7px !important;" ng-click="asociar_identificador(myOptions.items, cursor_asociar, puesto_seleccionado)"><i class="fa fa-plus"></i></span>
							</td>
						     </tr>
						    <!--   
						     <tr>
						       <td align="left"><label class="modnuevotexto">Seleccione un Objetivo Estratégico]:</label></td>
						     </tr>
						     <tr>
						     <td align="left"><select ng-model="puesto_seleccionado" ng-options="item_identificador.title for item_identificador in items_identificadores" style="width:400px""></select>
									<span class="boton" style="padding: 2px 7px !important;" ng-click="asociar_identificador(myOptions.items, cursor_asociar, puesto_seleccionado)"><i class="fa fa-plus"></i></span>
									
									</td>
						     </tr>
						     -->
						  </table>
						  
						  
						  
						  <table name="tablalista">
						  	<tr>
						  		<td class="textBarra resalta nopadding" style="text-align:left;">Lista de Números Inteligentes asisgnados a: {{myOptions.items[cursor_asociar].title}}</label>	   
							    </td>
						    </tr>
						    <tr>
						        <td >
						          <div class="celda-nombre form-control width-500 " style="overflow-y:scroll; height:70px;">
										<ul style="list-style-type: none;">
											<li ng-repeat="item in myOptions.items[cursor_asociar].asociados" padding: 1px;>
												<label style="color: #fff; display: inline; color: #000 ; align:left;">
													{{items_identificadores[item].title}}
												</label>
												<span  class="botonrojo" ng-click="$parent.eliminarAsociado(myOptions.cursorItem, $index)"><i class="fa fa-times fa-1"></i></span>
								 			</li>
								 		</ul>
								 	</div>	
								 </td>								 	
						    </tr>
						  </table>
						
       	</div><!-- Body --> 
        
        <div class="modal-footer" style="border-top: 2px solid #B5B7B9; ">
        	<a onclick="" id="btnAceptar" class="btn btn-success " data-dismiss="modal">Aceptar</a>
          
		</div>
    </div>
	</div>
	</div><!-- Modal Asociar -->
	</div><!-- NG-APP -->
</div><!-- Principal -->
	

	

	<script>
		$( ".puestosmas" ).click(function() {
			$( "#puestos" ).show( "fast" );
		});
		$( "#menos" ).click(function() {
			$( "#puestos" ).hide( "fast" );
		});
	</script>
</body>
<form method="POST" id="linkDireccion" action="linkDireccion">
	<input type="hidden" id="linkDestino" name="linkDestino" value="">
</form>
<form method="POST" id="cargaDeptos" action="CargaSistInd">
	<input type="hidden" id="idArea" name="idArea" value="">
	<input type="hidden" id="idDepto" name="idDepto" value="">
	<input type="hidden" id="TpUsr" name="TpUsr" value="<%=tipo%>">
	<input type="hidden" id="diagVisible" name="diagVisible" value="">
</form>
<form method="POST" id="consultaNIs" action="cargaConsultaNIs">
</form>

<script>

var mes;
var mesNumerico;
var anoActual="";

function linkDir(link){
	document.getElementById("linkDestino").value=link;
	document.getElementById("linkDireccion").submit();
	
}

function linkDir2(){
	document.getElementById("consultaNIs").submit();
	
}
</script>

<script>
inicio();
</script>
<script>
$('.bar-percentage[data-percentage]').each(function () {
  var progress = $(this);
  var percentage = Math.ceil($(this).attr('data-percentage'));
  $({countNum: 0}).animate({countNum: percentage}, {
    duration: 2000,
    easing:'linear',
    step: function() {
      
    var pct = '';
    if(percentage == 0){
      pct = Math.floor(this.countNum) + '%';
    }else{
      pct = Math.floor(this.countNum+1) + '%';
    }
    progress.text(pct) && progress.siblings().children().css('width',pct);
    }
  });
});
</script>

	<script>
		$( ".puestosmas" ).click(function() {
			$( "#puestos" ).show( "fast" );
		});
		$( "#menos" ).click(function() {
			$( "#puestos" ).hide( "fast" );
		});
	</script>

</html>