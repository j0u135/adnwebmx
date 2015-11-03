
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	
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
  
<title>Estrategia - ADN</title>
<%@ page session="true" %>
<%
String usuario = "";
String nombre = "";
String puesto = "";
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
<body class="modulodis">
<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>
<div class="principal">
	<div class="modulo">
		<div class="modizquierda">
			<div class="mods">
				<span class="derecha"><i class="fa fa-users"></i></span>
				<h2>Cultura (Filosofía)</h2>
				<div class="modmenu">
					<p>Principios y Valores</p>
					<p>Propósito Fundamental</p>
					<p>Mantra</p>
					<p>BHAG</p>
					<p>Descripción Vivida</p>
				</div>
			</div>
			<div class="mods">
				<span class="derecha"><img src="ImagenesADN/est.png"></span>
				<h2 onclick="linkDir('Estrategia2.jsp')">Estrategia<br>¿En dónde jugamos?</h2>
				<div class="modmenu">
					<p>Oportunidad</p>
					<p>Segmento</p>
					<p>Modelo de Negocio</p>
					<p>Competencia</p>
				</div>
			</div>
			<div class="mods">
				<span class="derecha"><i class="fa fa-users"></i></span>
				<h2>¿Cómo Ganamos?</h2>
				<div class="modmenu">
					<p>Propuesta de Valor</p>
					<p>Modelo Comercial</p>
					<p>Competencia</p>
				</div>
			</div>
			<div class="mods">
				<span class="derecha"><i class="fa fa-pie-chart"></i></span>
				<h2>Números Inteligentes</h2>
			</div>
			<div class="mods">
				<span class="derecha"><i class="fa fa-pie-chart"></i></span>
				<h2>Prioridades</h2>
			</div>
		</div>
		<div class="modconf">
			<div class="modulotitulos">
				<table align="center" width="100%">
					<tr>
						<td align="center" width="33%"><h1>CULTURA</h1></td>
						<td align="center" width="33%"><h2>¿En qué creemos?</h2></td>
						<td align="center" width="33%"><img src="ImagenesADN/guardar.jpg"></td>
					</tr>
				</table>
			</div>
			<table align="center" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td width="50%">
						<div class="modnuevo">
							<div class="modajustes">
								<span class="ajuste">PRINCIPIOS</span> <span class="boton"><i class="fa fa-plus"></i></span> <span class="boton"><i class="fa fa-pencil"></i></span> <span class="boton"><i class="fa fa-times"></i></span>
							</div>
							<table width="100%" align="center">
								<tr>
									<td><input type="checkbox" id="checkbox-1-1" class="regular-checkbox"><label for="checkbox-1-1"></label> <input type="text" class="vacio" value="Contribución Social"></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="checkbox-1-2" class="regular-checkbox"><label for="checkbox-1-2"></label> <input type="text" class="vacio" value="Equipo y Autogestion"></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="checkbox-1-3" class="regular-checkbox"><label for="checkbox-1-3"></label> <input type="text" class="vacio" value="Aprendizaje"></td>
								</tr>
								<tr class="ultimo">
									<td><input type="checkbox" id="checkbox-1-4" class="regular-checkbox"><label for="checkbox-1-4"></label> <input type="text" class="vacio" value="Pasión"></td>
								</tr>
							</table>
						</div>
					</td>
					<td width="50%">
						<div class="modnuevo">
							<div class="modajustes">
								<span class="ajuste">VALORES</span> <span class="boton"><i class="fa fa-plus"></i></span> <span class="boton"><i class="fa fa-pencil"></i></span> <span class="boton"><i class="fa fa-times"></i></span>
							</div>
							<table width="100%" align="center">
								<tr>
									<td><input type="checkbox" id="checkbox-2-1" class="regular-checkbox"><label for="checkbox-2-1"></label> <input type="text" class="vacio" value="Respeto"></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="checkbox-2-2" class="regular-checkbox"><label for="checkbox-2-2"></label> <input type="text" class="vacio" value="Honestidad"></td>
								</tr>
								<tr>
									<td><input type="checkbox" id="checkbox-2-3" class="regular-checkbox"><label for="checkbox-2-3"></label> <input type="text" class="vacio" value="Integridad"></td>
								</tr>
								<tr class="ultimo">
									<td><input type="checkbox" id="checkbox-2-4" class="regular-checkbox"><label for="checkbox-2-4"></label> <input type="text" class="vacio" value=""></td>
								</tr>
							</table>
						</div>
					</td>
				</tr>
			</table>
			<table align="center" width="100%">
				<tr>
					<td width="60%">
						<div class="modnuevo">
							<div class="modajustes">
								<span class="ajuste">PROPÓSITO</span> <span class="boton"><i class="fa fa-times"></i></span>
							</div>
							<textarea class="form-control"></textarea>
						</div>
					</td>
					<td width="40%">
						<div class="modnuevo">
							<div class="modajustes">
								<span class="ajuste">MANTRA</span> <span class="boton"><i class="fa fa-times"></i></span>
							</div>
							<textarea class="form-control"></textarea>
						</div>
					</td>
				</tr>
			</table>
			<table align="center" width="100%">
				<tr>
					<td width="50%">
						<div class="modnuevo">
							<div class="modajustes">
								<span class="ajuste">BHAG</span> <span class="boton"><i class="fa fa-pencil"></i></span> Año <select class="bhagano"><option value=""></option></select> Reto <select class="bhagreto"><option value=""></option></select>
							</div>
							<table width="100%" align="center" class="bhag">
								<tr>
									<th align="center">Metas</th>
								</tr>
								<tr>
									<td><input type="text" class="vacio"></td>
								</tr>
							</table>
						</div>
					</td>
					<td width="50%">
						<div class="modnuevo">
							<div class="modajustes">
								<span class="ajuste">DESCRIPCIÓN VIVIDA (Misión)</span> <span class="boton"><i class="fa fa-pencil"></i></span>
							</div>
							<textarea class="form-control"></textarea>
						</div>
					</td>
				</tr>
			</table>
		</div>
	</div>
	<div id="pie">
		<jsp:include page="Footer.jsp"></jsp:include>
	</div>
<form method="POST" id="redireccion" action="CargaInterfazIndicadores">
	<input type="hidden" id="usuarioRedireccion" name="usuarioRedireccion" value="">
	<input type="hidden" id="mesEnviado" name="mesEnviado" value="">
	<input type="hidden" id="origen" name="origen" value="">
</form>
</body>
</html>