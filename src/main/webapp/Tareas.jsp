
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	
	
	<link rel="stylesheet" href="EstilosADN/bootstrap.min.css" type="text/css">
	<LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
	 <link rel="stylesheet" href="EstilosADN/dis.css" type="text/css"> 
	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css" type='text/css'>
    
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet"> 
     <script src="js/jquery.min.js"></script> 
    <script src="js/bootstrap.min.js"></script> 
	<script src="js/bootstrap-modal.js"></script>
    
    <script src="js/interfaz1.js"></script>
	
	<script src="js/highcharts.js"></script>
	<script src="js/modulos/exporting.js"></script>
	<script src="js/jquery-ui.js"></script>

<title>Tareas</title>

<%@ page import ="java.sql.SQLException"%> 
<%@ page import = "com.adn.conexion.ClaseIndicadoresInteligentes"%> 
<%@ page import = "com.adn.conexion.ClaseProyectosPrioritarios"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>




<%@ page session="true" %>
<%
String usuario = "";
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
	 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
} else {
usuario = (String)sesionOk.getAttribute("usuario");
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
<body onload="MM_preloadImages('ImagenesADN/direccion-rollover.png','ImagenesADN/analisis-rollover.png','ImagenesADN/gerencia-rollover.png','ImagenesADN/planeacion-rollover.png','ImagenesADN/tablero-rollover.png','ImagenesADN/admon-rollover.png')" class="modulodis">





<div class="principal">
	
	
	
	
	        	<div class="shadow" id="barrausuario">
	                	<table width="100%">
	                		<tr>
	                			<td align="left">
	                				<table>
	                					<tr align="center">
				                			<td align="left">
				                				 <div id="iconousuario"><img src="ImagenesADN/icono-usuario.png" width="26" height="31" /></div>
				                			</td>
				                			<td align="left">
				                				<div id="usuario"><%=usuario%></div> 
				                			</td>
				                		</tr>
				                	 </table>
	                			</td>
	                			<td>
	                				<form action="${pageContext.request.contextPath}/logout" method="post">
								    	<button type="submit" data-loading-text="Salir"  class="btn btn-danger" autocomplete="off">
											 LogOut
										</button>
									</form>
	                			</td>
	                			<td align="right">
	                				<table>		
				                			<td align="right">
				                				 <div id=""><img src="ImagenesADN/icono-fecha.png" width="28" height="31" /></div>
				                			</td>
				                			<td align="right">
				                				 <div id="fecha">
							                        <script type="text/JavaScript"> var f = new Date(); document.getElementById("fecha").innerHTML=(((f.getDate()<10)?("0"+f.getDate()):(f.getDate())) + "/" +((f.getMonth() +1<10)?("0"+(f.getMonth() +1)):(f.getMonth() +1))+ "/" + f.getFullYear()); </script>
							                    </div>
				                			</td>
				                			<td align="right">
				                				 <div id=""><img src="ImagenesADN/icono-hora.png" width="26" height="31" /></div>
				                			</td>
				                			<td align="right">
				                				 <div id="hora">
							                        <script type="text/javascript"> function startTime(){ today=new Date(); h=today.getHours(); m=today.getMinutes(); s=today.getSeconds(); m=checkTime(m); s=checkTime(s); document.getElementById('reloj').innerHTML=h+":"+m+":"+s; t=setTimeout('startTime()',500);} function checkTime(i) {if (i<10) {i="0" + i;}return i;} window.onload=function(){startTime();} </script> <div id="reloj"></div>
							                     </div>
				                			</td>
				                		</tr>
				                	</table>
	                			</td>
	                		</tr>
	                </table>		
				 </div>
         
		<div class="modulo">
		<div class="modizquierda">
			<div class="mods1">
				<div class="fotousuario"><img src="ImagenesADN/foto.jpg"></div>
				<div class="datosusuario">
				   <h2>Rodrigo Gutierrez </h2>
					<p>Director de Operaciones</p>
				</div>
			</div>
	   </div>
	   
		<div class="modconf">	
			<div class="modheader">
				<div class="headerizq">					
					<div id="menu">
			                
							
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('direccion','','ImagenesADN/Nmenu/planeacion-rollover.png',1)"><img src="ImagenesADN/Nmenu/planeacion-normal.png" name="direccion" width="57" height="59" border="0" id="direccion" onclick="linkDir('Estrategia.jsp')"/> </a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('gerencia','','ImagenesADN/Nmenu/arbol-rollover.png',1)"><img src="ImagenesADN/Nmenu/arbol-normal.png" name="gerencia" width="69" height="59" border="0" id="gerencia" onclick="linkDir('arbolIndicadoresADN.jsp')"/></a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('planeacion','','ImagenesADN/Nmenu/dash-rollover.png',1)"><img src="ImagenesADN/Nmenu/dash-normal.png" name="planeacion" width="70" height="59" border="0" id="planeacion" onclick="linkDir('DashBoardADN.jsp')" /></a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('tablero','','ImagenesADN/Nmenu/desempeno-rollover.png',1)"><img src="ImagenesADN/Nmenu/desempeno-normal.png" name="tablero" width="69" height="59" border="0" id="tablero"  onclick="hojaRumbo()" /></a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('admon','','ImagenesADN/Nmenu/config-rollover.png',1)"><img src="ImagenesADN/Nmenu/config-normal.png" name="admon" width="65" height="59" border="0" id="admon" onclick="linkDir('usuariosADN.jsp')" /></a></div>
							<div id="" style="display:inline-block"><a href="https://sites.google.com/a/10x.mx/soporte-adn/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('analisis','','ImagenesADN/Nmenu/ayuda-rollover.png',1)"><img src="ImagenesADN/Nmenu/ayuda-normal.png" name="analisis" width="55" height="59" border="0" id="analisis"/></a></div>
					</div>
					<div class="logocliente"><img src="ImagenesADN/empresa.png"></div>
				</div>
				<div class="headerder">
					<div class="logo"><img src="ImagenesADN/logo-adn.png"/></div>
				</div>
			</div>
	  </div>
		
			
	</div>

    </br>

<table width="100%"><tr><td width="95%" valign="top">		
<div class="interfaz">
		<div class="filtros">
			<div class="filtrostitulo">Filtros</div>
			<table width="90%" align="center">
				<tr>
					<td><a href="#" class="btn btn-info" id="mistareas">Mis tareas</a> <span id="vertodas" class="btn btn-info">Ver todas</span></td>
					<td><span>Proyecto</span><select id="promedio"><option value="Ejemplo 1">Ejemplo 1</option><option value="Ejemplo 2">Ejemplo 2</option><option value="Ejemplo 3">Ejemplo 3</option></select></td>
					<td><a href="#" class="btn btn-success" id="atiempo">A tiempo</a> <a href="#" class="btn btn-info" id="hoy">Hoy</a></td>
				</tr>
				<tr>
					<td><select id="equipo"><option value="Mi Equipo">Mi Equipo</option><option value="Ejemplo 1">Ejemplo 1</option><option value="Ejemplo 2">Ejemplo 2</option><option value="Ejemplo 3">Ejemplo 3</option></select></td>
					<td><span>Actividad</span><select id="actividad"><option value="Ejemplo 1">Ejemplo 1</option><option value="Ejemplo 2">Ejemplo 2</option><option value="Ejemplo 3">Ejemplo 3</option></select></td>
					<td><a href="#" class="btn btn-warning" id="vencidos">Vencidos</a> <!--<a href="#" class="btn btn-info">Fecha</a>--><input type="hidden" value="" id="fecha"></td>
				</tr>
			</table>
		</div>
		<div class="actividades">
			<table width="100%" align="center">
				<td><span class="boton" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i></span> <span class="boton" id="editar" data-toggle="modal" data-target="#EditarModal"><i class="fa fa-pencil"></i></span> <span class="boton" id="eliminar"><i class="fa fa-times"></i></span><a href="#" class="guardar" title="Guardar" alt="Guardar"><img src="ImagenesADN/guardar.jpg"></a></td>
			</table>
			<div class="actividadestabla">
				<table align="center" width="100%" class="tablatitulo">
					<tr>
						<td align="center">No completadas</td>
						<td align="center">En progreso</td>
						<td align="center">Completadas</td>
					</tr>
				</table>
				<table width="100%" align="center" class="appactividades">
					<tr>
						<td width="33%" align="center">
							<div class="apptabla"><table align="center" width="100%" id="nocompletadas"><tbody class="conexion">
								<tr class="tarea1">
									<td></td>
								</tr>
								<tr class="mistareas atiempo hoy">
									<td><div class="tarea tareaverde" id="tarea1"><div class="izquierda"><input type="radio" name="tarea"></div><div class="derecha"><input type="text" class="form-control" name="prioridadtarea" value="A"><input type="hidden" name="tipotarea" value="Indicador"><input type="hidden" name="origentarea" value="Ind 1"><input type="hidden" name="asignartarea" value="Empleado 1"><input type="hidden" name="notastarea" value="Ejemplo de notas."><input type="hidden" name="iniciatarea" value="18-11-2014"><input type="hidden" name="fintarea" value="30-11-2014"></div><span class="nombretarea">contratar personal de ventas</span></div></td>
								</tr>
								<tr class="vencidos">
									<td><div class="tarea tareanaranja" id="tarea2"><div class="izquierda"><input type="radio" name="tarea"></div><div class="derecha"><input type="text" class="form-control" name="prioridadtarea" value="A"><input type="hidden" name="tipotarea" value="Indicador"><input type="hidden" name="origentarea" value="Ind 1"><input type="hidden" name="asignartarea" value="Empleado 1"><input type="hidden" name="notastarea" value="Ejemplo de notas."><input type="hidden" name="iniciatarea" value="18-11-2014"><input type="hidden" name="fintarea" value="30-11-2014"></div><span class="nombretarea">Capacitación de uso del producto</span></div></td>
								</tr>
							</tbody></table></div>
						</td>
						<td width="33%" align="center">
							<div class="apptabla"><table align="center" width="100%" id="progreso"><tbody class="conexion">
								<tr class="tarea1">
									<td></td>
								</tr>
								<tr class="atiempo hoy">
									<td><div class="tarea tareaverde" id="tarea3"><div class="izquierda"><input type="radio" name="tarea"></div><div class="derecha"><input type="text" class="form-control" name="prioridadtarea" value="A"><input type="hidden" name="tipotarea" value="Indicador"><input type="hidden" name="origentarea" value="Ind 1"><input type="hidden" name="asignartarea" value="Empleado 1"><input type="hidden" name="notastarea" value="Ejemplo de notas."><input type="hidden" name="iniciatarea" value="18-11-2014"><input type="hidden" name="fintarea" value="30-11-2014"></div><span class="nombretarea">Diseño de plan de marketing</span></div></td>
								</tr>
								<tr class="mistareas vencidos hoy">
									<td><div class="tarea tareanaranja" id="tarea4"><div class="izquierda"><input type="radio" name="tarea"></div><div class="derecha"><input type="text" class="form-control" name="prioridadtarea" value="A"><input type="hidden" name="tipotarea" value="Indicador"><input type="hidden" name="origentarea" value="Ind 1"><input type="hidden" name="asignartarea" value="Empleado 1"><input type="hidden" name="notastarea" value="Ejemplo de notas."><input type="hidden" name="iniciatarea" value="18-11-2014"><input type="hidden" name="fintarea" value="30-11-2014"></div><span class="nombretarea">Diseñar Modelo de costos fijos</span></div></td>
								</tr>
								<tr class="atiempo">
									<td><div class="tarea tareaverde" id="tarea5"><div class="izquierda"><input type="radio" name="tarea"></div><div class="derecha"><input type="text" class="form-control" name="prioridadtarea" value="A"><input type="hidden" name="tipotarea" value="Indicador"><input type="hidden" name="origentarea" value="Ind 1"><input type="hidden" name="asignartarea" value="Empleado 1"><input type="hidden" name="notastarea" value="Ejemplo de notas."><input type="hidden" name="iniciatarea" value="18-11-2014"><input type="hidden" name="fintarea" value="30-11-2014"></div><span class="nombretarea">Contratación de nueva oficina</span></div></td>
								</tr>
							</tbody></table></div>
						</td>
						<td width="33%" align="center">
							<div class="apptabla"><table align="center" width="100%" id="completadas"><tbody class="conexion">
								<tr class="tarea1">
									<td></td>
								</tr>
								<tr>
									<td><div class="tarea tareaazul" id="tarea6"><div class="izquierda"><input type="radio" name="tarea"></div><div class="derecha"><input type="text" class="form-control" name="prioridadtarea" value="A"><input type="hidden" name="tipotarea" value="Indicador"><input type="hidden" name="origentarea" value="Ind 1"><input type="hidden" name="asignartarea" value="Empleado 1"><input type="hidden" name="notastarea" value="Ejemplo de notas."><input type="hidden" name="iniciatarea" value="18-11-2014"><input type="hidden" name="fintarea" value="30-11-2014"></div><span class="nombretarea">Contratos de canales de distribución</span></div></td>
								</tr>
								<tr>
									<td><div class="tarea tareaazul" id="tarea7"><div class="izquierda"><input type="radio" name="tarea"></div><div class="derecha"><input type="text" class="form-control" name="prioridadtarea" value="A"><input type="hidden" name="tipotarea" value="Indicador"><input type="hidden" name="origentarea" value="Ind 1"><input type="hidden" name="asignartarea" value="Empleado 1"><input type="hidden" name="notastarea" value="Ejemplo de notas."><input type="hidden" name="iniciatarea" value="18-11-2014"><input type="hidden" name="fintarea" value="30-11-2014"></div><span class="nombretarea">Diseño de metas de ventas individuales</span></div></td>
								</tr>
							</tbody></table></div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</td>
			<td width="5%" align="center" valign="top">
			
             <table width="100%" class="sidebar" border="0">
                <tr>
					<td align="center">
						<img src="ImagenesADN/tareas.png" title="Tareas" width="50" height="50"  alt="Tareas" onclick="linkDir('Tareas.jsp')">
					</td>
				</tr>
				<tr>
					<td align="center">
						<img src="ImagenesADN/Juntas.png" title="Juntas" width="50" height="50" alt="Juntas" onclick="">
					</td>
				</tr>
				<tr>
					<td align="center">
						<img src="ImagenesADN/Hoja de rumbo.png" title="Hoja de rumbo" width="40" height="40" alt="Hoja de rumbo" onclick="hojaRumbo()">
					</td>
				</tr>
				<tr>
					<td align="center">
						<img src="ImagenesADN/Aprobaciones.png" title="Aprobaciones" width="38" height="38" alt="Aprobaciones" onclick="linkDir('Interfaz7.jsp')">
					</td>
				</tr>
				<tr>
					<td align="center">
						<img src="ImagenesADN/Reportes.png" title="Reportes" width="40" height="45" alt="Reportes" onclick="reportes()">
					</td>
				</tr>
				<tr>
					<td align="center">
						<a href="ADNFiles/Reporte.xls">Descargar</a>
					</td>
				</tr>
			</table>       
		</td>
	
	</tr>
</table>
</div>
<!-- Agregar Inicia -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
        <h4 class="modal-title" id="myModalLabel">Agregar tarea</h4>
      </div>
      <div class="modal-body">
      	<form id="creartarea">
        <table width="100%" align="center">
        	<tr>
        		<td colspan="2"><span class="izquierda">Nombre</span> <input type="text" name="nombre" class="form-control modalnombre"></td>
        	</tr>
        	<tr>
        		<td><span class="izquierda">Tipo</span><select id="tipomodal" name="tipomodal"><option value="Ninguno"></option><option value="Indicador">Indicador</option><option value="Proyecto">Proyecto</option><option value="Reunion">Reunión</option></select></td>
        		<td><span class="izquierda">Asignar A</span><select name="asignarmodal"><option value=""></option><option value="Empleado 1">Empleado 1</option><option value="Empleado 2">Empleado 2</option><option value="Empleado 3">Empleado 3</option></select></td>
        	</tr>
        	<tr>
        		<td><span class="izquierda">Origen</span><select name="origenmodal" id="origenmodal"></select></td>
        		<td rowspan="3"><span class="izquierda">Notas</span><textarea class="form-control" name="notasmodal"></textarea></td>
        	</tr>
        	<tr>
        		<td><span class="izquierda">Prioridad</span><select name="prioridadmodal"><option value=""></option><option value="A">Alta</option><option value="M">Media</option><option value="B">Baja</option></select></td>
        	</tr>
        	<tr>
        		<td><span class="izquierda">Periodo</span><div class="derecha"><input type="text" name="inicio" class="form-control datepicker" id="inicio" placeholder="Inició"> <input type="text" name="fin" class="form-control datepicker" id="fin" placeholder="Fin"></div></td>
        	</tr>
        </table>
       </form>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-success" id="agregartarea" data-dismiss="modal">Aceptar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal">Cancelar</button>
      </div>
    </div>
  </div>
</div>
<!-- Agregar Termina -->
<!-- Editar Inicia -->
<div class="modal fade" id="EditarModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Cerrar</span></button>
        <h4 class="modal-title" id="myModalLabel">Editar tarea</h4>
      </div>
      <div class="modal-body">
      	<form id="editarform">
      		<table width="100%" align="center">
      			<tr>
      				<td colspan="2"><span class="izquierda">Nombre</span> <input type="hidden" name="id" value=""><input type="text" name="nombre2" class="form-control modalnombre" value=""></td>
      			</tr>
      			<tr>
      				<td><span class="izquierda">Tipo</span><select id="tipomodal2" name="tipomodal2"><option value="Ninguno"></option><option value="Indicador">Indicador</option><option value="Proyecto">Proyecto</option><option value="Reunion">Reunión</option></select></td>
      				<td><span class="izquierda">Asignar A</span><select name="asignarmodal2"><option value=""></option><option value="Empleado 1">Empleado 1</option><option value="Empleado 2">Empleado 2</option><option value="Empleado 3">Empleado 3</option></select></td>
      			</tr>
      			<tr>
      				<td><span class="izquierda">Origen</span><select name="origenmodal2" id="origenmodal2"></select></td>
      				<td rowspan="3"><span class="izquierda">Notas</span><textarea class="form-control" name="notasmodal2"></textarea></td>
      			</tr>
      			<tr>
      				<td><span class="izquierda">Prioridad</span><select name="prioridadmodal2"><option value=""></option><option value="A">Alta</option><option value="M">Media</option><option value="B">Baja</option></select></td>
      			</tr>
      			<tr>
      				<td><span class="izquierda">Periodo</span><div class="derecha"><input type="text" name="inicio2" class="form-control datepicker" id="inicio2" placeholder="Inició" value=""> <input type="text" name="fin2" class="form-control datepicker" id="fin2" placeholder="Fin" value=""></div></td>
      			</tr>
      		</table>
       </form>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-success" id="editartarea" data-dismiss="modal">Aceptar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" id="cancelareditar">Cancelar</button>
      </div>
    </div>
  </div>
</div>


<div align="center">
  <p class="footer">Powered by: ADN. Todos los derechos reservados. 2015</p>
  <div id="logodiezequis"><img src="ImagenesADN/logo-adn.png" width="53" height="37" /></div>
</div>

<form method="POST" id="redireccion" action="CargaInterfazIndicadores">
	<input type="hidden" id="usuarioRedireccion" name="usuarioRedireccion" value="">
	<input type="hidden" id="mesEnviado" name="mesEnviado" value="">
	<input type="hidden" id="origen" name="origen" value="">
</form>

<form method="POST" id="linkDireccion" action="linkDireccion">
	<input type="hidden" id="linkDestino" name="linkDestino" value="">
</form>

<!-- Editar Termina -->
<script>
var total = 7;
$(document).ready(function() {

    var $tabs=$('#progreso')
    $( "tbody.conexion" )
        .sortable({
            connectWith: ".conexion",
            items: "> tr:not(:first)",
            appendTo: $tabs,
            helper:"clone",
            zIndex: 999990
        })
        .disableSelection()
    ;
    
    var $tab_items = $( ".nav-tabs > li", $tabs ).droppable({
      accept: ".conexion tr",
      hoverClass: "ui-state-hover",
      
      drop: function( event, ui ) {
        return false;
      }
    });
    
});
$( "#vertodas" ).click(function() {
  $('.apptabla tr').show();
});
$( "#mistareas" ).click(function() {
  $('.apptabla tr').show();
  $('.apptabla tr:not(".mistareas,.tarea1")').hide();
});
$( "#atiempo" ).click(function() {
	$('.apptabla tr').show();
  $('.apptabla tr:not(".atiempo,.tarea1")').hide();
});
$( "#vencidos" ).click(function() {
	$('.apptabla tr').show();
  $('.apptabla tr:not(".vencidos,.tarea1")').hide();
});
$( "#hoy" ).click(function() {
	$('.apptabla tr').show();
  $('.apptabla tr:not(".hoy,.tarea1")').hide();
});

$(function() {
    $( "#fecha1" ).datepicker({
      showOn: "button",
      buttonText: "Fecha",
      dateFormat: "dd-mm-yy",
      onSelect: function(dateText) {
      	var fecha = $(this).val();
      	$('.apptabla tr').show();
  		$('.apptabla tr:not(".mistareas,.tarea1")').hide();
      }
    }).next(".ui-datepicker-trigger").addClass("btn btn-info");
});


$( "#eliminar" ).click(function() {
	$( ".appactividades input:checked" ).closest("tr").remove();
});

$("#equipo").change(function() {
	var equipo = $("#equipo").val();
	$('.apptabla tr').show();
  	$('.apptabla tr:not(".mistareas,.tarea1")').hide();
});

$("#promedio").change(function() {
	var promedio = $("#promedio").val();
	$('.apptabla tr').show();
  	$('.apptabla tr:not(".atiempo,.tarea1")').hide();
});

$("#actividad").change(function() {
	var actividad = $("#equipo").val();
	$('.apptabla tr').show();
  	$('.apptabla tr:not(".vencidos,.tarea1")').hide();
});

$(function() {
    $( "#inicio" ).datepicker({dateFormat: "dd-mm-yy"});
    $( "#fin" ).datepicker({dateFormat: "dd-mm-yy"});
  });

$( "#tipomodal" ).change(function() {
	var tipo = $("#tipomodal").val();
	$("#origenmodal option").remove();
	if (tipo == "Indicador") {
		$('<option value="Ind 1">Ind 1</option><option value="Ind 2">Ind 2</option><option value="Ind 3">Ind 3</option>').appendTo('#origenmodal');
	} else if (tipo == "Proyecto") {
		$('<option value="Proy 1">Proy 1</option><option value="Proy 2">Proy 2</option><option value="Proy 3">Proy 3</option>').appendTo('#origenmodal');
	} else if (tipo == "Reunion") {
		$('<option value="Min 1">Min 1</option><option value="Min 2">Min 2</option><option value="Min 3">Min 3</option>').appendTo('#origenmodal');
	}
});
  
$("#agregartarea").click(function() {
	tarea = 1;
	total=total+tarea;
	console.log(total);
	var nombre = $("[name='nombre']").val();
	var prioridad = $("[name='prioridadmodal']").val();
	var inicio = $("[name='inicio']").val();
	var fin = $("[name='fin']").val();
	var tipo = $("#tipomodal").val();
	var origen = $("#origenmodal").val();
	var asignar = $("[name='asignarmodal']").val();
	var notas = $("[name='notasmodal']").val();
	$('<tr class="atiempo"><td><div class="tarea tareaverde" id="tarea'+total+'"><div class="izquierda"><input type="radio" name="tarea"></div><div class="derecha"><input type="text" class="form-control" name="prioridadtarea" value="'+prioridad+'"><input type="hidden" name="tipotarea" value="'+tipo+'"><input type="hidden" name="origentarea" value="'+origen+'"><input type="hidden" name="asignartarea" value="'+asignar+'"><input type="hidden" name="notastarea" value="'+notas+'"><input type="hidden" name="iniciatarea" value="'+inicio+'"><input type="hidden" name="fintarea" value="'+fin+'"></div><span class="nombretarea">'+nombre+'</span></div></td></tr>').appendTo('#nocompletadas');
	$("#origenmodal option").remove();
	$("#creartarea")[0].reset()
});

$( "#editar" ).click(function() {
	var divpadre = $( ".appactividades input:checked" ).closest("div.tarea");
	var divid = divpadre.attr('id');
	var editarnombre = divpadre.find("span").text();
	var editarprioridad = divpadre.find("[name='prioridadtarea']").val();
	var editartipo = divpadre.find("[name='tipotarea']").val();
	var editarorigen = divpadre.find("[name='origentarea']").val();
	var editarasignar = divpadre.find("[name='asignartarea']").val();
	var editarnotas = divpadre.find("[name='notastarea']").val();
	var editarinicio = divpadre.find("[name='iniciatarea']").val();
	var editarfin = divpadre.find("[name='fintarea']").val();
	if (editarnombre.length == 0) {
		alert("Favor de seleccionar una tarea");
		return false;
	}
	console.log(divid);
	$("#origenmodal2 option").remove();
	/*$('<table width="100%" align="center"><tr><td colspan="2"><span class="izquierda">Nombre</span> <input type="hidden" name="id" value="'+divid+'"><input type="text" name="nombre2" class="form-control modalnombre" value="'+editarnombre+'"></td></tr><tr><td><span class="izquierda">Tipo</span><select id="tipomodal2" name="tipomodal2"><option value="Ninguno"></option><option value="Indicador">Indicador</option><option value="Proyecto">Proyecto</option><option value="Reunion">Reunión</option></select></td><td><span class="izquierda">Asignar A</span><select name="asignarmodal2"><option value=""></option><option value="Empleado 1">Empleado 1</option><option value="Empleado 2">Empleado 2</option><option value="Empleado 3">Empleado 3</option></select></td></tr><tr><td><span class="izquierda">Origen</span><select name="origenmodal2" id="origenmodal2"></select></td><td rowspan="3"><span class="izquierda">Notas</span><textarea class="form-control" name="notasmodal2">'+editarnotas+'</textarea></td></tr><tr><td><span class="izquierda">Prioridad</span><select name="prioridadmodal2"><option value=""></option><option value="A">Alta</option><option value="M">Media</option><option value="B">Baja</option></select></td></tr><tr><td><span class="izquierda">Periodo</span><div class="derecha"><input type="text" name="inicio2" class="form-control datepicker" id="inicio2" placeholder="Inició" value="'+editarinicio+'"> <input type="text" name="fin2" class="form-control datepicker" id="fin2" placeholder="Fin" value="'+editarfin+'"></div></td></tr></table>').appendTo('#editarform');*/
	$("[name='id']").val(divid);
	$("[name='nombre2']").val(editarnombre);
	$("#tipomodal2").val(editartipo);
	var tipoModal = $("#tipomodal2").val();
	if (tipoModal == "Indicador") {
		$('<option value="Ind 1">Ind 1</option><option value="Ind 2">Ind 2</option><option value="Ind 3">Ind 3</option>').appendTo('#origenmodal2');
	} else if (tipoModal == "Indicador") {
		$('<option value="Proy 1">Proy 1</option><option value="Proy 2">Proy 2</option><option value="Proy 3">Proy 3</option>').appendTo('#origenmodal2');
	} else if (tipoModal == "Reunion") {
		$('<option value="Min 1">Min 1</option><option value="Min 2">Min 2</option><option value="Min 3">Min 3</option>').appendTo('#origenmodal2');
	}
	$("#origenmodal2").val(editarorigen);
	$("[name='asignarmodal2']").val(editarasignar);
	$("[name='notasmodal2']").val(editarnotas);
	$("[name='prioridadmodal2']").val(editarprioridad);
	$("#inicio2").val(editarinicio);
	$("#fin2").val(editarfin);
	$( "#inicio2" ).datepicker({dateFormat: "dd-mm-yy"});
    $( "#fin2" ).datepicker({dateFormat: "dd-mm-yy"});
});

$( "#tipomodal2" ).change(function() {
	var tipo2 = $("#tipomodal2").val();
	$("#origenmodal2 option").remove();
	if (tipo2 == "Indicador") {
		$('<option value="Ind 1">Ind 1</option><option value="Ind 2">Ind 2</option><option value="Ind 3">Ind 3</option>').appendTo('#origenmodal2');
	} else if (tipo2 == "Proyecto") {
		$('<option value="Proy 1">Proy 1</option><option value="Proy 2">Proy 2</option><option value="Proy 3">Proy 3</option>').appendTo('#origenmodal2');
	} else if (tipo2 == "Reunion") {
		$('<option value="Min 1">Min 1</option><option value="Min 2">Min 2</option><option value="Min 3">Min 3</option>').appendTo('#origenmodal2');
	}
});

$("#cancelareditar").click(function() {
	$(".appactividades [type='radio']").removeAttr('checked');            
	$( ".appactividades [type='radio']" ).buttonset('refresh');
	$("#editarform")[0].reset()
});

$("#editartarea").click(function() {
	var id = $("[name='id']").val();
	var nombre = $("[name='nombre2']").val();
	var prioridad = $("[name='prioridadmodal2']").val();
	var inicio = $("[name='inicio2']").val();
	var fin = $("[name='fin2']").val();
	var tipo = $("#tipomodal2").val();
	var origen = $("#origenmodal2").val();
	var asignar = $("[name='asignarmodal2']").val();
	var notas = $("[name='notasmodal2']").val();
	console.log(nombre);
	$("#"+id+" .nombretarea").text(nombre);
	$("#"+id+" [name='prioridadtarea']").val(prioridad);
	$("#"+id+" [name='tipotarea']").val(tipo);
	$(".appactividades [type='radio']").removeAttr('checked');            
	$( ".appactividades [type='radio']" ).buttonset('refresh');
	$("#editarform")[0].reset()
});
</script>
<script>
var mesNumerico="";

function linkDir(link){
	document.getElementById("linkDestino").value=link;
	document.getElementById("linkDireccion").submit();
	
}

function hojaRumbo(){
	obtieneMes();
	
	document.getElementById("mesEnviado").value=mesNumerico;
	document.getElementById("usuarioRedireccion").value=document.getElementById("usuario").innerHTML;
	
	document.getElementById("redireccion").submit();
	
}

function obtieneMes(){
	//Obtiene mes actual
		var fechaActual = new Date(); 
		mesActual=fechaActual.getMonth();
		anoActual=fechaActual.getFullYear();
		mesNumerico=mesActual;
		
		
	}
</script>

</body>

</html>



