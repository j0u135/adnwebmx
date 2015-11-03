<html xmlns="http://www.w3.org/1999/xhtml"><head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link href="EstilosADN/fuente.css" rel="stylesheet" type="text/css">
    <link href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/jquery-ui.css">
    <link rel="stylesheet" href="EstilosADN/bootstrap.min.css">
    <link href="EstilosADN/ui.css" rel="stylesheet">
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css">
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">
   
    <link rel="stylesheet" href="EstilosADN/dis.css" type="text/css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.js"></script>


	<link rel="stylesheet" href="js/jquery/ui-lightness/jquery-ui-1.10.2.custom.css" />
	<link href="css/primitives.latest.css?207" media="screen" rel="stylesheet" type="text/css" />


	<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="js/jquery/jquery-ui-1.10.2.custom.js"></script>
	<script type="text/javascript" src="js/primitives.min.js?207"></script>
	<script type="text/javascript" src="js/angular.js"></script>
	<script type="text/javascript" src="js/diagrama-identificadores.js"></script>
	<script src="js/bootstrap-toggle.min.js"></script>
	
	<script src="js/bootstrap-modal.js"></script>

	<script src="js/colpick.js" type="text/javascript"></script>
	<link rel="stylesheet" href="css/colpick.css" type="text/css"/>
	<link rel="stylesheet" href="css/colorpicker-adn.css" type="text/css"/>
	<link rel="stylesheet" href="css/bootstrap-toggle.min.css" type="text/css"/>
	


<%@ page import = "com.adn.conexion.ClaseArbol"%> 
<%@ page import = "com.adn.conexion.ClaseDiagrama"%> 
<%@ page import = "com.adn.controlador.Departamento"%> 
<%@page import="java.util.ArrayList"%>
<!-- Filtro ind -->
<%@ page import = "com.adn.conexion.ClaseIndicador"%> 

</head>


<body>						
						
		<div ng-app="appADN" data-ng-controller="controllerADN">
			
			
			<div class="modnuevo" ng-show="bandera_asociar">
				<div style="width: 100%;">
				<table width="100%" align="center" class="plana" ng-show="bandera_asociar">
				  <tr>
				    <td name="tdcontrol">
				     <table name="tablecontrol" width=500px>
				     	<tr>
				         <td class="textBarra">Seleccione la bandera de otro Indicador de Control para asociar o seleccione un NI estrat[egico de la lista]</td>	
				     	</tr>
				     	 <td align="left"><select ng-model="puesto_seleccionado" ng-options="item_identificador.title for item_identificador in myOptions_idnt.items" style="width:400px"">
				     	 </select>
						<span class="boton" style="padding: 2px 7px !important;" ng-click="asociar_identificador(myOptions_idnt.items, cursor_asociar, puesto_seleccionado)"><i class="fa fa-plus"></i></span>
						</td>
				     	<tr>
				     	</tr>
				     </table>
				    </td>
				    
				    <td name= "tdestrategicos">
				     <table name="tableestrategicos">
				     	<tr>
				     	  <td>
						     <label style="color:#FB7B36;" >Lista de indicadores asociados a: {{myOptions_idnt.items[cursor_asociar].title}}</label>
						  </td>
				     	</tr>
				        <tr>
			              <td class="celda-nombre">
								<ul style="list-style-type: none;">
								<li ng-repeat="item in myOptions_idnt.items[cursor_asociar].asociados" padding: 1px;>
									<label ng-click="setCursorItem(item)" style="color: #fff; display: inline; background: {{myOptions_idnt.items[item].itemTitleColor}}; border: 1px solid; border-radius: 4px; padding: 1px; margin: 1px;">
										{{myOptions_idnt.items[item].title.substring(0,1)}}{{myOptions_idnt.items[item].title}}
									</label>
									<span  class="botonrojo" ng-click="$parent.eliminarAsociado(myOptions_idnt.cursorItem, $index)"><i class="fa fa-times fa-1"></i></span>
								 </li>
								 </ul>
						  </td>	        
				        </tr>
				     </table>
				    </td>
				    <td width=110px></td>
								 <td align="center" ><a ng-click="cerrarPanel()" class="btn btn-success btn-sm">Aceptar</a></td>
				
				  </tr>
			    </table> 
			</div>
			</div>
			
			
            <div class="containernuevo" style="padding: 0px 0px 0px 0px">
			<table><tr>
			<td width=25%>
				<div class="control">	
					
					<table>
					<tr>
					<td>
					<div class="modnuevo nopadding" style="width: 120px;">
						<!--  <div class="izquierda"><a href="" class="puestosmas"><i class="fa fa-user"></i></a></div>
						<div class="derecha"><a href="" id="menos"><i class="fa fa-minus"></i></a></div>
						<div class="puestos"><a href="" class="puestosmas"> Ver Puestos Asociados:</a></div>
						-->
					<ul class="fa-ul">
  						<li><i class="fa-li fa fa fa-money" style="color:#FABF1E;"></i><span class="textBarra">Financieros</span></li>
  						<li><i class="fa-li fa fa fa-user" style="color:#59C72E;"></i><span class="textBarra">Cliente</span></li>
  						
					</ul>
					</div>
					</td>
					<td>
					<div class="modnuevo nopadding" style="width: 120px;">
					<ul class="fa-ul">
  						
  						<li><i class="fa-li fa fa fa-gears" style="color:#2E70C7;"></i><span class="textBarra">Procesos</span></li>
  						<li><i class="fa-li fa fa-book" style="color:#EB9028;"></i><span class="textBarra">Cultura</span></li>
					</ul>
					</div>
					</td>
					</tr>
					</Table>
					<!--  <div class="modnuevo" style="width:350px; display:none;" id="puestos">
						<table align="center" width="100%" class="tablanueva">
						<tr style="border: 0px;">
						<td>
							<ul style="list-style-type: none;">
								<li ng-repeat="puesto in lista_puestos">{{puesto}}</li>
							</ul>
						</td>
						</tr>
						</table>
					</div>-->
				</div>
				</td>
				
				<td width=15%>
			   					<div style="display: inline; font-size: 12px; color: #2e5a99;">
			    					Orientación:
			    					
                	                  <a href="#"  class="boton-sm"  id="Top" ><i class="fa fa-arrow-up"></i></a>
				                      <a href="#"  class= "boton-sm" id="Right" ><i class="fa fa-arrow-right"></i></a>
				                       
			    				</div>
			  				</td>
			  				<td style="width: 50px"></td>
			  				<td width=15%>  
			    				<div style="font-size: 12px; top:15px; color: #2e5a99;">Zoom:</div><div id="slider" style="width: 200px; height: 13px; font-size: 62.5%;"></div>
			  				</td>
			  				<td style="width: 50px"></td>
			  				
			  				<td>
			  				<table>
			  				<tr>
			  				<td align="center" style="font-size: 12px; top:15px; color: #2e5a99;">Color</td>
			  				<td align="left">
										<div class="color-box bd-9"></div>
							</td>
			  				<td>  
			    				<div style="display:none;">
			    				<input  id="toggle-tipo" type="checkbox" data-toggle="toggle" data-on="Editar-on" data-off="Editar-0ff" data-size="mini" data-width="70" >
			    				</div>
			  				</td>
			  				
			  				<td>  
			    				
			    				<input id="toggle-colapsar" type="checkbox" data-toggle="toggle" data-on="Expandir-on" data-off="Expandir-off" data-size="mini" data-width="85" >
			    				
			  				</td>
			  				</tr>
			  				</table>
			  				</td>		
			 	
				</tr>
				</table>
				</div>
				
				<div id="centerpanel"  style="float:right; width: 100%;" >
					<div bp-ind-diagram data-listapuestos="lista_puestos" data-options="myOptions_idnt" data-on-highlight-changed="onMyHighlightChanged()"  data-on-cursor-changed="onMyCursorChanged()" style= "height: 500px; overflow: hidden;"></div> 
				</div>
		
		
		
		
	<div id="editar" class="modal fade ">
       <div class="modal-dialog ">
       <div class="modal-content fondoadn sombramodal">

       <div class="modal-header headeradn">
       
        	<a class="close" data-dismiss="modal" onclick=""><i class="fa fa-times fa-md" style="color:#ff0000; padding:10px 0px 0px 0px;"></i></a>
            <h5 class="negritas m-t-15">Editar Número Inteligente</h5>
        
       </div>    		    
       <div class="modal-body" style="border-top: 2px solid #B5B7B9;">
       	
					
		<table name="tablamaestra" width=100%>
     
       	 <tr class="nopadding" style="height:20px;">
       	   <td class="textBarra resalta nopadding" style="text-align:left;">Nombre del NI</td>
       	 </tr>
       			
       	 <tr ng-show="mostrarItem(item)" ng-repeat="item in myOptions_idnt.items">
       		<td >
       	     <div class="input-group margin-bottom-sm">
               <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-check-square-o fa-fw"></i></span>
               <input class="form-control input-xs" id="nbPuesto"  type="text"  ng-model="item.title" ng-required></input>
             </div>
            </td>
       	  </tr>
       	
       	  <tr class="nopadding" style="height:20px;">
       	    <td class="textBarra resalta nopadding" style="text-align:left;">Descripción</td>
          </tr>
       			
          <tr ng-show="mostrarItem(item)" ng-repeat="item in myOptions_idnt.items">
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
       			
          <tr ng-show="mostrarItem(item)" ng-repeat="item in myOptions_idnt.items">
       		 <td >
       	       <div class="input-group margin-bottom-sm">
                 <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-check-square-o fa-fw"></i></span>
                 <select class="form-control input-xs"  id="deptoInd" name="deptoInd" ng-options="obj for obj in myOptions_idnt.deptos" ng-model="item.itemDepto" ng-required></select>
               </div>
             </td>
       	  </tr>
       	</table><!-- tablamaestra -->
       		       	
       	</div>
        
        <div class="modal-footer" style="border-top: 2px solid #B5B7B9; ">
        	<a onclick="" id="btnAceptar" class="btn btn-success " data-dismiss="modal">Aceptar</a>
		</div>
	</div>
	</div>
   </div><!-- Modal Editar -->		
</div><!-- Fin de NG-APP -->
		
</body>


<script>

var mes;
var mesNumerico;
var anoActual="";

function linkDir(link){
	document.getElementById("linkDestino").value=link;
	document.getElementById("linkDireccion").submit();
	
}
function validaInfo(){
	var nbPuesto = document.getElementById("nbPuesto").value;
	var depto = document.getElementById("deptoInd").value;
	if(nbPuesto!="" && depto!="?"){
		$('#editar').modal('hide');
		//document.getElementById("editar").data-dismiss="modal";
	}else{
		alert("Faltan campos por capturar");
	}
}
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