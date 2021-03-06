<%@page import="java.awt.print.Printable"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
	<LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <LINK href="EstilosADN/dis.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/jquery-ui.css">
    <link rel="stylesheet" href="EstilosADN/bootstrap.min.css">
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css">
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">
   
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/cargaArchivoCsvUsu.js"></script>

<title>Carga archivo</title>
<%@ page session="true" %>
<%
String usuario = "";
String nombre = "";
String puesto = "";
String mensaje = (String)request.getAttribute("mensaje");
ArrayList<String> usuariosArr = (ArrayList<String>)request.getAttribute("usuarios");
ArrayList<String> nombIndArr = (ArrayList<String>)request.getAttribute("nombresInd");
ArrayList<String> indInteArr = (ArrayList<String>)request.getAttribute("indInt");

HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
	 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
} else {
usuario = (String)sesionOk.getAttribute("usuario");
nombre = (String)sesionOk.getAttribute("nombre");
puesto = (String)sesionOk.getAttribute("puesto");
}
%>
</head>
<body>
<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>
<div id="cuerpo" class="principal">
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
<div id="CargaXusuario" class="modconf">
<form method="POST" id="cargaCsvUsuario" action="CargaArchivoXusuario">
<input type="hidden" id="usuSel" name="usuSel" value=""></input>
<input type="hidden" id="indSel" name="indSel" value=""></input>
<input type="hidden" id="anioSel" name="anioSel" value=""></input>
<input type="hidden" id="cantMes" name="cantMes" value=""></input>
<div id="escondidos"></div>
	<table>
		<tr><td colspan="8" height="5px"></td></tr>
		<tr>
			<td align="right"><span>Usuario</span></td>
			<td align="left"><select id="cbUsuario" class="form-control" style="width: 100px; padding: 2px 2px 2px 2px" onchange="llenacbAnio()"></select></td>
			<td align="right"><span>A&ntilde;o</span></td>
			<td align="left"><select id="anio2" class="form-control" style="width: 100px; padding: 2px 2px 2px 2px" onchange="llenaIndicador()" disabled="disabled"></select></td>
			<td align="right"><span>Indicador</span></td>
			<td align="left"><select id="indicador" class="form-control" style="width: 100px; padding: 2px 2px 2px 2px" disabled="disabled" onchange=""></select></td>
			<td align="right"><span>Archivo</span></td>
			<td align="left"><input type="file" id="fileInput" class="form-control" style="width: 300px" accept=".csv" onchange="processFiles(this.files)" disabled="disabled"></input></td>
		</tr>
		<tr><td colspan="8" height="5px"></td></tr>
		<tr>
			<td colspan="8">
			<div class="barraazul"></div>
			</td>
		</tr>
		<tr><td colspan="8" height="5px"></td></tr>
		<tr>
			<td colspan="8">
			<div id="infoFile"></div>
			</td>
		</tr>
		<tr>
			<td colspan="8">
				<div id="correcto" class="alert alert-success" role="alert" style="display: none;"><span id="msjSpan"></span></div>
				<div id="fileOutput" class="tablerodos abajo" style="width:900px; overflow: scroll;"></div>
			</td>
		</tr>
		<tr><td colspan="8" height="5px"></td></tr>
		<tr>
			<td colspan="2" height="50px">
				<div id= "error" class="alert alert-danger" role="alert" style="display: none;">El mes no coincide</div>
			</td>
			<td colspan="1"></td>
			<td colspan="2" height="50px">
				<div id="alerta" class="alert alert-warning" role="alert" style="display: none;">El indicador no pertenece al año seleccionado</div>
			</td>
			<td colspan="1" align="center"><button id="btnCarga" class="btn btn-success" onclick="cargaArchivoPorMes()" disabled="disabled" style="display: none;">Carga Archivo</button></td>
		</tr>
	</table>
</form>
<form method="POST" id="linkDireccion1" action="BuscaOpcionesCargaIndInte">
	<input type="hidden" id="linkDestino1" name="linkDestino1" value="">
</form>
<form method="POST" id="confPuestos" action="ConfigPuestos">
</form>
</div>
</div>
</div>
<div id="pie">
	<jsp:include page="Footer.jsp"></jsp:include>
</div>
<script type="text/javascript">
var array_js = "";
var array_js2 = "";
var mensaje = "<%=mensaje%>";
<%//Lo declaramos fuera del bucle, porque sino a veces da problemas
if(nombIndArr != null && indInteArr!=null){
%>
var tamano=<%=usuariosArr.size()%>;
var tamano2=<%=indInteArr.size()%>;
array_js= new Array(tamano);
array_js2=new Array(tamano2);
<%//Lo declaramos fuera del bucle, porque sino a veces da problemas
for(int a=0; a< usuariosArr.size(); a++)
{%>
array_js[<%=a%>]= "<%= usuariosArr.get(a)%>";
// Si no fuera de Strings, quitamos las comillas:
<%}%>
<%//Lo declaramos fuera del bucle, porque sino a veces da problemas
for(int b=0; b< indInteArr.size(); b++)
{%>
array_js2[<%=b%>]= "<%= indInteArr.get(b)%>";
// Si no fuera de Strings, quitamos las comillas:
<%}
}%>
if(array_js != "" && array_js2 != ""){
	iniciaArreglo(array_js,array_js2);
	llenaComboUsuario();
}
validaCarga(mensaje);
</script>
</body>
</html>