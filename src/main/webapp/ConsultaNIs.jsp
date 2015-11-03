<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	 
	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
	<LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/jquery-ui.css">
	<link rel="stylesheet" href="EstilosADN/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="EstilosADN/dis.css" type="text/css"> 
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css" type='text/css'>
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet"> 
    <link rel="stylesheet" href="js/jquery/ui-lightness/jquery-ui-1.10.2.custom.css" />
	<link href="css/primitives.latest.css?207" media="screen" rel="stylesheet" type="text/css" />
    
    <script src="js/jquery.min.js"></script>  
	<script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.js"></script>

	<script type="text/javascript" src="js/ConsultaNIs.js"></script>
	<script src="js/bootstrap-modal.js"></script>
	
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
	<script src="js/modulos/drilldown.src.js"></script>
	<script src="js/modulos/heatmap.js"></script>
	<script src="js/modulos/heatmap.src.js"></script>
	
	


<title>Arbol Indicadores</title>

<%@ page session="true" %>
<%
String usuario = "";
String nombre1 = "";
String puesto = "";
String tipo ="";
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
	 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
} else {
usuario = (String)sesionOk.getAttribute("usuario");
nombre1 = (String)sesionOk.getAttribute("nombre");
puesto = (String)sesionOk.getAttribute("puesto");
tipo = (String)sesionOk.getAttribute("tipo");
}
%>

<%@ page import = "com.adn.controlador.Area"%> 
<%@ page import = "com.adn.controlador.Departamento"%> 
<%@ page import = "com.adn.controlador.Puesto"%> 
<%@ page import = "com.adn.controlador.Indicador"%>
<%@ page import = "com.adn.controlador.FiltroIndicadores"%>
<%@page import="java.util.ArrayList"%>

<script>

</script>

</head>
<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>

<div class="principal">
		<br>
				
<div id="izquierda" class="izquierda">				
				<div class="barratitulo"  >Consulta de NIs</div>
				<div class="barraopciones" style="padding: 0px 0px 20px 2px">
				  
				   <table width="100%">
				   <tr>
				   <td class="textBarra">
				   Area
				   </td>
				   <td width=200px>
				   <select class="form-selectm grande" id="selArea" name="area" onchange="cargarDeptos()">
						<option id="listaAreas" name="listaAreas"></option>
							<option value="0" selected="selected">seleccione</option>
							<%
							String areaUs = (String)((request.getAttribute("idArea")!=(null))?request.getAttribute("idArea"): "");
							ArrayList<Area> arrArea = (ArrayList<Area>)request.getAttribute("areas");
							String cvArea, nombreArea;
							if(arrArea!=null && arrArea.size()>0){
								for(int i=0; i<arrArea.size();i++){
									Area area = arrArea.get(i);
									cvArea = area.getIdArea();
									nombreArea=area.getArea();
									if(areaUs!= null && !areaUs.equals("") && areaUs.equals(cvArea)){
									%>
									 	<option value="<%=cvArea%>" selected="selected" ><%=nombreArea%></option>
									<%}else{%>
										<option value="<%=cvArea%>" ><%=nombreArea%></option>
									<%}
								}
							}%>
						</select>
				   </td>
				   
				   <td class="textBarra">
				   Departamento
				   </td>
				   <td>
				   <select class="form-selectm grande" id="selDepart" name="Departamento" onchange="cargaPuestos()">
						<option id="listaDepartamento" name="listadepartamento"></option>
						<option value="0" selected="selected">Todos</option>
							<%
							String deptoUs = (String)((request.getAttribute("idDepto")!=(null))?request.getAttribute("idDepto"): "");
							ArrayList<Departamento> arrDeptos = (ArrayList<Departamento>)request.getAttribute("deptos");
							String cvDepto, nombreDepto;
							if(arrDeptos!=null){
								for(int i=0; i<arrDeptos.size();i++){
									Departamento depto = arrDeptos.get(i);
									cvDepto = depto.getIdDepto()+"";
									nombreDepto = depto.getNbDepto();
									if(deptoUs!= null && !deptoUs.equals("") && deptoUs.equals(cvDepto)){
									%>
									 	<option value="<%=cvDepto%>" selected="selected" ><%=nombreDepto%></option>
									<%}else{%>
										<option value="<%=cvDepto%>" ><%=nombreDepto%></option>
									<%}
	
								}
								
							}%>
						</select>
				   </td>
				   
				   <td>
				  <!--   <a href="#" class="boton"  title="Lista NIs" onclick="muestraNIs()" alt="lista nis" id="botonNIs"><i class="fa fa-list-alt"></i></a>-->
				  <!--   <a href="#" class="boton"  title="Muestra Resumen" onclick="muestraResumen()" alt="muestra resumen" id="botonResumen"><i class="fa fa-bar-chart"></i></a>-->
				   </td>
				   <td>
				   
				   </td>
					<td align="right">
					
					</td>
					<td width="10px"><td>
					</tr>
					<tr>
					<td height="40px">
					</td>
					</tr>
					</table>
					
					
				
				</div>
		
		<div name="container" class="contenido">
		<div name=opciones2>
		  <table width="100%">
			<tr>	 
				
				
				
		          
		    </tr>
		   </table>
		</div>
		<div id="divGrafica" style="display:none">
		<div id="niveldepartamento"></div>
		<table id="tablamaestra">
		<tr>
		<td id="tablero">
		<table class="bordered">
			<tr id="recuadros">
				<td>
				<table id="tablarecuadros">
				 <tr>
					<td id="recuadro1">
		             
       	                <div class="recuadro" >
                        <h5>Total NIs<br><h1>10</h1></h5></div>
                     
					</td>
					<td id="recuadro2">
		                <div class="recuadro" >
                        <h5>Total Puestos<br><h1>10</h1></h5></div>
					</td>
				</tr>
				</table>
				</td>
			</tr>
          		
		  <tr id="pie">
		  <td colspan=2>
		 <div id="graficapie"></div>
		  </td>
		 </tr>
		</table>
		</td><!-- Tablero -->
		
		<td id="drafica">
		<div id="graficahoras"></div>	
		</td>
		</tr>
		</table>
		
			
		
		
		</div><!-- Div Grafica -->
		
		<div id="divNIs"  style="overflow: scroll;height:400px; ">
		<br>
		<table width= "97%" id="tablamaestra">
		<tr>
		<td>
	    	    <table>
		         <tr>
		        <td width=50px></td>
		         
		         <td class="textBarra">
				   Puesto
				   </td>
				   <td width=200px>
				   <select class="form-selectm grande" id="selPuesto" name="selpuesto" onchange="cargarNis()">
						<option id="listaPuesto" name="listapuesto"></option>
							<option value="0" selected="selected">Todos</option>
							<%
							String puestoUs = (String)((request.getAttribute("idPuesto")!=(null))?request.getAttribute("idPuesto"): "");
							ArrayList<Puesto> arrPuestos = (ArrayList<Puesto>)request.getAttribute("puestos");
							String cvPuesto, nombrePuesto;
							if(arrPuestos!=null){
								for(int i=0; i<arrPuestos.size();i++){
									Puesto puestoArr = arrPuestos.get(i);
									cvPuesto = puestoArr.getIdPuesto()+"";
									nombrePuesto = puestoArr.getNbPuesto();
									if(puestoUs!= null && !puestoUs.equals("") && puestoUs.equals(cvPuesto)){
									%>
									 	<option value="<%=cvPuesto%>" selected="selected" ><%=nombrePuesto%></option>
									<%}else{%>
										<option value="<%=cvPuesto%>" ><%=nombrePuesto%></option>
									<%}
	
								}
								
							}%>
						</select>
				   </td>
				<td class="textBarra">
				   NI
				   </td>
				   <td width=200px>
				   <select class="form-selectm grande" id="selNIs" name="selnis">
						<option id="listaNIs" name="listanis"></option>
							<option value="0" selected="selected">Todos</option>
							<%
							String niUs = (String)((request.getAttribute("idNI")!=(null))?request.getAttribute("idNI"): "");
							ArrayList<Indicador> arrIndicadores = (ArrayList<Indicador>)request.getAttribute("indicadores");
							String cvIndica, nombreIndica;
							if(arrIndicadores!=null){
								for(int i=0; i<arrIndicadores.size();i++){
									Indicador indicador = arrIndicadores.get(i);
									cvIndica = indicador.getIdIndicador()+"";
									nombreIndica = indicador.getNbIndicador();
									if(niUs!= null && !niUs.equals("") && niUs.equals(cvIndica)){
									%>
									 	<option value="<%=cvIndica%>" selected="selected" ><%=nombreIndica%></option>
									<%}else{%>
										<option value="<%=cvIndica%>" ><%=nombreIndica%></option>
									<%}
	
								}
								
							}%>
						</select>
				   </td>
				<td class="textBarra" style="display: none">
				   Tipo
				   </td>
				   <td width=200px>
				   <select class="form-selectm mediano" id="selTipo" name="seltipo" style="display: none">
						<option id="listaTipo" name="listatipo"></option>
							<option value="0">Todos</option>
							<option value="0">Estrategicos</option>
							<option value="0">Control</option>
						</select>
				   </td>
				 <td class="textBarra" style="display: none">
				   Estatus
				   </td>
				   <td width=200px>
				   <select class="form-selectm mediano" id="selEstatus" name="selestatus" style="display: none">
						<option id="listaEstatus" name="listaestatus"></option>
							<option value="0">Todos</option>
							<option value="0">Asignados</option>
							<option value="0">Pendientes</option>
						</select>
				   </td>  
		         <td width=50px>
				   <a href="#" class="boton" onclick="buscarNIs()" id="btnBuscar" title="Buscar NIs" alt="Buscar NIs"><i class="fa fa-search"></i></a>
				   
				   </td>
		         </tr>
     	    	</table>
		</td>
		</tr>
		
		
		<tr>
		<td>
		<table width= "97%"  align="center" id="tablaNIs">
	                		
	                		<tr>
	                			<td colspan="">
	                				<table  width="97%" align="center" style="display:inline">
	                					<tr >
											<th width=18% class="primero">Nombre</th>
											<th width=22%>Descripción</th>
											<th width=10%>Fórmula</th>
											<th width=10%>Fuente</th>
											<th width=15%>Responsable</th>
											<th width=8%>Frecuencia</th>
											<th width=6%>Unidad</th>
											<th width=3%class="ultimo">Acciones</th>
										</tr>
										<%
											ArrayList<Indicador> arrIndTabla = (ArrayList<Indicador>)request.getAttribute("arrIndTabla");
											ArrayList<FiltroIndicadores> arrFiltroTbl = (ArrayList<FiltroIndicadores>)request.getAttribute("arrFiltroTbl");
											if(arrIndTabla!=null){
												for(int j=0; j<arrIndTabla.size(); j++){
													Indicador indic = arrIndTabla.get(j);
													int idIndic = indic.getIdIndicador();
													String nbIndic = indic.getNbIndicador();
													String descIndic = indic.getDescIndicador();
													String formula ="", fuente="", responsable="", frecuencia="",unidad="";
													if(arrFiltroTbl!=null && arrFiltroTbl.size()>0){
														for(int k = 0; k<arrFiltroTbl.size(); k++){
															FiltroIndicadores filInd = arrFiltroTbl.get(k);
															if(filInd!=null && filInd.getIdIndicador()==idIndic){
																formula = filInd.getFormula();
																fuente = filInd.getFuenteDatos();
																responsable = filInd.getRespNombre();
																frecuencia = filInd.getFrecEmision();
																unidad = filInd.getUnidadMedida(); 
															}
														}
													}
										%>
													<tr>
														<td width=18%>
															<input type="hidden" id="idIndicador<%=j%>" value="<%=idIndic%>"> 
															<input type="hidden" id="nbIndicador<%=j%>" value="<%=nbIndic%>">
															<input  type="text" class="noeditablevista registroNIs" placeholder="" disabled id="txtNombre" value="<%=nbIndic%>">
														</td>
														<td width=22%>
															<input type="text" class="noeditablevista registroNIs" placeholder="" disabled id="txtDescripción" value="<%=descIndic%>">
														</td>
														<td width=10%>
															<input type="text" class="noeditablevista registroNIs" placeholder="" disabled id="txtFormula" value="<%=formula%>">
														</td>
														<td width=10%>
															<input type="text" class="noeditablevista registroNIs" placeholder="" disabled id="txtFuente"  value="<%=fuente%>">
														</td>
														<td width=15%>
															<input type="text" class="noeditablevista registroNIs" placeholder="" disabled id="txtResponsable"  value="<%=responsable%>">
														</td>
														<td width=8%>
															<input type="text" class="noeditablevista registroNIs" placeholder="" disabled id="Frecuencia"  value="<%=frecuencia%>">
														</td>
														<td width=6%>
															<input type="text" class="noeditablevista" placeholder="" disabled id="txtUnidad"  value="<%=unidad%>">
														</td>
													    <td width=3%>
													    <%if(!tipo.equals("Usr")){%>	
															<button type="button" id="btnEditar" data-loading-text="Agr/Act..." class="btn btn-info btn-xs" autocomplete="off" onclick="cargaConfigNI(<%=j%>)">
															 <i class="fa fa-pencil-square-o fa-2x" ></i>
										                    </button>
														<%}else if(tipo.equals("Usr") && formula!=null &&!formula.equals("")){%>
															<button type="button" id="btnEditar" data-loading-text="Agr/Act..." class="btn btn-info btn-xs" autocomplete="off" onclick="cargaConfigNI(<%=j%>)">
															 <i class="fa fa-pencil-square-o fa-2x" ></i>
										                    </button>
														<%}%>
														</td>
													</tr>
										<%			
												}
											}
										%>
									</table>
		         </table><!--Tabla NIs-->
		         </td>
		         </tr>
		         </table><!-- Tabla Maestra -->
		</div><!--Div tabla NIs-->
		</div><!--Div Container-->
		</div>
			
</div><!-- izquierda -->
<div id="barraDerecha" class="barraDerecha">
 <table width="100%" class="sidebar" border="0">
                <tr>
					<td align="center">
						<a href="#"><img src="ImagenesADN/BSC.png" title="BSC" width="25" height="25"  alt="BSC" onclick="linkDir('BSC.jsp')"></a>
					  <p>Balanced Scorecard</p>
					</td>
				</tr>
				
				
				<tr>
					<td align="center">
						<a href="#"><img src="ImagenesADN/arbolC.png" title="Control" width="25" height="20" alt="Nis Control" onclick="sistInd('NIs')"></a>
					<p>Árbol NIs</p>
					</td>
				</tr>
				
				<tr>
					<td align="center">
					  <a href="#"> <img src="ImagenesADN/arbolOrg.png" title="Organigrama" width="25" height="25" alt="Organigrama" onclick="sistInd('Org')"/></a>
				    <p>Organigrama</p>	
					</td>
				</tr>
				<tr>
					<td align="center">
						<a href="#"><img src="ImagenesADN/listaNis.png" title="Lista NIs" width="30" height="30" alt="Lista Nis" onclick="linkDir('ConsultaNIs.jsp')"></a>
					<p>Consulta de NIs</p>
					</td>
				</tr>
			</table>       
		</td>
             </table>

</div>
</div><!--Div principal-->

		
	

	<script>
		$( ".puestosmas" ).click(function() {
			$( "#puestos" ).show( "fast" );
		});
		$( "#menos" ).click(function() {
			$( "#puestos" ).hide( "fast" );
		});
	</script>
</body>
<form method="POST" id="linkDireccion" action="linkDireccion">
	<input type="hidden" id="linkDestino" name="linkDestino" value="">
</form>
<form method="POST" id="cargaDeptos" action="cargaConsultaNIs">
	<input type="hidden" id="idArea" name="idArea" value="">
	<input type="hidden" id="idDepto" name="idDepto" value="">
	<input type="hidden" id="idPuesto" name="idPuesto" value="">
	<input type="hidden" id="vistaNI" name="vistaNI" value="0">
	<input type="hidden" id="buscaNI" name="buscaNI" value="NO">
	<input type="hidden" id="idNi" name="idNi" value="">
</form>

<form method="POST" id="cargaConfigNIs" action="cargaConfigNIs">
	<input type="hidden" id="idAreaConf" name="idAreaConf" value="">
	<input type="hidden" id="idDeptoConf" name="idDeptoConf" value="">
	<input type="hidden" id="idPuestoConf" name="idPuestoConf" value="">
	<input type="hidden" id="idNiConf" name="idNiConf" value="">
	<input type="hidden" id="nbAreaConf" name="nbAreaConf" value="">
	<input type="hidden" id="nbDeptoConf" name="nbDeptoConf" value="">
	<input type="hidden" id="nbPuestoConf" name="nbPuestoConf" value="">
	<input type="hidden" id="nbNIConf" name="nbNIConf" value="">
</form>

<form method="POST" id="cargaDeptos" action="CargaSistInd">
	<input type="hidden" id="idArea" name="idArea" value="">
	<input type="hidden" id="idDepto" name="idDepto" value="">
	<input type="hidden" id="TpUsr" name="TpUsr" value="<%=tipo%>">
	<input type="hidden" id="diagVisible" name="diagVisible" value="">
</form>
<form method="POST" id="sistInd" action="CargaSistInd">
	<input type="hidden" id="propiedad" name="propiedad" value="inicio">
	<input type="hidden" id="TpUsr" name="TpUsr" value="<%=request.getParameter("tipo")%>">
	<input type="hidden" id="diagMos" name="diagMos" value="">
</form>

<script>

var mes;
var mesNumerico;
var anoActual="";

function linkDir(link){
	document.getElementById("linkDestino").value=link;
	document.getElementById("linkDireccion").submit();
	
}
</script>

<script>
$(function () {
    $('#graficapie').highcharts({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            text: 'Asignación de NIs'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Browser share',
            data: [
                ['Asignados',   10],
                ['Pendientes',       20],
               
                
            ]
        }]
    });
});

$(function () {

    // Create the chart
    $('#graficahoras').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: null,
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
            name: 'Empleados',
            colorByPoint: true,
            data: [{
                name: 'Fernando Quintanar',
                y: 99,
                drilldown: 'fernando'
            }, {
                name: 'Ana Sanchez',
                y: 53,
                drilldown: 'ana'
            }, 
               {
                name: 'Jose Luis Molina',
                y: 71,
                drilldown: 'jose'
            },  {
                name: 'Elba Rocio Perez',
                y: 65,
                drilldown: 'elba'
            }],
            type: 'column'
        }],
        drilldown: {
            series: [{
                id: 'ana',
                data: [
                    ['Ene', 30],
                    ['Feb', 0],
                    ['Mar', 67],
                    ['Abr',56],
                    ['May', 51]
                ]
            },{
                id: 'fernando',
                data: [
['Ene', 100],
['Feb', 100],
['Mar', 100],
['Abr',99],
['May', 0]
                ]
            }, {
                id: 'elba',
                data: [
['Ene', 40],
['Feb', 30],
['Mar', 77],
['Abr',86],
['May', 91]
                ]
            }, {
                id: 'jose',
                data: [
                    ['Ene', 74],
                    ['Feb', 100],
                    ['Mar', 72],
                    ['Abr',65],
                    ['May', 35]
                ]
            }]
        }
    });
});


</script>
</script>
<script>
var vistaNI = <%=(request.getAttribute("vistaNI")!=(null))?request.getAttribute("vistaNI"): ""%>;
inicio(vistaNI);
function sistInd(diag){
	document.getElementById("diagMos").value=diag;
	document.getElementById("sistInd").submit();
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

	<script>
		$( "#botonNIs" ).click(function() {
			
			var area=document.getElementById("selArea").value;
			var dep=document.getElementById("selDepart").value;
			if(area!=""&&dep!=""){
			$( "#divNIs" ).show( "fast" );
			$( "#divGrafica" ).hide( "fast" );
			}
		});
		$( "#botonResumen" ).click(function() {
			var area=document.getElementById("selArea").value;
			var dep=document.getElementById("selDepart").value;
			if(area!=""&&dep!=""){
			$( "#divNIs" ).hide( "fast" );
			$( "#divGrafica" ).show( "fast" );
			}
		});
	</script>

</html>