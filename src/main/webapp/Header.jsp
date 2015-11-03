<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	
<title>Cabecera - ADN</title>
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
	<div class="shadow" id="barrausuario" style="height:24px;">
	                	<table width="100%" style="height:24px !important;">
	                		<tr>
	                			<td class="barrasuperior" align="left">
	                				<table>
	                					<tr class="barrasuperior" align="center">
				                			<td class="barrasuperior" align="left" width=5px>
				                				 <div id="iconousuario"><img src="ImagenesADN/icono-usuario.png" width="18" height="20" /></div>
				                			</td>
				                			<td class="barrasuperior" align="right">
				                				<div id="usuario" style="font-size:11px; display:none;"><%=request.getParameter("usuario")%></div> 
				                			</td>
				                			<td width=5px ></td>
				                			<td class="barrasuperior">
				                				<div id="usuario" style="font-size:11px;"><%=request.getParameter("nombre")%></div> 
				                			</td>
				                			<td width=20px></td>
				                			<td class="barrasuperior">
				                				<div id="usuario" style="font-size:11px;"><%=request.getParameter("puesto")%></div> 
				                			</td>
				                			<td width=20px></td>
				                			<td class="barrasuperior">
				                			 <form action="${pageContext.request.contextPath}/logout" method="post">
								    	       <button type="submit" data-loading-text="Salir"  class="btn btn-danger btn-xs barrasuperior" style="width: 52px !important; height:22px !important"  autocomplete="off">
											    Salir&nbsp;&nbsp;<i class="fa fa-envelope"></i>
										       </button>
									         </form>
				                			</td>
				                			
				                		</tr>
				                	 </table>
	                			</td>
	                			<td class="barrasuperior">
	                			<% String aut = request.getParameter("autorizador"); 
	                			if(aut!= null && !aut.equals("") && aut.equals("SI")){%>
	                			<button style="width:150px;" type="submit" class="btn btn-success btn-xs btn-block margin-bottom-sm" onclick="consultaAuto()" data-toggle="popover" data-trigger="hover" data-placement="top" title="" data-content="We'll send you updates on new Font Awesome releases, icons, and other stuff that we're working on. We won't spam you. Scout's honor." data-original-title="Stay up to date with the Awesome">
                                  Ver Autorizaciones&nbsp;&nbsp;<i class="fa fa-envelope"></i>
                                </button>
                                <%}%>
	                			</td>
	                			<td align="right" class="barrasuperior" >
	                				<table>	
	                				    <tr class="barrasuperior">	
				                			<td align="right" class="barrasuperior">
				                				 <div class="barrasuperior" id=""><img src="ImagenesADN/icono-fecha.png" width="17" height="20" /></div>
				                			</td>
				                			<td align="right" class="barrasuperior">
				                				 <div class="barrasuperior" id="fecha" style="font-size:11px;">
							                        <script type="text/JavaScript"> var f = new Date(); document.getElementById("fecha").innerHTML=(((f.getDate()<10)?("0"+f.getDate()):(f.getDate())) + "/" +((f.getMonth() +1<10)?("0"+(f.getMonth() +1)):(f.getMonth() +1))+ "/" + f.getFullYear()); </script>
							                    </div>
				                			</td>
				                			<td align="right" class="barrasuperior">
				                				 <div class="barrasuperior" id="" ><img src="ImagenesADN/icono-hora.png" width="17" height="20" /></div>
				                			</td>
				                			<td align="right" class="barrasuperior">
				                				 <div class="barrasuperior" id="hora" style="font-size:11px;">
							                        <script type="text/javascript"> function startTime(){ today=new Date(); h=today.getHours(); m=today.getMinutes(); s=today.getSeconds(); m=checkTime(m); s=checkTime(s); document.getElementById('reloj').innerHTML=h+":"+m+":"+s; t=setTimeout('startTime()',500);} function checkTime(i) {if (i<10) {i="0" + i;}return i;} window.onload=function(){startTime();} </script> <div id="reloj"></div>
							                     </div>
				                			</td>
				                		
				                		</tr>
				                	</table>
	                			</td>
	                		</tr>
	                </table>		
				 </div>
         
		<div class="modulo" style="width:100%;" >
		
	   
		<div class="modconfHeader" style="width:100%;">	
			<div class="modheader" style="width:100%;">
				<div class="headerizq">					
					
					<div id="menu" >
					<table>
					<tr height=20px></tr>
					<tr>
					
					 <td>
					  <div id="" style="display:inline-block" ><a href="https://sites.google.com/a/10x.mx/soporte-adn/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('ayuda','','ImagenesADN/Nmenu/ayuda-rollover.png',1)"><img src="ImagenesADN/Nmenu/ayuda.png" name="ayuda" width="20" height="20" border="0" id="ayuda"/></a></div>
					  <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('configura','','ImagenesADN/Nmenu/config-rollover.png',1)"><img src="ImagenesADN/Nmenu/config.png" name="configura" width="20" height="20" border="0" id="configura"  onclick="linkDir('Conf-1.jsp')" /></a></div>
			          <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('gerencia','','ImagenesADN/Nmenu/sistema-rol.png',1)"><img src="ImagenesADN/Nmenu/sistema.png" name="gerencia" width="20" height="20" border="0" id="gerencia" onclick="sistInd()"/></a></div> 
			        </td>
			
			        </tr>
			        </table>	
					</div>
					<div id="menu" style="width:60px"></div>
					
					<div id="menu">
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('direccion','','ImagenesADN/Nmenu/inicio-roll.png',1)"><img src="ImagenesADN/Nmenu/inicio.png" name="direccion" width="60" height="50" border="0" id="direccion" onclick="linkDir('Index.jsp')"/> </a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('admon','','ImagenesADN/Nmenu/grid-rol.png',1)"><img src="ImagenesADN/Nmenu/grid.png" name="admon" width="60" height="50" border="0" id="admon" onclick="cargaTablero()" /></a></div>	
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('tablero','','ImagenesADN/Nmenu/hdr-rol.png',1)"><img src="ImagenesADN/Nmenu/hdr.png" name="tablero" width="60" height="50" border="0" id="tablero"  onclick="hojaRumbo()" /></a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('planeacion','','ImagenesADN/Nmenu/dasboards-rol.png',1)"><img src="ImagenesADN/Nmenu/dashboards.png" name="planeacion" width="60" height="50" border="0" id="planeacion" onclick="linkDir('DashBoardADN.jsp')" /></a></div>
							
					</div>
					
					<div class="logocliente" style="margin: 0px 0px 0px 0px"><img src="ImagenesADN/empresa.png" style="width:124px; height:60px"></div>
				</div>
				
				<div class="headerder">
					<div class="logo" style="margin: 15px 20px 10px 30px"><img src="ImagenesADN/logo/logo-adn.png"/></div>
				</div>
			    <div class="headerder">
					 
				</div>
			</div>
	  </div>
	</div>
</div>

<form method="POST" id="redHeader" action="CargaInterfazIndicadores">
	<input type="hidden" id="usuarioRedireccionHD" name="usuarioRedireccionHD" value="">
	<input type="hidden" id="mesEnviadoHD" name="mesEnviadoHD" value="">
	<input type="hidden" id="mesNumericoHD" name="mesNumericoHD" value="">
	<input type="hidden" id="anioSelHD" name="anioSelHD" value="">
	<input type="hidden" id="origenHD" name="origenHD" value="Cabecera">
</form>

<form method="POST" id="linkDireccion" action="linkDireccion">
	<input type="hidden" id="linkDestino" name="linkDestino" value="">
</form>

<form method="POST" id="sistInd" action="CargaSistInd">
	<input type="hidden" id="propiedad" name="propiedad" value="inicio">
	<input type="hidden" id="TpUsr" name="TpUsr" value="<%=request.getParameter("tipo")%>">
</form>
<form method="POST" id="consultaAuto" action="cargaInterfazAutorizaciones">
	<input type="hidden" id="usuarioSes" name="usuarioSes" value="<%=request.getParameter("usuario")%>">
</form>

<script>
var fechaActual = new Date();
var mesActual;
var anoActual;
var mesNumerico;

function linkDir(link){
	document.getElementById("linkDestino").value=link;
	document.getElementById("linkDireccion").submit();
}

function consultaAuto(){
	document.getElementById("consultaAuto").submit();
}

function obtieneMes(){
	//Obtiene mes actual 
		mesActual=fechaActual.getMonth();
		anoActual=fechaActual.getFullYear();
		mesNumerico=mesActual;
		
		
	}

function regresaNombreMes(mesNum){
	var mes = "";
	switch (mesNum) {
	case 0:
		mes = "Enero";
		break;
	case 1:
		mes = "Febrero";
		break;
	case 2:
		mes = "Marzo";
		break;
	case 3:
		mes = "Abril";
		break;
	case 4:
		mes = "Mayo";
		break;
	case 5:
		mes = "Junio";
		break;
	case 6:
		mes = "Julio";
		break;
	case 7:
		mes = "Agosto";
		break;
	case 8:
		mes = "Septiembre";
		break;
	case 9:
		mes = "Octubre";
		break;
	case 10:
		mes = "Noviembre";
		break;
	case 11:
		mes = "Diciembre";
		break;
	}
	return mes;
}
function hojaRumbo(){
	obtieneMes();
	
	document.getElementById("mesEnviadoHD").value=regresaNombreMes(mesNumerico);
	document.getElementById("mesNumericoHD").value=mesNumerico;
	document.getElementById("anioSelHD").value=anoActual;
	document.getElementById("usuarioRedireccionHD").value=document.getElementById("usuario").innerHTML;
	
	document.getElementById("redHeader").submit();
	
}

function cargaTablero(){
obtieneMes();
	
	document.getElementById("mesEnviadoHD").value=regresaNombreMes(mesNumerico);
	document.getElementById("mesNumericoHD").value=mesNumerico;
	document.getElementById("anioSelHD").value=anoActual;
	document.getElementById("usuarioRedireccionHD").value=document.getElementById("usuario").innerHTML;
	document.getElementById("redHeader").action="CargaTablero";
	document.getElementById("redHeader").submit();
}

function sistInd(){
	document.getElementById("sistInd").submit();
}



</script>
</body>
</html>