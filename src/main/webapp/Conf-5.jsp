<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
    <LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/jquery-ui.css">
    <link rel="stylesheet" href="EstilosADN/bootstrap.min.css">
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css">
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="EstilosADN/dis.css" rel="stylesheet" type="text/css">
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/conf5.js"></script>
  
<title>Alta y modificación de usuarios</title>

<%@ page import = "com.adn.controlador.Empresa"%>
<%@page import="java.util.ArrayList"%>
<%@ page session="true" %>
<%
String usuario = "";
String nombre1 = "";
String puesto = "";
String tipo = "";
String jefe = "";
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
	 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
} else {
usuario = (String)sesionOk.getAttribute("usuario");
nombre1 = (String)sesionOk.getAttribute("nombre");
puesto = (String)sesionOk.getAttribute("puesto");
tipo = (String)sesionOk.getAttribute("tipo");
jefe = (String)sesionOk.getAttribute("jefe");
}
%>
<script>
	$(function() {
		$("#datepicker").datepicker();
	});

	$(function() {
		$("#datepicker1").datepicker();
	});
	
	function obFecha(){
		
		var fecha = $('#datepicker').val();
		//alert(fecha);
		document.getElementById("hidenfechaIni").value=fecha;
	}
	function obFecha1(){
		
		var fecha = $('#datepicker1').val();
		//alert(fecha);
		document.getElementById("hidenfechaFin").value=fecha;
	}
</script>

</head>
<body>

<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>
<div class="principal">

	<div class="modulo">
		<div class="modizquierda">
			<div class="mods">
				<span class="derecha"><i class="fa fa-users"></i></span>
				<h2>Administración de usuarios</h2>
				<div class="modmenu">
					<p><a id="ConfEmp" onclick="linkDir2('ConfEmpresa')">-Configuración de empresa</a></p>
					<p><a id="CambPass" onclick="linkDir('Conf-1.jsp')">-Cambio de contraseña</a></p>
					<p><a id="Modif" onclick="linkDir2('ConfUsuarios')">-Modificar usuarios</a></p>
					<p><a id="Grupos" onclick="linkDir('Conf-3.jsp')">-Grupos</a></p>
					<p><a id="Puestos" onclick="linkDir2('ConfigPuestos')">-&Aacute;reas y departamentos</a></p>
				</div>
			</div>
			<div class="mods">
				<span class="derecha"><i class="fa fa-users"></i></span>
				<h2>Sistema de desempeño</h2>
				<div class="modmenu">
					<p>Calendario de aprobaciones</p>
					<p>Modificar aprobaciones</p>
					<p>Personalización</p>
				</div>
			</div>
			<div class="mods">
				<span class="derecha"><i class="fa fa-pie-chart"></i></span>
				<h2>Datos</h2>
				<div class="modmenu">
					<p><a onclick="linkDir1('Mes')">-Carga por mes</a></p>
					<p><a onclick="linkDir1('Usuario')">-Carga por usuario</a></p>
					<p><a onclick="linkDir1('Indicador')">-Carga por indicador</a></p>
				</div>
			</div>
		</div>
		<div class="modconf">
	
	  	<form id="guardarEmpresa" action="guardarEmpresa" method="post">
	  	<input type="hidden" id="actualizar" name="actualizar" value="<%=(request.getAttribute("actualizar")!=(null))?request.getAttribute("actualizar"): ""%>">
	  	<input type="hidden" id="msgBus" name="msgBus" value="<%=(request.getAttribute("mensaje")!=(null))?request.getAttribute("mensaje"): ""%>">
	  	<input type="hidden" id="usrAct" name="usrAct" value="">
	  	<input type="hidden" id="hidenfechaIni" name="hidenfechaIni" value="">
	  	<input type="hidden" id="hidenfechaFin" name="hidenfechaFin" value="">
			<table class="forma2" width="80%" align="center">
				<tr>
					<td width="10px"></td>
					<td width="50px" align="center"><span>Empresa:</span></td>
					<td width="200px" align="left">
						<select class="form-selectm grande" id="empresa" name="empresa" onchange="valOp()">
							<option value="0" selected="selected">[Selecciona]</option>
							<%
							String cvEmp="", nbEmp="";
							ArrayList<Empresa> empresas = (ArrayList<Empresa>)((request.getAttribute("empresas")!=(null))?request.getAttribute("empresas"): "");
							if(empresas!=null && empresas.size()>0){
								for(int i=0; i<empresas.size();i++){
								Empresa emp = empresas.get(i);
								cvEmp = emp.getIdEmpresa()+"";
								nbEmp = emp.getNbEmpresa();
							%>
								<option value="<%=cvEmp%>" ><%=nbEmp%></option>
							<%}
							}else{%>
							<option value="Alta">Alta de empresa</option>
							<%}%>
						</select></td>
					<td width="200px"align="center"><a href="#" class="boton" id="findEmp" onclick="" title="Busca empresa" alt="Busca empresa"><i class="fa fa-search"></i></a>
												   <a href="#" class="boton" id="createEmp" onclick="nuevaEmpresa()" title="Alta empresa" alt="Alta empresa"><i class="fa fa-plus"></i></a> 
												   <a href="#" class="boton" id="eliminaEmp" onclick="" title="Elimina empresa" alt="Elimina usuario"><i class="fa fa-times"></i></a>
					</td>
					<td width="40px"></td>
				</tr>
				
			</table>
			<div class="barraazul"></div>
	
	        <table class="forma22" width="80%" align="left">
	        <tr>
	        <td width=70%>
	         <table align="center">
	         <tr height="30px">
	                <td width="100px" align="right" id="lblNombre"><span>*Nombre</span></td>
					<td width="300px" align="left"><input type="text" name="nombre" id="nombre" class="form-control" value="<%=(request.getAttribute("nombre")!=(null))?request.getAttribute("nombre"): ""%>"></td>
	         </tr>
	         <tr height="30px">
					<td width="100px" align="right" id="lblDesc"><span>*Descripci&oacute;n</span></td>
					<td width="300px"><input type="text" name="desc" id="desc" class="form-control" value="<%=(request.getAttribute("desc")!=(null))?request.getAttribute("desc"): ""%>"></td>
		     </tr>
	         <tr height="30px">
	        	<td width="170px" align="right" id="lblLicAd"><span>*Num. Licencias adquiridas</span></td>
	        	<td width="300px"align="left"><input type="text" name="numLicAd" id="numLicAd" class="form-control w200"></td>
	         </tr>
	        <tr height="30px">
	           <td width="170px" align="right" id="lblLicAc"><span>Num.Licencias activas/en uso</span></td>
			   <td><input type="text" name="numLicAd" id="numLicAc" class="form-control w200"></td>
			</tr>
			<tr>					
				<td align="right" id="lblVigencia"><span>*Vigencia</span></td>
			</tr>
			 <tr height=7px>
	       </tr>
			<tr height="30px">
				<td></td>
				<td id="lblFechas"><span>Inicio</span>
				<input id="datepicker" name="datepicker" onchange="obFecha()" value="" type="text" class="form-control fecha" >
				
				<span>Fin</span>
				<input id="datepicker1" name="datepicker1" onchange="obFecha()" value="" type="text" class="form-control fecha" >
				</td>
			</tr>
			<tr height="30px">
				<td></td>
				<td id="chk1">
					<input type="checkbox" id="activaCalApro" onselect="muestraSel()">Activa calendario de Aprobaciones
				</td>
			</tr>
			<tr height="30px">
				<td></td>
				<td id="chk2">
					<input type="checkbox" id="activaSisPenal">Activa sistema de Penalizaci&oacute;n
				</td>
			</tr>
			<tr height="30px">
				<td></td>
				<td id="chk3">
					<input type="checkbox" id="activaSisAlert">Activa sistema de Alertas
				</td>
			</tr>
	        </table>
	        </td>
	        </tr>
	        <tr height=40px></tr>
	        <table align="left">
	        <tr id="btnGuardar">
				<td width="150px"></td>
				<td colspan="3" align="left"><a href="#" class="btn btn-success" onclick="validaDatos()">Guardar cambios</a></td>
			</tr>
	        <tr height=10px></tr>
	        </table>
	
	        
	        </table> 
	        
			
			</form>
		</div>
	</div>
<div id="pie">
	<jsp:include page="Footer.jsp"></jsp:include>
</div>	
	
<form method="POST" id="linkDireccion" action="linkDireccion">
	<input type="hidden" id="linkDestino" name="linkDestino" value="">
</form>

<form method="POST" id="linkDireccion1" action="BuscaOpcionesCargaIndInte">
	<input type="hidden" id="linkDestino1" name="linkDestino1" value="">
</form>
<form method="POST" id="confPuestos" action="ConfigPuestos">
</form>

<script type="text/javascript">
inicio();
</script>
</body>
</html>