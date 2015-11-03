<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<style>

/*div principal del datepicker*/
.ui-datepicker {
	width: auto;
	background: #2E9AFE;
}

/*Tabla con los días del mes*/
.ui-datepicker table {
	font-size: 9px;
}

/*La cabecera*/
.ui-datepicker .ui-datepicker-header {
	font-size: 12px;
	background: #0040FF;
}

/*Para los días de la semana: Sa Mo ... */
.ui-datepicker th {
	color: #FFFFFF;
}

/*Para items con los días del mes por defecto */
.ui-datepicker .ui-state-default {
	background: #FFFFFF;
}

/*Para el item del día del mes seleccionado */
.ui-datepicker .ui-state-active {
	background: orange;
	color: #FFFFFF;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	
    <link rel="stylesheet" href="EstilosADN/bootstrap.min.css">
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css">
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">    
     <link href="EstilosADN/ui.css" rel="stylesheet">
    <link rel="stylesheet" href="EstilosADN/dis.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/disO.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/jquery-ui.css" rel="stylesheet" type="text/css">
   
   
   
   
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/interfaz11.js"></script>
    <script src="js/calendario.js"></script>



<title>Alta de Prioridades - ADN</title>
<%@ page import = "com.adn.controlador.IndicadorInteligente"%> 
<%@page import="java.util.ArrayList"%>
<%@ page session="true" %>
<%
String usuario = "";
String nombre1 = "";
String puesto = "";
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
	 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
} else {
usuario = (String)sesionOk.getAttribute("usuario");
nombre1 = (String)sesionOk.getAttribute("nombre");
puesto = (String)sesionOk.getAttribute("puesto");
}
%>

</head>

<body>

<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>

<div class="modaladn">

</div>

<div class="contenido bodyadn sombramodal">
<div class="modal-header headeradn">
       
        	<a class="close" onclick="hojaRumbo();"><i class="fa fa-times fa-lg" style="color:#ff0000; padding:10px 0px 0px 0px;"></i></a>
            <h5 class="negritas"><i class="fa fa-eye fa-lg " style="color:#FFFFFF;" ></i> Nueva Prioridad</h5>
        
  </div>
        
        <div class="modal-body">
       
       		<table align="center">
       		    <tr align="center">
       		    <td width=100px colspan=4 >
       		    <div class="input-group margin-bottom-sm" style="float:right; width:50px;">
                     <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-calendar"></i></span>
                     <span id="txtmes"><%=(request.getAttribute("mes")!=(null))?request.getAttribute("mes"): ""%>/<%=(request.getAttribute("anio")!=(null))?request.getAttribute("anio"): ""%></span>
                </div>
       		    </td>
       		    </tr> 
       		    <tr height=5px></tr>
       		
       			<tr>
       			<td class="textBarra negritas resalta" >
				   Puesto
				 </td>
       			<td width=800px colspan=5>
				<input  type="text" class="noeditablevista registroNIs" placeholder="Nombre del Puesto" disabled id="txtpuesto" value="<%=(request.getAttribute("puesto")!=(null))?request.getAttribute("puesto"): ""%>">
				</td>
		        </tr> 
       		    <tr>
       		    
				<td class="textBarra negritas resalta">
				   Departamento
				 </td>
       			
				 
       			<td>
				<input  type="text" class="noeditablevista registroNIs" placeholder="Fecha" disabled id="txtDepartamento" value="<%=(request.getAttribute("departamento")!=(null))?request.getAttribute("departamento"): ""%>">
				</td>
				
				<td class="textBarra negritas resalta">
				   Area
				 </td>
       			
				 
       			<td>
				<input  type="text" class="noeditablevista registroNIs" placeholder="Fecha" disabled id="txtArea" value="<%=(request.getAttribute("area")!=(null))?request.getAttribute("area"): ""%>">
				</td>
				</tr>
				<tr height=5px>
				</tr>	
			    
			</table>
			       	
       	</div>
        <div class="modal-body" style="border-top: 2px solid #B5B7B9;">
       	
       	<table name="tablamaestra" width=100%>
       	<tr class="nopadding" style="height:20px;">
       	<td class="textBarra resalta nopadding" style="text-align:left;">Nombre de la Iniciativa</td>
       	</tr>
       	<tr>
       	<td width=600px>
       	<div class="input-group margin-bottom-sm">
           <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-eye fa-fw"></i></span>
           <input class="form-control input-xs" id="nbIniciativa" type="text" placeholder="Escriba Nombre de la Iniciativa"></input>
        </div>
        </td>
       	</tr>
       	<tr>
       	<td>
       	<table width=100%>
       	<tr class="nopadding" style="height:20px;">
       	<td colspan=3 class="textBarra resalta nopadding" style="text-align:left;">Seleccione el NI a Mejorar</td>
       	
       	</tr>
       	<tr>
       	<td colspan=3 width=600px>
       	<div class="input-group margin-bottom-sm">
           <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-bar-chart fa-fw"></i></span>
           <select class="form-control input-xs" id="selNI" type="text" placeholder="Seleccione NI">
           <option value="Seleccione">Seleccione</option>
           <%
			ArrayList<IndicadorInteligente> arrIndInt = (ArrayList<IndicadorInteligente>)request.getAttribute("arrNis");
			for(int i=0; i<arrIndInt.size();i++){
				IndicadorInteligente indInt = arrIndInt.get(i);
				String claveInd = indInt.getIdIndicador()+"";
				String nombreInd = indInt.getNombre();
				%>
		  		<option value="<%=claveInd%>"><%=nombreInd%></option>
			<%}%>
           </select>
        </div>
        </td>
     
       	</tr>
       	<tr class="nopadding" style="height:20px;">
       	  <td class="textBarra resalta nopadding" style="text-align:left;">Fecha inicio</td>
       	  <td class="textBarra resalta nopadding" style="text-align:left;">Fecha Fin</td>
       	  <td class="textBarra resalta nopadding" style="text-align:left;">Peso</td>
       	</tr>
       			
       	<tr>
       		<td>
       	   <div class="input-group margin-bottom-sm">
             <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-check-square-o fa-fw"></i></span>
             <input class="form-control input-xs" id="datepicker100" name="datepicker100" onchange="obFecha100()" type="text" placeholder="Incial"></input>
           </div>
         </td>
       	<td>
       	   <div class="input-group margin-bottom-sm">
             <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-check-square-o fa-fw"></i></span>
             <input class="form-control input-xs" id="datepicker101" name="datepicker101" onchange="obFecha101()" type="text" placeholder="Final"></input>
           </div>
         </td>
         <td>
       	   <div class="input-group margin-bottom-sm">
             <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-check-square-o fa-fw"></i></span>
             <input class="form-control input-xs" id="inpPeso" type="text" placeholder="Peso Máximo"></input>
           </div>
         </td>
       	</tr>
       	</table><!-- Tabla izquierda -->
        </td>
        
        <td><!-- TD tabla maestra -->
        
       	</td><!-- TD tablamaestra -->
       	</tr>
       	
       	</table><!-- tablamaestra -->
       	
       	       	
       	</div>
       	
        
        <div class="modal-footer" style="border-top: 2px solid #B5B7B9; padding:10px 40px 0px 0px">
        <table width=100%>
        <tr id="tralert" height=30px>
        <td align=left><div class="alert alert-danger" role="alert" id="alertas" style="display:none;">
        	<label id="mensaje"></label>
        	</div>
        </td>
        <td align=right>
        <a onclick="agregaProyectoPrioritario()" id="btnAceptar" class="btn btn-success">Guardar</a>
            <a onclick="hojaRumbo()" id="btnCancelar" class="btn btn-danger" data-dismiss="modal">Cerrar</a>
        </td>
       	</tr>
        	
		</table>
		</div>
</div>

<form method="POST" id="GuardaProyectosPrioritarios" action="GuardaProyectosPrioritarios">
	<input type="hidden" id="nombre1" name="nombre1" value="">
	<input type="hidden" id="cveInd" name="cveInd" value="">
	<input type="hidden" id="fhIni" name="fhIni" value="">
	<input type="hidden" id="fhFin" name="fhFin" value="">
	<input type="hidden" id="peso" name="peso" value="">
	<input type="hidden" id="usuarioHR" name="usuarioHR" value="<%=(request.getAttribute("usuario")!=(null))?request.getAttribute("usuario"):""%>">
	<input type="hidden" id="mesBarra" name="mesBarra" value="<%=(request.getAttribute("mes")!=(null))?request.getAttribute("mes"):""%>">
	<input type="hidden" id="mesNumerico" name="mesNumerico" value="<%=(request.getAttribute("mesNumerico")!=(null))?request.getAttribute("mesNumerico"):""%>">
	<input type="hidden" id="anioSel" name="anioSel" value="<%=(request.getAttribute("anio")!=(null))?request.getAttribute("anio"):""%>">
</form>

<form method="POST" id="redireccion" action="CargaInterfazIndicadores">
	<input type="hidden" id="usuarioRedireccion" name="usuarioRedireccion" value="<%=(request.getAttribute("usuario")!=(null))?request.getAttribute("usuario"):""%>">
	<input type="hidden" id="mesEnviado" name="mesEnviado" value="<%=(request.getAttribute("mes")!=(null))?request.getAttribute("mes"):""%>">
	<input type="hidden" id="mesNumerico1" name="mesNumerico" value="">
	<input type="hidden" id="anioSel" name="anioSel" value="<%=(request.getAttribute("anio")!=(null))?request.getAttribute("anio"):""%>">
	<input type="hidden" id="origen" name="origen" value="">
</form>

<form method="POST" id="linkDireccion" action="linkDireccion">
	<input type="hidden" id="linkDestino" name="linkDestino" value="">
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
function hojaRumbo(){
	var mesEnv = <%=(request.getAttribute("mesNumerico")!=(null))?request.getAttribute("mesNumerico"):""%>;
	var mesInt = parseInt(mesEnv)-1;
	document.getElementById("mesNumerico1").value=mesInt;
	document.getElementById("origen").value="Otro";
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
</script>

<!-- DatePciker en Espa'ol  
<script>

$.datepicker.regional['es'] = {
closeText: 'Cerrar',
prevText: '<Ant',
nextText: 'Sig>',
currentText: 'Hoy',
monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
monthNamesShort: ['Ene','Feb','Mar','Abr', 'May','Jun','Jul','Ago','Sep', 'Oct','Nov','Dic'],
dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
dayNamesShort: ['Dom','Lun','Mar','Mié','Juv','Vie','Sáb'],
dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','Sá'],
weekHeader: 'Sm',
dateFormat: 'dd/mm/yy',
firstDay: 1,
isRTL: false,
showMonthAfterYear: false,
yearSuffix: ''
};
$.datepicker.setDefaults($.datepicker.regional['es']);
</script>
-->
<script>

$(function() {
	$("#datepicker100").datepicker();
});
$(function() {
	$("#datepicker101").datepicker();
});
</script>
	





	function agregar(){
		var area = document.getElementById("area").value;
		if(area!= "")
			{
				document.getElementById("GuardaArea").submit();
			}
	}
</script>


<script>
var fecha;

function obFecha100(){
	
	var fecha = $('#datepicker100').val();
	//alert(fecha);
	document.getElementById("hidenfecha100").value=fecha;
}
function obFecha101(){
	
	var fecha = $('#datepicker101').val();
	//alert(fecha);
	document.getElementById("hidenfecha101").value=fecha;
}
</script>


</body>
<script>
inicio("Alta");
</script>
</html>
	