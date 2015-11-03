<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
      
    <link rel="stylesheet" href="EstilosADN/jquery-ui.css" rel="stylesheet" type="text/css"> 
    <link rel="stylesheet" href="EstilosADN/bootstrap.min.css" type="text/css"> 
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css" type='text/css'>
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">  
    <link href="EstilosADN/style.css" rel="stylesheet">
    <link href="EstilosADN/theme.css" rel="stylesheet">
    <link href="EstilosADN/ui.css" rel="stylesheet">
    <LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="EstilosADN/dis.css" type="text/css"> 
	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
	
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/indicadoresInteligentes.js"></script>
	<script src="js/calendario.js"></script>
	<script src="js/bootstrap-modal.js"></script>
    <script src="js/accounting.min.js"></script>

<title>Indicadores</title>

<%@ page import = "com.adn.controlador.IndicadorInteligente"%> 
<%@ page import = "com.adn.controlador.Prioridad"%> 
<%@ page import = "com.adn.controlador.FiltroIndicadores"%> 
<%@ page import = "com.adn.controlador.ComentarioIndInte"%>
<%@ page import = "java.util.ArrayList"%>

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
FiltroIndicadores filInd = (FiltroIndicadores) request.getAttribute("filtro");
IndicadorInteligente indInte = (IndicadorInteligente) request.getAttribute("indInt");
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
 <form method="POST" id="actualizaIndInte" action="actualizaIndInte">
<div class="contenido bodyadn-lg sombramodal">
<div class="modal-header headeradn">
       
        	<a class="close" onclick="hojaRumbo();"><i class="fa fa-times" style="color:#ff0000;"></i></a>
            <h4 class="negritas"><i class="fa fa-tachometer fa-lg" ></i> Actualización de Número Inteligente</h4>
        
  </div>
        <div class="btn-group">
  				<a class="btn btn-default m-b-0" href="#" id="btnGeneral"><i class="fa fa-pencil-square-o "></i><span style="font-size:12px;"> General</span></a>
  				<a class="btn btn-default m-b-0" href="#" id="btnComments"><i class="fa fa-comments "></i><span style="font-size:12px;"> Comentarios</span></a>
  				<a class="btn btn-default m-b-0" href="#" id="btnDetalle"><i class="fa fa-info-circle "></i><span style="font-size:12px;"> Detalles</span> </a>
  				
		   </div>
		   <div class="input-group margin-bottom-sm" style="float:right; width:50px;margin-right:10px; margin-top:5px;">
                     <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-calendar"></i></span>
                     <input type="text" id="mesBarra" value="<%=(request.getAttribute("mesBarra")!=(null))?request.getAttribute("mesBarra"): ""%>" disabled class="noeditable noventa"></td>
                </div>
 
 <!-- -------------------------------Div General---------------------------------------------------->
 <input type="hidden" name="mesHR" id="mesHR" value="<%=(request.getAttribute("mesBarra")!=(null))?request.getAttribute("mesBarra"): ""%>">
 <input type="hidden" name="claveIndInte" id="claveIndInte" value="<%=(request.getAttribute("claveIndInte")!=(null))?request.getAttribute("claveIndInte"): ""%>">
 <input type="hidden" name="rpond" id="rpond" value="<%=indInte.getRpond()%>">
 <input type="hidden" name="pesoHR" id="pesoHR" value="<%=(request.getAttribute("pesoTotal")!=(null))?request.getAttribute("pesoTotal"): "0"%>">
 <input type="hidden" name="usuSes" id="usuSes" value="<%=usuario%>">
 <input type="hidden" name="usuarioEnviado" id="usuarioEnviado" value="<%=(request.getAttribute("usuarioEnviado")!=(null))?request.getAttribute("usuarioEnviado"): ""%>">
 <input type="hidden" name="mesNum" id="mesNum" value="<%=(request.getAttribute("mesNumerico")!=(null))?request.getAttribute("mesNumerico"): ""%>">
 <input type="hidden" name="anio" id="anio" value="<%=(request.getAttribute("anio")!=(null))?request.getAttribute("anio"): ""%>">
 <input type="hidden" name="hidmeta" id="hidmeta" value="">
 <input type="hidden" name="hidresultado" id="hidresultado" value="">
 <input type="hidden" name="contComent" id="contComent" value="">
 <div id=general><!-- Div General -->      
        <div class="modal-body">
       		<table align="center">
       			<tr>
	       			<td class="textBarra negritas resalta" >
					   Nombre
					 </td>
	       			<td width=700px colspan=5>
						<input id="nombre" name="nombre" type="text" class="noeditablevista width-600 bd-6 h-30" disabled placeholder="Nombre"  value="<%=(request.getAttribute("valor")!=(null))?request.getAttribute("valor"): ""%>">
					</td>
					<td class="textBarra negritas resalta">
					   Unidad
					 </td>
	       			<td width=150px>
						<input id="unidad" name="unidad" type="text" class="noeditablevista width-100 bd-6 h-30" placeholder="Unidad" value="<%=(request.getAttribute("unidad")!=(null))?request.getAttribute("unidad"): ""%>">
					</td>
				</tr>
				<tr height=5px></tr>	
			</table>
       	</div>
        <div class="modal-body" style="border-top: 2px solid #B5B7B9;">
       		<table name="tablamaestra" class= "table table-bordered">
       			<tr>
       				<td>
       					<table width=100%>
       						<tr class="nopadding" style="height:20px;">
       							<td class="textBarra resalta nopadding" style="text-align:left;">Frecuencia</td>
       							<td class="textBarra resalta nopadding" style="text-align:left;">Tipo</td>
       							<td class="textBarra resalta nopadding width-100" style="text-align:left;">Peso</td>
       						</tr>
       						<tr>
       							<td>
							       	<div class="input-group margin-bottom-sm">
							           <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-clock-o fa-fw"></i></span>
           									<select name="frecuencia" id="frecuencia" onchange="selFrecuencia();calculaCeldas();rPond();formato();" class="form-control input-xs">
           									<option value="0">Seleccione</option>
								           <%String frec="", tipo="", pesoInd="", meta="", resultado="";
								           	if(indInte!=null && indInte.getFrecuencia()!=null && !indInte.getFrecuencia().equals("")){
								           		frec = indInte.getFrecuencia()!=null?indInte.getFrecuencia():"";
								           		tipo = indInte.getTipo()!=null?indInte.getTipo():"";
								           		pesoInd = indInte.getPeso()!=null?indInte.getPeso():"0";
								           		meta = indInte.getMeta()!=null?indInte.getMeta():"0";
								           		resultado = indInte.getResultado()!=null?indInte.getResultado():"0";
								           		if(frec.equals("Mensual")){
								           %>
									           		<option value="Mensual" selected="selected">Mensual</option>
									           <%}else{%>
									           		<option value="Mensual">Mensual</option>
									           <%}
								           		if(frec.equals("Quincenal")){
									           %>
									           		<option value="Quincenal" selected="selected">Quicenal</option>
									           <%}else{%>
									           		<option value="Quincenal">Quicenal</option>
									           <%}
								           		if(frec.equals("Semanal")){
									           %>
									           		<option value="Semanal" selected="selected">Semanal</option></Select>
									           <%}else{%>
									           		<option value="Semanal">Semanal</option></Select>
									           <%}%>
								           <%}else{%>
								        	   <option value="Mensual">Mensual</option>
									           <option value="Quincenal">Quincenal</option>
								    	       <option value="Semanal">Semanal</option></Select>
								           <%}%>
								        </div>
								</td>
       							<td>
							       	<div class="input-group margin-bottom-sm">
							           <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-bars fa-fw"></i></span>
							           <select id="tipo" name="tipo" onchange="calculaCeldas();rPond();formato();"  class="form-control input-xs" >
							           		<option value="Seleccione">Seleccione</option>
							           <%if(tipo!=null && !tipo.equals("")){
							           		if(tipo.equals("Acumulado")){
							           %>
							           			<option value="Acumulado" selected="selected">Acumulado</option>
							           		<%}else{%>
							           			<option value="Acumulado">Acumulado</option>
							           		<%}
							           		if(tipo.equals("Promedio")){%>
							           			<option value="Promedio" selected="selected">Promedio</option>
							           		<%}else{%>
							           			<option value="Promedio">Promedio</option>
							           		<%}%>
							           <%}else{%>
							           		<option value="Acumulado">Acumulado</option>
							           		<option value="Promedio">Promedio</option>
							           <%}%>
							           </Select>
							        </div>
							   </td>
        				<td>
       	 <div class="input-group margin-bottom-sm">
           <span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-compass fa-fw"></i></span>
           <input id="peso" name="peso" type="text" onkeyup="soloNumeros(this);" onblur="rPond();validaPeso()" class="form-control input-xs" placeholder="Ps" style="text-align:center" value="<%=pesoInd%>">
           <input type="hidden" id="pesoIndAnt" name="pesoIndAnt" value="<%=pesoInd%>">
        </div>
        </td>
     
       	</tr>
       	
       	</table><!-- Tabla izquierda -->
        </td>
        
        <td><!-- TD tabla maestra -->
        <table>
       	 <tr>
       	     
             <td>
       	      	<div class="noeditablevista cuadroazul">
               		<span  style="font-size:12px;  color:#FFFFFF;">Meta Final<br>
               		<input class="transparente p-t-10" type="text" placeholder="" id="meta" style="text-align:center" value="<%=meta%>"></span>
               	</div>
             </td>
             <td>
       	      	<div class="noeditablevista cuadroazul">
               		<span  style="font-size:12px;  color:#FFFFFF;">Resultado Final<br>
              		<input class="transparente p-t-10" type="text" placeholder="" id="resultado" style="text-align:center" value="<%=resultado%>"></span>
               	</div>
             </td>
             <td>
       	      	<div class="noeditablevista cuadroverde" id="cuadroCump" >
               		<span  style="font-size:12px;  color:#FFFFFF;">Cumplimiento<br>
               		<span class="negritas" style="font-size:12px;  color:#FFFFFF;"><input class="transparente p-t-10" disabled type="text" placeholder="" id="cumplimiento" style="text-align:center; width:30px; font-size:12px;" value="">%</span></span>
               	</div>
             </td>
         </tr>
        </table>   	
       	</td><!-- TD tablamaestra -->
       	</tr>
       	</table><!-- tablamaestra -->
       	
<div id="semanal"><!-- Seguimiento Semanal -->
	<table class="table table-bordered m-b-10">
	    <tr>
        	<td><!--seguimiento semanal -->
    
    <div class="row">
    <!-- Sem1 -->
     <div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 width-200 ">
    <div class="panel-header bg-adn-blue-n bd-6 tope" style="min-height:15px;"><strong>Sem1</strong></div>
      <div class="panel bd-9" style="margin-bottom:0px">
        <div class="panel-content noeditablevista widget-info2 abajo">
          <div class="row">
           
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Meta</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="progSem1" name="progSem1" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Meta" value="<%=!indInte.getProgSem1().equals("null")?indInte.getProgSem1():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Real</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="realSem1" name="realSem1" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Real" value="<%=!indInte.getResulSem1().equals("null")?indInte.getResulSem1():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left" style="padding: 0px 25px">
               <strong class="text" id="texto">Cumplimiento</strong>
               <strong class="text" id="sufijo">%</strong>
               <strong class="c-red" id="numero"> <input id="cumpSem1" name="cumpSem1"  maxlength="20" class="transparente-sm" value="">
              </strong>
            </div> 
          </div>
        </div>
      </div>
    </div> <!-- Sem1 -->
 <!-- Sem2 -->
     <div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 width-200 ">
    <div class="panel-header bg-adn-blue-n bd-6 tope" style="min-height:15px;"><strong>Sem2</strong></div>
      <div class="panel bd-9" style="margin-bottom:0px">
        <div class="panel-content noeditablevista widget-info2 abajo">
          <div class="row">
           
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Meta</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="progSem2" name="progSem2" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Meta" value="<%=!indInte.getProgSem2().equals("null")?indInte.getProgSem2():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Real</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="realSem2" name="realSem2" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Real" value="<%=!indInte.getResulSem2().equals("null")?indInte.getResulSem2():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left" style="padding: 0px 25px">
               <strong class="text" id="texto">Cumplimiento</strong>
               <strong class="text" id="sufijo">%</strong>
               <strong class="c-red" id="numero"> <input id="cumpSem2" name="cumpSem2"  maxlength="20" class="transparente-sm" value=""></strong>
            </div> 
          </div>
        </div>
      </div>
    </div> <!-- Sem2 -->
     <!-- Sem3 -->
    <div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 width-200 ">
    <div class="panel-header bg-adn-blue-n bd-6 tope" style="min-height:15px;"><strong>Sem3</strong></div>
      <div class="panel bd-9" style="margin-bottom:0px">
        <div class="panel-content noeditablevista widget-info2 abajo">
          <div class="row">
           
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Meta</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="progSem3" name="progSem3" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Meta" value="<%=!indInte.getProgSem3().equals("null")?indInte.getProgSem3():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Real</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="realSem3" name="realSem3" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Real" value="<%=!indInte.getResulSem3().equals("null")?indInte.getResulSem3():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left" style="padding: 0px 25px">
               <strong class="text" id="texto">Cumplimiento</strong>
               <strong class="text" id="sufijo">%</strong>
               <strong class="c-red" id="numero"> <input id="cumpSem3" name="cumpSem3"  maxlength="20" class="transparente-sm" value=""></strong>
            </div> 
          </div>
        </div>
      </div>
    </div> <!-- Sem3 -->
    
     <!-- Sem4 -->
    <div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 width-200 ">
    <div class="panel-header bg-adn-blue-n bd-6 tope" style="min-height:15px;"><strong>Sem4</strong></div>
      <div class="panel bd-9" style="margin-bottom:0px">
        <div class="panel-content noeditablevista widget-info2 abajo">
          <div class="row">
           
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Meta</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="progSem4" name="progSem4" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Meta" value="<%=!indInte.getProgSem4().equals("null")?indInte.getProgSem4():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Real</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="realSem4" name="realSem4" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Real" value="<%=!indInte.getResulSem4().equals("null")?indInte.getResulSem4():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left" style="padding: 0px 25px">
               <strong class="text" id="texto">Cumplimiento</strong>
               <strong class="text" id="sufijo">%</strong>
               <strong class="c-red" id="numero"> <input id="cumpSem4" name="cumpSem4"  maxlength="20" class="transparente-sm" value=""></strong>
            </div> 
          </div>
        </div>
      </div>
    </div> <!-- Sem4 -->
    
     <!-- Sem5 -->
    <div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 width-200 ">
    <div class="panel-header bg-adn-blue-n bd-6 tope" style="min-height:15px;"><strong>Sem5</strong></div>
      <div class="panel bd-9" style="margin-bottom:0px">
        <div class="panel-content noeditablevista widget-info2 abajo">
          <div class="row">
           
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Meta</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="progSem5" name="progSem5" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Meta" value="<%=!indInte.getProgSem5().equals("null")?indInte.getProgSem5():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Real</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="realSem5" name="realSem5" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Real" value="<%=!indInte.getResulSem5().equals("null")?indInte.getResulSem5():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left" style="padding: 0px 25px">
               <strong class="text" id="texto">Cumplimiento</strong>
               <strong class="text" id="sufijo">%</strong>
               <strong class="c-red" id="numero"> <input id="cumpSem5" name="cumpSem5"  maxlength="20" class="transparente-sm" value=""></strong>
            </div> 
          </div>
        </div>
      </div>
    </div> <!-- Sem5 -->
    
  </div><!--/.row m-t-10 -->
         </td>
         </tr>
         </table>
         </div><!-- Seguimiento Semanal -->
       	
<div id="quincenal" style="display:none;"><!-- Seguimiento Quincenal -->
         <table class="table table-bordered">
     
         <tr>
         <td><!--seguimiento Quincenal -->
    
    
   <div class="row">
    <!-- Quincena 1 -->
     <div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 width-200 ">
    <div class="panel-header bg-adn-blue-n bd-6 tope" style="min-height:15px;"><strong>Quincena 1</strong></div>
      <div class="panel bd-9" style="margin-bottom:0px">
        <div class="panel-content noeditablevista widget-info2 abajo">
          <div class="row">
           
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Meta</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="progQuin1" name="progQuin1" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Meta" value="<%=!indInte.getProgQuin1().equals("null")?indInte.getProgQuin1():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Real</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="realQuin1" name="realQuin1" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Real" value="<%=!indInte.getResulQuin1().equals("null")?indInte.getResulQuin1():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left" style="padding: 0px 25px">
               <strong class="text" id="texto">Cumplimiento</strong>
               <strong class="text" id="sufijo"></strong>
               <strong class="c-red" id="numero"> <input id="cumpQuin1" name="cumpQuin1"  maxlength="20" class="transparente-sm" value=""></strong>
            </div> 
          </div>
        </div>
      </div>
    </div> <!-- Quincena1 -->
    
 <!-- Quincena2 -->
     <div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 width-200 ">
    <div class="panel-header bg-adn-blue-n bd-6 tope" style="min-height:15px;"><strong>Quincena 2</strong></div>
      <div class="panel bd-9" style="margin-bottom:0px">
        <div class="panel-content noeditablevista widget-info2 abajo">
          <div class="row">
           
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Meta</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="progQuin2" name="progQuin2" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Meta" value="<%=!indInte.getProgQuin2().equals("null")?indInte.getProgQuin2():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Real</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="realQuin2" name="realQuin2" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Real" value="<%=!indInte.getResulQuin2().equals("null")?indInte.getResulQuin2():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left" style="padding: 0px 25px">
               <strong class="text" id="texto">Cumplimiento</strong>
               <strong class="text" id="sufijo">%</strong>
               <strong class="c-red" id="numero"> <input id="cumpQuin2" name="cumpQuin2"  maxlength="20" class="transparente-sm" value=""></strong>
            </div> 
          </div>
        </div>
      </div>
    </div> <!-- Quincena2 -->
    
         </td><!-- seguimiento semanal -->
         </tr>
         </table>
  </div><!-- Seguimiento Quincenal -->

<div id="mes" style="display:none"><!-- Seguimiento mensual -->
         <table class="table table-bordered">
     
         <tr>
         <td>
    
   <div class="row">
    
 <!-- MEs -->
     <div class="col-xlg-2 col-lg-3 col-md-3 col-sm-3 col-xs-12 width-200 ">
    <div class="panel-header bg-adn-blue-n bd-6 tope" style="min-height:15px;"><strong>Mes Actual</strong></div>
      <div class="panel bd-9" style="margin-bottom:0px">
        <div class="panel-content noeditablevista widget-info2 abajo">
          <div class="row">
           
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Meta</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="progMes" name="progMes" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Meta" value="<%=!indInte.getMeta().equals("null")?indInte.getMeta():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left">
               <table width=100%>
               <tr>
               <td width=50px>
                 <strong class="text" id="texto">Real</strong>
                 <strong class="text" id="sufijo"></strong>
               </td>
               <td>
               <input id="realMes" name="realMes" onblur="calculaCeldas();rPond();formato();" onkeyup="soloNumeros(this)" maxlength="20" class="form-control input-xs" type="text" placeholder="Ingrese Real" value="<%=!indInte.getResultado().equals("null")?indInte.getResultado():"0"%>">
               </td>
               <tr>
               </table>
            </div>
            <div class="left" style="padding: 0px 25px">
               <strong class="text" id="texto">Cumplimiento</strong>
               <strong class="text" id="sufijo">%</strong>
               <strong class="c-red" id="numero"> <input id="cumpMes" name="cumpMes"  maxlength="20" class="transparente-sm" value=""></strong>
            </div> 
          </div>
        </div>
      </div>
    </div> <!-- Mes -->
    </div>
         </td>
         </tr>
         </table>
  </div><!-- Seguimiento Mensual -->

       	</div><!-- Modal Body -->
 </div>     	
 <!-- --------------------------Div General------------------------------------------ -->   
 
      
 <div id=comentarios style="display:none"><!-- Div Comentarios -->      
        <div class="modal-body">
       
       		<table id="tblComentarios" name="tblComentarios" class="table table-striped table table-bordered table table-hover" style="overflow: scroll; height:100px;">

       			<th><strong>Fecha</strong></th>
       			<th><strong>Usuario</strong></th>
       			<th><strong>Comentarios</strong></th>
			    <%ArrayList<ComentarioIndInte> arrComents = (ArrayList<ComentarioIndInte>) request.getAttribute("comentarios");
			    	if(arrComents!=null && arrComents.size()>0){
			    		for(int i=0; i<arrComents.size(); i++){
			    			ComentarioIndInte coment = arrComents.get(i);
			    			String fhComent = coment.getFhComentario();
			    			String usu = coment.getUsuario();
			    			String descComen = coment.getTxComentario();
			    %>
			    <tr>
			    	<td><%=fhComent%></td><td><%=usu%></td><td><%=descComen%></td>	
			    </tr>
			    <%		}
			    	}
			    %>
			    
			</table>	       	
       	</div> 
       	<div class="modal-body">
       	<table class="table">
       	<tr>
       	<td>
       	<a onclick="agregaComent()" id="btnComentar" class="btn btn-info">Comentar</a>
       	</td>
       	<td>
       	<textarea id="descComent" name="descComent" cols="1" rows="2" maxlength="150" class="form-control" style="Width:850px"></textarea>
       	</td>
       	</tr>
       	</table>
       	</div>
       	
       	</div><!-- Div Comentarios -->
       	<!------------------------------------------Div Comentarios --------------------------------------------------------------->
       	 
       <div id="detalles" style="display:none;"><!-- Div Detalles -->      
         <div class="modal-body">
       	 <div class="panel panel-default">
          <!-- Default panel contents -->
         <div class="panel-heading">Detalles del Número Inteligente</div>

          <!-- Table -->
              <table class="table table-bordered">
              	<%String objInd="", formula="", sentido="", fueDatos="", frecEmis="", respEmis="", dist="";
              	if(filInd!=null && !filInd.equals("")){
              		objInd=filInd.getObjetivo()!=null?filInd.getObjetivo():"Sin Objetivo";
              		formula=filInd.getFormula()!=null?filInd.getFormula():"Sin Fórmula";
              		sentido=filInd.getSentido()!=null?filInd.getSentido():"Sin Sentido";
              		fueDatos=filInd.getFuenteDatos()!=null?filInd.getFuenteDatos():"Sin Fuente";
              		frecEmis=filInd.getFrecEmision()!=null?filInd.getFrecEmision():"";
              		respEmis=filInd.getRespNombre()!=null?filInd.getRespNombre():"";
              		dist=filInd.getDistribucion()!=null?filInd.getDistribucion():"";
              	}%>
                    <tr>
                        <td>Objetivo del NI</td>
                        <td><%=objInd%></td>
                    </tr>
                    <tr>
                        <td>Fórmula de Cálculo</td>
                        <td><%=formula%></td>
                    </tr>
                    
                    <tr>
                        <td>Sentido</td>
                        <td><%=sentido%></td>
                    </tr>
                    <tr>
                        <td>Fuente de Datos</td>
                        <td><%=fueDatos%></td>
                    </tr>
                    <tr>
                        <td>Frecuencia de Emisión</td>
                        <td><%=frecEmis%></td>
                    </tr>
 				    <tr>
    					<td>Responsable de Emisión</td>
    					<td><%=respEmis%></td>
  					</tr>
  					<tr>
    					<td>Distribución</td>
    					<td><%=dist%></td>
  					</tr>
  				</table>
				</div>
       			<input type="hidden" id="sentido" name="sentido" value="<%=sentido%>">
       	</div> 
       	
     	</div><!-- Div Detalles -->
       	<!------------------------------------------Div Detalles --------------------------------------------------------------->
       	      
        <div class="modal-footer" style="border-top: 2px solid #B5B7B9; padding:10px 40px 0px 0px">
        <div class="izquierda alert alert-danger" style="width:500px; display:none;" id="alerta" role="alert"></div>
         
        <div class="derecha">
        	<a onclick="valida()" id="btnGuardar" class="btn btn-success">Guardar</a>
            <a 	onclick="hojaRumbo();" id="btnRegresar" class="btn btn-danger" data-dismiss="modal">Cerrar</a>
		</div>
		</div>
</div>
</form>
<form method="POST" id="redireccion" action="CargaInterfazIndicadores">
	<input type="hidden" id="usuarioRedireccion" name="usuarioRedireccion" value="<%=(request.getAttribute("usuarioEnviado")!=(null))?request.getAttribute("usuarioEnviado"):""%>">
	<input type="hidden" id="mesEnviado" name="mesEnviado" value="<%=(request.getAttribute("mesBarra")!=(null))?request.getAttribute("mesBarra"):""%>">
	<input type="hidden" id="mesNumerico" name="mesNumerico" value="">
	<input type="hidden" id="anioSel" name="anioSel" value="<%=(request.getAttribute("anio")!=(null))?request.getAttribute("anio"):""%>">
	<input type="hidden" id="origen" name="origen" value="">
</form>
<script>
jQuery("#btnGeneral").click(function () {
	document.getElementById("general").style.display="inline";
	document.getElementById("comentarios").style.display="none";
	document.getElementById("detalles").style.display="none";
});

jQuery("#btnComments").click(function () {
	document.getElementById("general").style.display="none";
	document.getElementById("comentarios").style.display="inline";
	document.getElementById("detalles").style.display="none";
});

jQuery("#btnDetalle").click(function () {
	document.getElementById("general").style.display="none";
	document.getElementById("comentarios").style.display="none";
	document.getElementById("detalles").style.display="inline";
});
function hojaRumbo(){
	var mes = document.getElementById("mesNum").value;
	var mesNum = parseInt(mes);
	document.getElementById("mesNumerico").value=mesNum-1;  
	document.getElementById("origen").value="Otro";
	document.getElementById("redireccion").submit();
}

function formato(){
	
	var Unidad= document.getElementById("unidad").value;
	if (Unidad=="Porcentaje"){
	var Meta = accounting.formatMoney(document.getElementById("meta").value,{ symbol: "%",  format: "%v %s"});
	var Resultado = accounting.formatMoney(document.getElementById("resultado").value,{ symbol: "%",  format: "%v %s"});
	var Cump = accounting.formatNumber(document.getElementById("cumplimiento").value,1,"");
	
	}else if(Unidad=="Monto"){
		var Meta = accounting.formatMoney(document.getElementById("meta").value);
		var Resultado = accounting.formatMoney(document.getElementById("resultado").value);
		var Cump = accounting.formatNumber(document.getElementById("cumplimiento").value,1,"");		
	}
	else{
		var Meta = accounting.formatNumber(document.getElementById("meta").value,1,",");
		var Resultado = accounting.formatNumber(document.getElementById("resultado").value,1,",");
		var Cump = accounting.formatNumber(document.getElementById("cumplimiento").value,1,"");		
		
	}
	
	/*
	var pMes = accounting.formatNumber(document.getElementById("progMes").value,1,",");
	var rMes = accounting.formatNumber(document.getElementById("realMes").value,1,",");
	var pQ1 = accounting.formatNumber(document.getElementById("progQuin1").value,1,",");
	var pQ2 = accounting.formatNumber(document.getElementById("progQuin2").value,1,",");
	var pS1 = accounting.formatNumber(document.getElementById("progSem1").value,1,",");
	var pS2 = accounting.formatNumber(document.getElementById("progSem2").value,1,",");
	var pS3 = accounting.formatNumber(document.getElementById("progSem3").value,1,",");
	var pS4 = accounting.formatNumber(document.getElementById("progSem4").value,1,",");
	var pS5 = accounting.formatNumber(document.getElementById("progSem5").value,1,",");
	var rQ1 = accounting.formatNumber(document.getElementById("realQuin1").value,1,",");
	var rQ2 = accounting.formatNumber(document.getElementById("realQuin2").value,1,",");
	var rS1 = accounting.formatNumber(document.getElementById("realSem1").value,1,",");
	var rS2 = accounting.formatNumber(document.getElementById("realSem2").value,1,",");
	var rS3 = accounting.formatNumber(document.getElementById("realSem3").value,1,",");
	var rS4 = accounting.formatNumber(document.getElementById("realSem4").value,1,",");
	var rS5 = accounting.formatNumber(document.getElementById("realSem5").value,1,",");
	*/
	
	
	document.getElementById("meta").value=Meta;  
	document.getElementById("resultado").value=Resultado;
	document.getElementById("cumplimiento").value=Cump;
	
}

</script>



</body>


<script>
inicio();
formato();
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