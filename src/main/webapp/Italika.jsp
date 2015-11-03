
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	
	
	
	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
	<LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <LINK href="EstilosADN/dis.css" rel="stylesheet" type="text/css">
    <LINK href="EstilosADN/italika.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/jquery-ui.css">
    <link rel="stylesheet" href="EstilosADN/bootstrap.min.css">
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css">
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">
    
    
    
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="http://code.highcharts.com/highcharts.js"></script>
    <script src="http://code.highcharts.com/modules/exporting.js"></script>
    
  
<title>Cabecera - ADN</title>

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
			                
							
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('direccion','','ImagenesADN/Nmenu/planeacion-rollover.png',1)"><img src="ImagenesADN/Nmenu/planeacion-normal.png" name="direccion" width="57" height="59" border="0" id="direccion" /> </a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('gerencia','','ImagenesADN/Nmenu/arbol-rollover.png',1)"><img src="ImagenesADN/Nmenu/arbol-normal.png" name="gerencia" width="69" height="59" border="0" id="gerencia" onclick=""/></a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('planeacion','','ImagenesADN/Nmenu/dash-rollover.png',1)"><img src="ImagenesADN/Nmenu/dash-normal.png" name="planeacion" width="70" height="59" border="0" id="planeacion" onclick="linkDir('DashBoardADN.jsp')" /></a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('tablero','','ImagenesADN/Nmenu/desempeno-rollover.png',1)"><img src="ImagenesADN/Nmenu/desempeno-normal.png" name="tablero" width="69" height="59" border="0" id="tablero"  onclick="hojaRumbo()" /></a></div>
							<div id="" style="display:inline-block"><a href="#" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('admon','','ImagenesADN/Nmenu/config-rollover.png',1)"><img src="ImagenesADN/Nmenu/config-normal.png" name="admon" width="65" height="59" border="0" id="admon" onclick="linkDir('usuariosADN.jsp')" /></a></div>
							<div id="" style="display:inline-block"><a href="https://sites.google.com/a/10x.mx/soporte-adn/" onmouseout="MM_swapImgRestore()" onmouseover="MM_swapImage('analisis','','ImagenesADN/Nmenu/ayuda-rollover.png',1)"><img src="ImagenesADN/Nmenu/ayuda-normal.png" name="analisis" width="55" height="59" border="0" id="analisis"/></a></div>
					</div>
					<div class="logocliente"><img src="ImagenesADN/empresa2.png"></div>
				</div>
				<div class="headerder">
					<div class="logo"><img src="ImagenesADN/logo-adn.png"/></div>
				</div>
			</div>
	  </div>
		
			
	</div>
	<br>
	
<div class="areaGraficado" align="center">
<table>
<tbody>
<tr>
		<div class="menu" align= "left">
			
				<div class= "barrabotones" style="display:inline-block" >
					<select class="form-selects" id="anio" onchange="validaRequeridos()">
					<option value="0">Año</option>
					<option value="2011">2011</option>
					<option value="2012">2012</option>
					<option value="2013">2013</option>
					</select>								
									
					<select class="form-selectm" id="negocio" onchange="llenaDivision()">
	        		<option value="0">Negocio</option>	
	        		<option value="25">ITALIKA</option>							
	    			</select>
	
	    			<select class="form-selectl" id="division" onchange="validaRequeridos()">
	        		<option value="0">Division</option>
	        		<option value="220">PROPIOS</option>
	        		<option value="825">NO ASIGNABLE</option>
	        		<option value="1941">CENTRAL METROPOLITANA SPS</option>
	        		<option value="2558">CESIT BDR ECATEPEC</option>
	        		<option value="2561">CESIT BDR SANTA ANA CHIAUTEMPAN</option>
	        		<option value="2562">CESIT BDR URUAPAN</option>
	        		<option value="6561">PETEN</option>
	        		<option value="6726">PIURA</option>
	        		<option value="6727">IQUITOS</option>
	        		<option value="6730">LAMBAYEQUE</option>
	        		<option value="7219">IRAPUATO</option>
	        		<option value="7555">TEXCOCO</option>
	        		<option value="7563">VILLAHERMOSA</option>
	        		<option value="7564">VERACRUZ</option>
	        		<option value="7565">ZAMORA</option>
	        		<option value="7567">CERRADO IRAPUATO</option>
	        		<option value="7574">JALAPA</option>
	        		<option value="7580">SAN JUAN BAUTISTA TUXTEPEC</option>
	        		<option value="8081">CESIT BDR CUAUTLA</option>
	        		<option value="8913">SAN VICENTE CHICOLOAPAN</option>
	        		<option value="8914">TUXPAN NAYARIT</option>
	        		<option value="4119">CESIT KENNEDY</option>
	        		<option value="5414">PROGRESO</option>
	        		<option value="5415">SANTA BARBARA</option>
	        		<option value="7220">PUERTO ESCODIDO</option>
	        		<option value="6644">TOLUCA</option>
	        		<option value="1211">JUCHITAN</option>
	        		<option value="5420">3RA. AVENIDA SPS</option>
	        		<option value="5411">CHINCHA</option>
	        		<option value="5413">PUCALLPA</option>
	        		<option value="5412">TARAPOTO</option>	
	        			
	    	 		</select>	
	    	 		  
	    	 	
	    	 	<div id="grafAct"style="display:inline-block;" onclick="graficar()" >,<a href><img src="ImagenesADN/grafica-linea1.png" width="25px" height="25px"/></a></div>  	 			
                <div id="grafAct"style="display:none;" onclick="publica()" ><img src="ImagenesADN/grafica-linea1.png" width="25px" height="25px"/></div>  	 			
                
                <div style="display:inline-block" ><a href="https://docs.google.com/a/italika.org/spreadsheets/d/1Yts4rJpO6gmp2W-OIleKxZBZT5bp7_IzoD8W0odpgzg/edit#gid=1252592902" target="_blank"><img src="ImagenesADN/tabla2.png" width="25px" height="25px"/></a></div>  	 			
            
            </div>
               
                <div style="display:inline-block" align= "right">
               	  <div style="display:inline-block" ><a href="https://mail.google.com/" target="_blank"><img src="ImagenesADN/gmail.png" width="35px" height="35px"/></a></div> 
               	  <div style="display:inline-block" ><a href="https://drive.google.com/" target="_blank"><img src="ImagenesADN/googledrive.png" width="35px" height="35px"/></a></div> 
               	  <div style="display:inline-block" ><a href="https://www.google.com/calendar/" target="_blank"><img src="ImagenesADN/googlecalendar.png" width="35px" height="35px"/></a></div> 
               
               </div>
              
          </div>
</tr>   
<tr>
	<div class="panel panel-primary">
	 <div class="panel-body"></div>
	 <div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
 
	 </div>
</tr>
<tr>
	<div class="menu2" align= "left" style="display:inline-block">
	<label for="semana" font-size="10px";>Ingrese la semana a calcular</label>
	<input type="text" class="form-selectm" id="semana" onblur="validaSemana()">
	<button type="button" id="btnCalcula" class="btn btn-primary btn-xs" onclick="calculaSemana()" disabled="disabled">Calcula semana</button>
	</div>
</tr>
<tr>
	<div class="panel panel-primary">
	 <div class="panel-body">
	 
	 </div>
	 </div>
</tr>

</tbody>	 
</table>	
</div>	


</div>	
	

<div align="center">
  <p class="footer">Powered by: ADN. Todos los derechos reservados. 2015</p>
  <div id="logodiezequis"><img src="ImagenesADN/logo-adn.png" width="53" height="37" /></div>
</div>
</body>
<script>
function publica(){
	
	
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

</script>



</html>