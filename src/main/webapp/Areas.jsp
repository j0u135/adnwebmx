<%@page language="java" %>
<%@ page import="com.adn.controlador.Area"%>
<%@ page import="com.adn.conexion.ConsultaArea"%>
<%@ page import = "java.util.LinkedList"%> 
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <LINK href="js/bootstrap.css" rel="stylesheet" type="text/css">
  
<title>Areas</title>
<script>
	function agregar(){
		var area = document.getElementById("area").value;
		if(area!= "")
			{
				document.getElementById("GuardaArea").submit();
			}
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
				                			<td>
				                				<form action="${pageContext.request.contextPath}/logout" method="post">
											    	<button type="submit" data-loading-text="Salir"  class="btn btn-danger" autocomplete="off">
														 LogOut
													</button>
												</form>
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
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('direccion','','ImagenesADN/direccion-rollover.png',1)"><img src="ImagenesADN/direccion-normal.png" name="direccion" width="97" height="99" border="0" id="direccion" /></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('gerencia','','ImagenesADN/gerencia-rollover.png',1)"><img src="ImagenesADN/gerencia-normal.png" name="gerencia" width="109" height="99" border="0" id="gerencia" onclick="dashBoardIr()"/></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('planeacion','','ImagenesADN/planeacion-rollover.png',1)"><img src="ImagenesADN/planeacion-normal.png" name="planeacion" width="110" height="99" border="0" id="planeacion" onclick="planeacionIr()" /></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('tablero','','ImagenesADN/tablero-rollover.png',1)"><img src="ImagenesADN/tablero-normal.png" name="tablero" width="109" height="99" border="0" id="tablero" onclick="arbolIr()" /></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('admon','','ImagenesADN/admon-rollover.png',1)"><img src="ImagenesADN/admon-normal.png" name="admon" width="105" height="99" border="0" id="admon"  onclick="hojaRumbo()"/></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('analisis','','ImagenesADN/analisis-rollover.png',1)"><img src="ImagenesADN/analisis-normal.png" name="analisis" width="95" height="99" border="0" id="analisis" onclick="indiIr()" /></a></div>
			            </td>
			        </tr>
			    </table>
        	</td>
        </tr>
    </table>
    <br><br>
<table  align="center" width="1200px"> 
<td valign="top">
 <table>
	<tr>
    	<td>
    		<form method="POST" id="GuardaArea" action="GuardaArea">
    		<table class="shadow" BGCOLOR="#f5f6f6" width="500" >
    			<tr>
          			<td><label  class="stylo">Nuevo</label></td><td><input class="redondear" type="text" name="area" id="area"></td>
       			</tr>	
       		</table>
       		</form>
       </td>
       <td>
       </td>
       <td>
       		<button type="submit" data-loading-text="Agregar" class="btn btn-primary" autocomplete="off" onclick="agregar()">
				 Agregar
			</button>
       </td>
	</tr>
	<tr>
			
	</tr>
	<tr>
	</tr>
  		 <br>
	<tr>
		<td>
      		<table class="shadow" BGCOLOR="#f5f6f6" WIDTH=500 HEIGHT=170>
      			<tr>
      				
      			</tr>
      		</table>	
		</td>
<td>
		<td>
			<table class="shadow"  BGCOLOR="#f5f6f6" WIDTH=500 HEIGHT=170>
		
				<tr>
      	 			<td></td>
</tr>
<%
LinkedList<Area> lista = ConsultaArea.getAreas();
for (int i=0;i<lista.size();i++)
{
   out.println("<tr>");
   out.println("<td>"+lista.get(i).getArea()+"</td>");
   out.println("</tr>");
}
%>
				</tr>
			</table>
		</td>
</td>
<tr>
	<table name="scrolltable" class="shadow"  BGCOLOR="#f5f6f6" WIDTH=500 style="display:none">
	<tr>
		<td>
		</br>
		<label class="Stylo">Url de CSV: </label><input class="url" type="text" name="url">
		</td>
	</tr>
	<tr>
		<td>
		<br>
		<div class="custom-input-file"><input type="file" size="1" class="input-file" />
		</div>
		</td>
	</tr>
	</table>
</td>
<td width="5%" valign="top" style="display:none">	
<div >
                		<IMG SRC="ImagenesADN/gadgets1.png">
                	</div>
                    <table width="100%" BGCOLOR="#f5f6f6" border="0">
                        <tr>
                        	<td align="center">
			               		<img src="ImagenesADN/" onclick="creaElemento('metaAudaz')">
			               </td>
                        </tr>
                        <tr>
                        	<td align="center">
			               		<img src="ImagenesADN/" onclick="creaElemento('pqExisto')">
			               </td>
                        </tr>
                        <tr>
                        	<td align="center">
			               		<img src="ImagenesADN/" onclick="creaElemento('valores')">
			               </td>
                        </tr>
                        <tr>
                        	<td align="center">
			               		<img src="ImagenesADN/" onclick="creaElemento('foda')">
			               </td>
                        </tr>
                        <tr>
                        	<td align="center">
			               		<img src="ImagenesADN/" onclick="creaElemento('segmentacion')">
			               </td>
                        </tr>
                        <tr>
                        	<td align="center">
			               		<img src="ImagenesADN/" onclick="creaElemento('promesaMarca')">
			               </td>
                        </tr>
                        <tr>
                        	<td align="center">
			               		<img src="ImagenesADN/" onclick="creaElemento('competencias')">
			               </td>
                        </tr>
                        <tr>
                        	<td align="center">
			               		<img src="ImagenesADN/" onclick="creaElemento('propuestaVenta')">
			               </td>
                        </tr>
                    </table>
                    <div>
                    	<IMG SRC="ImagenesADN/gadgets2.png">
                    </div>
</td>
</tr>
</table>
    <br>
    <table align="center" width="50%">
        <tr>
            <td width="70%" align="left">
                <div class="shadow" id="alertas">
                <table align="center" width="100%">
                   
                </table>
                </div>
            </td>
 
      </tr>
    </table>
</div>
<div align="center">
  <p class="footer">Powered by: ADN. Todos los derechos reservados. 2015</p>
  <div id="logodiezequis"><img src="ImagenesADN/logo-adn.png" width="53" height="37" /></div>
</div>
<table>

<!-- <tr style="cursor:hand" onMouseOver="this.style.background='#E1E1E1'; this.style.color='blue'" onMouseOut="this.style.background='#FFFFFF'; this.style.color='black'">

<td><B><FONT FACE="Verdana" SIZE=1 COLOR="">Fila 1</FONT></B></td>

<td ><B><FONT FACE="Verdana" SIZE=1 COLOR="">Fila 1</FONT></B></td>

</tr>

<tr style="cursor:hand" onMouseOver="this.style.background='#E1E1E1'; this.style.color='blue'" onMouseOut="this.style.background='#FFFFFF'; this.style.color='black'">

<td ><B><FONT FACE="Verdana" SIZE=1 COLOR="">Fila 2</FONT></B></td>

<td ><B><FONT FACE="Verdana" SIZE=1 COLOR="">Fila 2</FONT></B></td>

</tr> -->

</table>
</body>
</html>
