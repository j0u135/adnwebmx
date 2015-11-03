<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
	<LINK href="js/bootstrap.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="EstilosADN/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css" type='text/css'>
	<link href="EstilosADN/font-awesome.min.css" rel="stylesheet"> 
    
    
     <!-- Scripts para las graficas -->
    <script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/highcharts.js"></script>
	<script src="js/highcharts-3d.js"></script>
	<script src="js/modulos/exporting.js"></script>
	<script src="js/highcharts-more.js"></script>
	<script src="js/modulos/solid-gauge.js"></script>
	<script src="js/modulos/data.js"></script> 
	<script src="js/modulos/funnel.js"></script>
	
	<!-- Script paa drag & drop -->
	<script src="js/jquery-ui.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<link rel="stylesheet" href="EstilosADN/jquery-ui.css">
	
	<link rel="stylesheet" href="EstilosADN/dis.css" type="text/css"> 
	
	<script src="js/DHSR.js"></script>
	
<%@ page session="true" %>
<%
String usuario1 = "";
String nombre1 = "";
String puesto = "";
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
	 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
} else {
usuario1 = (String)sesionOk.getAttribute("usuario");
nombre1 = (String)sesionOk.getAttribute("nombre");
puesto = (String)sesionOk.getAttribute("puesto");
}
%>
<script type="text/javascript">
    function MM_swapImgRestore() { //v3.0
        var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
    }
    function MM_preloadImages() { //v3.0
        var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
            var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
                if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
    }

    function MM_findObj(n, d) { //v4.01
        var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
            d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}

        if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
        for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
        if(!x && d.getElementById) x=d.getElementById(n); return x;
    }

    function MM_swapImage() { //v3.0
        var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
            if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
    }
</script>
</head>
	
	
<body ng-app="DSHRModule" ng-controller="MainController">

<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario1%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>
<div class="principal">
<table width="100%"><tr><td width="95%" valign="top">
<div class="interfaz" ng-controller="InputController">

 <div class="barratitulo"  style="padding: opx 0px 0px 0px; "><span  id=t"itulonuevo">Reportes Hoja de Ruta</span></div>
   <div class="barraopciones" style="padding: 5px 0px 0px 0px;">
    <table align="center" width="100%" >
    	
    	<tr>
    		
             <td class="textBarra">
					Area
				   </td>
				   <td width=200px>
				   <select class="form-selectm grande" id="selArea" name="area" ng-model="selecciones.area" ng-change="changeAreas()">
						<option ng-repeat="area in combos.area" value="{{area.idArea}}">{{area.area}}</option>
					</select>
					</td>	
	         	
         	
         	<td>
         	<td class="textBarra">
				   Departamento
				   </td>
				   <td width=200px>
				   <select class="form-selectm grande" id="selDepartamento" name="departamento" ng-model="selecciones.departamento"
				   			ng-change="changeDepartamentos()">
						<option id="listaDepartamentos" name="listaDepartamentos" ng-repeat="departamento in combos.departamento"
								value="{{departamento.id_Departamento}}">{{departamento.nb_Departamento}}</option>
					</select>
					</td>	
	         	
         	
         	<td>
         	<td class="textBarra">
					<div ng-hide="selecciones.departamento == 0">Puesto</div>
				   </td>
				   <td width=200px>
					   <div ng-hide="selecciones.departamento == 0">
						   	<select class="form-selectm grande" id="selPuesto" name="puesto" ng-model="selecciones.puesto"
						   			ng-change="changePuestos()">
								<option id="listaPuestos" name="listaPuestos" ng-repeat="puesto in combos.puesto"
										value="{{puesto.idPuesto}}">{{puesto.nb_Puesto}}</option>
							</select>
					   </div>
					</td>	
   		</tr>
   	</table>
   	</div>
   
   	<table table width="98%" align="left" id="filtrostabla">	
        <tr>
        	<td>
	        <table align="center" width="100%">
		        <tr>
			        <td class="textBarra">
							   Año
							   </td>
							   <td width=200px>
							   <select class="form-selectm grande" id="selYear" name="year" ng-model="selecciones.year" ng-change="changeYears()">
									<option id="listaYears" name="listaYears" ng-repeat="year in combos.year" value="{{year}}">{{year}}</option>
								</select>
								</td>	
			        
			        <td>
			        <td class="textBarra">
							   <div ng-hide="selecciones.departamento == 0 || selecciones.puesto == 0">Usuario</div>
							   </td>
							   <td width=200px>
							   <div ng-hide="selecciones.departamento == 0 || selecciones.puesto == 0">
							   		<select class="form-selectm grande" id="selUsuario" name="usuario" ng-model="selecciones.usuario" ng-change="changeUsuarios()">
										<option id="listaUsuarios" name="listaUsuarios" ng-repeat="usuario in combos.usuario" value="{{usuario.User}}">{{usuario.Nombre}}</option>
									</select>
							   </div>
								</td>	
			        <td>
			        <td>
			        	<table align="center" width="100%" ng-controller="BotonesController">
		        			<tr>
						        <td class="textBarra">
										   <button type="button" id="botonHohaRuta" class="btn btn-info btn-sm" autocomplete="off" ng-click="getHojaRuta()">
											 Hojas de Ruta
										</button>
								</td>
								<td class="textBarra">
										<button type="button" id="botonNIs" class="btn btn-info btn-sm" autocomplete="off" ng-click="getIndicadoresMesesByUsuarioYYear()" ng-hide="selecciones.departamento == 0 || selecciones.puesto == 0">
											 Números Inteligentes
										</button>
								</td>
								<td class="textBarra">		
										<button type="button" id="botonPrioridades" class="btn btn-info btn-sm" autocomplete="off" ng-click="getPrioridadesByUsuarioYYear()" ng-hide="selecciones.departamento == 0 || selecciones.puesto == 0">
											 Prioridades
										</button>
						        </td>
						        <td>
							        <a class="boton"  title="Lista NIs" alt="lista nis" id="botonNIs"><i class="fa fa-list-alt"></i></a>
								    <a class="boton"  title="Muestra Gráfica" ng-click="visuales.mostrar_grafica = true"><i class="fa fa-bar-chart"></i></a>

							    </td>
				        	</tr>
				        </table>

				    </td>
	        	</tr>
	        </table>
        </td>
        </tr>
        <tr>
            <td width="95%" valign="top">
            	<form id="guardaDas" action="guardarDashboard" method="post">
	                <div width="100%" height="300px" style="overflow: scroll; height: 300px !important" id="contenedorGraficas" name="contenedorGraficas" ng-controller="TablasController">
	                	<table width= "100%" align="center" id="tablaNIs">
	                		<td colspan>
								<div class="alert {{alertas.tipo}}" role="alert" ng-show="alertas.bandera">
									{{alertas.mensaje}}
									<div ng-repeat="error in alertas.lista_errores">{{error.descripcion}}</div>
								</div>
								<table width="97%" align="center" style="display:inline" ng-show="tablas.hoja_ruta.length > 0 && selecciones.departamento != 0 && selecciones.puesto != 0">
									<tr>
										<th width=25%>Mes</th>
										<th width=17%>Resultado</th>
										<th width=20%>Estatus</th>
										<th width=3% class="ultimo">Acciones</th>
									</tr>
									<tr ng-repeat="hoja in tablas.hoja_ruta">
										<td width=25%><input type="text" class="noeditablevista registroNIs" disabled value="{{hoja.mes_palabra}}"></td>
										<td width=17%><input type="text" class="noeditablevista registroNIs" disabled value="{{hoja.resultado}}"></td>
										<td width=20%><input type="text" class="noeditablevista registroNIs" disabled value="{{hoja.estatus}}"></td>
										<td width=3%>
											<button type="button" id="btnEditar" class="btn btn-info btn-xs" ng-click="submitHojaRuta(hoja)">
												<i class="fa fa-pencil-square-o fa-2x" ></i>
											</button>
										</td>
									</tr>
								</table>

								<table width="97%" align="center" style="display:inline" ng-show="tablas.hoja_ruta.length > 0 && selecciones.departamento != 0 && selecciones.puesto == 0">
									<tr>
										<th width=10%>Usuario</th>
										<th width=10%>Puesto</th>
										<th width=5%>Promedio Anual</th>
										<th width=5%>Meses Evaluados</th>
										<th width=5%>Meses Aprobados</th>
										<th width=5%>Porcentaje de Aprobaciones</th>
									</tr>
									<tr ng-repeat="hoja in tablas.hoja_ruta">
										<td width=10%><input type="text" class="noeditablevista registroNIs" disabled value="{{hoja.usuario.Nombre}}"></td>
										<td width=10%><input type="text" class="noeditablevista registroNIs" disabled value="{{hoja.usuario.nb_Puesto}}"></td>
										<td width=5%><input type="text" class="noeditablevista registroNIs" disabled value="{{hoja.promedio_anual}}"></td>
										<td width=5%><input type="text" class="noeditablevista registroNIs" disabled value="{{hoja.meses_evaluados}}"></td>
										<td width=5%><input type="text" class="noeditablevista registroNIs" disabled value="{{hoja.meses_aprobados}}"></td>
										<td width=5%><input type="text" class="noeditablevista registroNIs" disabled value=
										"{{ hoja.meses_evaluados == 0?'Sin Solicitudes':hoja.porcentaje_aprobado }}"></td>
									</tr>
								</table>

								<table width="97%" align="center" style="display:inline" ng-show="tablas.hoja_ruta.length > 0 && selecciones.departamento == 0">
									<tr>
										<th width=10%>Departamento</th>
										<th width=5%>Promedio Anual</th>
										<th width=5%>Meses Evaluados</th>
										<th width=5%>Meses Aprobados</th>
										<th width=5%>Porcentaje de Aprobaciones</th>
									</tr>
									<tr ng-repeat="hoja in tablas.hoja_ruta">
										<td width=10%><input type="text" class="noeditablevista registroNIs" disabled value="{{hoja.departamento.nb_Departamento}}"></td>
										<td width=5%><input type="text" class="noeditablevista registroNIs" disabled value="{{hoja.promedio_anual}}"></td>
										<td width=5%><input type="text" class="noeditablevista registroNIs" disabled value="{{hoja.meses_evaluados}}"></td>
										<td width=5%><input type="text" class="noeditablevista registroNIs" disabled value="{{hoja.meses_aprobados}}"></td>
										<td width=5%><input type="text" class="noeditablevista registroNIs" disabled value=
										"{{ hoja.meses_evaluados == 0?'Sin Solicitudes':hoja.porcentaje_aprobado }}"></td>
									</tr>
								</table>

								<table width="97%" align="center" style="display:inline" ng-show="tablas.ni.length > 0">
									<tr>
										<th width=25% class="primero">Nombre</th>
										<th width=17%>Unidad</th>
										<th width=5% ng-repeat="item_mes in constantes.meses">{{item_mes.nombre}}</th>
										<th width=3% class="ultimo">Acciones</th>
									</tr>
									<tr ng-repeat="indicador in tablas.ni">
										<td widtd=25%><input type="text" class="noeditablevista registroNIs" disabled value="{{indicador.nb_indicador}}"></td>
										<td widtd=17%><input type="text" class="noeditablevista registroNIs" disabled value="{{indicador.unidad_medida}}"></td>
										<td widtd=5% ng-repeat="item_mes in constantes.meses track by item_mes.id"><input type="text" class="noeditablevista registroNIs" disabled value="{{getResultadoMes(indicador.meses, item_mes.id)}}"></td>
										<td width=3%>
											<div class="btn-group">
												<button type="button" id="btnEditar" class="btn btn-info btn-xs dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													<i class="fa fa-pencil-square-o fa-2x" ></i><span class="caret"></span>
												</button>
												<ul class="dropdown-menu dropdown-menu-right">
													<li ng-repeat="item_mes in constantes.meses">
														<a ng-click="submitNIs(indicador, item_mes.id, getidIndIntMes(indicador.meses, item_mes.id))">{{item_mes.nombre}}</a>
													</li>
												</ul>
											</div>
										</td>
									</tr>
								</table>

								<table width="97%" align="center" style="display:inline" ng-show="tablas.prioridad.length > 0">
									<tr>
										<th width=37% ng-click="submitPrioridad()">Nombre</th>
										<th width=15%>Fecha Inicio</th>
										<th width=15%>Fecha Fin</th>
										<th width=15%>Avance Planeado</th>
										<th width=15%>Avance Real</th>
										<th width=3% class="ultimo">Acciones</th>
									</tr>
									<tr ng-repeat="prioridad in tablas.prioridad">
										<td width=37%><input type="text" class="noeditablevista registroNIs" disabled value="{{prioridad.Nombre}}"></td>
										<td width=15%><input type="text" class="noeditablevista registroNIs" disabled value="{{prioridad.fhInicio_s}}"></td>
										<td width=15%><input type="text" class="noeditablevista registroNIs" disabled value="{{prioridad.fhFin_s}}"></td>
										<td width=15%><input type="text" class="noeditablevista registroNIs" disabled value="{{prioridad.ultimoMesPlaneado}}"></td>
										<td width=15%><input type="text" class="noeditablevista registroNIs" disabled value="{{prioridad.ultimoMesReal}}"></td>
										<td width=3%>
											<div class="btn-group">
												<button type="button" id="btnEditar" class="btn btn-info btn-xs dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
													<i class="fa fa-pencil-square-o fa-2x" ></i><span class="caret"></span>
												</button>
												<ul class="dropdown-menu dropdown-menu-right">
													<li ng-repeat="mes in prioridad.meses"><a ng-click="submitPrioridad(prioridad, mes.mes_numerico, mes.mes)">{{mes.mes}}</a></li>
												</ul>
											</div>
										</td>
									</tr>
								</table>

							</td>
	                	</table>
	                </div>
	 			</form>	
            </td>
        </tr>
   <tr>
   <td> 
	<div style="height:430px; width:95%" class="areagrafica" ng-show="visuales.mostrar_grafica" ng-controller="GraficasController">
	<img src="ImagenesADN/cerrar.png" align="left" id="botonQuitarInd" ng-click="visuales.mostrar_grafica = false">
			<label align="center" value="" id="label1" class="titulodivs">Gráfica</label>
			<table width="100%" BGCOLOR="#f5f6f6" border="0">
                <tr>
                <td width="5%">
                <table>
                <tr>
					<td align="center" BGCOLOR="#f5f6f6">
						<img src="ImagenesADN/barra-graficas.png"  onclick="ejecutaGraficas('bar')">
					</td>
				</tr>
				<tr>
					<td align="center" BGCOLOR="#f5f6f6">
						<img src="ImagenesADN/grafica-linea.png"  onclick="ejecutaGraficas('line')">
					</td>
				</tr>
				<tr>
					<td align="center" BGCOLOR="#f5f6f6">
						<img src="ImagenesADN/barrasConNegativo.png"  onclick="ejecutaGraficas('column')">
					</td>
				</tr>
				<tr>
					<td align="center" BGCOLOR="#f5f6f6">
						<img src="ImagenesADN/graficaArea.png"  onclick="ejecutaGraficas('area')">
					</td>
				</tr>
				</table>
				</td>
	            <td width="95%">
	             <div id="indicadorGrafica"  style="width: 95%; height: 400px; margin: 0 auto">
			     </div>    
	            </td>			
				</tr>
				
			</table>  			
	</div>
</td>
</tr>	
</table>
</div>
</td>
<td width="5%" align="left" valign="top">
			
            <table width="100%" class="sidebar" border="0">
                <tr>
					<td align="center">
						<img src="ImagenesADN/tareas.png" title="Tareas" width="40" height="40"  alt="Tareas" onclick="linkDir('Tareas.jsp')">
					Tareas</td>
				</tr>
				<tr>
					<td align="center">
						<img src="ImagenesADN/Juntas.png" title="Juntas" width="40" height="40" alt="Juntas" onclick="">
					Juntas</td>
				</tr>
				<tr>
					<td align="center">
						<img src="ImagenesADN/Aprobaciones.png" title="Aprobaciones" width="30" height="30" alt="Aprobaciones" onclick="linkDir('Interfaz7.jsp')">
					Aprobación</td>
				</tr>
				<tr>
					<td align="center">
						<img src="ImagenesADN/Reportes.png" title="Reportes" width="30" height="35" alt="Reportes" onclick="linkDir('DSHR.jsp')">
					Reportes</td>
				</tr>
			</table>       
		</td>
	</tr>
	</table>
</div>
	<div align="center">
	 	<p class="footer">Powered by: ADN. Todos los derechos reservados. 2015</p>
	  	<div id="logodiezequis">
	  		<img src="ImagenesADN/logo-adn.png" width="53" height="37" />
	  	</div>
	</div>

	<form method="POST" id="redireccion_hojaruta" action="CargaInterfazIndicadores">
		<input type="hidden" id="usuarioRedireccion" name="usuarioRedireccion">
		<input type="hidden" id="mesEnviado" name="mesEnviado">
		<input type="hidden" id="mesNumerico" name="mesNumerico">
		<input type="hidden" id="anioSel" name="anioSel">
		<input type="hidden" id="origen" name="origen" value="Select">
	</form>	


	<form method="POST" id="redireccion_prioridades" action="ServletRedireccionProy">
		<input type="hidden" id="hiddenRedireccion" name="hiddenRedireccion">
		<input type="hidden" id="usuarioHR" name="usuarioHR">
		<input type="hidden" id="pesoTotal" name="pesoTotal" value="0">
		<input type="hidden" id="desMensual" name="desMensual" value="0">
		<input type="hidden" id="mesBarra" name="mesBarra">
		<input type="hidden" id="anioSel" name="anioSel">
		<input type="hidden" id="mesNumerico" name="mesNumerico">
	</form>	


	<form method="POST" id="redireccion_nis" action="servletRedireccion">
		<input type="hidden" id="hiddenRedireccion" name="hiddenRedireccion">
		<input type="hidden" id="usuarioHR" name="usuarioHR">
		<input type="hidden" id="anioSel" name="anioSel">
		<input type="hidden" id="pesoTotal" name="peso" value="0">
		<input type="hidden" id="desMensual" name="desMensual" value="0">
		<input type="hidden" id="mesBarra" name="mesBarra">
		<input type="hidden" id="cveIndInte" name="cveIndInte">
		<input type="hidden" id="mesNumerico" name="mesNumerico">
	</form>	


</body>

<script>
inicio();

function reportes(){
	document.getElementById("ExportarDatos").submit();
}

</script>

	<script type="text/javascript" src="js/angular.js"></script>
	<script type="text/javascript" src="js/modulos_angular/DSHR/MainModule.js"></script>
	<script type="text/javascript" src="js/modulos_angular/DSHR/controllers/MainController.js"></script>
	<script type="text/javascript" src="js/modulos_angular/DSHR/controllers/InputsController.js"></script>
	<script type="text/javascript" src="js/modulos_angular/DSHR/controllers/BotonesController.js"></script>
	<script type="text/javascript" src="js/modulos_angular/DSHR/controllers/TablasController.js"></script>
	<script type="text/javascript" src="js/modulos_angular/DSHR/controllers/GraficasController.js"></script>
	<script type="text/javascript" src="js/modulos_angular/services/commons/CommonsServices.js"></script>
	<script type="text/javascript" src="js/modulos_angular/services/hoja_ruta/HojaRutaServices.js"></script>
	<script type="text/javascript" src="js/modulos_angular/services/usuarios/UsuariosServices.js"></script>
	<script type="text/javascript" src="js/modulos_angular/services/indicadores_inteligentes/IndicadoresInteligentesServices.js"></script>
	<script type="text/javascript" src="js/modulos_angular/services/prioridades/PrioridadesServices.js"></script>

</html>