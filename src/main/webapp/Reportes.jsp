
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
    
    
     <!-- Scripts para las graficas -->
    <script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/highcharts.js"></script>
	<script src="js/highcharts-3d.js"></script>
	<script src="js/modulos/exporting.js"></script>
	<script src="js/highcharts-more.js"></script>
	<script src="js/modulos/solid-gauge.js"></script>
	<script src="js/modulos/data.js"></script>
	<script src="js/modulos/funnel.js"></script>
	<script src="js/modulos/drilldown.js"></script>
    
  
<title>Reportes - ADN</title>
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
					<h2>Roberto Gutiérrez</h2>
					<p>Director de logística</p>
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
		<div class="interfaz">
		<div class="barra">
			<table width="100%" align="center" id="tablabarra">
				<tr>
					<td>Empleado</td>
					<td>
						<select class="seis">
							<option value="Roberto Gutierrez">Luis Roberto Alves</option>
							<option value="José Gutierrez">Ejemplo 01</option>
							<option value="Angel Guevara">Ejemplo 02</option>
							<option value="Rosario Lopez">Ejemplo 03</option>
							<option value="Ejemplo 04">Ejemplo 04</option>
							<option value="Ejemplo 05">Ejemplo 05</option>
							<option value="Ejemplo 06">Ejemplo 06</option>
						</select>
					</td>
					<td class="relativo"><span class="izquierda">Ene</span><span class="derecha">Dic</span><div class="barrafecha"><div id="arrastrar1" class="barraverticaluno"></div><div id="arrastrar2" class="barraverticaldos"></div></div></td>
					<td class="relativo"><span class="izquierda">Año</span><div class="barrafecha"><div id="arrastrar3" class="barraverticaluno"></div><div id="arrastrar4" class="barraverticaldos"></div></div></td>
					<td><span class="izquierda">Tipo</span><select class="tipo">
							<option value="Indicador">Indicador</option>
							<option value="Ejemplo 01">Ejemplo 01</option>
							<option value="Ejemplo 02">Ejemplo 02</option>
							<option value="Ejemplo 03">Ejemplo 03</option>
							<option value="Ejemplo 04">Ejemplo 04</option>
							<option value="Ejemplo 05">Ejemplo 05</option>
							<option value="Ejemplo 06">Ejemplo 06</option>
					</select></td>
				</tr>
			</table>
		</div>
		<div class="interfazseis">
			<table width="100%" align="center">
				<tr>
					<td rowspan="3" class="bordeseis" width="50%"><textarea class="form-control"></textarea></td>
					<td valign="middle" width="32%" class="espacioblanco"><span class="izquierda">Compara</span><select>
							<option value="Promedio general">Promedio general</option>
							<option value="Ejemplo 01">Ejemplo 01</option>
							<option value="Ejemplo 02">Ejemplo 02</option>
							<option value="Ejemplo 03">Ejemplo 03</option>
							<option value="Ejemplo 04">Ejemplo 04</option>
							<option value="Ejemplo 05">Ejemplo 05</option>
							<option value="Ejemplo 06">Ejemplo 06</option>
					</select></td>
					<td rowspan="3" align="center" valign="middle"><img src="" class="img-responsive"></td>
				</tr>
				<tr>
					<td valign="middle" width="32%" class="espacioblanco"><span class="izquierda">Calcula</span><select>
							<option value="Promedio de selec">Promedio de selec</option>
							<option value="Ejemplo 01">Ejemplo 01</option>
							<option value="Ejemplo 02">Ejemplo 02</option>
							<option value="Ejemplo 03">Ejemplo 03</option>
							<option value="Ejemplo 04">Ejemplo 04</option>
							<option value="Ejemplo 05">Ejemplo 05</option>
							<option value="Ejemplo 06">Ejemplo 06</option>
					</select></td>
				</tr>
				<tr>
					<td valign="middle" width="32%" class="espacioblanco"><span class="izquierda">Visualiza</span><select>
							<option value="Tiempo">Tiempo</option>
							<option value="Ejemplo 01">Ejemplo 01</option>
							<option value="Ejemplo 02">Ejemplo 02</option>
							<option value="Ejemplo 03">Ejemplo 03</option>
							<option value="Ejemplo 04">Ejemplo 04</option>
							<option value="Ejemplo 05">Ejemplo 05</option>
							<option value="Ejemplo 06">Ejemplo 06</option>
					</select></td>
				</tr>
			</table>
		</div>
		<div class="centro">
			<div id="grafica1" ></div>
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

<script>
$(function () {

    // Create the chart
    $('#grafica1').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Resultado Anual Hoja de Ruta'
        },
        xAxis: {
            type: 'category',
            showEmpty: false
        },
        yAxis: {
            showEmpty: false
        },

        legend: {
            enabled: false
        },

        plotOptions: {
            series: {
                borderWidth: 0,
                dataLabels: {
                    enabled: true
                }
            }
        },

        series: [{
            name: 'Resultado anual',
            colorByPoint: true,
            data: [{
                name: 'José Gutierrez',
                y: 95,
                drilldown: 'Jose Gutierrez'
            }, {
                name: 'Angel Guevara',
                y: 87,
                drilldown: 'Angel Guevara'
            }, {
                name: 'Rosario López',
                y: 56,
                drilldown: 'Rosario López'
            }],
            type: 'column'
        }],
        drilldown: {
            series: [{
                id: 'Jose Gutierrez',
                data: [
                    ['Ene', 80],
                    ['Feb', 100],
                    ['Mar', 90],
                    ['Abr', 95],
                    ['May', 80],
                    ['Jun', 79],
                    ['Jul', 100],
                    ['Ago', 98],
                    ['Sep', 97],
                    ['Oct', 98],
                    ['Nov', 99],
                    ['Dic', 100]
                ]
            }, {
                id: 'Angel Guevara',
                data: [
                     ['Ene', 80],
                    ['Feb', 100],
                    ['Mar', 90],
                    ['Abr', 95],
                    ['May', 80],
                    ['Jun', 79],
                    ['Jul', 100],
                    ['Ago', 70],
                    ['Sep', 60],
                    ['Oct', 76],
                    ['Nov', 99],
                    ['Dic', 100]
                ]
            }, {
                id: 'Rosario López',
                data: [
                    ['Ene', 80],
                    ['Feb', 50],
                    ['Mar', 60],
                    ['Abr', 54],
                    ['May', 76],
                    ['Jun', 79],
                    ['Jul', 46],
                    ['Ago', 25],
                    ['Sep', 30],
                    ['Oct', 76],
                    ['Nov', 55],
                    ['Dic', 64]
                ]
            }]
        }
    });
});


</script>
		
</body>
</html>