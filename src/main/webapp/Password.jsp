<%@page import="com.adn.conexion.ClaseUsuario"%>
<%@page language="java" %>
<%@ page import="com.adn.controlador.Actividades"%>
<%@ page import="com.adn.conexion.ConsultaActividades"%>
<%@ page import = "java.util.LinkedList"%> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<link rel="stylesheet" href="EstilosADN/jquery-ui.css">
	

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
    <LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/bootstrap.min.css">
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css">
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="EstilosADN/dis.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/jquery-ui.css" rel="stylesheet" type="text/css">
       <script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/highcharts.js"></script>
	<script src="js/highcharts-3d.js"></script>
	<script src="js/modulos/exporting.js"></script>
	<script src="js/highcharts-more.js"></script>
	<script src="js/modulos/solid-gauge.js"></script>
	<script src="js/modulos/data.js"></script>
	<script src="js/modulos/funnel.js"></script>
		<script src="js/jquery-ui.js"></script>
		        <script src="js/interfaz1.js"></script>
         <script src="js/calendario.js"></script>

	<link rel="stylesheet" href="EstilosADN/jquery-ui.css">
<title>Interfaz 4 - ADN</title>

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
<style>
label{
color:#0174DF;
 font-size:14px;
}

input{
border-radius:5px;
font-size: 12px;
}
</style>
<body onload="ponderacion();fun();popo();">
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
				                				<div id="usuario5" name="usuario5"><%=usuario%></div>
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
	<div class="menuylogo">
		<div id="menu">
			<div class="menuicono"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('direccion','','ImagenesADN/direccion-rollover.png',1)"><img src="ImagenesADN/direccion-normal.png" name="direccion" border="0" id="direccion" /></a></div>
			<div class="menuicono"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('gerencia','','ImagenesADN/gerencia-rollover.png',1)"><img src="ImagenesADN/gerencia-normal.png" name="gerencia" border="0" id="gerencia" /></a></div>
			<div class="menuicono"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('planeacion','','ImagenesADN/planeacion-rollover.png',1)"><img src="ImagenesADN/planeacion-normal.png" name="planeacion" border="0" id="planeacion" /></a></div>
		    <div class="menuicono"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('tablero','','ImagenesADN/tablero-rollover.png',1)"><img src="ImagenesADN/tablero-normal.png" name="tablero" border="0" id="tablero" /></a></div>
			<div class="menuicono"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('admon','','ImagenesADN/admon-rollover.png',1)"><img src="ImagenesADN/admon-normal.png" name="admon" border="0" id="admon" /></a></div>
			<div class="menuicono"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('analisis','','ImagenesADN/analisis-rollover.png',1)"><img src="ImagenesADN/analisis-normal.png" name="analisis" border="0" id="analisis" /></a></div>
		</div>
		<div class="logo"><img src="ImagenesADN/logo-adn.png"/></div>
	</div>

	<div align="center" class="interfaz">
	  <%=(request.getAttribute("variableEnviada")!=(null))?request.getAttribute("variableEnviada"): ""%>
	<form method="POST" id="CambiaPassword" action="CambiaPassword">
		<table align="center">
			<tr>
				<td>
					<label>Usuario: </label>
				</td>
				<td>
					<input type="text" id="usuario2" name="usuario2">
				</td>
			</tr>
			<tr>
				<td>
					<label>Contraseña anterior: </label>
				</td>
				<td>
					<input type="password" id="password2" name="password2">
				</td>
			</tr>
			<tr>
				<td>
					<label>Contraseña nueva: </label>
				</td>
				<td>
					<input type="password" id="newpass" name="newpas">
				</td>
			</tr>	
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="Aceptar">
				</td>
			</tr>
		</table>	
		</form>	
	</div>
  </div>
</div>
<div align="center">
  <p class="footer">Powered by: ADN. Todos los derechos reservados. 2015</p>
  <div id="logodiezequis"><img src="ImagenesADN/logo-adn.png" width="53" height="37" /></div>
</div>

<script>
$('.bar-percentage[data-percentage]').each(function () {
  var progress = $(this);
  var percentage = Math.ceil($(this).attr('data-percentage'));
  $({countNum: 0}).animate({countNum: percentage}, {
    duration: 2000,
    easing:'linear',
    step: function() {
      // What todo on every count
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
</body>
<script>
inicio();
</script>
</html>