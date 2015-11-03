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
    <script src="js/Conf4.js"></script>
  
<title>Configuracion</title>
<%@ page import = "com.adn.controlador.Area"%>
<%@page import="java.util.ArrayList"%>
<%@ page session="true" %>
<%
String usuario = "";
String nombre1 = "";
String puesto = "";
ArrayList<Area> arrAreas = (ArrayList<Area>)request.getAttribute("areas");
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
		 <table align="center" width="1200px">
        <tr>
            <td align="center">
              <div id="Roles">
              	<div id="divAltaArea" style="display: none;">
					<div align="center" class="titulodivs">Alta de área</div>
					<br>
					<div>
						<form id="altaArea" action="RegistroRol" method="post">
						<input type="hidden" id="accion" name="accion" value="Area">
							<table>
								<tr>
				                    <td><span>*&Aacute;rea:</span></td>
				                    <td><input type="text" size="20" id="area" name="area" class="form-control"></td>
								</tr>
								<tr>
				                    <td><span>Descripci&oacute;n del &aacute;rea:</span></td>
				                    <td><input type="text" size="50" id="descArea" name="descArea" class="form-control"></td>
				                    <td align="center">
								    	<a href="#" class="btn btn-success" onclick="guardarArea()">Guardar área</a>
								    	<a href="#" class="btn btn-danger " onclick="cancelar()">Cancelar</a>
								    </td>
								</tr>
								<tr><td><br></td></tr>
							</table>
						</form>
					</div>
				</div>
				<br>
				<div id="divAltaPuesto" style="display: inline;">
					<div align="center" style="width: 30%;" class="titulodivs">Alta de departamentos</div>
					<br>
					<div>
						<form id="altaPuesto" action="RegistroRol" method="post">
						<input type="hidden" id="usuSes" name="usuSes" value="<%=usuario%>"> 
							<table>
								<tr>
				                    <td><span>*&Aacute;rea:</span></td>
				                    <td>
				                    	<select id="cbArea" name="cbArea" class="form-control" style="padding: 2px 2px 2px 2px" onchange="validaOp()">
				                    	<option value="[Seleccione]" >[Seleccione]</option>
										<%
										Area obj=new Area();
										String cvArea="", nbArea="";
										if(arrAreas!=null && !arrAreas.equals("")){
											for(int i=0;i<arrAreas.size();i++){
												obj = arrAreas.get(i);
												cvArea = obj.getIdArea();
												nbArea = obj.getArea();
											%>
											<option value="<%=cvArea%>" ><%=nbArea%></option>
											<%
											}
										}%>
										<option value="nuevaArea" >Genera una nueva área</option>
				                    </td>
								</tr>
								<tr>
				                    <td><span>*Nombre del departamento:</span></td>
				                    <td><input type="text" size="20" id="nombre" name="nombre" class="form-control"></td>
								</tr>
								<tr>
				                    <td><span>Descripci&oacute;n del departamento:</span></td>
				                    <td><input type="text" size="50" id="desc" name="desc" class="form-control"></td>
				                    <td align="center">
								    	<a href="#" class="btn btn-success" onclick="guardarPuesto()">Guardar</a>
								    </td>
								</tr>
								<tr><td><br></td></tr>
							</table>
						</form>
					</div>
					</div>
				</div>
            </td>
        </tr>
    </table>
			
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
$('.bxslider').bxSlider({
	  auto: true,
	  autoControls: true
	});
	
var mesNumerico="";

function obtieneMes(){
	//Obtiene mes actual
		var fechaActual = new Date(); 
		mesActual=fechaActual.getMonth();
		anoActual=fechaActual.getFullYear();
		mesNumerico=mesActual;
	}
</script>
</body>
</html>