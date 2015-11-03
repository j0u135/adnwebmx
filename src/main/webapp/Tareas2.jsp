<%@page import="com.adn.conexion.ClaseTareas"%>
<%@page import="com.adn.conexion.ClaseUsuario"%>
<%@page import="com.adn.conexion.ClaseProyectosPrioritarios"%>
<%@page import="com.adn.conexion.ClaseIndicadoresInteligentes"%>
<%@page import="com.adn.conexion.ClaseIndicador"%>
<%@page import="com.adn.conexion.ConsultaActividades"%>
<%@ page import ="java.sql.SQLException"%> 
<%@ page import = "java.sql.ResultSet"%> 
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
    <link href="EstilosADN/jquery-ui.css" rel="stylesheet"> 
     <script src="js/jquery.min.js"></script> 
    <script src="js/bootstrap.min.js"></script> 
	<script src="js/bootstrap-modal.js"></script>
    
    <script src="js/interfaz1.js"></script>
	
	<script src="js/highcharts.js"></script>
	<script src="js/modulos/exporting.js"></script>
	<script src="js/jquery-ui.js"></script>

<title>Hoja Rumbo</title>

<%@ page import ="java.sql.SQLException"%> 
<%@ page import = "com.adn.conexion.ClaseIndicadoresInteligentes"%> 
<%@ page import = "com.adn.conexion.ClaseProyectosPrioritarios"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.util.List"%>
<%@ page import = "java.util.ArrayList"%>
<script src="js/tareas.js"></script>



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

<script>
var fecha;

function obFecha1(){
	
	var fecha = $('#inicio1').val();
	//alert(fecha);
	document.getElementById("hidenfecha1").value=fecha;
}
</script>

<script>
var fecha;

function obFecha2(){
	
	var fecha = $('#fin1').val();
	//alert(fecha);
	document.getElementById("hidenfecha2").value=fecha;
}
</script>

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

<body onload="MM_preloadImages('ImagenesADN/direccion-rollover.png','ImagenesADN/analisis-rollover.png','ImagenesADN/gerencia-rollover.png','ImagenesADN/planeacion-rollover.png','ImagenesADN/tablero-rollover.png','ImagenesADN/admon-rollover.png')">
<div align="center" width="1200">
    <table align="center">
        <tr>
        	<td>
	        	<div class="shadow" id="barrausuario">
	                	<table width="1200">
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
	                			<td align="right">
	                				<table>		
				                			<td align="right">
				                				 <div id=""><img src="ImagenesADN/icono-fecha.png" width="28" height="31" /></div>
				                			</td>
				                			<td align="right">
				                				 <div id="fecha">
							                        <script type="text/JavaScript"> var f = new Date(); document.getElementById("fecha").innerHTML=(f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear()); </script>
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
            </td>
        </tr>
        <tr>
        	<td>
        		<table align="center" width="100%">
			        <tr>
			            <td colspan="4" align="center">
			                <div id="" style="display:inline-block"><img src="ImagenesADN/logo-adn.png" width="116" height="98" /></div>
			                <div id="" style="display:inline-block; width: 116; height: 98"><img src="ImagenesADN/parche-navegacion.png"></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('direccion','','ImagenesADN/Nmenu/planeacion-rollover.png',1)"><img src="ImagenesADN/Nmenu/planeacion-normal.png" name="direccion" width="77" height="79" border="0" id="direccion" /> </a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('gerencia','','ImagenesADN/Nmenu/arbol-rollover.png',1)"><img src="ImagenesADN/Nmenu/arbol-normal.png" name="gerencia" width="89" height="79" border="0" id="gerencia" onclick="dashBoardIr()"/></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('planeacion','','ImagenesADN/Nmenu/dash-rollover.png',1)"><img src="ImagenesADN/Nmenu/dash-normal.png" name="planeacion" width="90" height="79" border="0" id="planeacion" onclick="planeacionIr()" /></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('tablero','','ImagenesADN/Nmenu/desempeno-rollover.png',1)"><img src="ImagenesADN/Nmenu/desempeno-normal.png" name="tablero" width="89" height="79" border="0" id="tablero" onclick="arbolIr()" /></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('admon','','ImagenesADN/Nmenu/config-rollover.png',1)"><img src="ImagenesADN/Nmenu/config-normal.png" name="admon" width="85" height="79" border="0" id="admon"  onclick="rutaIr()"/></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('analisis','','ImagenesADN/Nmenu/ayuda-rollover.png',1)"><img src="ImagenesADN/Nmenu/ayuda-normal.png" name="analisis" width="75" height="79" border="0" id="analisis" onclick="indiIr()" /></a></div>
			            </td>
			        </tr>
			    </table>
        	</td>
        </tr>
    </table>
    <table width="60%">
	<tr>
	<td>	
<div class="interfaz">
	<div class="filtros">
		<div class="filtrostitulo">Filtros</div>
			<table width="90%" align="center">
				<tr>
					<td><a href="#" class="btn btn-info" id="mistareas" onclick="refrescar();">Mis tareas</a> <span id="vertodas" class="btn btn-info">Ver todas</span></td>
					<td><span>Proyecto</span>
					<select onchange="proyecto();" id="proyecto">
						<option value="Seleccione">Seleccione</option>
							<%
								String idproy="", nombreproy="";
								ClaseProyectosPrioritarios proypri= new ClaseProyectosPrioritarios();
								ResultSet resulsetProy= proypri.consultaProy(usuario);
								
								try {
									while(resulsetProy.next()){
										
										idproy=resulsetProy.getString(1);
										nombreproy=resulsetProy.getString(2);
										
							%>
					  <option id="proyecto" name="proyecto" value="<%=nombreproy%>"><%=nombreproy%></option>
							<%			
								//st.close();
									   }
								//c.cerrarConexion();
								} catch (SQLException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
							%>
					</select>	
		   		</td>
				<td>
					<a class="btn btn-success" onClick="tareasAtiempo();" id="atiempo">A tiempo</a> <a onClick="tareasHoy();" class="btn btn-info" id="hoy">Hoy</a>
				</td>
			</tr>
			<tr>
				<td>
					<select id="equipo">
					<option value="Seleccione">Seleccione </option>
						<%
						
							String nombreusu="", user="";
							ClaseUsuario usu= new ClaseUsuario();
							ResultSet resulsetusu= usu.consultaJefe(usuario);
							
							try {
								while(resulsetusu.next()){
									
									nombreusu=resulsetusu.getString(1);
									user=resulsetusu.getString(2);
									
						%>
					<option value="<%=user%>"><%=nombreusu%></option>
						<%			
							//st.close();
								   }
							//c.cerrarConexion();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						%>
				</select>	
		   	</td>	
					
			<td>
				<span>Actividad</span>
					<%
						int conta=1;
					%>
					
				<select>
					<option  id="" value="Seleccione">Seleccione</option>
						<%
							String nombreact="", proy="";
							ConsultaActividades act= new ConsultaActividades();
						//	proy=request.getParameter("proyecto");
							ResultSet resulsetact= act.consultaacti();
						
							try {
								while(resulsetact.next()){
									
									nombreact=resulsetact.getString(1);
									nombreproy=resulsetact.getString(2);
									
						%>
					<option style="display: none" id="op<%=conta%>" value="<%=nombreproy%>"><%=nombreact%></option>
						<%			
							//st.close();
							conta++;
							   }
								//c.cerrarConexion();
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
										
						%>
					<input type="hidden" value="<%=conta%>" id="contadoract">
				</select>	
		   	</td>	
			<td>
				<a class="btn btn-warning"  onClick="tareasVencidas();" id="vencidos">Vencidos</a> <a href="#fecha" class="btn btn-info">Fecha</a><input type="hidden" value="" >
			</td>
		</tr>
	</table>
	</div>
	<div class="actividades">
	<table width="100%" align="center">
		<tr>
			<td>
			<span class="boton" data-toggle="modal" data-target="#myModal"><i class="fa fa-plus"></i></span>

			<span class="boton" id="editar" data-toggle="modal" data-target="#EditarModal"><i class="fa fa-pencil"></i></span>

			<span class="boton" onClick="eliminarTareas();"><i class="fa fa-times"></i></span><a onclick="guardarTareas()" class="guardar" title="Guardar" alt="Guardar"><img src="ImagenesADN/guardar.jpg"></a>
	
			<label align="rigth">Fecha Inicio: </label><input type="text" name="inicio" onChange="obFecha1()" class="form-control datepicker" id="inicio1" placeholder="Inició">
			<label align="rigth">Fecha Fin: </label><input type="text" onChange="obFecha2()" name="fin" class="form-control datepicker" id="fin1" placeholder="Fin">
			<img width='25' height='25' src="ImagenesADN/lupita.png" onclick="buscaFechas()">
			<label>  </label>
			</td>
		</tr>
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
						<div class="apptabla">	
						<form method="POST" id="actualizaTNC" action="actualizaTNC">
						<table align="center" width="100%" id="nocompletadas">
							<tbody class="conexion">
								<tr class="tarea1">
									<td>
										<div id="mostrarTareas" style='display:none;'>
												<%
													int con=1;
													String nombreTarea="";
													ClaseTareas tareas= new ClaseTareas();
													ResultSet resulsettareas= tareas.consultarTareas(usuario);
												
													try {
														while(resulsettareas.next()){
															nombreTarea=resulsettareas.getString(1);
															
												%>
											<div id="mostrarTareas" style.display ='none'>
												<label><%=nombreTarea%></label><br>
											</div>
													<%			
														//st.close();
														con++;
														   }
														//c.cerrarConexion();
														} catch (SQLException e) {
															// TODO Auto-generated catch block
																e.printStackTrace();
														}				
													%>
										<input type="hidden" value="<%=con%>" id="contadoract">
									</div>	
								</td>
							</tr>
							
									<%
											String nomTN="", tipTN="", origTN="", asigTN="", notTN="",iniTN="",fiTN="",prioriTN="";
											int id=0;
											int cont=1;
											ClaseTareas clTN= new ClaseTareas();
											ResultSet resultseTN=clTN.consultaTareasN(usuario);
											try {
												while(resultseTN.next()){
													prioriTN=resultseTN.getString(1);
													tipTN=resultseTN.getString(2);
													origTN=resultseTN.getString(3);
													asigTN=resultseTN.getString(4);
													notTN=resultseTN.getString(5);
													iniTN=resultseTN.getString(6);
													fiTN=resultseTN.getString(7);
													nomTN=resultseTN.getString(8);
													id=resultseTN.getInt(9);
											
										%>
								<tr id="tr<%=cont%>" style.display="inline" class="atiempo hoy">
								  
									<td>
										<div class="tarea tareaverde" id="tarea3">
										<div class="izquierda">
										<input type="radio" id="radio<%=cont%>" name="tarea">
										</div>
										<div class="derecha">
										
											<input type="text" class="form-control" id="prioridadtarea<%=cont%>" name="prioridadtarea" value="<%=prioriTN%>">
											<input type="hidden" name="tipotarea" id="tipotarea<%=cont%>" value="<%=tipTN%>">
											<input type="hidden" name="origentarea" id="origentarea<%=cont%>" value="<%=origTN%>">
											<input type="hidden" name="asignartarea" id="asignartarea<%=cont%>" value="<%=asigTN%>">
											<input type="hidden" name="notastarea" id="notastarea<%=cont%>" value="<%=notTN%>">
											<input type="hidden" name="iniciatarea" id="iniciatarea<%=cont%>" value="<%=iniTN%>">
											<input type="hidden" name="fintarea" id="fintarea<%=cont%>" value="<%=fiTN%>">
											<input type="hidden" name="idT" id="id<%=cont%>" value="<%=id%>">
										</div>
											<span class="nombretarea" id="nombretarea<%=cont%>" name="nombretarea"><%=nomTN%></span>
										</div>
									</td>
								</tr>
							
								<%			
									//st.close();
								cont++;
									   }
										//c.cerrarConexion();
									} catch (SQLException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}					
								%>
								<input type="hidden" value="<%=cont%>" id="conNoComple">
						</tbody>	
					</table>
				</form>
				</div>
				</td>
				<td width="33%" align="center">
					<div class="apptabla">
					<form method="POST" id="actualizaTP" action="actualizaTP">
					<table align="center" width="100%" id="progreso">
						<tbody class="conexion">
								<tr class="tarea1">
									<td>
									</td>
								</tr>
										<%
											String nomT="", tipT="", origT="", asigT="", notT="",iniT="",fiT="",prioriT="";
											int idT=0;
											ClaseTareas clT= new ClaseTareas();
											ResultSet resultseT=clT.consultaTareas(usuario);
											try {
												while(resultseT.next()){
													prioriT=resultseT.getString(1);
													tipT=resultseT.getString(2);
													origT=resultseT.getString(3);
													asigT=resultseT.getString(4);
													notT=resultseT.getString(5);
													iniT=resultseT.getString(6);
													fiT=resultseT.getString(7);
													nomT=resultseT.getString(8);
													idT=resultseT.getInt(9);
											
										%>
								<tr id="tr<%=cont%>" style.display="inline" class="atiempo hoy">
									<td>
										<div class="tarea tareanaranja" id="tarea3">
										<div class="izquierda">
										<input type="radio" id="radio<%=cont%>" name="tarea">
										</div>
										<div class="derecha">
										<input type="text" class="form-control" name="prioridadtarea" value="<%=prioriT%>">
										<input type="hidden" id="tipotarea<%=cont%>" name="tipotarea" value="<%=tipT%>">
										<input type="hidden" id="origentarea<%=cont%>" name="origentarea" value="<%=origT%>">
										<input type="hidden" id="asignartarea<%=cont%>" name="asignartarea" value="<%=asigT%>">
										<input type="hidden" id="notastarea<%=cont%>" name="notastarea" value="<%=notT%>">
										<input type="hidden" id="iniciatarea<%=cont%>" name="iniciatarea" value="<%=iniT%>">
										<input type="hidden" id="fintarea<%=cont%>" name="fintarea" value="<%=fiT%>">
										<input type="hidden" name="idT" id="id<%=cont%>" value="<%=idT%>">
										</div>
											<span class="nombretarea" id="nombretarea<%=cont%>" name="nombretarea"><%=nomT%></span>
										</div>
									</td>
								</tr>
								<%			
									//st.close();
									cont++;
									   }
										//c.cerrarConexion();
									} catch (SQLException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}					
								%>
								<input type="hidden" value="<%=cont%>" id="conProgreso">
						</tbody>
					</table>
				</form>
				</div>
			</td>
			<td width="33%" align="center">
				<div class="apptabla">
				  <form method="POST" id="actualizaTC" action="actualizaTCC">	
					<table align="center" width="100%" id="completadas">
						<tbody class="conexion">
							<tr class="tarea1">
								<td>
								</td>
							</tr>
							<%
											String nomTC="", tipTC="", origTC="", asigTC="", notTC="",iniTC="",fiTC="",prioriTC="";
											int idC=0;
											ClaseTareas clTC= new ClaseTareas();
											ResultSet resultseTC=clTC.consultaTareasC(usuario);
											try {
												while(resultseTC.next()){
													prioriTC=resultseTC.getString(1);
													tipTC=resultseTC.getString(2);
													origTC=resultseTC.getString(3);
													asigTC=resultseTC.getString(4);
													notTC=resultseTC.getString(5);
													iniTC=resultseTC.getString(6);
													fiTC=resultseTC.getString(7);
													nomTC=resultseTC.getString(8);
													idC=resultseTC.getInt(9);
											
										%>
								<tr id="tr<%=cont%>" style.display="inline" class="atiempo hoy">
									<td>
										<div size="100px" class="tarea tareaazul" id="tarea3">
										<div class="izquierda">
										<input type="radio" id="radio<%=cont%>" name="tarea">
										</div>
										<div class="derecha">
										<input type="text" class="form-control" name="prioridadtarea" value="<%=prioriTC%>">
										<input type="hidden" id="tipotarea<%=cont%>" name="tipotarea" value="<%=tipTC%>">
										<input type="hidden" id="origentarea<%=cont%>" name="origentarea" value="<%=origTC%>">
										<input type="hidden" id="asignartarea<%=cont%>" name="asignartarea" value="<%=asigTC%>">
										<input type="hidden" id="notastarea<%=cont%>" name="notastarea" value="<%=notTC%>">
										<input type="hidden" id="iniciatarea<%=cont%>" name="iniciatarea" value="<%=iniTC%>">
										<input type="hidden" id="fintarea<%=cont%>"  name="fintarea" value="<%=fiTC%>">
										<input type="hidden" name="idT" id="id<%=cont%>" value="<%=idC%>">
										</div>
											<span class="nombretarea" id="nombretarea<%=cont%>" name="nombretarea"><%=nomTC%></span>
										</div>
									</td>
								</tr>
								<%			
									//st.close();
									cont++;
									   }
										//c.cerrarConexion();
									} catch (SQLException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}					
								%>
								<input type="hidden" value="<%=cont%>" id="conCompleta">
								<input type="hidden" value="<%=cont%>" id="contadorTareasT">
					</tbody>
				</table>
			 </form>
			</div>
		</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	</td>
	<td width="5%" align="center" valign="top">
			
            <table width="100%" bgcolor="#f5f6f6" border="0">
                <tbody><tr>
					<td align="center" bgcolor="#f5f6f6">
						<img src="ImagenesADN/tareas.png" title="Tareas" width="50" height="50" alt="Tareas" onclick="">
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#f5f6f6">
						<img src="ImagenesADN/Juntas.png" title="Juntas" width="50" height="50" alt="Juntas" onclick="">
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#f5f6f6">
						<img src="ImagenesADN/Hoja de rumbo.png" title="Hoja de rumbo" width="40" height="40" alt="Hoja de rumbo" onclick="hojaRumbo()">
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#f5f6f6">
						<img src="ImagenesADN/Aprobaciones.png" title="Aprobaciones" width="38" height="38" alt="Aprobaciones" onclick="">
					</td>
				</tr>
				<tr>
					<td align="center" bgcolor="#f5f6f6">
						<img src="ImagenesADN/Reportes.png" title="Reportes" width="40" height="45" alt="Reportes" onclick="">
					</td>
				</tr>
			</tbody></table>       
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
        		<td colspan="2"><span class="izquierda">Nombre</span> <input type="text" id="nombre" name="nombre" class="form-control modalnombre"></td>
        	</tr>
        	<tr>
        		<td><span class="izquierda">Tipo</span><select id="tipomodal" name="tipomodal"><option value="Ninguno"></option><option value="Indicador">Indicador</option><option value="Proyecto">Proyecto</option><option value="Reunion">Reunión</option></select></td>
        		<td><span class="izquierda">Asignar A</span><select id="asignarmodal" name="asignarmodal"><option value=""></option><option value="Empleado 1">Empleado 1</option><option value="Empleado 2">Empleado 2</option><option value="Empleado 3">Empleado 3</option></select></td>
        	</tr>
        	<tr>
        		<td><span class="izquierda">Origen</span><select name="origenmodal" id="origenmodal"></select></td>
        		<td rowspan="3"><span class="izquierda">Notas</span><textarea class="form-control" id="notasmodal" name="notasmodal"></textarea></td>
        	</tr>
        	<tr>
        		<td><span class="izquierda">Prioridad</span><select id="prioridadmodal" name="prioridadmodal"><option value=""></option><option value="A">Alta</option><option value="M">Media</option><option value="B">Baja</option></select></td>
        	</tr>
        	<tr>
        		<td><span class="izquierda">Periodo</span><div class="derecha"><input type="text" name="inicio" class="form-control datepicker" id="inicio" placeholder="Inició"> <input type="text" name="fin" class="form-control datepicker" id="fin" placeholder="Fin"></div></td>
        	</tr>
        </table>
       </form>
      </div>
      <div class="modal-footer">
      	<button type="button" onclick="guardarTareas();" class="btn btn-success" id="agregartarea" data-dismiss="modal">Aceptar</button>
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
      				<td colspan="2"><span class="izquierda">Nombre</span> <input type="hidden" name="id" value=""><input type="text" id="nombre2" name="nombre2" class="form-control modalnombre" value=""></td>
      			</tr>
      			<tr>
      				<td><span class="izquierda">Tipo</span><select id="tipomodal2" name="tipomodal2"><option value="Ninguno"></option><option value="Indicador">Indicador</option><option value="Proyecto">Proyecto</option><option value="Reunion">Reunión</option></select></td>
      				<td><span class="izquierda">Asignar A</span><select id="asignarmodal2" name="asignarmodal2"><option value=""></option><option value="Empleado 1">Empleado 1</option><option value="Empleado 2">Empleado 2</option><option value="Empleado 3">Empleado 3</option></select></td>
      			</tr>
      			<tr>
      				<td><span class="izquierda">Origen</span><select name="origenmodal2" id="origenmodal2"></select></td>
      				<td rowspan="3"><span class="izquierda">Notas</span><textarea class="form-control"  id="notasmodal2" name="notasmodal2"></textarea></td>
      			</tr>
      			<tr>
      				<td><span class="izquierda">Prioridad</span><select id="prioridadmodal2" name="prioridadmodal2"><option value=""></option><option value="A">Alta</option><option value="M">Media</option><option value="B">Baja</option></select></td>
      			</tr>
      			<tr>
      				<td><span class="izquierda">Periodo</span><div class="derecha"><input type="text" name="inicio2" class="form-control datepicker" id="inicio2" placeholder="Inició" value=""> <input type="text" name="fin2" class="form-control datepicker" id="fin2" placeholder="Fin" value=""></div></td>
      			</tr>
      			<input type="hidden" id="idT" name="idT" value="">
      		</table>
       </form>
      </div>
      <div class="modal-footer">
      	<button type="button" onclick="editarTarea();" class="btn btn-success" id="editartarea" data-dismiss="modal">Aceptar</button>
        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="refrescar();" id="cancelareditar">Cancelar</button>
      </div>
    </div>
  </div>
</div>

<input type="hidden" id="hidenfecha1" name="hidenfecha1" value="">
<input type="hidden" id="hidenfecha2" name="hidenfecha2" value="">

<form method="POST" id="guardaTareas" action="guardaTareas">
<input type="hidden" id="usuarioT" name="usuarioT" value="<%=usuario%>">
<input type="hidden" id="nombreT" name="nombreT" value="">
<input type="hidden" id="tipoT" name="tipoT" value="">
<input type="hidden" id="origenT" name="origenT" value="">
<input type="hidden" id="prioridadT" name="prioridadT" value="">
<input type="hidden" id="periodoiT" name="periodoiT" value="">
<input type="hidden" id="periodofT" name="periodofT" value="">
<input type="hidden" id="asignaT" name="asignaT" value="">
<input type="hidden" id="notasT" name="notasT" value="">
</form>	

<form method="POST" id="editarTareas" action="editarTareas">
<input type="hidden" id="usuarioeT" name="usuarioeT" value="<%=usuario%>">
<input type="hidden" id="nombreeT" name="nombreeT" value="">
<input type="hidden" id="tipoeT" name="tipoeT" value="">
<input type="hidden" id="origeneT" name="origeneT" value="">
<input type="hidden" id="prioridadeT" name="prioridadeT" value="">
<input type="hidden" id="periodoieT" name="periodoieT" value="">
<input type="hidden" id="periodofeT" name="periodofeT" value="">
<input type="hidden" id="asignaeT" name="asignaeT" value="">
<input type="hidden" id="notaseT" name="notaseT" value="">
<input type="hidden" id="ideT" name="ideT" value="">
</form>	

<form method="POST" id="eliminarTarea" action="eliminarTarea">
<input type="hidden" id="idtarea" name="idtarea" value="">
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
$( "#atiemp" ).click(function() {
	$('.apptabla tr').show();
  $('.apptabla tr:not(".atiempo,.tarea1")').hide();
});
$( "#vencido" ).click(function() {
	$('.apptabla tr').show();
  $('.apptabla tr:not(".vencidos,.tarea1")').hide();
});
$( "#ho" ).click(function() {
	$('.apptabla tr').show();
  $('.apptabla tr:not(".hoy,.tarea1")').hide();
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
    $( "#inicio" ).datepicker({dateFormat: "dd/mm/yy"});
    $( "#inicio1" ).datepicker({dateFormat: "dd/mm/yy"});
    $( "#fin" ).datepicker({dateFormat: "dd/mm/yy"});
    $( "#fin1" ).datepicker({dateFormat: "dd/mm/yy"});
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
	var editarid = divpadre.find("[name='idT']").val();
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
	$("[name='idT']").val(editarid);
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
	var id = $("[name='idT']").val();
	console.log(nombre);
	$("#"+id+" .nombretarea").text(nombre);
	$("#"+id+" [name='prioridadtarea']").val(prioridad);
	$("#"+id+" [name='tipotarea']").val(tipo);
	$(".appactividades [type='radio']").removeAttr('checked');            
	$( ".appactividades [type='radio']" ).buttonset('refresh');
	$("#editarform")[0].reset()
});
</script>
</body>

</html>



