
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
    <!-- <script src="js/bootstrap.min.js"></script>  -->
	<script src="js/bootstrap-modal.js"></script>
    
    <script src="js/interfaz1.js"></script>
	
	<script src="js/highcharts.js"></script>
	<script src="js/modulos/exporting.js"></script>

<title>Hoja Rumbo</title>

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


<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	<table width="1200px"><tr><td width="95%" valign="top">
	<div class="interfaz">
		<div class="barra">
			<input type="hidden" id="hidden1" value="<%=(request.getAttribute("variableEnviada")!=(null))?request.getAttribute("variableEnviada"): ""%>">
			<input type="hidden" id="hiddenMesAno" value="">
			<table width="100%" align="center" id="tablabarra">
			
				<tbody><tr>
					<td>Mes</td>
					<td>
						<select id="comboSelectMes" onchange="cambiaframe();" value="<%=(request.getAttribute("mesEnviado")!=(null))?request.getAttribute("mesEnviado"): ""%>">
							<option value="Seleccione">Seleccione</option>
							<option value="Enero">Enero</option>
							<option value="Febrero">Febrero</option>
							<option value="Marzo">Marzo</option>
							<option value="Abril">Abril</option>
							<option value="Mayo">Mayo</option>
							<option value="Junio">Junio</option>
							<option value="Julio">Julio</option>
							<option value="Agosto">Agosto</option>
							<option value="Septiembre">Septiembre</option>
							<option value="Octubre">Octubre</option>
							<option value="Noviembre">Noviembre</option>
							<option value="Diciembre">Diciembre</option>
						</select>
					</td>
					<td>Ponderación <input type="text" id="ponderacionFinal" value="" disabled class="form-control verde porcentaje"></td>
					<td>Resultado <input type="text" id="resultadoFinal" value=""  disabled class=""></td>
					<!--<td><span>Indicadores</span> <input type="checkbox" id="checkbox-1-1" class="regular-checkbox"><label for="checkbox-1-1"></label></td>
					<td><span>Proyectos</span> <input type="checkbox" id="checkbox-1-2" class="regular-checkbox"><label for="checkbox-1-2"></label></td>
					-->	
				</tr>
			</tbody></table>
		</div>
		
		
                 
		</td>
	</tr>
</table>
		</br>
		</br>
		</br>
	</div>
<img src="https://www.google.com/chart?chc=sites&amp;cht=d&amp;chdp=sites&amp;chl=%5B%5BGoogle+Gadget'%3D20'f%5Cv'a%5C%3D0'10'%3D599'0'dim'%5Cbox1'b%5CF6F6F6'fC%5CF6F6F6'eC%5C0'sk'%5C%5B%22Include+gadget+iframe%22'%5D'a%5CV%5C%3D12'f%5C%5DV%5Cta%5C%3D10'%3D0'%3D600'%3D797'dim'%5C%3D10'%3D10'%3D600'%3D797'vdim'%5Cbox1'b%5Cva%5CF6F6F6'fC%5CC8C8C8'eC%5C'a%5C%5Do%5CLauto'f%5C&amp;sig=rotlUwMu-fuMFtTFZ5QIN5OaM0U" class="igm" frameborder="0" scrolling="no" allowtransparency="true" width="600" height="800" data-igsrc="http://208.gmodules.com/ig/ifr?mid=208&amp;synd=trogedit&amp;url=http%3A%2F%2Fhosting.gmodules.com%2Fig%2Fgadgets%2Ffile%2F106581606564100174314%2Fiframe.xml&amp;up_iframeURL=https%3A%2F%2Fsites.google.com%2Fa%2F10x.mx%2Fproyecto-adn%2Fhome%2Fdireccion%2Fokrs&amp;up_scroll=auto&amp;h=800&amp;w=600" style="display: block; text-align: left;" data-props="url:http#58//hosting.gmodules.com/ig/gadgets/file/106581606564100174314/iframe.xml;showBorder:true;showBorderTitle:true;borderTitle:Include gadget (iframe);title:Include gadget (iframe);view:default;scrolling:no;width:600;height:800;screenshot:https#58//ssl.gstatic.com/sites/p/d46ff3/system/app/images/cleardot.gif;params:up_iframeURL=https%3A%2F%2Fsites.google.com%2Fa%2F10x.mx%2Fproyecto-adn%2Fhome%2Fdireccion%2Fokrs&amp;up_scroll=auto;align:left" data-type="ggs-gadget"><br>

</body>
<script>
inicio();

function cambiaframe(){
	
	select=document.getElementById("comboSelectMes").value;
	if(select=="Seleccione")
		{
		//document.getElementById("FrameEne").style.display="inline";
		
		 $('#container').highcharts({
		        chart: {
		            zoomType: 'x',
		             borderColor: '#708090',
		            borderWidth: 2,
		            type: 'line'
		        },
		       
		        
		        title: {
		            text: 'Gráfica de contribución'
		        },
		        subtitle: {
		            
		        },
		        xAxis: [{
		            categories: ['Ene',"","","", 'Feb',"","","", 'Mar',"","","","", 'Abr',"","","","", 'May',"","","", 'Jun',"","","","",
		                'Jul',"","","", 'Ago',"","","","", 'Sep',"","","", 'Oct',"","","", 'Nov',"","","","", 'Dic',"","",""]
		        }],
		        yAxis: [{ }, { 
		        }],
		        tooltip: {
		            shared: true,
		            crosshairs: true,
		        },
		        legend: {
		            layout: 'horizontal',
		            align: 'top',
		            x: 120,
		            verticalAlign: 'top',
		            y: 30,
		            floating: true,
		            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
		        },
		       
		        
		        series: [{
		            name: 'ingreso italikas',
		            type: 'column',
		            color: "#6495ED",
		            borderColor: '#000080',
		            zIndex:4,
		            data: [20, 71, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4,34,50,87,67,54,23,12,34,56,78,65,67,78,56,23,12,34,56,45,56,67,78,34,21,23,45,65,45,32,76,89,67,88,90,76,56,76,78,56,43],
		            tooltip: {
		                valueSuffix: ' M'
		            }

		        }, {
		            name: 'Ingreso Plan',
		            type: 'spline',
		            color: "#0000CD",
		           
		            zIndex:3,
		            data: [20, 81, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 246.4, 194.1, 95.6, 54.4,34,50,87,67,54,23,12,34,56,78,65,67,78,56,23,12,34,56,45,56,67,78,34,41,23,45,75,45,52,66,49,67,88,90,66,66,96,78,76,63],
		            tooltip: {
		                valueSuffix: '°M'
		            }
		        },
		                 {
		            name: 'Costos italikas',
		            type: 'column',
		            color: "#FF6347",  
		            borderColor: '#B22222',         
		            pointPlacement: -0.3,  
		            zIndex:2,         
		            data: [-30, -81, -56.4, -79.2, -64.0, -76.0, -65.6, -68.5, -76.4, -54.1, -45.6, -54.4,-34,-30,-37,-47,-34,-23,-12,-34,-56,-58,-65,-67 , -46,-23,-12,-34,-56,-45,-56,-67,-78,-34,-41,-23,-45,-75,-45,-52,-66,-49,-67,-88,-90,-66,-66,-96,-78,-76,-63,-34],
		            tooltip: {
		                valueSuffix: '°M'
		            }
		        },
		          {
		            name: 'Costos Plan',
		            type: 'spline',
		            color: '#FF0000' ,
		              zIndex:1,
		            data: [-20, -71, -56.4, -79.2, -64.0, -76.0, -65.6, -48.5, -76.4, -54.1, -45.6, -54.4,-34,-30,-37,-47,-34,-23,-12,-34,-56,-58,-65,-67 , -46,-23,-12,-34,-56,-45,-56,-37,-68,-34,-41,-23,-35,-75,-45,-52,-46,-59,-67,-88,-60,-66,-66,-96,-78,-56,-63,-34],
		            tooltip: {
		                valueSuffix: '°M'
		            }
		        },
		                 {
		            name: 'Costo anterior',
		            type: 'area',
		            marker: {
		                    enabled: false
		                },         
		            color: '#DCDCDC' ,
		            data: [-10, -31, -56.4, -79.2, -64.0, -76.0, -65.6, -48.5, -76.4, -54.1, -45.6, -54.4,-34,-30,-37,-47,-34,-23,-12,-34,-56,-58,-65,-67,-46,-23,-12,-34,-56,-45,-56,-37,-68,-35,-41,-23,-35,-75,-45,-52,-46,-59,-67,-88,-60,-66,-66,-96,-78,-57,-63,-34],
		            tooltip: {
		                valueSuffix: '°M'
		            }
		        },
		                 {
		             marker: {
		                    enabled: false
		                },           
		            name: 'Ingreso anterior',
		            type: 'area',
		            color: "#DCDCDC",
		            data: [40, 71, 50.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4,34,50,87,67,54,63,42,54,76,78,65,67,78,56,23,12,34,56,45,56,67,78,74,61,53,85,65,75,42,76,89,67,88,90,76,56,76,78,56,43],
		            tooltip: {
		                valueSuffix: ' M'
		            }}
		                 
		                ]
		    });
		}
}

function aprobacionesIr(){
	
	location.href="http://localhost:8080/ADN/aprobacionesADN.jsp";
	
}
function tareasIr(){
	
	location.href="http://localhost:8080/ADN/tareasADN.jsp";
	
}
function juntasIr(){
	
	location.href="http://localhost:8080/ADN/juntasADN.jsp";
	
}
function reportesIr(){
	
	location.href="http://localhost:8080/ADN/reportesADN.jsp";
	
}
</script>
<script>
$('.bar-percentage[data-percentage]').each(function () {
  var progress = $(this);
  var percentage = Math.ceil($(this).attr('data-percentage'));
  $({countNum: 0}).animate({countNum: percentage}, {
    duration: 2000,
    easing:'linear',
    step: function() {
      
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
</html>
