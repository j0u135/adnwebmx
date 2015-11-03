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
    <script src="js/conf2.js"></script>
  
<title>Alta y modificación de usuarios</title>
<%@ page import = "com.adn.conexion.Operaciones"%>
<%@ page import = "com.adn.controlador.Area"%>
<%@ page import = "com.adn.controlador.Usuario"%>
<%@ page import = "com.adn.controlador.Rol"%>
<%@ page import = "com.adn.controlador.Departamento"%>
<%@ page import = "com.adn.controlador.Puesto"%>
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
		<%=(request.getAttribute("variableEnviada")!=(null))?request.getAttribute("variableEnviada"): ""%>
    
	  	<form id="busca" action="buscaUsuario" method="post">
	  		<input type="hidden" value="" name="usuarioBuscado" id="usuarioBuscado">
	  	</form>
	  	<form id="guardarUsr" action="guardarUsuario" method="post">
	  	<input type="hidden" id="actualizar" name="actualizar" value="<%=(request.getAttribute("actualizar")!=(null))?request.getAttribute("actualizar"): ""%>">
	  	<input type="hidden" id="msgBus" name="msgBus" value="<%=(request.getAttribute("mensaje")!=(null))?request.getAttribute("mensaje"): ""%>">
	  	<input type="hidden" id="usrAct" name="usrAct" value="">
			<table class="forma2" width="80%" align="center">
				<tr>
					<td width="10px"></td>
					<td width="50px" align="center"><span>Usuario</span></td>
					<td width="200px" align="left"><input type="text" name="usuario" id="user" class="form-control" value="<%=(request.getAttribute("user")!=(null))?request.getAttribute("user"): ""%>"></td>
					<td width="200px"align="center"><a href="#" class="boton" onclick="buscaUsuario()" title="Busca usuario" alt="Busca usuario"><i class="fa fa-search"></i></a>
												   <a href="#" class="boton" onclick="altaUsuario()" title="Alta usuario" alt="Alta usuario"><i class="fa fa-plus"></i></a> 
												   <a href="#" class="boton" id="eliminaUsu" onclick="eliminaUsuario()" title="Elimina usuario" alt="Elimina usuario"><i class="fa fa-times"></i></a>
					</td>
					<td width="40px"></td>
				</tr>
				
			</table>
			<div class="barraazul"></div>
	
	        <table class="forma22" width="80%" align="center">
	        <tr>
	        <td width=50%>
	         <table align="center">
	         <tr>
	                <td width="80px"  align="left"><span>Nombre</span></td>
					<td width="300px" align="left"><input type="text" name="nombre" id="nombre" class="form-control" value="<%=(request.getAttribute("nombre")!=(null))?request.getAttribute("nombre"): ""%>"></td>
				
	         </tr>
	         <tr>
					
					<td width="50px" align="left"><span>Correo</span></td>
					<td width="300px"><input type="text" name="correo" id="correo" class="form-control" value="<%=(request.getAttribute("correo")!=(null))?request.getAttribute("correo"): ""%>"></td>
					
		     </tr>
	         <tr>
	        	<td width="50px" align="left"><span id="lbPassword">Contraseña</span></td>
	        	<td width="300px"align="left"><input type="password" name="password" id="password" class="form-control w200" value="<%=(request.getAttribute("password")!=(null))?request.getAttribute("password"): ""%>"></td>
	         </tr>
	       <tr height=20px>
	       </tr>
	        <tr>
	           
	           <td colspan="2">
                   <table>
                   <tr>
				    <td><span class="izquierda">Personal a cargo</span>
				    </td>
				    <td>
						<select class="personal" id="personal" name="personal">
						<% String perCargoUs = (String)((request.getAttribute("perAcargo")!=(null))?request.getAttribute("perAcargo"): "NO");
							if(perCargoUs.equals("SI")){%>
								<option value="SI" selected="selected">SI</option>
								<option value="NO">NO</option>
						<%}else{%>
							<option value="SI">SI</option>
							<option value="NO" selected="selected">NO</option>
							<%}%>
						</select>
					</td>
				
					
					 <td><span class="izquierda">Autorizador</span>
					 </td>
					 <td>
						<select class="personal" id="autorizador" name="autorizador">
						<% String autorizadorUs = (String)((request.getAttribute("autorizador")!=(null))?request.getAttribute("autorizador"): "NO");
						if(autorizadorUs.equals("SI")){%>
							<option value="SI" selected="selected">SI</option>
							<option value="NO">NO</option>
						<%}else{%>
							<option value="SI">SI</option>
							<option value="NO" selected="selected">NO</option>
							<%}%>
						</select>
					</td>	
				  </tr>
				  </table>
				</td>
			</tr>
	       <tr height=30px></tr>
	        </table>
	        </td>
	        <td width=50%>
	        <table align="center">
	        		<%
						String nombrePuesto="", cvArea="", nombreArea="", cvTpUsr="", tipoUsuario="", busquedaJefes="", busquedaPuesto="", busquedaArea="", busquedaTipoUsuario="";
					%>
	       		<tr>
					
					<td width="50px" align="left"><span>Área</span></td>
					<td width="300px"><select id="area" onchange="llenaDepto()" name="area">
							<option value="0">[Selecciona]</option>
							<%
							String areaUs = (String)((request.getAttribute("area")!=(null))?request.getAttribute("area"): "");
							ArrayList<Area> areas = (ArrayList<Area>)((request.getAttribute("areas")!=(null))?request.getAttribute("areas"): "");
							if(areas!=null && areas.size()>0){
							for(int i=0; i<areas.size();i++){
								Area area = areas.get(i);
								cvArea = area.getIdArea();
								nombreArea=area.getArea();
								if(areaUs!= null && !areaUs.equals("") && areaUs.equals(cvArea)){
							%>
							 	<option value="<%=cvArea%>" selected="selected" ><%=nombreArea%></option>
							<%}else{%>
								<option value="<%=cvArea%>" ><%=nombreArea%></option>
							<%}
							}
							}%>
							</select>
					</select></td>
					
				</tr>
				<tr>
					
					<td width="50px" align="left"><span>Departamento</span></td>
					<td width="300px"><select id="departamento" onchange="llenaPuesto()" name="departamento">
						<option value="0">[Selecciona]</option>
						<%
							String nbDepto, idDepto;
							String deptoUs = (String)((request.getAttribute("depto")!=(null))?request.getAttribute("depto"): "");
							ArrayList<Departamento> deptos = (ArrayList<Departamento>)(request.getAttribute("deptos"));
							if(deptos!=null && !deptos.equals("") && deptos.size()>0){
							for(int i=0; i<deptos.size();i++){
								Departamento deptoCmb = deptos.get(i);
								idDepto=deptoCmb.getIdDepto()+"";
								nbDepto=deptoCmb.getNbDepto();
								if(deptoUs!= null && !deptoUs.equals("") && deptoUs.equals(idDepto)){
							%>
							 	<option value="<%=idDepto%>" selected="selected" ><%=nbDepto%></option>
							<%}else{%>
								<option value="<%=idDepto%>" ><%=nbDepto%></option>
							<%}
							}
							}%>
					</td>
					
				</tr>
				<tr>
					
					<td width="50px" align="left"><span>Puesto</span></td>
					<td width="300px">

					<select id="puesto" name="puesto">
							<option value="0">[Selecciona]</option>
					<%
							String idPuesto, nbPuesto;
							String puestoUS = (String)((request.getAttribute("puesto")!=(null))?request.getAttribute("puesto"): "");
							ArrayList<Puesto> puestos = (ArrayList<Puesto>)request.getAttribute("puestos");
							if(puestos!=null && puestos.size()>0){
							for(int i=0; i<puestos.size();i++){
								Puesto puestoCmb = puestos.get(i);
								nbPuesto=puestoCmb.getNbPuesto();
								idPuesto=puestoCmb.getIdPuesto()+"";
								if(puestoUS!=null && !puestoUS.equals("") && puestoUS.equals(idPuesto)){
								%>
								<option value="<%=idPuesto%>" selected="selected"><%=nbPuesto%></option>
								<%}else{%>
								<option value="<%=idPuesto%>"><%=nbPuesto%></option>
								<%}
							}
							}%>
					</select>		
					</td>
					
				</tr>
				<tr id="Tipo">
					
					<td width="50px"align="left" id="lbTipo"><span>Tipo</span></td>
					<td width="=300px">
					<select id="tipoUsuario" onchange="" name="tipoUsuario">
					<option value="0">[Selecciona]</option>	
						<%
						String tipoUs = (String)((request.getAttribute("tipo")!=(null))?request.getAttribute("tipo"): "Tipo");
						ArrayList<Rol> roles = (ArrayList<Rol>)((request.getAttribute("roles")!=(null))?request.getAttribute("roles"): "");
						if(roles!=null && roles.size()>0){
						for(int i=0; i<roles.size();i++){
							Rol rol = roles.get(i);
							cvTpUsr = rol.getIdRol();
							tipoUsuario=rol.getNombre();
							if(tipoUs!=null && !tipoUs.equals("") && tipoUs.equals(tipoUsuario)){
						%>
						 <option value="<%=cvTpUsr%>" selected="selected"><%=tipoUsuario%></option>
						<%}else{%>
						<option value="<%=cvTpUsr%>"><%=tipoUsuario%></option>
						<%}
						}}%>
					</select>
					</td>
					
				</tr>
	        <tr>
					
					<td align="left"><span>Nombre del jefe Directo</span></td>
					<td><select id="jefe" onchange="" name="jefe">
					<option value="0">[Selecciona]</option>
						<%
						String idjefe = (String)((request.getAttribute("jefe")!=(null))?request.getAttribute("jefe"): "");
						String cvJefe="", nbJefe="", usrJefe="";
						Integer cvJefeInt;
						ArrayList<Usuario> jefes = (ArrayList<Usuario>)((request.getAttribute("jefes")!=(null))?request.getAttribute("jefes"): "");
						if(jefes!=null && jefes.size()>0){
						for(int i=0; i<jefes.size();i++){
							Usuario jefe1 = jefes.get(i);
							cvJefeInt = jefe1.getIdUsuario();
							cvJefe = cvJefeInt.toString();
							nbJefe=jefe1.getNombre()+" - "+jefe1.getCorreo();
							if(idjefe!= null && !idjefe.equals("") &&idjefe.equals(cvJefe)){
						%>
						 <option value="<%=cvJefe%>" selected="selected"><%=nbJefe%></option>
						<%}else{%>
						<option value="<%=cvJefe%>"><%=nbJefe%></option>
						<%}
						}}%>
					</select></td>
					
				</tr>
	        </table>
	        </td>
	        </tr>
	        
	        <tr>
	        <tr height=50px></tr>
	        <table align="left">
	        <tr>
				<td width="150px"></td>
				<td colspan="3" align="left"><a href="#" class="btn btn-success" onclick="validaDatos()">Guardar cambios</a></td>
			</tr>
	        
	        </table>
	
	        </tr>
	        
	        </table> 
	        
			
			</form>
		</div>
	</div>
<form method="POST" id="linkDireccion" action="linkDireccion">
	<input type="hidden" id="linkDestino" name="linkDestino" value="">
</form>
<form method="POST" id="linkDireccion1" action="BuscaOpcionesCargaIndInte">
	<input type="hidden" id="linkDestino1" name="linkDestino1" value="">
</form>
<form method="POST" id="elimina" action="eliminaUsuario">
	<input type="hidden" id="usuarioBusc" name="usuarioBusc" value="<%=(request.getAttribute("user")!=(null))?request.getAttribute("user"): ""%>">
</form>
<form method="POST" id="confPuestos" action="ConfigPuestos">
</form>
<form method="POST" id="cargaCombo" action="cargaCombo">
	<input type="hidden" id="usuBusc" name="usuBusc" value="">
	<input type="hidden" id="nbUsu" name="nbUsu" value="">
	<input type="hidden" id="correoUsu" name="correoUsu" value="">
	<input type="hidden" id="pssUsu" name="pssUsu" value="">
	<input type="hidden" id="persCargoUsu" name="persCargoUsu" value="">
	<input type="hidden" id="autoUsu" name="autoUsu" value="">
	<input type="hidden" id="areaUsu" name="areaUsu" value="">
	<input type="hidden" id="deptoUsu" name="deptoUsu" value="">
	<input type="hidden" id="puestoUsu" name="puestoUsu" value="">
	<input type="hidden" id="tipoUsu" name="tipoUsu" value="">
	<input type="hidden" id="jefeUsu" name="jefeUsu" value="">
	<input type="hidden" id="opUsu" name="opUsu" value="">	
</form>


<script type="text/javascript">
var tipo = "<%=tipo%>";
inicio(tipo);
</script>
</body>
</html>