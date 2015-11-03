<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <LINK href="js/bootstrap.css" rel="stylesheet" type="text/css">


<title>Alta Usuarios</title>

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
<script>

//Funciones usuarios
function validaDatos(){
	//alert("entra");
	usuario=document.getElementById("user").value;
	password=document.getElementById("password").value;
	conpassword=document.getElementById("conpassword").value;
	correo=document.getElementById("correo").value;
	nombre=document.getElementById("nombre").value;
	tipoUsuario=document.getElementById("tipoUsuario").value;
	area=document.getElementById("area").value;
	
	if(password != conpassword){
		alert("La contraseña tiene que ser igual")
	}
	else
	if(usuario!="" && password!="" && correo!="" && nombre!="" && tipoUsuario!="" && area!=""){
		//Ejecuta evento guardar
		document.getElementById("prueba").submit();
		
	}else{
		alert("Los datos con * son Obligatorios");
	}
	
}

function buscaUsuario(){
	
	//Asignar el valor de el id usuario para buscar en la base
	usuario=document.getElementById("user").value;
	if(usuario!=""){
		//ejecuta para buscar
		document.getElementById("usuarioBuscado").value=usuario;
		document.getElementById("busca").submit();
	}else{
		alert("Debe ingresar un usuario")
	}
	
}


</script>
<script>
	var indice=0;
	
		function clone() {
			 original=document.getElementById("jefe2");
           	 nuevo=original.cloneNode(true);
           	 nuevo.id="jefe"+indice;
           	 destino=document.getElementById("datosjefe");
           	 destino.appendChild(nuevo);
           	 document.getElementById("jefe"+indice).style.display = "inline";
           	 
           	 indice=indice+1;
        }
</script>
</head>

<%@ page import = "com.adn.conexion.Operaciones"%>
<%@ page import = "java.sql.ResultSet"%> 

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
			            	
			            	<!--  
			                <div id="" style="display:inline-block"><img src="ImagenesADN/logo-adn.png" width="116" height="98" /></div>
			                <div id="" style="display:inline-block; width: 116; height: 98"><img src="ImagenesADN/parche-navegacion.png"></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('direccion','','ImagenesADN/direccion-rollover.png',1)"><img src="ImagenesADN/direccion-normal.png" name="direccion" width="97" height="99" border="0" id="direccion" /></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('gerencia','','ImagenesADN/gerencia-rollover.png',1)"><img src="ImagenesADN/gerencia-normal.png" name="gerencia" width="109" height="99" border="0" id="gerencia" onclick="dashBoardIr()"/></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('planeacion','','ImagenesADN/planeacion-rollover.png',1)"><img src="ImagenesADN/planeacion-normal.png" name="planeacion" width="110" height="99" border="0" id="planeacion" onclick="planeacionIr()" /></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('tablero','','ImagenesADN/tablero-rollover.png',1)"><img src="ImagenesADN/tablero-normal.png" name="tablero" width="109" height="99" border="0" id="tablero" onclick="arbolIr()" /></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('admon','','ImagenesADN/admon-rollover.png',1)"><img src="ImagenesADN/admon-normal.png" name="admon" width="105" height="99" border="0" id="admon"  onclick="hojaRumbo()"/></a></div>
			                <div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('analisis','','ImagenesADN/analisis-rollover.png',1)"><img src="ImagenesADN/analisis-normal.png" name="analisis" width="95" height="99" border="0" id="analisis" onclick="indiIr()" /></a></div>
			            	-->
			            </td>
			        </tr>
			    </table>
        	</td>
        </tr>
    </table>
    <br>
      <%=(request.getAttribute("variableEnviada")!=(null))?request.getAttribute("variableEnviada"): ""%>
    
  	<form id="busca" action="buscaUsuario" method="post">
  		<input type="hidden" value="" name="usuarioBuscado" id="usuarioBuscado">
  	</form>
  	
<form id="prueba" action="guardarUsuario" method="post">
<table  align="center" width="1200px"> 
	 <table>
		<tr>
	    	<td>
	    		<table class="shadow" BGCOLOR="#f5f6f6" width="500" >
	    			<tr>
	          			<td><label  class="stylo">Usuario *</label></td><td><input value="<%=(request.getAttribute("user")!=(null))?request.getAttribute("user"): ""%>"class="redondear" type="text" name="usuario" id="user"></td>
	       			</tr>
	        		<tr>
	         			<td><label  class="stylo">Contraseña *</label></td><td><input class="redondear" value="<%=(request.getAttribute("clave")!=(null))?request.getAttribute("clave"): ""%>" type="password" name="password" id="password"></td>
	       			</tr>
	       			<tr>
	         			<td><label  class="stylo">Confirmar Contraseña *</label></td><td><input class="redondear" value="" type="password" name="conpassword" id="conpassword"></td>
	       			</tr>
	       		</table>
	       </td>
		<tr>
			<td>
	      		<table class="shadow" BGCOLOR="#f5f6f6" WIDTH=500 HEIGHT=180>
	     			<tr>
	     				<td colspan="2">
	       					<label align="center" class="titulodivs">DATOS DEL USUARIO</label>
	       				</td>
	    			</tr>
	     			<tr>
	     				<td><label  class="stylo">Nombre *</label></td>
	     				<td><input value="<%=(request.getAttribute("nombre")!=(null))?request.getAttribute("nombre"): ""%>" class="redondear" type="text" name="nombre" id="nombre"></td>
					</tr>
					<tr>
						<td><label  class="stylo">Correo *</label></td>
						<td><input value="<%=(request.getAttribute("correo")!=(null))?request.getAttribute("correo"): ""%>"class="redondear" type="text" name="correo" id="correo"></td>
					</tr>
					<tr>
						<td><label  class="stylo">Puesto </label></td> 
						<td>
	     					<%
								String nombrePuesto="", nombreArea="", tipoUsuario="", busquedaPuesto="", busquedaArea="", busquedaTipoUsuario="";
							%>
												
							<select class="optiondos" id="puesto" onchange="" name="puesto">
							<option id="puesto" name="puesto"><%=(request.getAttribute("puesto")!=(null))?request.getAttribute("puesto"): "Puesto"%></option>
							<%
							Operaciones obj=new Operaciones();
							busquedaPuesto="SELECT puesto FROM puestos";
							ResultSet rs=obj.consultar(busquedaPuesto);
								
							while(rs.next()){
							nombrePuesto=rs.getString(1);
							%>
							<option value="<%=nombrePuesto%>" ><%=nombrePuesto%></option>
							<%
							}%>
							</select>
	       				</td>
					</tr>
					<tr>
						<td><label  class="stylo">Area *</label></td>
						<td>
	    					<select class="optiondos" id="area" onchange="" name="area">
							  <option><%=(request.getAttribute("area")!=(null))?request.getAttribute("area"): "Area"%></option>
							<%
							Operaciones objArea=new Operaciones();
							busquedaArea="SELECT area FROM areas";
							ResultSet rsArea=objArea.consultar(busquedaArea);
							
							while(rsArea.next()){
								nombreArea=rsArea.getString(1);
							%>
							 <option value="<%=nombreArea%>" ><%=nombreArea%></option>
							<%
							}%>
							</select>
	       				</td>
					</tr>
					<tr>
						<td><label  class="stylo">Tipo *</label></td>
						<td>
	     					<select class="optiondos" id="tipoUsuario" onchange="" name="tipoUsuario">
								  <option value="Default"><%=(request.getAttribute("tipo")!=(null))?request.getAttribute("tipo"): "Tipo"%></option>
								<%
								Operaciones objTUsuario=new Operaciones();
								busquedaTipoUsuario="SELECT nombre FROM roles WHERE nombre!=('Administrador')";
								ResultSet rsTUsuario=objTUsuario.consultar(busquedaTipoUsuario);
								
								while(rsTUsuario.next()){
									tipoUsuario=rsTUsuario.getString(1);
								%>
								 <option value="<%=tipoUsuario%>" ><%=tipoUsuario%></option>
								<%
								}%>
							</select>
	       				</td>
					</tr>
					<tr>
						<!--<td><label  class="stylo">Personal Acargo</label></td>
						 <td><input type="checkbox" name="personalCargo"></td> -->
					</tr>
			</table>
		</td>
	</tr>
<tr>
	<td>
		<table BGCOLOR="#f5f6f6" >
	<tr>
		<td>
			<table id="datosjefe" class="shadow"  BGCOLOR="#f5f6f6" WIDTH=500>
				<tr>
       				<td>
      				<label align="center" align="rigth" class="titulodivs">DATOS DEL JEFE DIRECTO</label></td>
      			</tr>
		    	<tr>
		    	</table>
     			<table id="jefe2" class="shadow"  BGCOLOR="#f5f6f6" id="jefe2" WIDTH=500>
				<tr>
					<td><label  class="stylo">Nombre</label></td>
					<td><input class="redondear" value="<%=(request.getAttribute("nombreJefe")!=(null))?request.getAttribute("nombreJefe"): ""%>" type="text" name="nombreJefe" id="nombreJefe"></td>
				</tr>
				<tr>
					<td><label class="stylo">Usuario</label></td>
					<td><input class="redondear" type="text" name="usuarioJefe" id="usuarioJefe" value="<%=(request.getAttribute("nombreJefe")!=(null))?request.getAttribute("nombreJefe"): ""%>"></td>
				</tr>
			</table>
		</table>
		<tr>
				<td>
					<!-- <input type="button" onclick="clone()" value="Agregar" />  
					<button type="button" class="btn btn-default" autocomplete="off" onclick="clone()">
						 Agregar Jefe
					</button>-->
				</td>
		</tr>

			</table>
		</table>
<tr>
	<table class="shadow" BGCOLOR="#f5f6f6">
		<tr>
			<td>
				<tr>
                 	<td align="center">
			        	<button type="button" class="btn btn-primary" autocomplete="off" onclick="validaDatos()">
							Guardar
						</button>
			        </td>
               		<td align="center">
			       	 	<button type="button" class="btn btn-success" autocomplete="off" onclick="buscaUsuario()">
							Buscar
						</button>
			        </td>
			       <!--  <td align="center">
			        	<button type="button" class="btn btn-info" autocomplete="off" onclick="validaDatos()">
							Actualizar
						</button>
			        </td>
               		<td align="center">
			        	<button type="button" class="btn btn-danger" autocomplete="off" onclick="buscaUsuario()">
							Eliminar
						</button>
			        </td> -->
              </tr>
			</td>
		</tr>
	</table>
</tr>
</table>
</form>
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
</html>