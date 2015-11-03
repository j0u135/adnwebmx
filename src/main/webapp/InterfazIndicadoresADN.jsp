<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.util.ArrayList"%>
<%@ page import = "com.adn.controlador.IndicadorInteligente"%>
<%@ page import = "com.adn.controlador.Prioridad"%> 
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
	<script src="js/accounting.min.js"></script>

<title>Hoja de Ruta</title>

<%@ page session="true" %>
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

ArrayList<IndicadorInteligente> arrIndInte = (ArrayList<IndicadorInteligente>)request.getAttribute("indicadores");
ArrayList<String> arrPorcentaje=(ArrayList<String>) request.getAttribute("porcentajes");
ArrayList<Prioridad> arrProyectosP = (ArrayList<Prioridad>) request.getAttribute("proyectosPrio");
//System.out.println("arrPort:"+arrPorcentaje);
String porcentajeInd ="";
String porcentajeProy = "";
if(arrPorcentaje!= null){
	if(arrPorcentaje.size() >= 2){
		porcentajeInd = (arrPorcentaje.get(0)!=""?arrPorcentaje.get(0):"0"); 
		porcentajeProy =(arrPorcentaje.get(1)!=""?arrPorcentaje.get(1):"0");
	}else{
		porcentajeInd = "70";
		porcentajeProy = "30";
	}
}
%>

</head>

<body class="modulodis">

<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>
<br>
<div id="cuerpo" class="principal">	
<table width="100%"><tr><td valign="top">
	<div class="interfaz">
	<div class="barratitulo">Hoja de Ruta de : 
	<input align="center" type="text" class="noeditable" style="width:55%; text-align:center; margin:0px 0px 0px 10px; background-color:#1678B5;" placeholder="" disabled="" id="" value="<%=(request.getAttribute("usuarioEnviado")!=(null))?request.getAttribute("usuarioEnviado"): ""%>"></div>
	
		<div class="barraopciones" style="padding: 0px 0px 20px 20px">
			<input type="hidden" id="hidden1" value="<%=(request.getAttribute("variableEnviada")!=(null))?request.getAttribute("variableEnviada"): ""%>">
			<input type="hidden" id="usuEnviado" value="<%=(request.getAttribute("usuarioEnviado")!=(null))?request.getAttribute("usuarioEnviado"): ""%>">
			<input type="hidden" id="hiddenOrigen" value="<%=(request.getAttribute("origen")!=(null))?request.getAttribute("origen"): ""%>">
			<input type="hidden" id="hiddenMesAno" value="">
			<table width="100%" align="center" id="tablabarra">
			<tbody>
				<tr>
					<td class="nopadding">A&ntilde;o</td>
					<td class="nopadding"><select id="cbAnio" class="form-control noventa" style="width: 70px; padding: 2px 2px 2px 2px" value="<%=(request.getAttribute("anio")!=(null))?request.getAttribute("anio"): ""%>" onchange="llenaCbMes()"></select></td>
					<td class="nopadding">Mes</td>
					<td class="nopadding"><select id="comboSelectMes" class="form-control porcentaje" style="width: 70px; padding: 2px 2px 2px 2px" onchange="cambiaOrigen();" value="<%=(request.getAttribute("mesEnviado")!=(null))?request.getAttribute("mesEnviado"): ""%>" disabled="disabled"></select></td>
					<td class="nopadding"> <input type="text" id="ponderacionFinal" value="" disabled class="noeditable verde porcentaje negritas" style="width:80px; display:none;">
					<table>
					<tr>
					<td class="nopadding">Peso Total:</td>
					<td >
					<div id="bar-1" class="bar-main-container red" > 
											<div class="wrap">
												<div class="bar-percentage" id="barrapesoTotal" data-percentage=""></div>
												<div class="bar-container">
													<div class="bar" style="width: 85%;"></div>
												</div>
											</div>
										</div>
					</td>
					</tr>
					</table>
					</td>
					<td class="nopadding"> <input type="text" id="resultadoFinal" value=""  disabled class="negritas noeditable" style="display:none">
					<table>
					<tr>
					<td class="nopadding">Desempeño</td>
					<td class="nopadding">
					<div id="bar-2" class="bar-main-container emerald">
											<div class="wrap"><div class="bar-percentage" id="barraResultado" data-percentage=""></div>
												<div class="bar-container">
													<div class="bar" style="width: 85%;"></div>
												</div>
											</div>
										</div>
					</td>
					</tr>
					</table>
					</td>
				    
				    <td>
         	        <%if(!tipo.equals("Usr")){%>
         	         <a class="boton grafica" onclick="reportes();">
								<i class="fa fa-file-text"></i>
							</a>
					<%}%>
					<a class="boton grafica" onclick="controlAprob();">
								<i class="fa fa-check-circle"></i>
							</a>		
         	         </td>
				    
				    
					<td class="nopadding">	<a align="rigth" title="Guardar" alt="Guardar">
							<img src="ImagenesADN/guardar.png" id="botonGuardar" onclick="guardarHojaRumbo()" width="27px" height="30px">
						</a></td>
				</tr>
			</tbody>
			</table>
	
		</div>
		
			<table><tr><td></td></tr></table>
			<br>
			<table id="indicadoresheader" class="containernuevo tope" width="1134px" align="left">
				<tbody>
					<tr>
						<td>
							<a class="boton" id="botonAlta"  onclick="direccionarAltaInd('alta')">
								<i class="fa fa-plus"></i>
							</a> 
							<a class="boton" id="botonActualiza"  onclick="direccionarAltaInd('update')">
								<i class="fa fa-pencil"></i>
							</a> 
							<a class="boton" id="botonElimina"  onclick="borrarIndicadorInteligente()">
								<i class="fa fa-times"></i>
							</a>
							<a class="boton grafica" onclick="graficaIndicador();">
								<i class="fa fa-bar-chart"></i>
							</a>
						</td>
						<td align="center"><h3></h3></td>
						<td>
							<span class="titulo">Tabla de Indicadores Inteligentes</span>
						</td>
						<td align="right"> 
						 <span style="font-size:10px">Resultado NI's:</span><input align="center" type="text" class="noeditable porcentajeDos" maxlength="3" placeholder="" id="resInd" value="" style="margin: 0px 0px 0px 5px">
						</td>
						<td align="right"> 
						 <span style="font-size:10px">Suma del peso:</span><input align="center" type="text" class="noeditable porcentajeDos" maxlength="3" placeholder="" id="porcentaje100Ind" value="" style="margin: 0px 0px 0px 5px">
						</td>
						<td align="right">
							<a class="boton flechas" id="antIndicador" style="display:none" onclick="anteriorInd();" >
							</a> 
								<i class="fa fa-caret-left"></i>
							<a class="boton flechas" id="sigIndicador" style="display:none" onclick="siguienteInd();">
								<i class="fa fa-caret-right" ></i>
							</a>
							<a id="botonContraer" class="boton flechas" onclick="contraerInd();" >
								<i class="fa fa-sort"></i>
							</a>
							<a id="botonExpandir" class="boton flechas" onclick="contraerInd();"  style="display:none">
								<i class="fa fa-sort"></i>
							</a>
						</td>
				
					</tr>
				</tbody>
			</table>
			<table id="tablaIndicadoresCarga" style="display:inline">
				<tr>
					<td>
						<table id="indicadorestabla" class="abajo" width="1130" align="left">
							<tbody>							
								<tr >
									<th colspan=""><input align="center" type="text" class="form-control porcentajeDos"  maxlength="3" placeholder="" id="porcentajeInd" value="<%=porcentajeInd%>"></th>
									<th class="" colspan="">Nombre del NI</th>
									<th>Unidad</th>
									<th>Meta</th>
									<th>Resultado</th>
									<th class="">Peso</th>
									<th >Ponderado</th>
									<th >Porcentaje</th>
									<th >Sentido</th>
								</tr>
								
								<%
									Object oMes=request.getAttribute("mesNumerico");
									int mesNumerico=0, contador=0, lon=0;
									if(oMes!=null){
										mesNumerico=Integer.parseInt(oMes.toString());	
									};	
									if(arrIndInte!=null){
										
										lon = arrIndInte.size();

										for(int i=0; i<lon;i++){
											IndicadorInteligente indInt = arrIndInte.get(i);
											String metaA="0", resultadoA="0", rpondInd="0", peso="0";
											String nombre="";
											String unidad="";
											String datosAnualIndicador="";
											String idIndInte="";
											String estatus="";
											String sentido="";
											
											nombre=indInt.getNombre();
											unidad=indInt.getUnidad();
											peso = !indInt.getPeso().equals("null")?indInt.getPeso():"0";
											metaA = !indInt.getMeta().equals("null")?indInt.getMeta():"0";
											resultadoA = !indInt.getResultado().equals("null")?indInt.getResultado():"0";
											rpondInd = !indInt.getRpond().equals("null")?indInt.getRpond():"0";
											idIndInte = indInt.getIdIndInte()+"";
											estatus = indInt.getEstatus();
											sentido = indInt.getSentido();
											contador++;
											
											String datGraf="0|0", datGra1="0|0", datGra2="0|0", datGra3="0-0";
											String datGra4="0|0",datGra5="0|0",datGra6="0|0", datGra7="0|0",datGra8="0|0",datGra9="0|0", datGra10="0|0",datGra11="0|0";
											if(indInt.getMetaEne()!=null && indInt.getMetaEne()!=""){
												if(indInt.getResEne()!=null && indInt.getResEne()!=""){
													datGraf=indInt.getMetaEne()+"|"+indInt.getResEne();	
												}else{
													datGraf=indInt.getMetaEne()+"|0";
												}
												
											}
											if(indInt.getMetaFeb()!=null && indInt.getMetaFeb()!=""){
												if(indInt.getResFeb()!=null && indInt.getResFeb()!=""){
													datGra1 =indInt.getMetaFeb()+"|"+indInt.getResFeb();	
												}else{
													datGra1=indInt.getMetaFeb()+"|0";
												}
												
											}
											if(indInt.getMetaMar()!=null && indInt.getMetaMar()!=""){
												if(indInt.getResMar()!=null && indInt.getResMar()!=""){
													datGra2 = indInt.getMetaMar()+"|"+indInt.getResMar();	
												}else{
													datGra2 = indInt.getMetaMar()+"|0";
												}
											}
											if(indInt.getMetaAbr()!=null && indInt.getMetaAbr()!=""){
												if(indInt.getResAbr()!=null && indInt.getResAbr()!=""){
													datGra3 = indInt.getMetaAbr()+"|"+indInt.getResAbr();	
												}else{
													datGra3 = indInt.getMetaAbr()+"|0";
												}
											}
											if(indInt.getMetaMay()!=null && indInt.getMetaMay()!=""){
												if(indInt.getResMay()!=null && indInt.getResMay()!=""){
													datGra4 = indInt.getMetaMay()+"|"+indInt.getResMay();	
												}else{
													datGra4 = indInt.getMetaMay()+"|0";
												}
											}
											if(indInt.getMetaJun()!=null && indInt.getMetaJun()!=""){
												if(indInt.getResJun()!=null && indInt.getResJun()!=""){
													datGra5 = indInt.getMetaJun()+"|"+indInt.getResJun();	
												}else{
													datGra5 = indInt.getMetaJun()+"|0";
												}
											}
											if(indInt.getMetaJul()!=null && indInt.getMetaJul()!=""){
												if(indInt.getResJul()!=null && indInt.getResJul()!=""){
													datGra6 = indInt.getMetaJul()+"|"+indInt.getResJul();	
												}else{
													datGra6 = indInt.getMetaJul()+"|0";
												}
											}
											if(indInt.getMetaAgo()!=null && indInt.getMetaAgo()!=""){
												if(indInt.getResAgo()!=null && indInt.getResAgo()!=""){
													datGra7 = indInt.getMetaAgo()+"|"+indInt.getResAgo();	
												}else{
													datGra7 = indInt.getMetaAgo()+"|0";
												}
											}
											if(indInt.getMetaSep()!=null && indInt.getMetaSep()!=""){
												if(indInt.getResSep()!=null && indInt.getResSep()!=""){
													datGra8 = indInt.getMetaSep()+"|"+indInt.getResSep();	
												}else{
													datGra8 = indInt.getMetaSep()+"|0";
												}
												
											}
											if(indInt.getMetaOct()!=null && indInt.getMetaOct()!=""){
												if(indInt.getResOct()!=null && indInt.getResOct()!=""){
													datGra9 = indInt.getMetaOct()+"|"+indInt.getResOct();	
												}else{
													datGra9 = indInt.getMetaOct()+"|0";
												}
											}
											if(indInt.getMetaNov()!=null && indInt.getMetaNov()!=""){
												if(indInt.getResNov()!=null && indInt.getResNov()!=""){
													datGra10 = indInt.getMetaNov()+"|"+indInt.getResNov();	
												}else{
													datGra10 = indInt.getMetaNov()+"|0";
												}
											}
											if(indInt.getMetaDic()!=null && indInt.getMetaDic()!=""){
												if(indInt.getResDic()!=null && indInt.getResDic()!=""){
													datGra11 = indInt.getMetaDic()+"|"+indInt.getResDic();	
												}else{
													datGra11 = indInt.getMetaDic()+"|0";
												}
											}
											
											//System.out.println(datGraf);
											datosAnualIndicador=datGraf+"-"+datGra1+"-"+datGra2+"-"+datGra3+"-"+datGra4+"-"+datGra5+"-"+datGra6+"-"+datGra7+"-"+datGra8+"-"+datGra9+"-"+datGra10+"-"+datGra11;
											//String datosAnualIndicador= "0"+"-"+"0"+"-"+"0"+"-"+"0"+"-"+"0"+"-"+"0"+"-"+"0"+"-"+"0"+"-"+"0"+"-"+"0"+"-"+"0"+"-"+"0";
											System.out.println(datosAnualIndicador);
									if(estatus.equals("activo")){
								%>
								
								<tr id="tr<%=contador %>">
									<td align="center" >
										<input type="checkbox" id="checkbox-2-<%=contador %>" class="regular-checkbox">
										<label for="checkbox-2-<%=contador %>"></label>
										<input type="hidden" id="datosAnualIndicador<%=contador %>" value="<%=datosAnualIndicador %>">
										<input type="hidden" id="rpondInd<%=contador%>"  value="<%=rpondInd%>">
										<input type="hidden" id="idIndInte<%=contador%>" value="<%=idIndInte%>">
										<input type="hidden" id="sentido<%=contador%>" value="<%=sentido%>">
										<input type="hidden" id="numInd" value="<%=lon%>">
									</td>
									<td>
										<input  type="text" class="noeditablevista" style="width:500px" placeholder="" disabled id="nombre<%=contador %>" value="<%=nombre%>">
									</td>
									<td>
										<input type="text" class="noeditablevista noventa" style="font-size:11px;" disabled id="unidad<%=contador %>" value="<%=unidad%>">
									</td>
									<td>
										<input align="center" type="text" class="noeditablevista porcentaje" style="width:110px;" placeholder="" disabled id="meta<%=contador %>" value="<%=metaA%>">
									</td>
									<td>
										<input type="text" class="noeditablevista porcentaje" style="width:110px;" placeholder="" disabled id="resultado<%=contador %>" value="<%=resultadoA%>">
									</td>
									<td>
										<input type="text" class="noeditablevista noventa " placeholder="" disabled id="pesoInd<%=contador %>"  value="<%=peso%>">
									</td>
									<td>
									    <input type="text" class="noeditablevista noventa" placeholder="" id="rPond<%=contador %>"  value="<%=rpondInd%>">
									</td>
									<td>
										<input type="text" class="noeditablevista noventa" placeholder="" disabled id="porcen<%=contador %>"  value="">
										
									</td>
									<td>
									    <i id="flechaInd<%=contador %>" ></i>
									</td>
								</tr>
								
								<%	}else{
										contador--;
									}
									}	//Termina for de indicadores										
									}else if(contador==0){
								%>
								<tr>
									<td align="center">
										<input type="checkbox" id="checkbox-2-1" disabled class="regular-checkbox">
										<label for="checkbox-2-1"></label>
									</td>
									<td>
										<input type="text" class="form-control" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control noventa" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje amarillo" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="" id="pesoInd1">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="" id="">
									</td>
								</tr>
								<tr>
									<td align="center">
										<input type="checkbox" id="checkbox-2-2" disabled class="regular-checkbox">
										<label for="checkbox-2-1"></label>
									</td>
									<td>
										<input type="text" class="form-control" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control noventa" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje amarillo" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="" id="pesoInd1">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="" id="">
									</td>
								</tr>
								<tr>
									<td align="center">
										<input type="checkbox" id="checkbox-2-3" disabled class="regular-checkbox">
										<label for="checkbox-2-1"></label>
									</td>
									<td>
										<input type="text" class="form-control" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control noventa" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje amarillo" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="" id="pesoInd1">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="" id="">
									</td>
								</tr>
								<tr>
									<td align="center">
										<input type="checkbox" id="checkbox-2-4" disabled class="regular-checkbox">
										<label for="checkbox-2-1"></label>
									</td>
									<td>
										<input type="text" class="form-control" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control noventa" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje amarillo" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="" id="pesoInd1">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="" id="">
									</td>
								</tr>
								<tr>
									<td align="center">
										<input type="checkbox" id="checkbox-2-5" disabled class="regular-checkbox">
										<label for="checkbox-2-1"></label>
									</td>
									<td>
										<input type="text" class="form-control" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control noventa" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje amarillo" disabled placeholder="">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="" id="pesoInd1">
									</td>
									<td>
										<input type="text" class="form-control porcentaje" disabled placeholder="" id="">
									</td>
								</tr>
								<%}%>
							</tbody>
						</table>
						<table class="ponderacion" width="1020" align="left" style="display:none">
							<tbody>
								<tr>
									<input type="hidden" id="hiddenElementos" value="<%=contador %>">
									
							<td>  <div  id= "cuadroPondera" class=" sombra" align="center">
										<span class="textoponderacion">Ponderación</span> 
										<span class="porcentajeponderacion" id="ponderacionIndicador" ></span>
										</div>
									</td>
									<td width="930px"></td>
									<td>
										
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>
			<table>
			<tr>
			<td>
			<div id="containergrafica" class="areagrafica" style="width:1020px; height:390px; display:none;"> 
			<img src="ImagenesADN/cerrar.png" align="left" id="botonQuitarInd" onclick="quitaGraficaInd()">
			<label align="center" value="" id="label1" class="titulodivs">Cumplimiento de Números Inteligentes</label>
			<div id="indicadorGrafica" style="height:350px; width:1000px"></div>
			</div>
			</td>
			</tr>
			</table>
			<table id="proyectosheader" class="containernuevo tope" width="1134px" align="left">
				<tbody>
					<tr>
						<td>
							<a class="boton" id="botonAltaP" onclick="direccionarAltaProy('alta')">
								<i class="fa fa-plus"></i>
							</a> 
							<a class="boton" id="botonUpdateP" onclick="direccionarAltaProy('update')">
								<i class="fa fa-pencil"></i>
							</a> 
							<a class="boton" id="botonEliminaP" onclick="direccionarAltaProy('baja')">
								<i class="fa fa-times"></i>
							</a>
							<a class="boton grafica" onclick="graficaProyecto();">
								<i class="fa fa-bar-chart"></i>
							</a>
						</td>
						<td align="center">
							<h3></h3>
						</td>
						<td><span class="titulo">Tabla de Prioridades</span></td>
						<td align="right"> 
						 <span style="font-size:10px">Resultado Prioridades:</span><input align="center" type="text" class="noeditable porcentajeDos" maxlength="3" placeholder="" id="resP" value="" style="margin: 0px 0px 0px 5px">
						</td>
						<td align="right"> 
						 <span style="font-size:10px">Suma del peso:</span><input align="center" type="text" class="noeditable porcentajeDos" maxlength="3" placeholder="" id="porcentaje100Proy" value="" style="margin: 0px 0px 0px 5px">
						</td>
						<td align="right">
							<a class="boton flechas" id="antProyecto" style="display:none" onclick="anteriorProy();">
								<i class="fa fa-caret-left" ></i>
							</a> 
							<a class="boton flechas" id="sigProyecto" style="display:none" onclick="siguienteProy();">
								<i class="fa fa-caret-right" ></i>
							</a>
							<a id="botonContraer1" class="boton flechas" onclick="contraerProy();">
								<i class="fa fa-sort"></i>
							</a>
							<a id="botonExpandir1" class="boton flechas" onclick="contraerProy();"  style="display:none">
								<i class="fa fa-sort"></i>
							</a>
						</td>
					</tr>
				</tbody>
			</table>
			<table id="tablaProyectosCarga" style="display:inline" align="left">
				<tr>
					<td>
						<table id="proyectostabla" class="abajo" width="1130px">
							<tbody>
								<tr>
									<th colspan=""><input align="center" type="text" class="form-control porcentajeDos" maxlength="3" placeholder="" id="porcentajeProy"  value="<%=porcentajeProy%>"></th>
									<th class="" colspan="">Nombre de la Prioridad</th>
									<th>Unidad</th>
									<th>Fecha Fin</th>
									
									<th>Meta</th>
									<th>Real</th>
									<th>Peso</th>
									<th>Ponderado</th>
									<th>Porcentaje</th>
									<th>Sentido</th>
								</tr>
								
									<%
									String nombreP="", unidadP="", fechaP="", idPrio="", pesoP="", resultadosP="", programadosP="", inicialP="", mesInicial="", inicial="0", fhInicio="";
									int contadorP=0;
									String[] resultadosAnual= new String[12];
									String[] planeadosAnual= new String[12];
									String[] inicioAnual= new String[12];
									String mesNum =(String)request.getAttribute("mesNumerico");
									System.out.println("Mes numerico jsp: "+mesNumerico);
									if(arrProyectosP!=null){
										for(int o=0; o<arrProyectosP.size();o++){
											Prioridad proyPrio = arrProyectosP.get(o);
											nombreP=proyPrio.getNombre();
											unidadP=proyPrio.getUnidad();
											fechaP=proyPrio.getFhFin();
											pesoP=proyPrio.getPeso();
											fhInicio=proyPrio.getFhInicio();
											idPrio=proyPrio.getIdPrioridad()+"";
											String[] arrFhInicio = fhInicio.split("/");
											mesInicial = arrFhInicio[0]!=""?arrFhInicio[0]:"";
											inicial ="0";
																						
											resultadosAnual[0]=proyPrio.getResEne()!=(null)?proyPrio.getResEne():"0";
											resultadosAnual[1]=proyPrio.getResFeb()!=(null)?proyPrio.getResFeb():"0";
											resultadosAnual[2]=proyPrio.getResMar()!=(null)?proyPrio.getResMar():"0";
											resultadosAnual[3]=proyPrio.getResAbr()!=(null)?proyPrio.getResAbr():"0";
											resultadosAnual[4]=proyPrio.getResMay()!=(null)?proyPrio.getResMay():"0";
											resultadosAnual[5]=proyPrio.getResJun()!=(null)?proyPrio.getResJun():"0";
											resultadosAnual[6]=proyPrio.getResJul()!=(null)?proyPrio.getResJul():"0";
											resultadosAnual[7]=proyPrio.getResAgo()!=(null)?proyPrio.getResAgo():"0";
											resultadosAnual[8]=proyPrio.getResSep()!=(null)?proyPrio.getResSep():"0";
											resultadosAnual[9]=proyPrio.getResOct()!=(null)?proyPrio.getResOct():"0";
											resultadosAnual[10]=proyPrio.getResNov()!=(null)?proyPrio.getResNov():"0";
											resultadosAnual[11]=proyPrio.getResDic()!=(null)?proyPrio.getResDic():"0";
			
											planeadosAnual[0]=proyPrio.getMetaEne()!=(null)?proyPrio.getMetaEne():"0";
											planeadosAnual[1]=proyPrio.getMetaFeb()!=(null)?proyPrio.getMetaFeb():"0";
											planeadosAnual[2]=proyPrio.getMetaMar()!=(null)?proyPrio.getMetaMar():"0";
											planeadosAnual[3]=proyPrio.getMetaAbr()!=(null)?proyPrio.getMetaAbr():"0";
											planeadosAnual[4]=proyPrio.getMetaMay()!=(null)?proyPrio.getMetaMay():"0";
											planeadosAnual[5]=proyPrio.getMetaJun()!=(null)?proyPrio.getMetaJun():"0";
											planeadosAnual[6]=proyPrio.getMetaJul()!=(null)?proyPrio.getMetaJul():"0";
											planeadosAnual[7]=proyPrio.getMetaAgo()!=(null)?proyPrio.getMetaAgo():"0";
											planeadosAnual[8]=proyPrio.getMetaSep()!=(null)?proyPrio.getMetaSep():"0";
											planeadosAnual[9]=proyPrio.getMetaOct()!=(null)?proyPrio.getMetaOct():"0";
											planeadosAnual[10]=proyPrio.getMetaNov()!=(null)?proyPrio.getMetaNov():"0";
											planeadosAnual[11]=proyPrio.getMetaDic()!=(null)?proyPrio.getMetaDic():"0";
											
											inicioAnual[0]=proyPrio.getIniEne()!=(null)?proyPrio.getIniEne():"0";
											inicioAnual[1]=proyPrio.getIniFeb()!=(null)?proyPrio.getIniFeb():"0";
											inicioAnual[2]=proyPrio.getIniMar()!=(null)?proyPrio.getIniMar():"0";
											inicioAnual[3]=proyPrio.getIniAbr()!=(null)?proyPrio.getIniAbr():"0";
											inicioAnual[4]=proyPrio.getIniMay()!=(null)?proyPrio.getIniMay():"0";
											inicioAnual[5]=proyPrio.getIniJun()!=(null)?proyPrio.getIniJun():"0";
											inicioAnual[6]=proyPrio.getIniJul()!=(null)?proyPrio.getIniJul():"0";
											inicioAnual[7]=proyPrio.getIniAgo()!=(null)?proyPrio.getIniAgo():"0";
											inicioAnual[8]=proyPrio.getIniSep()!=(null)?proyPrio.getIniSep():"0";
											inicioAnual[9]=proyPrio.getIniOct()!=(null)?proyPrio.getIniOct():"0";
											inicioAnual[10]=proyPrio.getIniNov()!=(null)?proyPrio.getIniNov():"0";
											inicioAnual[11]=proyPrio.getIniDic()!=(null)?proyPrio.getIniDic():"0";
													
											
											resultadosP=resultadosAnual[0]+"-"+resultadosAnual[1]+"-"+resultadosAnual[2]+"-"+resultadosAnual[3]+"-"+resultadosAnual[4]+"-"+resultadosAnual[5]+"-"+resultadosAnual[6]+"-"+resultadosAnual[7]+"-"+resultadosAnual[8]+"-"+resultadosAnual[9]+"-"+resultadosAnual[10]+"-"+resultadosAnual[11];
											programadosP=planeadosAnual[0]+"-"+planeadosAnual[1]+"-"+planeadosAnual[2]+"-"+planeadosAnual[3]+"-"+planeadosAnual[4]+"-"+planeadosAnual[5]+"-"+planeadosAnual[6]+"-"+planeadosAnual[7]+"-"+planeadosAnual[8]+"-"+planeadosAnual[9]+"-"+planeadosAnual[10]+"-"+planeadosAnual[11];
											
											if(mesInicial != ""){
												int mesIni = Integer.parseInt(mesInicial)-1;
												int mesNu = Integer.parseInt(mesNum);
												//System.out.println("Mes inicial: "+mesIni + " Mes actual: " +mesNu);
												if(mesIni==0){
													inicial ="0";
												}else if(mesIni == mesNu){
													inicial ="0";
												}else if(mesNu > mesIni && mesNu>0){
													mesNu = mesNu-1;
													inicial = resultadosAnual[mesNu];
												}else if(mesNu < mesIni && mesNu>0){
													mesNu = mesNu-1;
													inicial = resultadosAnual[mesNu];
												}else if(mesNu < mesIni && mesNu==0){
													mesNu = 12; //Encaso de que el mes actual sea Enero y el inicial el año pasado
													inicial = resultadosAnual[mesNu];
												}
												//System.out.println("valor inicial: "+inicial + " Mes actual: " +mesNu);
												//System.out.println("----------------");
											}
											
											contadorP++;	
								
									%>
									<tr id="trP<%=contadorP %>">
										<td align="center">
											<input type="checkbox" id="checkbox-3-<%=contadorP %>" class="regular-checkbox">
											<label for="checkbox-3-<%=contadorP %>"></label>
											<input type="hidden" id="resultadosAnualP<%=contadorP %>" value="<%=resultadosP %>">
											<input type="hidden" id="programadosAnualP<%=contadorP %>" value="<%=programadosP %>">
											<input type="hidden" id="cveIdProy<%=contadorP %>" value="<%=idPrio%>">
										</td>
										<td>
											<input type="text" class="noeditablevista" style="width:500px" disabled id="nombreP<%=contadorP %>" value="<%=nombreP %>" placeholder="">
										</td>
									<td>
											<input type="text" class="noeditablevista noventa" style="font-size:11px;" disabled id="unidadP<%=contadorP %>" value="<%=unidadP %>" placeholder="">
										</td>
										<td>
											<input type="text" class="noeditablevista fecha" disabled id="fechaP<%=contadorP %>" value="<%=fechaP %>" placeholder="">
										</td>
										
										<td>
											<input type="hidden" class="noeditablevista noventa" disabled id="inicialP<%=contadorP %>" value="<%=inicioAnual[mesNumerico]%>">
											<input type="text" class="noeditablevista noventa" disabled id="programadoP<%=contadorP %>" value="<%=planeadosAnual[mesNumerico] %>" placeholder="">
										</td>
										<td>
											<input type="text" class="noeditablevista noventa" disabled id="realP<%=contadorP %>" value="<%=resultadosAnual[mesNumerico] %>" placeholder="">
										</td>
										<td>
											<input type="text" class="noeditablevista noventa" disabled placeholder="" id="pesoProy<%=contadorP %>" value="<%=pesoP %>">
										</td>
										<td>
											<input type="text" class="noeditablevista noventa" disabled placeholder="" id="RpondProy<%=contadorP %>" value="">
										</td>
										<td>
											<input type="text" class="noeditablevista noventa" disabled placeholder="" id="PorcentajeProy<%=contadorP %>" value="">
										</td>
									    <td>
											<i id="flechaP<%=contadorP %>" ></i>
										</td>
									</tr>
									
									<%			
									}
									}
									
									%>
								
							</tbody>
						</table>
						
						<table class="ponderacion" width="1150" align="left" style="display:none">
							<tbody>
								<tr>
								
									<input type="hidden" id="hiddenElementosProy" value="<%=contadorP %>">
								  	
									<td> <div  id= "cuadroPondera" class=" sombra" align="center">
									  	<span class="textoponderacion">Ponderación</span> 
										<span class="porcentajeponderacion" id="ponderacionProyecto"></span>
									
									</div>
									</td>
									<td width="970px"></td>
									<td>
										
									</td>
								</tr>
							</tbody>
						</table>
							
					</td>
				</tr>
			</table>
			
			<table>
			<tr>
			<td>
		     <div id="containerproyectos" class="areagrafica" style="width:1020px; height:390px; display:none; ">
			<img src="ImagenesADN/cerrar.png" align="left" id="botonQuitarProy" onclick="quitaGraficaProy()">
			<label align="center" value="" id="label1" class="titulodivs">Cumplimiento de Prioridades</label>
			<div id="proyectosGrafica" style="width:1000px; height:350px"></div>
			
			</div>	
			
			</td>
			</tr>
			</table>
						
			
			<table id="tablaProyectosAlta" style="display:none">
				<tr>
					<td>
						<table id="proyectostabla" width="1000px">
							<tbody>
								<tr onclick="algo()">
									<th  colspan="2">Nombre</th>
									<th>Unidad</th>
									<th>Entrega</th>
									<th>Inicial</th>
									<th>Meta</th>
									<th>Avance</th>
									<th>Peso</th>
								</tr>
								<tr>
									<td align="center"><input type="checkbox" id="checkbox-3-1" class="regular-checkbox"><label for="checkbox-3-1"></label></td>
									<td><input type="text" class="form-control" placeholder=""></td>
									<td><input type="text" class="form-control noventa" placeholder=""></td>
									<td><input type="text" class="form-control fecha" placeholder=""></td>
									<td><input type="text" class="form-control noventa" placeholder=""></td>
									<td><input type="text" class="form-control noventa" placeholder=""></td>
									<td><input type="text" class="form-control noventa amarillo" placeholder=""></td>
									<td><input type="text" class="form-control noventa" placeholder=""></td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</table>	
			
			
			
		</div>
		
		</td>
		<td>
		</td>
		<td width="73px" align="center" valign="top">
			
            <table width="100%"  class="sidebar" style="height:150px !important;" border="0">
                
				
				<tr>
					<td align="center">
						<a href=#><img src="ImagenesADN/Aprobaciones.png" title="Aprobaciones" width="30" height="30" alt="Aprobaciones" onclick="controlAprob()">
					    </a>
					Resumen de Aprobación</td>
				</tr>
				<tr>
					<td align="center">
					<a href=#><img src="ImagenesADN/Reportes.png" title="Reportes" width="30" height="35" alt="Reportes" onclick="linkDir('DSHR.jsp')">
					</a>
					Reportes desempeño</td>
				    
				</tr>
				
			</table>       
		</td>
	</tr>
</table>
		</br>
		</br>
		</br>
	
<div class="loader-overlay">
      <div class="spinner">
        <div class="bounce1"></div>
        <div class="bounce2"></div>
        <div class="bounce3"></div>
      </div>
    </div>
</div>

<div id="pie" align="center">
  		<frame name="pie" id="pie"> 
			<jsp:include page="Footer.jsp"></jsp:include>
		 </frame>
</div>

<form method="POST" id="redireccion" action="servletRedireccion">
	<input type="hidden" id="hiddenRedireccion" name="hiddenRedireccion" value="">
	<input type="hidden" id="hiddenDestino" name="hiddenDestino" value="">
	<input type="hidden" id="usuarioRedireccion" name="usuarioRedireccion" value="">
	<input type="hidden" id="mesEnviado" name="mesEnviado" value="<%=(request.getAttribute("mesEnviado")!=(null))?request.getAttribute("mesEnviado"): ""%>">
	<input type="hidden" id="mesNumerico" name="mesNumerico" value="<%=(request.getAttribute("mesNumerico")!=(null))?request.getAttribute("mesNumerico"): ""%>">
	<input type="hidden" id="origen" name="origen" value="">
	<input type="hidden" id="usuarioHR" name="usuarioHR" value="<%=usuario%>">
	<input type="hidden" id="pesoTotal" name="pesoTotal" value="">
	<input type="hidden" id="desMensual" name="desMensual" value="">
	<input type="hidden" id="mesBarra" name="mesBarra" value="<%=(request.getAttribute("mesEnviado")!=(null))?request.getAttribute("mesEnviado"): ""%>">
	<input type="hidden" id="anioSel" name="anioSel" value="<%=(request.getAttribute("anio")!=(null))?request.getAttribute("anio"): ""%>">
	<input type="hidden" id="puesto" name="puesto" value="<%=puesto%>">
	<input type="hidden" id="numIndTot" name="numIndTot" value="<%=lon%>">
	<input type="hidden" id="contador" name="contador" value="<%=contador%>">
	<input type="hidden" id="cvePrio" name="cvePrio" value="">
	<input type="hidden" id="cveIndInte" name="cveIndInte" value="">
	<input type="hidden" id="peso" name="peso" value="">
</form>
<form method="POST" id="guardarHojaRumbo" action="guardarHojaRumbo">
	<input type="hidden" id="usuarioHojaRumbo" name="usuarioHojaRumbo" value="">
	<input type="hidden" id="solicitudHR" name="solicitudHR" value="">
	<input type="hidden" id="mesHR" name="mesHR" value="">
	<input type="hidden" id="mesEnviado1" name="mesEnviado1" value="<%=(request.getAttribute("mesEnviado")!=(null))?request.getAttribute("mesEnviado"): ""%>">
	<input type="hidden" id="resultadoHR" name="resultadoHR" value="">
	<input type="hidden" id="anioHR" name="anioHR" value="">
	<input type="hidden" id="porInd" name="porInd" value="">
	<input type="hidden" id="porProy" name="porProy" value="">
	<input type="hidden" id="mesNumerico1" name="mesNumerico1" value="<%=(request.getAttribute("mesNumerico")!=(null))?request.getAttribute("mesNumerico"): ""%>">
</form>
<form method="POST" id="ControlAprobaciones" action="ControlAprobaciones">
	<input type="hidden" id="usuHojaRumbo" name="usuHojaRumbo" value="<%=usuario%>">
</form>
<form method="POST" id="linkDireccion" action="linkDireccion">
	<input type="hidden" id="linkDestino" name="linkDestino" value="">
</form>

<form method="POST" id="ExportarDatos" action="ExportarDatos">
	<input type="hidden" id="usuarioReportes" name="usuarioReportes" value="">
    <input type="hidden" id="mesActual" name="mesActual" value=""> 
</form>

<script>
function formato(){
	
	var num= document.getElementById("numInd").value;
	var arrMetaInd=[0,0,0,0,0];
    var arrResInd=[0,0,0,0,0];
    
    //Formato a la lista de indicadores
	
    for(var i=1; i<=num;i++){
    	//asigna formato segun sentido la Unidad de Medida
    var unidad=document.getElementById("unidad"+i).value;
		
    	if(unidad=="Porcentaje")
    	{
    		
    		arrMetaInd[i]=document.getElementById("meta"+i).value;
    		//cambia el formato de la meta y el resultado
        	var Meta = accounting.formatMoney(arrMetaInd[i],{ symbol: "%",  format: "%v %s", precision : 1});
    			document.getElementById("meta"+i).value=Meta;
    			
    		arrResInd[i]=document.getElementById("resultado"+i).value;
    		//cambia el formato de la meta y el resultado
    	    var Res = accounting.formatMoney(arrResInd[i],{ symbol: "%",  format: "%v %s", precision : 1});
    			document.getElementById("resultado"+i).value=Res;
    		
    		
    	}else if(unidad=="Monto"){
    		arrMetaInd[i]=document.getElementById("meta"+i).value;
    		//cambia el formato de la meta y el resultado
        	var Meta = accounting.formatMoney(arrMetaInd[i]);
    			document.getElementById("meta"+i).value=Meta;
    			
    		arrResInd[i]=document.getElementById("resultado"+i).value;
    		//cambia el formato de la meta y el resultado
    	    var Res = accounting.formatMoney(arrResInd[i]);
    			document.getElementById("resultado"+i).value=Res;
    		
    	}else{
    	arrMetaInd[i]=document.getElementById("meta"+i).value;
		//cambia el formato de la meta y el resultado
    	var Meta = accounting.formatNumber(arrMetaInd[i],1,",");
			document.getElementById("meta"+i).value=Meta;
			
		arrResInd[i]=document.getElementById("resultado"+i).value;
			//cambia el formato de la meta y el resultado
	    	var Res = accounting.formatNumber(arrResInd[i],1,",");
				document.getElementById("resultado"+i).value=Res;
    	}	
    	document.getElementById("resultado"+i).className="noeditablevista porcentaje numerosHDR";
    	document.getElementById("meta"+i).className="noeditablevista porcentaje numerosHDR";
    	
		
    }
		

}
</script>

</body>
<script>

function linkDir(link){
	document.getElementById("linkDestino").value=link;
	document.getElementById("linkDireccion").submit();
}

function reportes(){
	usuarioReportes=document.getElementById("usuario").innerHTML;
	mes=document.getElementById("comboSelectMes").value;
	document.getElementById("mesActual").value=mes;
	document.getElementById("ExportarDatos").submit();	
}

inicio();
$('.bar-percentage[data-percentage]').each(function () {
  var progress = $(this);
  var percentage = $(this).attr('data-percentage');
  var p2=Math.ceil(percentage);
   percentage=Math.round(percentage*10)/10; 
  $({countNum: 0}).animate({countNum: p2}, {
    duration: 2000,
    easing:'linear',
    step: function() {
      
    var pct = '';
    if(percentage == 0){
      pct = Math.floor(this.countNum) + '%';
    }else{
      pct = Math.floor(this.countNum+1) + '%';
    }
    progress.text(percentage) && progress.siblings().children().css('width',pct);
    }
  });
});
</script>
<script>
formato();
</script>
</html>
