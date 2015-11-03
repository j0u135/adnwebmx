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
  	<script src="js/conf1.js"></script>
<title>Configuracion</title>

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
<div class="principal">
	
	<div class="modulo">
		<div class="modizquierda">
			<div id="ConfUsuario" class="mods">
				<span class="derecha"><i class="fa fa-users"></i></span>
				<h2>Administración</h2>
				<div class="modmenu">
					<p><a id="ConfEmp" onclick="linkDir2('ConfEmpresa')">-Configuración de empresa</a></p>
					<p><a id="CambPass" onclick="linkDir('Conf-1.jsp')">-Cambio de contraseña</a></p>
					<p><a id="Modif" onclick="linkDir2('ConfUsuarios')">-Modificar usuarios</a></p>
					<p><a id="Grupos" onclick="linkDir('Conf-3.jsp')">-Grupos</a></p>
					<p><a id="Puestos" onclick="linkDir2('ConfigPuestos')">-&Aacute;reas y departamentos</a></p>
				</div>
			</div>
			<div id="Aprob" class="mods">
				<span class="derecha"><i class="fa fa-users"></i></span>
				<h2>Sistema de desempeño</h2>
				<div id="AprobOps" class="modmenu">
					<p>Calendario de aprobaciones</p>
					<p>Modificar aprobaciones</p>
					<p>Personalización</p>
				</div>
			</div>
			<div id="Cargas" class="mods">
				<span class="derecha"><i class="fa fa-pie-chart"></i></span>
				<h2>Datos</h2>
				<div id="CargaOps" class="modmenu">
					<p><a onclick="linkDir1('Mes')">-Carga por mes</a></p>
					<p><a onclick="linkDir1('Usuario')">-Carga por usuario</a></p>
					<p><a onclick="linkDir1('Indicador')">-Carga por indicador</a></p>
				</div>
			</div>
		</div>
		<div class="modconf">
		<form id="formContrasena" action="cambiarContrasena" method="post">
		<input type="hidden" id="paso" name="paso" value="">
		<input type="hidden" id="valido" name="valido" value="<%=(request.getAttribute("valido")!=(null))?request.getAttribute("valido"): ""%>">
		<input type="hidden" id="actualizo" name="actualizo" value="<%=(request.getAttribute("actualizo")!=(null))?request.getAttribute("actualizo"): ""%>">
		<input type="hidden" id="usrAct" name="usrAct" value="">
			<table class="forma1" width="700px" align="center">
				<tr>
					<td align="left"><span>Usuario</span></td>
					
					<td><input type="text" id="user" name="user" class="form-control" value="<%=usuario%>"></td>
				   <td width="300px"></td>
				</tr>
				<tr>
					<td align="left"><span>Contraseña</span></td>
					<td><input type="password" id="password" name="password" onblur="validaPssw()" class="form-control" value="<%=(request.getAttribute("clave")!=(null))?request.getAttribute("clave"): ""%>"></td>
				</tr>
				<tr>
					<td colspan="2" height="60"></td>
				</tr>
				<tr>
					<td align="left"><span>Nueva</span></td>
					<td><input type="password" id="conpassword" name="conpassword" class="form-control" disabled="disabled"></td>
				    <td width="200px"></td>
				</tr>
				<tr>
					<td align="left"><span>Repetir</span></td>
					<td><input type="password" id="conpassword1" name="conpassword1" class="form-control" disabled="disabled"></td>
				</tr>
				<tr>
					<td colspan="2" height="60"></td>
				</tr>
				<tr>
					<td></td>
					<td><a href="#" id="btnGuardar" class="btn btn-success" onclick="validaDatos()" style="display:none;">Cambiar contraseña</a></td>
				</tr>
			</table>
		</form>
		</div>
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

<script>
var tipo = "<%=tipo%>";
inicio(tipo);
</script>
</body>
</html>