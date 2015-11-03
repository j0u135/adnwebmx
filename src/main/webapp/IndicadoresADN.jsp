<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">


<title>Alta Indicadores</title>


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

<%@ page import = "com.adn.conexion.Operaciones"%>
<%@ page import = "com.adn.conexion.Conexion"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.sql.Statement"%> 


<script src="js/Chart.js"></script>

<script>

function carga(x){
	//alert(x);
	cadena=x.split("-");
	//alert(cadena[0]);
	document.getElementById("nombre").value=cadena[0];
	document.getElementById("definicion").value=cadena[1];
	document.getElementById("formula").value=cadena[2];
	document.getElementById("frecuencia").value=cadena[3];
	document.getElementById("tipo").value=cadena[4];
	document.getElementById("unidad").value=cadena[5];
	document.getElementById("q1").value=cadena[6];
	document.getElementById("q2").value=cadena[7];
	document.getElementById("q3").value=cadena[8];
	document.getElementById("q4").value=cadena[9];
	document.getElementById("rolvisible").value=cadena[10];
		
}

function elegir(){
	document.getElementById("llena").action="UpdateIndicador";
	document.getElementById("llena").submit();
}

function pintar(){
	var randomScalingFactor = function(){ return Math.round(Math.random()*20)};
	meta1=document.getElementById("q1").value;
	meta2=document.getElementById("q2").value;
	meta3=document.getElementById("q3").value;
	meta4=document.getElementById("q4").value;
		
	
	var barChartData = {
		labels : ["Meta 1/ Real","Meta 2/ Real","Meta 3/ Real","Meta 3/ Real"],
		datasets : [
			{
				fillColor : "rgba(220,220,220,0.5)",
				strokeColor : "rgba(220,220,220,0.8)",
				highlightFill: "rgba(220,220,220,0.75)",
				highlightStroke: "rgba(220,220,220,1)",
				data : [meta1,meta2,meta3,meta4]
			},
			{
				fillColor : "rgba(151,187,205,0.5)",
				strokeColor : "rgba(151,187,205,0.8)",
				highlightFill : "rgba(151,187,205,0.75)",
				highlightStroke : "rgba(151,187,205,1)",
				data : [randomScalingFactor(),randomScalingFactor(),randomScalingFactor(),randomScalingFactor()]
			}
		]
	
	}
	
		var ctx = document.getElementById("canvas").getContext("2d");
		window.myBar = new Chart(ctx).Bar(barChartData, {
			responsive : true
		});
	
}

function validaFrecuencia(){
	frecuencia=document.getElementById("frecuencia").value;
	if(frecuencia!=""){
		if(frecuencia=="semanal"){
			document.getElementById("tablaSemanal").style.display="inline";
			document.getElementById("tablaMensual").style.display="none";
			document.getElementById("tablaTrimestral").style.display="none";
			
		}else if(frecuencia=="mensual"){
			document.getElementById("tablaSemanal").style.display="none";
			document.getElementById("tablaMensual").style.display="inline";
			document.getElementById("tablaTrimestral").style.display="none";
			
		}else{
			document.getElementById("tablaSemanal").style.display="none";
			document.getElementById("tablaMensual").style.display="none";
			document.getElementById("tablaTrimestral").style.display="inline";
			
		}
	}else{
		document.getElementById("tablaSemanal").style.display="none";
		document.getElementById("tablaMensual").style.display="none";
		document.getElementById("tablaTrimestral").style.display="none";
	}
	
}




// Direciones
function planeacionIr(){
	
	location.href="http://localhost:8080/ADN/PlaneacionEstrategica.jsp";
	
}
function arbolIr(){
	
	location.href="http://localhost:8080/ADN/arbolIndicadoresDosADN.jsp";
}

function dashBoardIr(){
	location.href="http://localhost:8080/ADN/DashBoardADN.jsp";
	
}
function rutaIr(){
	location.href="http://localhost:8080/ADN/hojaRutaADN.jsp";
	
}
function indiIr(){
	location.href="http://localhost:8080/ADN/dashboardIndividualADN.jsp";
	
}

</script>

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
 	<label><%=(request.getAttribute("variableEnviada")!=(null))?request.getAttribute("variableEnviada"): ""%></label>
    <table align="center" width="1200px">
        <tr>
            <td align="center">
                <div class="shadow" id="indicadoresconsola">
                    <div>	
				<%
				String nombre="", definicion="", formula="", frecuencia="", tipo="", unidad="", Q1="", Q2="", Q3="", Q4="", semana="",ene="",feb="",mar="",abr="",may="",jun="",jul="",ago="",sep="",oct="",nov="",dic="", permiso="",  busqueda="";
				%>
						
				<select class="selectEstiloGrande" onchange="carga(this.value); pintar();">
				  <option value="Default">Selecciona Indicador</option>
				<%
			
				Operaciones obj=new Operaciones();
				busqueda="SELECT Nombre, definicion,formula,frecuencia,tipo,unidad,q1,q2,q3,q4, semana,ene,feb,mar,abr,may,jun,jul,ago,sep,oct,nov,dic,rolvisible FROM indicadores";
				ResultSet rs=obj.consultar(busqueda);
				
				while(rs.next()){
					nombre=rs.getString(1);
					definicion=rs.getString(2);
					formula=rs.getString(3);
					frecuencia=rs.getString(4);
					tipo=rs.getString(5);
					unidad=rs.getString(6);
					Q1=rs.getString(7);
					Q2=rs.getString(8);
					Q3=rs.getString(9);
					Q4=rs.getString(10);
					semana=rs.getString(11);
					ene=rs.getString(12);
					feb=rs.getString(13);
					mar=rs.getString(14);
					abr=rs.getString(15);
					may=rs.getString(16);
					jun=rs.getString(17);
					jul=rs.getString(18);
					ago=rs.getString(19);
					sep=rs.getString(20);
					oct=rs.getString(21);
					nov=rs.getString(22);
					dic=rs.getString(23);
					permiso=rs.getString(24);


					//resultado2=rs.getString(2);
				
				%>
				 <option value="<%=nombre+"-"+definicion+"-"+formula+"-"+frecuencia+"-"+tipo+"-"+unidad+"-"+Q1+"-"+Q2+"-"+Q3+"-"+Q4+"-"+permiso%>" ><%=nombre%></option>
				
				<%
				}%>
				</select>
				
			</div>
			<div>
				
				<form id="llena" action="RegistroIndicador" method="post">
				<table>
				<tr>
                    <td><label class="cajatextocausariesgo">Nombre:</label></td>
                    <td><input type="text" size="20" id="nombre" name="nombre"></td>
				</tr>
				<tr>
                    <td><label class="cajatextocausariesgo">Definición:</label></td>
                    <td><input type="text" size="20" id="definicion" name="definicion"></td>
				</tr>
				<tr>
                    <td><label class="cajatextocausariesgo">Fórmula:</label></td>
                    <td><input type="text" size="20" id="formula" name="formula"></td>
				</tr>
				<tr>
                    <td><label class="cajatextocausariesgo">Frecuencia:</label></td>
                    <td>
                     <select class="selectEstiloMediano" onchange="validaFrecuencia()" name="frecuencia" id="frecuencia">
                       <option value="">Tipo de frecuencia</option>
                       <option value="semanal">Semanal</option>
                       <option value="mensual">Mensual</option>
                       <option value="trimestral">Trimestral</option>
                   </select>
                   </td>
				</tr>
				<tr>
                    <td><label class="cajatextocausariesgo">Tipo:</label></td>
                    <td>
                    <select class="selectEstiloMediano" onchange="" name="tipo" id="tipo">
                       <option>Tipo</option>
                       <option value="Individual">Individual</option>
                       <option value="Global">Global</option>
                       <option value="KPI">KPI</option>
                    </select>
                    </td>
				</tr>
				<tr>
                    <td><label class="cajatextocausariesgo">Unidad:</label></td>
                    <td>
                    <select class="selectEstiloMediano" onchange="" name="unidad" id="unidad">
                       <option>Unidad</option>
                       <option value="Porcentaje">Porcentaje</option>
                       <option value="Número">Numero</option>
                       <option value="Tiempo">Tiempo</option>
                       <option value="Días">Dias</option>
                       <option value="Horas">Horas</option>
                       <option value="Minutos">Minutos</option>
                    </select>
                    </td>
				</tr>
                </table>
                <table id="tablaSemanal" style="display:none">
					<tr>
	                    <td><label class="cajatextocausariesgo">Semana:</label></td>
					</tr>
					<tr>
	                    <td><input type="text" size="10" id="semana" name="semana"></td>
					</tr>		
				</table>
				<table id="tablaMensual" style="display:none">
					<tr>
	                    <td><label class="cajatextocausariesgo">Ene:</label></td>
	                    <td><label class="cajatextocausariesgo">Feb:</label></td>
	                    <td><label class="cajatextocausariesgo">Mar:</label></td>
	                    <td><label class="cajatextocausariesgo">Abr:</label></td>
					</tr>
					<tr>
	                    <td><input type="text" size="10" id="ene" name="ene"></td>
	                    <td><input type="text" size="10" id="feb" name="feb"></td>
	                    <td><input type="text" size="10" id="mar" name="mar"></td>
	                    <td><input type="text" size="10" id="abr" name="abr"></td>
					</tr>	
					<tr>
						<td><label class="cajatextocausariesgo">May:</label></td>
	                    <td><label class="cajatextocausariesgo">Jun:</label></td>
	                    <td><label class="cajatextocausariesgo">Jul:</label></td>
	                    <td><label class="cajatextocausariesgo">Ago:</label></td>
					</tr>
					<tr>
						<td><input type="text" size="10" id="may" name="may"></td>
	                    <td><input type="text" size="10" id="jun" name="jun"></td>
	                    <td><input type="text" size="10" id="jul" name="jul"></td>
	                    <td><input type="text" size="10" id="ago" name="ago"></td>
					</tr>
					<tr>
						<td><label class="cajatextocausariesgo">Sep:</label></td>
	                    <td><label class="cajatextocausariesgo">Oct:</label></td>
	                    <td><label class="cajatextocausariesgo">Nov:</label></td>
	                    <td><label class="cajatextocausariesgo">Dic:</label></td>
					</tr>
					<tr>
						 <td><input type="text" size="10" id="sep" name="sep"></td>
	                    <td><input type="text" size="10" id="oct" name="oct"></td>
	                    <td><input type="text" size="10" id="nov" name="nov"></td>
	                    <td><input type="text" size="10" id="dic" name="dic"></td>
					</tr>		
				</table>
				 <table id="tablaTrimestral" style="display:none">
					<tr>
	                    <td><label class="cajatextocausariesgo">Meta Q1:</label></td>
	                    <td><label class="cajatextocausariesgo">Meta Q2:</label></td>
	                    <td><label class="cajatextocausariesgo">Meta Q3:</label></td>
	                    <td><label class="cajatextocausariesgo">Meta Q4:</label></td>
	
					</tr>
					<tr>
	                    <td><input type="text" size="10" id="q1" name="q1"></td>
	                    <td><input type="text" size="10" id="q2" name="q2"></td>
	                    <td><input type="text" size="10" id="q3" name="q3"></td>
	                    <td><input type="text" size="10" id="q4" name="q4"></td>
					</tr>		
				</table>
				<table>
					<!--  <tr>
	                    <td><label class="cajatextocausariesgo">RolVisible:</label></td>
	                    <td><input type="text" size="20" id="rolvisible" name="rolVisible"></td>
					</tr>-->
					<tr>
					    <td align="center"><input type="submit" value="Registrar"></td>
	                    <td><input type="button" onclick="elegir()" value="Actualizar"></td>
					</tr>
				</table>
				</form>	
			</div>
                </div>
            </td>
        </tr>
    </table>

    <br>

   <!-- <table align="center" width="50%">
        <tr>
            <td align="center">
            	<label class="titulodivs">GRAFICA POR INDICADOR</label>
                <div class="shadow" id="divtotal">
                   <div>
						<canvas id="canvas" align="center" height="450" width="600"></canvas>
					</div>
                </div>
            </td>
        </tr>
    </table> -->
    <div align="center">
  <p class="footer">Powered by: ADN. Todos los derechos reservados. 2015</p>
  <div id="logodiezequis"><img src="ImagenesADN/logo-adn.png" width="53" height="37" /></div>
</div>
</div>
</body>
</html>