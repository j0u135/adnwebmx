<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

  
    
      
     <link rel="stylesheet" href="EstilosADN/jquery-ui.css" rel="stylesheet" type="text/css"> 
    <link rel="stylesheet" href="EstilosADN/bootstrap.min.css" type="text/css"> 
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css" type='text/css'>
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">  

	
	<!--<link rel="stylesheet" href="js/bootstrap.css" type="text/css"> -->
	<LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="EstilosADN/dis.css" type="text/css"> 
	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/indicadoresInteligentes.js"></script>
	<script src="js/calendario.js"></script>
	

<title>Indicadores</title>

<%@ page import ="java.sql.SQLException"%> 
<%@ page import = "com.adn.conexion.ClaseIndicadoresInteligentes"%> 
<%@ page import = "com.adn.conexion.ClaseProyectosPrioritarios"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.util.Calendar"%>
<%@ page import = "java.util.GregorianCalendar"%>




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
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('gerencia','','ImagenesADN/Nmenu/arbol-rollover.png',1)"><img src="ImagenesADN/Nmenu/arbol-normal.png" name="gerencia" width="89" height="79" border="0" id="gerencia" onclick=""/></a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('planeacion','','ImagenesADN/Nmenu/dash-rollover.png',1)"><img src="ImagenesADN/Nmenu/dash-normal.png" name="planeacion" width="90" height="79" border="0" id="planeacion" onclick="linkDir('DashBoardADN.jsp')" /></a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('tablero','','ImagenesADN/Nmenu/desempeno-rollover.png',1)"><img src="ImagenesADN/Nmenu/desempeno-normal.png" name="tablero" width="89" height="79" border="0" id="tablero"  onclick="hojaRumbo()" /></a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('admon','','ImagenesADN/Nmenu/config-rollover.png',1)"><img src="ImagenesADN/Nmenu/config-normal.png" name="admon" width="85" height="79" border="0" id="admon" onclick="linkDir('usuariosADN.jsp')" /></a></div>
							<div id="" style="display:inline-block"><a href="https://sites.google.com/a/10x.mx/soporte-adn/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('analisis','','ImagenesADN/Nmenu/ayuda-rollover.png',1)"><img src="ImagenesADN/Nmenu/ayuda-normal.png" name="analisis" width="75" height="79" border="0" id="analisis"/></a></div>
			            	
			            </td>
			        </tr>
			    </table>
        	</td>
        </tr>
    </table>
   <br>
   <br>
   <br>
   <table width="1200px"><tr><td width="95%" valign="top">
   <div class="interfaz">
   <form method="POST" id="GuardaIndicadorInteligente" action="GuardaIndicadorInteligente" >
   		<input type="hidden" id="indicadorRecibido" value="<%=(request.getAttribute("indicadorEnviado")!=(null))?request.getAttribute("indicadorEnviado"): ""%>">
		<input type="hidden" id="usuariohiden" name="usuariohiden" value="<%=usuario%>">
		<input type="hidden" id="fechahiden" name="fechahiden" value="">
		<input type="hidden" id="nombreModificado" name="nombreModificado" value="">
		<input type="hidden" id="comboUnidadH" value="<%=(request.getAttribute("unidad")!=(null))?request.getAttribute("unidad"): ""%>">
		<input type="hidden" id="comboFrecuenciaH" value="<%=(request.getAttribute("frecuencia")!=(null))?request.getAttribute("frecuencia"): ""%>">
		<input type="hidden" id="comboSentidoH" value="<%=(request.getAttribute("sentido")!=(null))?request.getAttribute("sentido"): ""%>">
		<input type="hidden" id="comboTipoH" value="<%=(request.getAttribute("tipo")!=(null))?request.getAttribute("tipo"): ""%>">
		<input type="hidden" id="variableMes" name="variableMes" value="">
		<input type="hidden" id="mes" name="mes" value="">
		<input type="hidden" id="anio" name="anio" value="">
		
		<table align="center" width="1200px" >
			<tr>
				<td>
					<select id="indicadorExistente" name="indicadorExistente" onchange="cargaIndicadores()" class="selectpicker" data-style="btn-primary">
						<option value="Selecciona">Selecciona Indicador Existente</option>
					<%
						String nombre="", unidad="", frecuencia="", sentido="", entregaMedible="", tipo="";
						
					 	Calendar fecha = new GregorianCalendar();
				        int anio = fecha.get(Calendar.YEAR);
				        int mes = fecha.get(Calendar.MONTH);
				        
					
						ClaseIndicadoresInteligentes cii= new ClaseIndicadoresInteligentes();
						ResultSet resulsetII= cii.consultarIndInte(usuario, anio);
					
						try {
							while(resulsetII.next()){
								nombre=resulsetII.getString(1);
								unidad=resulsetII.getString(2);
								frecuencia=resulsetII.getString(3);
								sentido=resulsetII.getString(4);
								entregaMedible=resulsetII.getString(5);
								tipo=resulsetII.getString(6);
					
					%>
						<option value="<%=nombre%>-<%=unidad%>-<%=frecuencia%>-<%=sentido%>-<%=entregaMedible%>-<%=tipo%>"><%=nombre%></option>
						
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
			</tr>
			<tr>
				<td>
					<table class="tablaadn" width="735" align="left">
						<tbody>
							<tr>
								<th class="primero" colspan="2">Nombre*</th>
								<th>Unidad*</th>
								<th>Meta*</th>
								<th>Resultado</th>
								<th class="ultimo">Peso*</th>
							</tr>
							<tr>
								<td align="center">
									<input type="checkbox" id="checkbox-2-1" class="regular-checkbox" checked>
									
								</td>
								<td align="center">
									<input id="nombre" name="nombre" onchange="asignaNombre()" type="text" class="form-control" placeholder="" value="<%=(request.getAttribute("valor")!=(null))?request.getAttribute("valor"): ""%>">
								</td>
								<td align="center">
									<select id="unidad" name="unidad" class="selectEstiloMediano">
										<option value="Seleccione">Seleccione</option>
										<option value="Porcentaje">Porcentaje</option>
										<option value="Monto">Monto</option>
										<option value="Reportes">Reportes</option>
										<option value="Errores">Errores</option>
										<option value="Visitas">Visitas</option>
										<option value="Unidades">Unidades</option>
										<option value="Otro">Otro</option>
									</select>
								</td>
								<td align="center">
									<input id="meta" name="meta" type="text" class="form-control porcentaje" onchange="rPond()" onkeypress="return soloNumeros(event);" placeholder="" value="<%=(request.getAttribute("meta")!=(null))?request.getAttribute("meta"): ""%>">
								</td>
								<td align="center">
									<input id="resultado" name="resultado" type="text" onkeypress="return soloNumeros(event);" onchange="rPond()" class="form-control porcentaje " placeholder="" value="<%=(request.getAttribute("resultado")!=(null))?request.getAttribute("resultado"): ""%>">
								</td>
								<td align="center">
									<input id="peso" name="peso" type="text" onkeypress="return soloNumeros(event);" onchange="rPond()" class="form-control porcentaje" placeholder="" value="<%=(request.getAttribute("peso")!=(null))?request.getAttribute("peso"): ""%>">
								</td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table class="tablaadn menosselect" width="735" align="left">
						<tbody>
							<tr>
								<td align="center">Frecuencia*</td>
								<td align="center">Sentido*</td>
								<td align="center" width="150">Entrega Medible*</td>
								<td align="center">Tipo*</td>
								<td align="center">Corte</td>
								<td align="center">R Pond</td>
							</tr>
							<tr>
								<td align="center">
									<select name="frecuencia" id="frecuencia" class="selectEstiloMediano">
										<option value="Seleccione">Seleccione</option>
										<option value="Semanal">Semanal</option>
										<option value="Quincenal">Quincenal</option>
										<option value="Mensual">Mensual</option>
										<option value="Trimestral">Trimestral</option>
										<option value="Semestral">Semestral</option>
										<option value="Anual">Anual</option>
									</select>
								</td>
								<td align="center">
									<select id="sentido" onchange="rPond()" name="sentido" class="selectEstiloMediano">
										<option value="Seleccione">Seleccione</option>
										<option value="Mas">Mas</option>
										<option value="Menos">Menos</option>
									</select>
								</td>
								<td align="center"><input id="entregamedible" name="entregamedible" type="text" class="form-control" value="<%=(request.getAttribute("eMedible")!=(null))?request.getAttribute("eMedible"): ""%>"></td>
								<td align="center">
									<select id="tipo" name="tipo" onchange="selectTipo();rPond()"  class="selectEstiloMediano">
										<option value="Seleccione">Seleccione</option>
										<option value="Valor Final">Valor Final</option>
										<option value="Acumulado">Acumulado</option>
										<option value="Promedio">Promedio</option>
									</select>
								</td>
								<td align="center"><input id="corte" name="corte" type="text" class="form-control" value="<%=(request.getAttribute("corte")!=(null))?request.getAttribute("corte"): ""%>"></td>
								<td align="center"><input id="rpond" name="rpond" disabled type="text" class="form-control" value="<%=(request.getAttribute("rPon")!=(null))?request.getAttribute("rPon"): ""%>"></td>
							</tr>
						</tbody>
					</table>
				</td>
			</tr>
			<tr>
				<td>
					<table width="900px" valign="top" >
						<tr>
							<td>
								<div class="tablero margenarriba" >
									<table >
										<tr>
											<td align="center" class="celdauno filauno">Nombre</td>
											<td align="center" class="negritas filauno">Sem 1</td>
											<td align="center" class="negritas filauno">Sem 2</td>
											<td align="center" class="negritas filauno">Sem 3</td>
											<td align="center" class="negritas filauno">Sem 4</td>
											<td align="center" class="negritas filauno">Sem 5</td>
											
										</tr>
										<tr>
											<td align="center" valign="middle" class="celdauno">
												<input type="text" class="vacio" id="nombreSemanas" disabled value="<%=(request.getAttribute("valor")!=(null))?request.getAttribute("valor"): ""%>">
											</td>
											<td align="center" valign="middle">
												<input type="text" class="vacio" id="sem1" name="sem1" onchange="selectTipo();rPond()"  onkeypress="return soloNumeros(event);" value="<%=(request.getAttribute("sem1")!=(null))?request.getAttribute("sem1"): ""%>">
											</td>
											<td align="center" valign="middle">
												<input type="text" class="vacio" id="sem2" name="sem2" onchange="selectTipo();rPond()"  onkeypress="return soloNumeros(event);" value="<%=(request.getAttribute("sem2")!=(null))?request.getAttribute("sem2"): ""%>">
											</td>
											<td align="center" valign="middle">
												<input type="text" class="vacio" id="sem3" name="sem3" onchange="selectTipo();rPond()"  onkeypress="return soloNumeros(event);" value="<%=(request.getAttribute("sem3")!=(null))?request.getAttribute("sem3"): ""%>">
											</td>
											<td align="center" valign="middle">
												<input type="text" class="vacio" id="sem4" name="sem4"  onchange="selectTipo();rPond()"  onkeypress="return soloNumeros(event);" value="<%=(request.getAttribute("sem4")!=(null))?request.getAttribute("sem4"): ""%>">
											</td>
											<td align="center" valign="middle">
												<input type="text" class="vacio" id="sem5" name="sem5" onchange="selectTipo();rPond()"  onkeypress="return soloNumeros(event);" value="<%=(request.getAttribute("sem5")!=(null))?request.getAttribute("sem5"): ""%>">
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td>		
					<button type="button" id="botonAgregar" data-loading-text="Agr/Act..." class="btn btn-primary" autocomplete="off" onclick="agregaIndicadorInteligente()">
						 Aceptar
					</button>
				</td>
			</tr>
		</table>
	
	</form>
   </div>
   </td>
		<td width="5%" align="center" valign="top">
			
            <table width="100%" BGCOLOR="#f5f6f6" border="0">
                <tr>
					<td align="center" BGCOLOR="#f5f6f6">
						<img src="ImagenesADN/tareas.png" title="Tareas" width="50" height="50"  alt="Tareas" onclick="">
					</td>
				</tr>
				<tr>
					<td align="center" BGCOLOR="#f5f6f6">
						<img src="ImagenesADN/Juntas.png" title="Juntas" width="50" height="50" alt="Juntas" onclick="">
					</td>
				</tr>
				<tr>
					<td align="center" BGCOLOR="#f5f6f6">
						<img src="ImagenesADN/Hoja de rumbo.png" title="Hoja de rumbo" width="40" height="40" alt="Hoja de rumbo" onclick="hojaRumbo()">
					</td>
				</tr>
				<tr>
					<td align="center" BGCOLOR="#f5f6f6">
						<img src="ImagenesADN/Aprobaciones.png" title="Aprobaciones" width="38" height="38" alt="Aprobaciones" onclick="">
					</td>
				</tr>
				<tr>
					<td align="center" BGCOLOR="#f5f6f6">
						<img src="ImagenesADN/Reportes.png" title="Reportes" width="40" height="45" alt="Reportes" onclick="">
					</td>
				</tr>
			</table> 
                 
		</td>
	</tr>
</table>
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

function hojaRumboEquipo(){
	//obtieneMes();
	
	document.getElementById("mesEnviado").value=11;
	document.getElementById("usuarioRedireccion").value="andoni@10x.mx";
	
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
<script>
$(function() {
		$("#corte").datepicker();
	});

inicio();

</script>
</html>