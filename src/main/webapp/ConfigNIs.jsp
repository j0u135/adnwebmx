<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	 
	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
	<LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/bootstrap.min.css" type="text/css"> 
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">  
    <link href="EstilosADN/ui.css" rel="stylesheet">
	<link rel="stylesheet" href="EstilosADN/dis.css" type="text/css"> 
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css" type='text/css'>
    
   
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/ConfigNIs.js"></script>
	<script type="text/javascript" src="js/calendario.js"></script>
	<script src="js/bootstrap-modal.js"></script>
	


<title>Arbol Indicadores</title>

<%@ page session="true" %>
<%@ page import = "com.adn.controlador.FiltroIndicadores"%>
<%
String usuario = "";
String nombre1 = "";
String puesto = "";
String tipo = "";
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
	 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
} else {
usuario = (String)sesionOk.getAttribute("usuario");
nombre1 = (String)sesionOk.getAttribute("nombre");
puesto = (String)sesionOk.getAttribute("puesto");
tipo = (String)sesionOk.getAttribute("tipo");
}

FiltroIndicadores filtro = (FiltroIndicadores)request.getAttribute("filtroInd");
String objetivo="", respNombre="", respPuesto="", sentido="", tpCarga="", unidadMedida="", fuenteDatos="", frecEmision="", formula="", fhCorte="", distribucion="";
if(filtro!=null){
	objetivo = filtro.getObjetivo()!=null?filtro.getObjetivo():"";
	respNombre = filtro.getRespNombre()!=null?filtro.getRespNombre():"";
	respPuesto = filtro.getRespPuesto()!=null?filtro.getRespPuesto():"";
	sentido = filtro.getSentido()!=null?filtro.getSentido():"";
	tpCarga = filtro.getTpCarga()!=null?filtro.getTpCarga():"";
	unidadMedida = filtro.getUnidadMedida()!=null?filtro.getUnidadMedida():"";
	fuenteDatos = filtro.getFuenteDatos()!=null?filtro.getFuenteDatos():""; 
	frecEmision = filtro.getFrecEmision()!=null?filtro.getFrecEmision():"";
	formula = filtro.getFormula()!=null?filtro.getFormula():""; 
	fhCorte = filtro.getFhCorte()!=null?filtro.getFhCorte():""; 
	distribucion = filtro.getDistribucion()!=null?filtro.getDistribucion():"";
}
%>




<script type="text/javascript">
    $(window).load(function(){
        $('#example').modal('show');
    });
</script>
</head>
<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>



<div id="example" class="modal fade ">
<div class="modal-dialog ">
<div class="modal-content fondoadn sombramodal width-800">

<div class="modal-header headeradn">
       
        	<a class="close" data-dismiss="modal" onclick="buscarNIs()" id="btnRegresar" ><i class="fa fa-times fa-md" style="color:#ff0000; padding:10px 0px 0px 0px;"></i></a>
            <h5 class="negritas m-t-15">Configuración del Número Inteligente</h5>
        
  </div>
        <div class="modal-body">
       		<table align="center">
       			<tr>
       			<td class="textBarra negritas resalta">
				   Area
				 </td>
       			<td width=300px>
				<input  type="text" class="noeditablevista registroNIs" placeholder="Area" disabled id="lblArea" value="<%=(request.getAttribute("nbArea")!=(null))?request.getAttribute("nbArea"): ""%>">
				</td>
				
				<td class="textBarra negritas resalta">
				   Departamento
				 </td>
       			<td width=250px>
				<input  type="text" class="noeditablevista registroNIs" placeholder="Departamento" disabled id="lblDepto" value="<%=(request.getAttribute("nbDepto")!=(null))?request.getAttribute("nbDepto"): ""%>">
				</td>
		
       		    </tr> 
       		    <tr>
       		    <td class="textBarra negritas resalta">
				   Puesto
				 </td>
       			<td width=250px>
				<input  type="text" class="noeditablevista registroNIs"  placeholder="Puesto" disabled id="lblPuesto" value="<%=(request.getAttribute("nbPuesto")!=(null))?request.getAttribute("nbPuesto"): ""%>">
				</td>
				
				<td class="textBarra negritas resalta" style="text-align:right;">
				   NI
				 </td>
				 
       			<td width=300px>
				<input  type="text" class="noeditablevista registroNIs" placeholder="Número Inteligente" disabled id="lblNI" value="<%=(request.getAttribute("nbNi")!=(null))?request.getAttribute("nbNi"): ""%>">
				</td>
				</tr>
				<tr height=30px>
				</tr>	
			    
			</table>
			<form method="POST" id="guardaFiltro" action="guardaFiltro">
			<input type="hidden" id="tipoUsr" name="tipoUsr" value="<%=tipo%>">
			<input type="hidden" id="idArea" name="idArea" value="<%=(request.getAttribute("idArea")!=(null)?request.getAttribute("idArea"):"")%>">
			<input type="hidden" id="idDepto" name="idDepto" value="<%=(request.getAttribute("idDepto")!=(null)?request.getAttribute("idDepto"):"")%>">
			<input type="hidden" id="idPuesto" name="idPuesto" value="<%=(request.getAttribute("idPuesto")!=(null)?request.getAttribute("idPuesto"):"")%>">
			<input type="hidden" id="idNi" name="idNi" value="<%=(request.getAttribute("idNi")!=(null)?request.getAttribute("idNi"):"")%>">
			<input type="hidden" id="usuSes" name="usuSes" value="<%=nombre1%>">
			
			<table id=tablamaestra class="table bordered">
			<tr>
			<td>
			
			<table id=tableizquierda >
			        <tr>
			        <td class="textBarra resalta" style="text-align:right;">
				   			Objetivo
				 	</td>
				 
       				<td width=300px>
						<textarea id="txtDescripcion" name="txtDescripcion" rows="1" cols="1"  class="form-control registroNIs nopadding" style="width:300px;"><%=objetivo%></textarea>
					</td>
			        </tr>
			          <tr>
			        <td class="textBarra resalta" style="text-align:right;">
				   			Fórmula
				 	</td>
				 
       				<td width=300px>
						<textarea id="txtFormula" name="txtFormula" rows="1" cols="1" class="form-control registroNIs nopadding" style="width:300px;"><%=formula%></textarea>
					</td>
			        </tr>
			          <tr>
			        <td colspan="2" class="textBarra resalta negritas" style="text-align:center; ">
				   			Responsable de Emisión
				 	</td>
				   </tr>
				   <tr>
       				<td class="textBarra resalta" style="text-align:right;">
				   			Puesto
				 	</td>
       				<td width=300px>
       				<div class="input-group margin-bottom-sm">
                         <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-clock-o fa-fw"></i></span>   
				      
						<input id="txtNombre" name="txtNombre" placeholder="seleccione" type="text" class="form-control registroNIs nopadding" value="<%=respNombre%>">
					</div>		 
					</td>
			        </tr>
			         
			        <tr>
			        </tr>
			        <tr>
			        <td class="textBarra resalta" style="text-align:right;">
				   			Corte
				 	</td>
			        <td align="left">
			        <div class="input-group margin-bottom-sm">
                         <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-clock-o fa-fw"></i></span>   
				        
			        <input id="txtFhCorte" name="txtFhCorte"  type="text" placeholder="Fecha" style="text-align:center; width:150px;" class="form-control registroNIs nopadding" value="<%=fhCorte%>" >
			        </div>
			        </td>
								
			        </tr>
			        </table><!-- Tabla izquierda -->
       	           </td>
       	           <td width=15px></td>
       	           <td class="p-0" style="vertical-align: top;">
       	           <table>
       	           
       	           	  <tr>
			        <td class="textBarra resalta" style="text-align:right;">
				   			Distribución
				 	</td>
				 
       				<td width=300px>
						<div class="input-group margin-bottom-sm">
                         <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-clock-o fa-fw"></i></span>   
				        
						<input id="txtDistribucion" name="txtDistribucion" type="text" class="form-control registroNIs nopadding" value="<%=distribucion%>">
							
						
					</div>
					</td>
					</tr>
						<tr>
       	           		<td class="textBarra resalta" style="text-align:right; ">
				   		    Fuente
				 	    </td>
				 	    
				 	    <td width=300px>
						<div class="input-group margin-bottom-sm">
                         <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-clock-o fa-fw"></i></span>   
				        
						<input id="txtFuenDatos" name="txtFuenDatos" type="text" class="form-control registroNIs nopadding" value="<%=fuenteDatos%>">
						</div>	 
					</td>
       	           	</tr>
					<tr>
       	           		<td class="textBarra resalta" style="text-align:right; ">
				   		    Frecuencia
				 	    </td>
				 	    <td width=200px>
				        <div class="input-group margin-bottom-sm">
                         <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-clock-o fa-fw"></i></span>   
				         <select id="txtFrecEmi" name="txtFrecEmi" class="form-control">
						    <option value="Seleccione" selected="selected">Seleccione</option>
						    <%if(frecEmision.equals("Diaria")){%>
								<option value="Diaria" selected="selected">Diaria</option>
							<%}else{%>
								<option value="Diaria">Diaria</option>
							<%}
						    if(frecEmision.equals("Semanal")){
							%>
								<option value="Semanal" selected="selected">Semanal</option>
							<%}else{%>
								<option value="Semanal">Semanal</option>
							<%}
						    if(frecEmision.equals("Quincenal")){
							%>	
								<option value="Quincenal" selected="selected">Quincenal</option>
							<%}else{%>
								<option value="Quincenal">Quincenal</option>
							<%}
						    if(frecEmision.equals("Mensual")){
							%>
								<option value="Mensual" selected="selected">Mensual</option>
							<%}else{%>	
								<option value="Mensual">Mensual</option>
							<%}
						    if(frecEmision.equals("Trimestral")){
							%>
								<option value="Trimestral" selected="selected">Trimestral</option>
							<%}else{%>
								<option value="Trimestral">Trimestral</option>
							<%}	%>
						 </select>
						 </div>
				        </td>
				 	    
       	           	</tr>
       	           	<tr>
       	           		<td class="textBarra resalta" style="text-align:right; ">
				   		    Unidad
				 	    </td>
				 	    <td width=200px>
				 	    <div class="input-group margin-bottom-sm">
                         <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-clock-o fa-fw"></i></span>
				         <select id="cmbUM" name="cmbUM" class="form-control"  >
				         	<option value="Seleccione" selected="selected">Seleccione</option>
							<%if(unidadMedida.equals("Peso")){%>
							<option value="Peso" selected="selected">Peso</option>
							<%}else{%>
							<option value="Peso">Peso</option>
							<%}
							if(unidadMedida.equals("Monto")){
							%>
							<option value="Monto" selected="selected">Monto</option>
							<%}else{%>
							<option value="Monto">Monto</option>
							<%}
							if(unidadMedida.equals("Tiempo")){
							%>
							<option value="Tiempo" selected="selected">Tiempo</option>
							<%}else{%>
							<option value="Tiempo">Tiempo</option>
							<%}
							if(unidadMedida.equals("Unidades")){
							%>
							<option value="Unidades" selected="selected">Unidades</option>
							<%}else{%>
							<option value="Unidades">Unidades</option>
							<%}
							if(unidadMedida.equals("Porcentaje")){
							%>
							<option value="Porcentaje" selected="selected">Porcentaje</option>
							<%}else{%>
							<option value="Porcentaje">Porcentaje</option>
							<%}
							if(unidadMedida.equals("Otro")){
							%>
							<option value="Otro" selected="selected">Otro</option>
							<%}else{%>
							<option value="Otro">Otro</option>
							<%}%>
						 </select>
						 </div>
				        </td>
				 	    
       	           	</tr>
       	           	<tr>
       	           		<td class="textBarra resalta" style="text-align:right; ">
				   		    Sentido
				 	    </td>
				 	    <td width=200px>
				 	    <div class="input-group margin-bottom-sm">
                         <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-clock-o fa-fw"></i></span>
				         <select id="cmbSentido" name="cmbSentido" class="form-control"  >
						    <option value="Seleccione" selected="selected">Seleccione</option>
						    <%if(sentido.equals("Mas")){%>
								<option value="Mas" selected="selected">Mas</option>
							<%}else{%>
								<option value="Mas">Mas</option>
							<%}
							if(sentido.equals("Menos")){
							%>
								<option value="Menos" selected="selected">Menos</option>
							<%}else{%>
								<option value="Menos">Menos</option>
							<%}%>
						 </select>
						 </div>
				        </td>
				 	    
       	           	</tr>
       	           	<tr>
       	           		<td class="textBarra resalta" style="text-align:right; ">
				   		    Tipo Carga
				 	    </td>
				 	    <td width=200px>
				 	    <div class="input-group margin-bottom-sm">
                         <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-clock-o fa-fw"></i></span>
				         <select id="cmbTpCarga" name="cmbTpCarga" class="form-control"  >
				         	<option value="Seleccione" selected="selected">Seleccione</option>
							<%if(tpCarga.equals("Automático")){%>
							<option value="Automático" selected="selected">Automático</option>
							<%}else{%>
							<option value="Automático">Automático</option>
							<%}
							if(tpCarga.equals("Manual")){%>
							<option value="Manual" selected="selected">Manual</option>
							<%}else{%>
							<option value="Manual">Manual</option>
							<%}%>
						 </select>
						 </div>
				        </td>
				 	    
       	           	</tr>
       	           </table><!-- Tabla Derecha -->
       	           
       	           </td>
       	           </tr>
     
       	           </table><!-- Tabla maestra -->
       	</form>
       	</div>
        <div class="modal-footer" style="border-top: 2px solid #B5B7B9;">
        	 <%if(!tipo.equals("Usr")){%>
        	<a onclick="valida()" id="btnGuardar" class="btn btn-success">Guardar</a>
        	<%}%>
            <a 	onclick="buscarNIs()" id="btnRegresar" class="btn btn-danger" data-dismiss="modal">Cerrar</a>
		</div>
</div>
</div>
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
				   <select class="form-selectm grande" id="selArea" name="area" >
						<option id="listaAreas" name="listaAreas"></option>
							<option value="0">Todas</option>
						</select>
				   </td>
				   
				   <td class="textBarra">
				   Departamento
				   </td>
				   <td>
				   <select class="form-selectm grande" id="selDepart" name="Departamento">
						<option id="listaDepartamento" name="listadepartamento"></option>
							<option value="0">Todos</option>
						</select>
				   </td>
				   
				   <td>
				   <a href="#" class="boton"  title="Lista NIs" onclick="muestraNIs()" alt="lista nis" id="botonNIs"><i class="fa fa-list-alt"></i></a>
				   <a href="#" class="boton"  title="Muestra Resumen" alt="muestra resumen" id="botonResumen"><i class="fa fa-bar-chart"></i></a>
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
						<a href="#"><img src="ImagenesADN/arbolE.png" title="Estratégicos" width="25" height="20" alt="Estratégicos" onclick="linkDir('ArbolEstrategicos.jsp')"></a>
					    <p>NIs Estratégicos</p>
					</td>
				</tr>
				
				<tr>
					<td align="center">
						<a href="#"><img src="ImagenesADN/arbolC.png" title="Control" width="25" height="20" alt="Nis Control" onclick="linkDir('arbolIndicadoresADN.jsp')"></a>
					<p>NIs Control</p>
					</td>
				</tr>
				
				<tr>
					<td align="center">
					  <a href="#"> <img src="ImagenesADN/arbolOrg.png" title="Organigrama" width="25" height="25" alt="Organigrama" onclick="linkDir('arbolIndicadoresADN.jsp')"/></a>
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
	
<form method="POST" id="cargaDeptos" action="cargaConsultaNIs">
	<input type="hidden" id="vistaNI" name="vistaNI" value="0">
	<input type="hidden" id="buscaNI" name="buscaNI" value="NO">
	<input type="hidden" id="idArea" name="idArea" value="<%=(request.getAttribute("idArea")!=(null)?request.getAttribute("idArea"):"")%>">
	<input type="hidden" id="idDepto" name="idDepto" value="<%=(request.getAttribute("idDepto")!=(null)?request.getAttribute("idDepto"):"")%>">
	<input type="hidden" id="idPuesto" name="idPuesto" value="<%=(request.getAttribute("idPuesto")!=(null)?request.getAttribute("idPuesto"):"")%>">
	<input type="hidden" id="idNi" name="idNi" value="<%=(request.getAttribute("idNi")!=(null)?request.getAttribute("idNi"):"")%>">
</form>	

</body>
<form method="POST" id="linkDireccion" action="linkDireccion">
	<input type="hidden" id="linkDestino" name="linkDestino" value="">
</form>


<script>
function linkDir(link){
	document.getElementById("linkDestino").value=link;
	document.getElementById("linkDireccion").submit();
	
}
</script>

</html>