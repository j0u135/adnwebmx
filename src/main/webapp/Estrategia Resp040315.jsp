
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
	<LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <LINK href="EstilosADN/dis.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/jquery-ui.css">
    <link rel="stylesheet" href="EstilosADN/bootstrap.min.css">
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css">
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">
    
    
    
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.js"></script>
  
<title>Estrategia - ADN</title>
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
	                	<table width="1200">
	                		<tr>
	                			<td align="left">
	                				<table>
	                					<tr align="center">
				                			<td align="left">
				                				 <div id="iconousuario"><img src="ImagenesADN/icono-usuario.png" width="26" height="31" /></div>
				                			</td>
				                			<td align="left">
				                				 
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
						<h2>Usuario Google </h2>
					<p>Unidad Google Glass</p>
				</div>
			</div>
			<div class="mods">
				<span class="derecha"><i class="fa fa-users"></i></span>
				<h2>Cultura (Filosofía)</h2>
				<div class="modmenu">
					<p>Principios y Valores</p>
					<p>Propósito Fundamental</p>
					<p>Mantra</p>
					<p>BHAG</p>
					<p>Descripción Vivida</p>
				</div>
			</div>
			<div class="mods">
				<span class="derecha"><img src="ImagenesADN/est.png"></span>
				<h2 onclick="linkDir('Estrategia2.jsp')">Estrategia<br>¿En dónde jugamos?</h2>
				<div class="modmenu">
					<p>Oportunidad</p>
					<p>Segmento</p>
					<p>Modelo de Negocio</p>
					<p>Competencia</p>
				</div>
			</div>
			<div class="mods">
				<span class="derecha"><i class="fa fa-users"></i></span>
				<h2>¿Cómo Ganamos?</h2>
				<div class="modmenu">
					<p>Propuesta de Valor</p>
					<p>Modelo Comercial</p>
					<p>Competencia</p>
				</div>
			</div>
			<div class="mods">
				<span class="derecha"><i class="fa fa-pie-chart"></i></span>
				<h2>Números Inteligentes</h2>
			</div>
			<div class="mods">
				<span class="derecha"><i class="fa fa-pie-chart"></i></span>
				<h2>Prioridades</h2>
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
			<div class="modulotitulos">
				<table align="center" width="100%">
					<tr>
						<td align="center" width="33%"><h1>CULTURA</h1></td>
						<td align="center" width="33%"><h2>¿En qué creemos?</h2></td>
						<td align="center" width="33%"><img src="ImagenesADN/guardar.jpg"></td>
					</tr>
				</table>
			</div>
			<table align="center" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="50%">
						<div class="modnuevo">
							<div class="modajustes">
								<span class="ajuste">PRINCIPIOS</span> <span class="boton"><i class="fa fa-plus"></i></span> <span class="boton"><i class="fa fa-pencil"></i></span> <span class="boton"><i class="fa fa-times"></i></span>
							</div>
							<table width="100%" align="center">
								<tr>
									<td><input type="checkbox" id="checkbox-1-1" class="regular-checkbox"><label for="checkbox-1-1"></label> <input type="text" class="vacio" value="Contribución Social"></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="checkbox-1-2" class="regular-checkbox"><label for="checkbox-1-2"></label> <input type="text" class="vacio" value="Equipo y Autogestion"></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="checkbox-1-3" class="regular-checkbox"><label for="checkbox-1-3"></label> <input type="text" class="vacio" value="Aprendizaje"></td>
								</tr>
								<tr class="ultimo">
									<td><input type="checkbox" id="checkbox-1-4" class="regular-checkbox"><label for="checkbox-1-4"></label> <input type="text" class="vacio" value="Pasión"></td>
								</tr>
							</table>
						</div>
					</td>
					<td width="50%">
						<div class="modnuevo">
							<div class="modajustes">
								<span class="ajuste">VALORES</span> <span class="boton"><i class="fa fa-plus"></i></span> <span class="boton"><i class="fa fa-pencil"></i></span> <span class="boton"><i class="fa fa-times"></i></span>
							</div>
							<table width="100%" align="center">
								<tr>
									<td><input type="checkbox" id="checkbox-2-1" class="regular-checkbox"><label for="checkbox-2-1"></label> <input type="text" class="vacio" value="Respeto"></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="checkbox-2-2" class="regular-checkbox"><label for="checkbox-2-2"></label> <input type="text" class="vacio" value="Honestidad"></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="checkbox-2-3" class="regular-checkbox"><label for="checkbox-2-3"></label> <input type="text" class="vacio" value="Integridad"></td>
								</tr>
								<tr class="ultimo">
									<td><input type="checkbox" id="checkbox-2-4" class="regular-checkbox"><label for="checkbox-2-4"></label> <input type="text" class="vacio" value=""></td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
			<table align="center" width="100%">
				<tr>
					<td width="60%">
						<div class="modnuevo">
							<div class="modajustes">
								<span class="ajuste">PROPÓSITO</span> <span class="boton"><i class="fa fa-times"></i></span>
							</div>
							<textarea class="form-control"></textarea>
						</div>
					</td>
					<td width="40%">
						<div class="modnuevo">
							<div class="modajustes">
								<span class="ajuste">MANTRA</span> <span class="boton"><i class="fa fa-times"></i></span>
							</div>
							<textarea class="form-control"></textarea>
						</div>
					</td>
				</tr>
			</table>
			<table align="center" width="100%">
				<tr>
					<td width="50%">
						<div class="modnuevo">
							<div class="modajustes">
								<span class="ajuste">BHAG</span> <span class="boton"><i class="fa fa-pencil"></i></span> Año <select class="bhagano"><option value=""></option></select> Reto <select class="bhagreto"><option value=""></option></select>
							</div>
							<table width="100%" align="center" class="bhag">
								<tr>
									<th align="center">Metas</th>
								</tr>
								<tr>
									<td><input type="text" class="vacio"></td>
								</tr>
							</table>
						</div>
					</td>
					<td width="50%">
						<div class="modnuevo">
							<div class="modajustes">
								<span class="ajuste">DESCRIPCIÓN VIVIDA (Misión)</span> <span class="boton"><i class="fa fa-pencil"></i></span>
							</div>
							<textarea class="form-control"></textarea>
						</div>
					</td>
				</tr>
			</table>
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