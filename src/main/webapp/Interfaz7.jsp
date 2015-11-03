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
    <link rel="stylesheet" href="js/disO.css" rel="stylesheet" type="text/css">
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet"> 
    
    <script src="js/jquery.min.js"></script>
    <script src="js/interfaz7.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<script src="js/jquery-ui.js"></script>


<title>Control de Aprobaciones</title>


<%@page import="com.adn.conexion.claseFecha"%>
<%@page import="com.adn.controlador.HojaRumbo"%>
<%@page import="com.adn.controlador.CalendarioAprobacion"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@ page import ="java.sql.SQLException"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.util.Calendar"%>
<%@ page import = "java.util.GregorianCalendar"%>

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
<script>
	function agregar(){
		var area = document.getElementById("area").value;
		if(area!= "")
			{
				document.getElementById("GuardaArea").submit();
			}
	}
</script>

<script language="javascript">
window.onload = function() {
estatus();
estatus2();
estatusa();
pruebaFecha();

}
</script>

</head>

<body onload="estatus();pruebaFecha();estatus2();">

<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>

<input type="hidden" id="fch1" name="fch1" value="">
<input type="hidden" id="fch2" name="fch2" value="">
<input type="hidden" id="mensajeSolicitud" name="mensajeSolicitud" value="<%=(request.getAttribute("mensajeSolicitud")!=(null))?request.getAttribute("mensajeSolicitud"): ""%>">

<div class="principal">
	
<%
					Calendar fechal = Calendar.getInstance();
					Calendar fecha2l = new GregorianCalendar();
					int mesfl = fechal.get(Calendar.MONTH);
					int dia = fechal.get(Calendar.DATE);
					int mesal=mesfl+1;
					String fAl="";
					String fA2="";
					String mesBl="";
					String mesB2="";
					System.out.println("mes"+mesal);
						if(mesal==1){mesBl="enef"; mesB2="enei";}
						if(mesal==2){mesBl="febf"; mesB2="febi";}
						if(mesal==3){mesBl="marf"; mesB2="mari";}
						if(mesal==4){mesBl="abrf"; mesB2="abri";}
						if(mesal==5){mesBl="mayf"; mesB2="mayi";}
						if(mesal==6){mesBl="junf"; mesB2="juni";}
						if(mesal==7){mesBl="julf"; mesB2="juli";}
						if(mesal==8){mesBl="agof"; mesB2="agoi";}
						if(mesal==9){mesBl="sepf"; mesB2="sepi";}
						if(mesal==10){mesBl="octf"; mesB2="octi";}
						if(mesal==11){mesBl="novf"; mesB2="novi";}
						if(mesal==12){mesBl="dicf"; mesB2="dici";}
						claseFecha cfl= new claseFecha();
						ResultSet resulsetFechal= cfl.consultaFecha2(mesBl,mesB2);
						try {
							while(resulsetFechal.next()){
								
								fAl=resulsetFechal.getString(1);
								fA2=resulsetFechal.getString(2);
								String fAlm=fAl.substring(0,2);
								String fA2m=fA2.substring(0,2);
								int fAln = Integer.parseInt(fAlm);
								int fA2n = Integer.parseInt(fA2m);
								int fA3=fAln-dia;
								if(fA3<0){
									fA3=0;
								}
								System.out.println("--"+fAlm+"-"+fA2m+"int"+fAln+"-"+fA2n);
							%>
	<table width="100%">
	<tr>
	<td>	
	<div class="interfaz">
	<div class="barratitulo">Control de Aprobaciones</div>
		<div class="barraopciones">
			<table  width="100%" id="tablabarra" style="display: inline">
				<tr>
				     <td width="50px"></td>
					<td>Fecha Límite</td>
					<td><input id="f0" type="text" class="form-control inputfecha" value="<%=fAl%>"></td>
					<td width="30px"></td>
					<td>Días Restantes</td>
					<td><input type="text" class="form-control inputfecha" value="<%=fA3%>"></td>
					<td width="30px"></td>
					<td>Calendario <i onclick="ocultaCalendario();" class="fa fa-calendar"></i></td>
				    <td width="10%"></td>
				</tr>
			</table>
			<%
			} 
						}catch (SQLException e) {
										// TODO Auto-generated catch block
										e.printStackTrace();
									}
								%>
		</div>
		<br>
		
		<form method="POST" id="formalta" action="consultaAprobadores1">
		<input type="hidden" id="mesre" name="mesre" value="<%=(request.getAttribute("mesre")!=(null))?request.getAttribute("mesre"): ""%>">
		<input type="hidden" id="usure" name="usure" value="<%=(request.getAttribute("usure")!=(null))?request.getAttribute("usure"): ""%>">
		<input type="hidden" id="variableAlta" name="variableAlta" value="<%=(request.getAttribute("variableAlta")!=(null))?request.getAttribute("variableAlta"): ""%>">
		</form>
		
		<form method="POST" id="consultaAprobadores2" action="consultaAprobadores2">
		<input type="hidden" id="usSel" name="usSel" value="">
		<input type="hidden" id="mesre2" name="mesre2" value="">
		<input type="hidden" id="usure2" name="usure2" value="<%=usuario%>">
		<input type="hidden" id="variableAlta" name="variableAlta" value="<%=(request.getAttribute("variableAlta")!=(null))?request.getAttribute("variableAlta"): ""%>">
		</form>
				
	<div id="oculta" style="display:none" >
			<br>
			<form method="POST" id="CambiaPassword" action="CambiaPassword">
			<h5 align="left">Calendario Aprobaciones</h5>
			<div id="calendario" class="tablerodos containernuevo" style="width:1200px;">
				<table align="center">
					<tr>
						<td></td>
						<td class="negritas titulotablero">Enero</td>
						<td class="negritas titulotablero">Febrero</td>
						<td class="negritas titulotablero">Marzo</td>
						<td class="negritas titulotablero">Abril</td>
						<td class="negritas titulotablero">Mayo</td>
						<td class="negritas titulotablero">Junio</td>
						<td class="negritas titulotablero">Julio</td>
						<td class="negritas titulotablero">Agosto</td>
						<td class="negritas titulotablero">Septiembre</td>
						<td class="negritas titulotablero">Octubre</td>
						<td class="negritas titulotablero">Noviembre</td>
						<td class="negritas titulotablero">Diciembre</td>
					</tr>
			<%
			
				CalendarioAprobacion calenApro =(CalendarioAprobacion)request.getAttribute("calendarioAprob");
					if(calenApro!=null){
				%>
				<tr>
				<td width=200 class="bordeazul">Inicio de Periodo</td>
				<td class="mestablero bordeazul" width="100px"><%=calenApro.getEnei()%></td>
				<td class="bordeazul" width="100px"><%=calenApro.getFebi()%></td>
				<td class="mestablero bordeazul" width="100px"><%=calenApro.getMari()%></td>
				<td class="bordeazul" width="100px"><%=calenApro.getAbri()%></td>
				<td class="mestablero bordeazul" width="100px"><%=calenApro.getMayi()%></td>
				<td class="bordeazul" width="100px"><%=calenApro.getJuni()%></td>
				<td class="mestablero bordeazul" width="100px"><%=calenApro.getJuli()%></td>
				<td class="bordeazul" width="100px"><%=calenApro.getAgoi()%></td>
				<td class="mestablero bordeazul" width="100px"><%=calenApro.getSepi()%></td>
				<td class="bordeazul" width="100px"><%=calenApro.getOcti()%></td>
				<td class="mestablero bordeazul" width="100px"><%=calenApro.getNovi()%></td>
				<td class="bordeazul" width="100px"><%=calenApro.getDici()%><td>
				</tr>
				<tr>
				<td width=100 class="bordeazul">Fin de Periodo</td>
				<td class="mestablero bordeazul"><%=calenApro.getEnef()%></td>
				<td class="bordeazul"><%=calenApro.getFebf()%></td>
				<td class="mestablero bordeazul"><%=calenApro.getMarf()%></td>
				<td class="bordeazul"><%=calenApro.getAbrf()%></td>
				<td class="mestablero bordeazul"><%=calenApro.getMayf()%></td>
				<td class="bordeazul"><%=calenApro.getJunf()%></td>
				<td class="mestablero bordeazul"><%=calenApro.getJulf()%></td>
				<td class="bordeazul"><%=calenApro.getAgof()%></td>
				<td class="mestablero bordeazul"><%=calenApro.getSepf()%></td>
				<td class="bordeazul"><%=calenApro.getOctf()%></td>
				<td class="mestablero bordeazul"><%=calenApro.getNovf()%></td>
				<td class="bordeazul"><%=calenApro.getDicf()%></td>
				</tr>
		</table>
			<%
			} 
			%>	
		</div>
		</form>	
	</div>	
	
	

<div class="tablas" style="width:1100px">
			<div>
			<table id="proyectosheader" width="800px" class="containernuevo tope" >
				
				<tr>
					<td width="250px"><a onclick="validaMesApro()" title="Flujo" alt="Flujo" class="btn btn-primary btn-xs" >Solicitar Aprobaci&oacute;n</a>
							  <a onclick="cargaHojaRumbo()" class="btn btn-primary btn-xs">Ver Hoja de Ruta</a></td>
					
					
					<td width="200px" align="center"><h4>Mis aprobaciones</h4></td>
					<td align="right"></td>
				</tr>
			</table>
			<table align="left" id="proyectostabla" width="800px" >
				<tbody><tr>
					<th width="14%" size="5"  colspan="2">Mes</th>
					<th width="10%">Resultado</th>
					<th width="12%">Solicitud</th>
					<th width="13%">Liberación</th>
					<th width="13%">Estatus</th>
					<th width="18%" >Aprobaciones</th>
				</tr>
				
				<form method="POST" id="formHR" action="CargaInterfazIndicadores">
					<input type="hidden" id="usuarioRedireccion" name="usuarioRedireccion" value="<%=usuario%>">
					<input type="hidden" id="mesEnviado" name="mesEnviado" value="">
					<input type="hidden" id="mesNumerico" name="mesNumerico" value="">
					<input type="hidden" id="anioSel" name="anioSel" value="">
					<input type="hidden" id="origen" name="origen" value="">
				</form>
					<input type="hidden" name="fechaAp" id="fechaAp" value="<%=request.getAttribute("fechaFin")%>">	
				<body>
					<%
									String nombre="", resultado="", solicitud="", liberacion="", estatus="", mes="", aprobaciones="", numAprobadores="";
									int contador=0;
									ArrayList<HojaRumbo> arrHR = (ArrayList<HojaRumbo>)request.getAttribute("hojasRuta");
									int res=0;
									String ress="";
									if(arrHR!=null){
									for(int i=0; i<arrHR.size();i++){
											HojaRumbo hojaUsuario = arrHR.get(i);
											nombre=hojaUsuario.getAprobados();
											resultado=hojaUsuario.getResultado();
											solicitud=hojaUsuario.getSolicitud();
											liberacion=hojaUsuario.getLiberacion();
											estatus=hojaUsuario.getEstatus();
											mes=hojaUsuario.getMes();
											aprobaciones=(hojaUsuario.getAprobados()!=null?hojaUsuario.getAprobados():"0");
											numAprobadores=hojaUsuario.getAprobadores();
												contador++;	
				%>
				<tr id="tr<%=contador %>">
					<td align="center"><input type="checkbox" id="checkbox-3-<%=contador %>" class="regular-checkbox"><label for="checkbox-3-<%=contador %>"></label></td>
					<td style="display:none"><input type="text" class="form-control porcentaje" placeholder="Nombre" id="nombre<%=contador %>" value="<%=nombre%>"></td>
					<td><input type="text" class="form-control porcentaje" placeholder="Mes" id="mes<%=contador %>" value="<%=mes%>"></td>
					<td><input type="text" class="form-control noventa" placeholder="Porcentaje" id="resultado<%=contador %>" value="<%=resultado%>"></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" id="solicitud<%=contador %>" value="<%=solicitud%>"></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" id="liberacion<%=contador %>" value="<%=liberacion%>"></td>
					<td><input size="7" type="text" class="form-control estatus" id="estatus<%=contador %>" value="<%=estatus%>"></td>
					<td><div id="bar-<%=contador %>" class="bar-main-container emerald menos sombra"><div class="wrap">
						<span><%=aprobaciones %> aprobaciones de <%=numAprobadores%></span> 
						</div></div></td>
				</tr>
					<%			
			   				}
						}
					out.println("<td style='display:none'><input size='7' type='text' class='form-control estatus' id='conta' value='"+contador+"'></td>");						
					if(contador==0){
					%>
				<tr>
					<td align="center"><input type="checkbox" id="checkbox-3-1" class="regular-checkbox"><label for="checkbox-3-1"></label></td>
					<td><input type="text" class="form-control porcentaje" placeholder="Mes" value=""></td>
					<td><input type="text" class="form-control noventa" placeholder="Porcentaje" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control estatus verde" placeholder="" value=""></td>
					<td><div id="bar-2" class="bar-main-container emerald menos sombra">
							<div class="wrap">
								<div class="bar-percentage" data-percentage="80"></div>
								<div class="bar-container"><div class="bar"></div></div>
						</div></div></td>
				</tr>
				<tr>
					<td align="center"><input type="checkbox" id="checkbox-3-2" class="regular-checkbox"><label for="checkbox-3-1"></label></td>
					<td><input type="text" class="form-control porcentaje" placeholder="Mes" value=""></td>
					<td><input type="text" class="form-control noventa" placeholder="Porcentaje" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control estatus verde" placeholder="" value=""></td>
					<td><div id="bar-2" class="bar-main-container emerald menos sombra"><div class="wrap"><div class="bar-percentage" data-percentage="80"></div><div class="bar-container"><div class="bar"></div></div></div></div></td>
				</tr>
				<tr>
					<td align="center"><input type="checkbox" id="checkbox-3-3" class="regular-checkbox"><label for="checkbox-3-1"></label></td>
					<td><input type="text" class="form-control porcentaje" placeholder="Mes" value=""></td>
					<td><input type="text" class="form-control noventa" placeholder="Porcentaje" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control estatus verde" placeholder="" value=""></td>
					<td><div id="bar-2" class="bar-main-container emerald menos sombra"><div class="wrap"><div class="bar-percentage" data-percentage="80"></div><div class="bar-container"><div class="bar"></div></div></div></div></td>
				</tr>
				<tr>
					<td align="center"><input type="checkbox" id="checkbox-3-3" class="regular-checkbox"><label for="checkbox-3-1"></label></td>
					<td><input type="text" class="form-control porcentaje" placeholder="Mes" value=""></td>
					<td><input type="text" class="form-control noventa" placeholder="Porcentaje" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control estatus verde" placeholder="" value=""></td>
					<td><div id="bar-2" class="bar-main-container emerald menos sombra"><div class="wrap"><div class="bar-percentage" data-percentage="80"></div><div class="bar-container"><div class="bar"></div></div></div></div></td>
				</tr>
				<tr>
					<td align="center"><input type="checkbox" id="checkbox-3-3" class="regular-checkbox"><label for="checkbox-3-1"></label></td>
					<td><input type="text" class="form-control porcentaje" placeholder="Mes" value=""></td>
					<td><input type="text" class="form-control noventa" placeholder="Porcentaje" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control estatus verde" placeholder="" value=""></td>
					<td><div id="bar-2" class="bar-main-container emerald menos sombra"><div class="wrap"><div class="bar-percentage" data-percentage="80"></div><div class="bar-container"><div class="bar"></div></div></div></div></td>
				</tr>
				<%}%>
				<input type="hidden" id="contador" value="<%=contador%>"/>
			</tbody></table>
			</div>
			
			<%String esJefe = (String)request.getAttribute("esJefe");
			if(esJefe!=null && !esJefe.equals("") && esJefe.equals("SI")){%>
			<div>
			<table id="proyectosheader" width="100%">
				<tr><td height="30px"></td></tr>
				<tr class="containernuevo tope">	
					<td width="300px"><a title="Flujo" alt="Flujo" class="btn btn-primary btn-xs" data-toggle="modal" onclick="validaMes2()" >Aprobar</a> 
									  <a onclick="hojaRumboEquipo()" class="btn btn-primary btn-xs">Ver Hoja de Ruta</a></td>
					<td align="center" colspan="5"><h4>Mi Equipo</h4></td>
					<td width="200px"></td>
					<td align="left" ><span>Estatus</span> 
					<select name="estatusa" id="estatusa" onchange="estatusa()">
					<option selected value="Esta">Todos</option>
					<option  value="Aprobada" >Aprobada</option>
					<option value="Solicitada">Solicitada</option>
					<option value="Pendiente">Pendiente</option>
					<option value="Denegada">Denegada</option>
					</select></td>
					
					
					<td align="left"><span>Mes</span> 
					<select name="mesbox" id="mesbox" onchange="estatusa()">
					<option selected value="Mes">Todos</option>
					<option value="Enero">Ene</option>
					<option value="Febrero">Feb</option>
					<option value="Marzo">Mar</option>
					<option value="Abril">Abr</option>
					<option value="Mayo">May</option>
					<option value="Junio">Jun</option>
					<option value="Julio">Jul</option>
					<option value="Agosto">Ago</option>
					<option value="Septiembre">Sep</option>
					<option value="Octubre">Oct</option>
					<option value="Noviembre">Nov</option>
					<option value="Diciembre">Dic</option></select></td>
					<td></td>
					<td><span>Usuario</span> <input size="12" type="text" id="buscaUsu" name="buscaUsu"><a title="Buscar" alt="Buscar">
							<img width='25' height='25' src="ImagenesADN/lupita.png" onclick="buscaUsuario()">
						</a></td>
				</tr>
			</table>
			<table align="left" id="proyectostabla tope"  width="100%" >
				<tbody>
				<tr style="height:10px">
					<th colspan="2" width="180px">Usuario</th>
					<th width="110px">Resultado</th>
					<th width="100px">Solicitud</th>
					<th width="100px">Liberación</th>
					<th width="100px">Estatus</th>
					<th width="80px">Mes</th>
					<th width="150px" >Aprobaciones</th>
				</tr>
					</tbody>
					<form id="consultaEquipo" name="consultaEquipo" method="POST">
						<input type="hidden" name="estatushiden" id="estatushiden" value=""/>
						<input type="hidden" name="usuariohiden" id="usuariohiden" value="<%=usuario%>"/>
					</form>		
					</table>
				<table id="proyectostabla" width="100%" align="left">			
				<%
									String nombre2="", resultadoo="", solicitud2="", liberacion2="", estatus2="", mes2="", usuario2="", aprobaciones2="",numApro="";
									int contador2=0;
									ArrayList<HojaRumbo> hojaRumboArr = (ArrayList<HojaRumbo>)request.getAttribute("hojasEquipo");
									int res2=0;
									String ress2="";
									if(hojaRumboArr!=null){
										for(int i=0;i<hojaRumboArr.size();i++){
											HojaRumbo hr = hojaRumboArr.get(i);
											nombre2=hr.getAprobados();
											if(nombre2==null){
												nombre2="0";									
											}
											resultadoo=hr.getResultado();
											solicitud2=hr.getSolicitud();
											
											if(hr.getLiberacion()==(null)){
												liberacion2="";
											}else{
												liberacion2=hr.getLiberacion();
											}
											
											estatus2=hr.getEstatus();
											mes2=hr.getMes();
											int mesn = Integer.parseInt(mes2);
											if(mesn==0)mes2="Enero";
											if(mesn==1)mes2="Febrero";
											if(mesn==2)mes2="Marzo";
											if(mesn==3)mes2="Abril";
											if(mesn==4)mes2="Mayo";
											if(mesn==5)mes2="Junio";
											if(mesn==6)mes2="Julio";
											if(mesn==7)mes2="Agosto";
											if(mesn==8)mes2="Septiembre";
											if(mesn==9)mes2="Octubre";
											if(mesn==10)mes2="Noviembre";
											if(mesn==11)mes2="Diciembre";
											usuario2=hr.getUsuario();										
												//System.out.println(resultadoo);
											aprobaciones2=(hr.getAprobados()!=null?hr.getAprobados():"0");
											numApro=hr.getAprobadores();
											int resultado2 = Integer.parseInt(resultadoo);
											if(aprobaciones2.equals(numApro)){
												resultado2=100;
												estatus2="Aprobada";
											}
										contador2++;
							%>	
				<tr id="tr2<%=contador2 %>" style="display:inline">
					<td width="30px" align="center"><input type="checkbox" id="checkbox-32-<%=contador2 %>" class="regular-checkbox"><label for="checkbox-32-<%=contador2 %>"></label></td>
					<td width="240px"><input type="text" class="form-control" style="width:420px" id="nombre2<%=contador2 %>" value="<%=usuario2%>"></td>
					<td width="110px"><input type="text" class="form-control noventa" placeholder="Porcentaje" id="resultado<%=contador2 %>" value="<%=resultado2%>"></td>
					<td width="100px"><input type="text" class="form-control fecha" placeholder="Fecha" id="solicitud<%=contador2 %>" value="<%=solicitud2%>"></td>
					<td width="100px"><input type="text" class="form-control fecha" placeholder="Fecha" id="liberacion<%=contador2 %>" value="<%=liberacion2%>"></td>
					<td width="100px"><input type="text" class="form-control estatus" id="estatus2<%=contador2 %>" value="<%=estatus2%>"></td>
					<td width="80px"><input type="text" class="form-control porcentaje" placeholder="Mes" id="mes2<%=contador2 %>" value="<%=mes2%>"></td>
					<td width="150px"><div id="bar-<%=contador2 %>" class="bar-main-container emerald menos sombra">
							<div class="wrap">
								<span><%=aprobaciones2%> aprobaciones de <%=numApro%></span>
							</div>
						</div>
					</td>
					<input type='hidden' id='mes2hiden' name='mes2hiden' value=''>
					<input type='hidden' id='nombre2hiden' name='nombre2hiden' value=''>
					<input type='hidden' id='uss<%=contador2 %>' name='uss<%=contador2 %>' value='<%=usuario2%>'>
				</tr>
					<%				}
									%>
									<input type='hidden' id='contadorEqui' name='contadorEqui' value='<%=contador2%>'>
								<%
								}
								if(contador2==0){
								%>
				<tr>
					<td align="center"><input type="checkbox" id="checkbox-3-1" class="regular-checkbox"><label for="checkbox-3-1"></label></td>
					<td><input type="text" class="form-control" style="width:400px" value=""></td>
					<td><input type="text" class="form-control noventa" placeholder="Porcentaje" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control estatus verde" placeholder="" value=""></td>
					<td><input type="text" class="form-control porcentaje" placeholder="Mes" value=""></td>
					<td><div id="bar-2" class="bar-main-container emerald menos sombra"><div class="wrap"><div class="bar-percentage" data-percentage=""></div><div class="bar-container"><div class="bar"></div></div></div></div></td>
				</tr>
				<tr>
					<td align="center"><input type="checkbox" id="checkbox-3-1" class="regular-checkbox"><label for="checkbox-3-1"></label></td>
					<td><input type="text" class="form-control" style="width:400px" value=""></td>
					<td><input type="text" class="form-control noventa" placeholder="Porcentaje" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control estatus verde" placeholder="" value=""></td>
					<td><input type="text" class="form-control porcentaje" placeholder="Mes" value=""></td>
					<td><div id="bar-2" class="bar-main-container emerald menos sombra"><div class="wrap"><div class="bar-percentage" data-percentage=""></div><div class="bar-container"><div class="bar"></div></div></div></div></td>
				</tr>
				<tr>
					<td align="center"><input type="checkbox" id="checkbox-3-1" class="regular-checkbox"><label for="checkbox-3-1"></label></td>
					<td><input type="text" class="form-control" style="width:400px" value=""></td>
					<td><input type="text" class="form-control noventa" placeholder="Porcentaje" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control fecha" placeholder="Fecha" value=""></td>
					<td><input type="text" class="form-control estatus verde" placeholder="" value=""></td>
					<td><input type="text" class="form-control porcentaje" placeholder="Mes" value=""></td>
					<td><div id="bar-2" class="bar-main-container emerald menos sombra"><div class="wrap"><div class="bar-percentage" data-percentage=""></div><div class="bar-container"><div class="bar"></div></div></div></div></td>
				</tr>
				
				<%}%>
				<input type="hidden" id="contador2" value="<%=contador2%>"/>
			</tbody></table>
		</div>
		<%}%>
	</div>
</div>

<table width="100%">
  <tr>
    <br/>
  <td>
 <div align="center">
  <p class="footer">Powered by: ADN. Todos los derechos reservados. 2015</p>
  <div id="logodiezequis"><img src="ImagenesADN/logo-adn.png" width="53" height="37" /></div>
</div>
</td>
</tr>
</table>
					<form method="POST" id="consultaAprobadores1" action="consultaAprobadores1">
						<!-- <input type="hidden" name="namemodalhiden" id="namemodalhiden" value=""/> 
						<input type="hidden" name="hidenapro" id="hidenapro" value=""/>-->
						<input type="hidden" name="usuariohidenA1" id="usuariohidenA1" value="<%=usuario%>"/>
						<input type="hidden" name="meshidA1" id="meshidA1" value=""/>
					</form>	

	
   </div>
   </td>
   <td>
   <div>
	<td width="73px" align="left" valign="top">
			
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
</div>	
	
<form method="POST" id="linkDireccion" action="linkDireccion">
	<input type="hidden" id="linkDestino" name="linkDestino" value="">
</form>
<form method="POST" id="ControlAprobaciones" action="ControlAprobaciones">
	<input type="hidden" id="usuHojaRumbo" name="usuHojaRumbo" value="<%=usuario%>">
</form>
<script>

function linkDir(link){
	document.getElementById("linkDestino").value=link;
	document.getElementById("linkDireccion").submit();
	
}
</script>	
	
<form method="POST" id="ExportarDatos" action="ExportarDatos">
	<input type="hidden" id="usuarioReportes" name="usuarioReportes" value="">
</form>

<script>
inicio();

function reportes(){
	usuarioReportes=document.getElementById("usuario").innerHTML;
	if(usuarioReportes=="jfquintanarb@grupolaflorida.com"){
		document.getElementById("ExportarDatos").submit();
	}else{
		alert("Accion no disponible");	
	}	
}
</script>

</body>	
</html>
