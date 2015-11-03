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
  
<title>Configuracion</title>

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

<script type="text/javascript">
    function cuentaLogin(){
    	var variable = document.getElementById("dato").value;
    	
    	if(variable!="Contador incrementado"){
    		document.getElementById("usuariologin").value=document.getElementById("usuario").innerHTML;
        	document.getElementById("pruebaServlet").submit();
    		
    	}   	
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
			<table class="forma2" width="100%" align="center">
				<tr>
					<td align="right"><span>Grupo</span></td>
					<td align="left"><input type="text" class="form-control"></td>
					<td align="center"><a href="#" class="boton"><i class="fa fa-plus"></i></a> <a href="#" class="boton"><i class="fa fa-pencil"></i></a> <a href="#" class="boton"><i class="fa fa-times"></i></a></td>
				</tr>
			</table>
			<div class="barraazul"></div>
			<table class="forma22" width="100%" align="center">
				<tr>
					<td align="right"><span>Nombre</span></td>
					<td align="left"><input type="text" class="form-control"></td>
					<td colspan="2"></td>
				</tr>
				<tr>
					<td colspan="4" height="50"></td>
				</tr>
				<tr>
					<td align="right"><span>Usuario</span></td>
					<td><input type="text" class="form-control"></td>
					<td align="center" colspan="2"><span class="btn btn-primary">Agregar</span> <span class="btn btn-danger">Eliminar</span></td>
				</tr>
				<tr>
					<td></td>
					<td colspan="3">Miembros</td>
				</tr>
				<tr>
					<td></td>
					<td rowspan="4"><textarea class="form-control textoconf3"></textarea></td>
					<td>Juntas compartidas</td>
					<td><select class="selectconf3"><option value=""></option></select></td>
				</tr>
				<tr>
					<td></td>
					<td>Indicadores compartidos</td>
					<td><select class="selectconf3"><option value=""></option></select></td>
				</tr>
				<tr>
					<td></td>
					<td>Mismo ciclo de aprobación</td>
					<td><select class="selectconf3"><option value=""></option></select></td>
				</tr>
				<tr>
					<td></td>
					<td>Dashboard comunitario</td>
					<td><select class="selectconf3"><option value=""></option></select></td>
				</tr>
				<tr>
					<td colspan="4" align="right"><a href="#" class="btn btn-success">Guardar cambios</a></td>
				</tr>
			</table>
		</div>
	</div>
<div id="pie">
	<jsp:include page="Footer.jsp"></jsp:include>
</div>	
	<form method="POST" id="linkDireccion1" action="BuscaOpcionesCargaIndInte">
		<input type="hidden" id="linkDestino1" name="linkDestino1" value="">
	</form>
	<form method="POST" id="linkDireccion" action="linkDireccion">
		<input type="hidden" id="linkDestino" name="linkDestino" value="">
	</form>
	<form method="POST" id="confPuestos" action="ConfigPuestos">
	</form>
	<form method="POST" id="confUsuarios" action="ConfUsuarios">
	</form>
</body>
<script>
function linkDir(link){
	document.getElementById("linkDestino").value=link;
	document.getElementById("linkDireccion").submit();
	
}
function linkDir1(link){
	document.getElementById("linkDestino1").value=link;
	document.getElementById("linkDireccion1").submit();
}

function linkDir2(accion){
	document.getElementById("confPuestos").action=accion;
	document.getElementById("confPuestos").submit();
}

</script>
</html>