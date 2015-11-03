<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	 pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
  
<html>
	<head>
		  
		<link href="EstilosADN/ui.css" rel="stylesheet">
		<link href="EstilosADN/style.css" rel="stylesheet">
		<link href="EstilosADN/theme.css" rel="stylesheet">
		<link rel="stylesheet" href="EstilosADN/jquery.bxslider.css">
		 
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
		<meta name="description" content="admin-themes-adn">
		<meta name="author" content="adn">
		<link rel="shortcut icon" href="favicon.png" type="image/png"> 
		  
		<title>Pagina de inicio</title>
		 
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

		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		
		<script type="text/javascript">

			google.load("visualization", "1", {packages:["table"]});
			google.setOnLoadCallback(drawTable);

			function drawTable() {
				 var data = new google.visualization.DataTable();
					data.addColumn('string', 'Numero Inteligente');
					data.addColumn('number', 'Meta Anual');
					data.addColumn('number', 'Q1');
					data.addColumn('number', 'Q2');
					data.addColumn('number', 'Q3');
					data.addColumn('number', 'Q4');
					data.addColumn('number', 'Ago-15');
					
					
					data.addRows([
					['EBITDA',  {v:17.7,f:"17.7M"}, {v:4.8,f:"4.8M"},{v:3.8,f:"3.8M"},      {v:4.3,f:"4.3M"}, {v:4.7,f:"4.7M"},{v:1.2,f:"1.2M"}],
					['Ventas',  {v:110.74,f:"110.74M"},{v:30.43,f:"30.43M"},      {v:23.81,f:"23.81M"}, {v:26.93,f:"26.93M"}, {v:29.57,f:"29.57M"},{v:7.7,f:"7.7M"}],
					['% de Horas Facturadas', {v:90,f:"90%"},{v:87,f:"87%"},      {v:82,f:"82%"}, {v:89.3,f:"89.3%"}, {v:87.6,f:"87.6%"},{v:82,f:"82%"}],
					['Satisfacción de Cliente', {v:90,f:"90%"},{v:84.67,f:"84.67%"},      {v:71,f:"%71"}, {v:82,f:"82%"}, {v:91.33,f:"91.33%"},{v:66,f:"66%"}]
				 ]);

				 var table = new google.visualization.Table(document.getElementById('table_div'));
				 
					var arrow = new google.visualization.ArrowFormat({base:90});
					arrow.format(data, 6); // Apply formatter to second column         
					table.draw(data, {allowHtml: true, showRowNumber: true});
					var arrow = new google.visualization.ArrowFormat({base:30});
					arrow.format(data, 2); // Apply formatter to second column         
					table.draw(data, {allowHtml: true, showRowNumber: true});
					var arrow = new google.visualization.ArrowFormat({base:90});
					arrow.format(data, 3); // Apply formatter to second column         
					table.draw(data, {allowHtml: true, showRowNumber: true});
					var arrow = new google.visualization.ArrowFormat({base:90});
					arrow.format(data, 4); // Apply formatter to second column         
					table.draw(data, {allowHtml: true, showRowNumber: true});
				
			}	
		</script> 
		 
		<script>
			function cuentaLogin(){
				var variable = document.getElementById("dato").value;
				
				if(variable!="Contador incrementado"){
					document.getElementById("usuariologin").value=document.getElementById("usuario").innerHTML;
					document.getElementById("pruebaServlet").submit();
				}	
			}	 
		</script>
	</head>


	<body ng-app="InicioApp">

		<div class="principal containernuevo" style="height:520px">
			<!-- Presentación -->
			<div style="width:40%;float:right;height:500px" ng-controller="MainController">
				<div><strong style="color:#606594; font-size:13px;">Avisos Importantes</strong></div>
				<iframe class="sombra" src="{{trustSrc(presentacion_activa.url)}}" frameborder="0" width="480" height="389" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>
				<% if(!tipo.equals("Usr")){ %>
				<div style="margin-left:0px; width:480px" class="containernuevo row">
					<div class="col-md-3">
						<a style="padding:15px" class="boton" id="botonEditar" data-toggle="modal" data-target="#editarPresentacionModal" ng-click="ventanaPresentaciones()">
							<i class="fa fa-pencil"></i>
						</a>
					</div>
				</div>
				<% } %>
				<!-- Editar Presentación Modal -->
				<div id="editarPresentacionModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<div ng-show="vista_editar">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Editar Presentación</h4>
								</div>
								<div ng-show="!vista_editar">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Nueva Presentación</h4>
								</div>
							</div>
							<div class="modal-body">
								<div ng-show="vista_editar">
									<div ng-show="!bandera_editar">
										<h5 class="modal-title">Seleccione la presentación que desea editar.</h5>
										<table class="table">
											<thead>
												<tr>
													<th>Descripción</th>
												</tr>
											</thead>
											<tbody>
												<tr ng-repeat="presentacion in presentaciones track by presentacion.id">
													<td ng-class="{'linea-seleccionada': presentacion.id == presentacion_seleccionada}">
														<div ng-click="seleccionarPresentacion(presentacion.id)">
															<div class="row">
																<div class="col-md-10">{{presentacion.descripcion}}</div>
																<div style="margin-right:0px;" ng-show="presentacion.id == presentacion_seleccionada && !bandera_editar">
																	<a class="boton boton-blanco" ng-show="presentacion.activo != 1" ng-click="activarPresentacion(presentacion)">
																		<i class="fa fa-check"></i>
																	</a>
																	<a class="boton boton-blanco" ng-click="editarPresentacion(presentacion)">
																		<i class="fa fa-pencil"></i>
																	</a>
																	<a class="boton boton-blanco" ng-click="deletePresentacionInicial(presentacion)">
																		<i class="fa fa-remove"></i>
																	</a>
																</div>
															</div>
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div id="editarPresentacionForm" ng-show="bandera_editar">
										<div class="form-group">
											<label for="descripcionInputEditar">Descripción</label>
											<input ng-model="presentacion_editable.descripcion" type="text" class="form-control" id="descripcionInputEditar" name="descripcionInputEditar" placeholder="Descripción">
										</div>
										<div class="form-group">
											<label for="urlInputEditar">URL</label>
											<input ng-model="presentacion_editable.url" type="text" class="form-control" id="urlInputEditar" name="urlInputEditar" placeholder="URL">
										</div>
										<div class="checkbox">
											<label style="margin-left: 20px;">
												<input ng-model="presentacion_editable.activo" type="checkbox" name="activoEditar" style="margin-left: -20px;"> Activar Presentación
											</label>
										</div>
									</div>
								</div>
								<div ng-show="!vista_editar">
									<form id="nuevaPresentacionForm">
										<div class="form-group">
											<label for="descripcionInput">Descripción</label>
											<input type="text" class="form-control" id="descripcionInput" name="descripcionInput"
														placeholder="Descripción" ng-model="nueva_presentacion.descripcion">
										</div>
										<div class="form-group">
											<label for="urlInput">URL</label>
											<input type="text" class="form-control" id="urlInput" name="urlInput" placeholder="URL" ng-model="nueva_presentacion.url">
										</div>
										<div class="checkbox">
											<label style="margin-left: 20px;">
												<input type="checkbox" name="activo" ng-model="nueva_presentacion.activo" style="margin-left: -20px;"> Activar Presentación
											</label>
										</div>
									</form>
								</div>
							</div>
							<div class="modal-footer">
								<div ng-show="vista_editar">	
									<div ng-show="!bandera_editar">
										<button type="button" class="btn btn-success" ng-click="vista_editar = false">Nueva Presentaci&oacute;n</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
									</div>
									<div ng-show="bandera_editar">
										<button type="button" class="btn btn-success" ng-click="guardarPresentacion(presentacion_editable)">Guardar</button>
										<button type="button" class="btn btn-default" ng-click="cancelaEditarPresentacion()">Cancelar</button>
										<div ng-show="lista_errores.length > 0" class="alert alert-danger" role="alert" style="margin-top: 10px; margin-bottom: 0px; padding-top: 5px; padding-bottom: 5px;" >
											{{error}}
											<div ng-repeat="error in lista_errores">{{error}}</div>
										</div>
									</div>
								</div>
								<div ng-show="!vista_editar">	
									<button type="button" class="btn btn-success" ng-click="newPresentacionInicial(nueva_presentacion)">Guardar</button>
									<button type="button" class="btn btn-default" ng-click="cancelarNewPresentacion()">Cancelar</button>
									<div ng-show="lista_errores.length > 0" class="alert alert-danger" role="alert" style="margin-top: 10px; margin-bottom: 0px; padding-top: 5px; padding-bottom: 5px;" >
										{{error}}
										<div ng-repeat="error in lista_errores">{{error}}</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div><!-- Fin Editar Presentación Modal -->
			</div>
			<!-- Sem1 -->
			<div><strong style="color:#606594; font-size:13px;">Resumen de Indicadores Estratégicos 2015</strong></div>
			<div id="table_div" class="googleTable" ></div>
			<div><strong style="color:#606594; font-size:13px;">Resumen de Cultura</strong></div>
			<div class="row" ng-controller="culturaMainController">
				<!-- Sem1 -->
				<div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 width-200 ">
					<div class="panel-header bg-adn-blue-n bd-6 tope tituloazul" style="min-height:15px;"><strong>Valores</strong></div>
					<div class="panel bd-9" style="margin-bottom:0px">
						<div class="panel-content noeditablevista widget-info2 abajo">
							<div class="row">
								<div class="left">
									<ul style="margin-left:20px; color:#606594;">
										<li ng-repeat="valor in lista_valores"><strong class="ng-cloack">{{valor.detalle}}</strong></li>
									</ul>   
								</div>
							</div>
						</div>
					</div>
					<%if(!tipo.equals("Usr")){%>
					<div style="margin-left:0px;" class="row">
						<a style="padding:15px" class="boton" data-toggle="modal" data-target="#editarCulturanModal" ng-click="iniciaVentanaEditar(1)">
							<i class="fa fa-pencil"></i>
						</a>
					</div>
					<% } %>
				</div> <!-- Sem1 -->
				<!-- Sem2 -->
				<div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 width-200 ">
					<div class="panel-header bg-adn-blue-n bd-6 tope tituloazul" style="min-height:15px;"><strong>Principios</strong></div>
					<div class="panel bd-9" style="margin-bottom:0px">
						<div class="panel-content noeditablevista widget-info2 abajo">
							<div class="row">
								<div class="left">
									<ul style="margin-left:20px; color:#606594;">
										<li ng-repeat="principio in lista_principios"><strong>{{principio.detalle}}</strong></li>
									</ul>      
								</div>
							</div>
						</div>
					</div>
					<%if(!tipo.equals("Usr")){%>
					<div style="margin-left:0px;" class="row">
						<a style="padding:15px" class="boton" data-toggle="modal" data-target="#editarCulturanModal" ng-click="iniciaVentanaEditar(2)">
							<i class="fa fa-pencil"></i>
						</a>
					</div>
					<% } %>
				</div> <!-- Sem2 -->
				<!-- Sem3 -->
				<div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 width-200 ">
					<div class="panel-header bg-adn-blue-n bd-6 tope tituloazul" style="min-height:15px;"><strong>Misión</strong></div>
					<div class="panel bd-9" style="margin-bottom:0px">
						<div class="panel-content noeditablevista widget-info2 abajo">
							<div class="row">
								<div class="left" ng-repeat="mision in lista_misiones">
									<strong style="margin-left:20px; margin-top:30px; color:#606594;">{{mision.detalle}}</strong>
								</div>
							</div>
						</div>
					</div>
					<%if(!tipo.equals("Usr")){%>
					<div style="margin-left:0px;" class="row">
						<a style="padding:15px" class="boton" data-toggle="modal" data-target="#editarCulturanModal" ng-click="iniciaVentanaEditar(3)">
							<i class="fa fa-pencil"></i>
						</a>
					</div>
					<% } %>
				</div> <!-- Sem3 -->



				<!-- Editar Cultura Modal -->
				<div id="editarCulturanModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<div>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
									<h4 class="modal-title">Editar {{vista_texto}}</h4>
								</div>
							</div>
							<div class="modal-body">
								<div ng-show="vista_editar">
									<h5 class="modal-title">Seleccione la línea que desea editar.</h5>
									<table class="table">
										<thead>
											<tr>
												<th>Detalle</th>
											</tr>
										</thead>
										<tbody>
											<tr ng-repeat="item in lista_editable" ng-show="!bandera_editar || (bandera_editar && item.id == item_seleccionado)">
												<td ng-class="{'linea-seleccionada': item.id == item_seleccionado}">
													<div ng-click="seleccionarDetalle(item.id)">
														<div class="row">
															<div class="col-md-10">{{item.detalle}}</div>
															<div style="margin-right:0px;" ng-show="item.id == item_seleccionado && !bandera_editar">
																<a class="boton boton-blanco" ng-click="camposEditarItem(item)">
																	<i class="fa fa-pencil"></i>
																</a>
																<a class="boton boton-blanco" ng-click="eliminaItemCultura(item)">
																	<i class="fa fa-remove"></i>
																</a>
															</div>
														</div>
													</div>
												</td>
											</tr>
										</tbody>
									</table>
									<div id="editarItemForm" ng-show="bandera_editar">
										<div class="form-group">
											<label for="detalleItemEditar">Descripción</label>
											<input ng-model="item_editable.detalle" type="text" class="form-control" id="detalleItemEditar" name="detalleItemEditar" placeholder="Detalle">
										</div>
									</div>
								</div>
								<div ng-show="!vista_editar">
									<form id="nuevoItemForm">
										<div class="form-group">
											<label for="detalleItemNuevo">Detalle</label>
											<input type="text" class="form-control" id="detalleItemNuevo" name="detalleItemNuevo" placeholder="Detalle" ng-model="nuevo_item.detalle">
										</div>
									</form>
								</div>
							</div>
							<div class="modal-footer">
								<div ng-show="vista_editar">	
									<div ng-show="!bandera_editar">
										<button type="button" class="btn btn-success" ng-click="vista_editar = false">Nuevo Item</button>
										<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
									</div>
									<div ng-show="bandera_editar">
										<button type="button" class="btn btn-success" ng-click="editarItemCultura(item_editable)">Guardar</button>
										<button type="button" class="btn btn-default" ng-click="cancelaEditarItem()">Cancelar</button>
									</div>
								</div>
								<div ng-show="!vista_editar">	
									<button type="button" class="btn btn-success" ng-click="nuevoItemCultura(nuevo_item)">Guardar</button>
									<button type="button" class="btn btn-default" ng-click="cancelarNuevoItem()">Cancelar</button>
								</div>
							</div>
						</div>
					</div>
				</div><!-- Fin Editar Cultura Modal -->
			</div><!--/.row m-t-10 -->
		</div>
</body>
		<script>

			cuentaLogin();	

		</script>

		<script type="text/javascript" src="js/angular.js"></script>
		<script type="text/javascript" src="js/modulos_angular/inicio/InicioModule.js"></script>
		<script type="text/javascript" src="js/modulos_angular/inicio/controllers/InicioControllers.js"></script>
		<script type="text/javascript" src="js/modulos_angular/inicio/controllers/CulturaControllers.js"></script>
		<script type="text/javascript" src="js/modulos_angular/services/presentacion_inicial/PresentacionInicialServices.js"></script>
		<script type="text/javascript" src="js/modulos_angular/services/cultura/CulturaServices.js"></script>
</html>