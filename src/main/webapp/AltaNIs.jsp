<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
	<script src="js/AltaNIs.js"></script>
	

<title>Indicadores</title>

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

<div class="contenido bodyadn-md sombramodal">
<div class="modal-header headeradn">
       
        	<a class="close" onclick="hojaRumbo();"><i class="fa fa-times fa-lg" style="color:#ff0000; padding:10px 0px 0px 0px;"></i></a>
            <h5 class="negritas"><i class="fa fa-tachometer fa-lg " style="color:#FFFFFF;" ></i> Nuevo Número Inteligente</h5>
        
  </div>
        
        <div class="modal-body">
       
       		<table align="center">
       		    <tr align="center">
       		    <td width=100px colspan=4 >
       		    <input type="hidden" id="pesoHR" name="pesoHR" value="<%=(request.getAttribute("pesoHR")!=(null))?request.getAttribute("pesoHR"): "0"%>">
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
       	<tr>
       	<td>
       	<table width=100%>
       	<tr class="nopadding" style="height:20px;">
       	<td class="textBarra resalta nopadding" style="text-align:left;">Seleccione un NI disponible</td>
       	
       	<td class="textBarra resalta nopadding" style="text-align:left;">Peso</td>
       	</tr>
       	<tr>
       	<td width=600px>
       	<div class="input-group margin-bottom-sm">
           <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-bar-chart fa-fw"></i></span>
           <select class="form-control input-xs" id="selNI" type="text" placeholder="NI">
           	<option value="-1" selected="selected">Selecciona NI</option>
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
       	
        	<td>
       	 <div class="input-group margin-bottom-sm">
           <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-check-square-o fa-fw"></i></span>
           <input class="form-control input-xs" id="inpPeso" onblur="validaPeso()" maxlength="10" onkeyup="soloNumeros(this)" type="text" placeholder="Peso Máximo">
        </div>
        </td>
     
       	</tr>
       	
       	</table><!-- Tabla izquierda -->
        </td>
        
        <td><!-- TD tabla maestra -->
        
       	</td><!-- TD tablamaestra -->
       	</tr>
       	<tr id="tralert" height=30px>
        <td><div class="alert alert-danger" role="alert" id="alertas" style="display:none;">
        		<label id="txtAlerta"></label>
        	</div>
        </td>
       	</tr>
       	</table><!-- tablamaestra -->
       	
       	       	
       	</div>
       	
        
        <div class="modal-footer" style="border-top: 2px solid #B5B7B9; padding:10px 40px 0px 0px">
        	<a onclick="agregaIndicadorInteligente()" id="btnAceptar" class="btn btn-success">Guardar</a>
            <a onclick="hojaRumbo();" id="btnCancelar" class="btn btn-danger" data-dismiss="modal">Cerrar</a>
		</div>
</div>


<div class="principal">
	
	</br>
	
<table width="100%"><tr><td width="95%" valign="top">
   <div class="interfaz">
   
   <form method="POST" id="GuardaIndicadorInteligente" action="GuardaIndicadorInteligente" >
   		<input type="hidden" id="indicadorRecibido" name="indicadorRecibido" value="">
   		<input type="hidden" id="pesoRecibido" name="pesoRecibido" value="">
   		<input type="hidden" id="mesNum" name="mesNum" value="<%=(request.getAttribute("mesNumerico")!=(null))?request.getAttribute("mesNumerico"): ""%>">
		<input type="hidden" id="usuariohiden" name="usuariohiden" value="<%=(request.getAttribute("usuario")!=(null))?request.getAttribute("usuario"): ""%>">
		<input type="hidden" id="mes" name="mes" value="<%=(request.getAttribute("mes")!=(null))?request.getAttribute("mes"): ""%>">
		<input type="hidden" id="anio" name="anio" value="<%=(request.getAttribute("anio")!=(null))?request.getAttribute("anio"): ""%>">
	</form>
	<form method="POST" id="redireccion" action="CargaInterfazIndicadores">
	<input type="hidden" id="usuarioRedireccion" name="usuarioRedireccion" value="<%=(request.getAttribute("usuario")!=(null))?request.getAttribute("usuario"):""%>">
	<input type="hidden" id="mesEnviado" name="mesEnviado" value="<%=(request.getAttribute("mes")!=(null))?request.getAttribute("mes"):""%>">
	<input type="hidden" id="mesNumerico" name="mesNumerico" value="<%=(request.getAttribute("mesNumerico")!=(null))?request.getAttribute("mesNumerico"): ""%>">
	<input type="hidden" id="anioSel" name="anioSel" value="<%=(request.getAttribute("anio")!=(null))?request.getAttribute("anio"):""%>">
	<input type="hidden" id="origen" name="origen" value="">
</form>
   </div>
   </td>
		
	</tr>
</table>
</div>
</body>
<script>
function hojaRumbo(){
	var mesEnv = <%=(request.getAttribute("mesNumerico")!=(null))?request.getAttribute("mesNumerico"):""%>;
	var mesInt = parseInt(mesEnv)-1;
	document.getElementById("mesNumerico").value=mesInt;
	document.getElementById("origen").value="Otro";
	document.getElementById("redireccion").submit();
}
</script>
</html>