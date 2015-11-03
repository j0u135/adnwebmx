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
  
<title>Welcome ADN</title>

<%@ page session="true" %>
<%
String usuario = "";
String nombre1 = "";
String puesto = "";
String auto = "";
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
	 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
} else {
usuario = (String)sesionOk.getAttribute("usuario");
nombre1 = (String)sesionOk.getAttribute("nombre");
puesto = (String)sesionOk.getAttribute("puesto");
auto = (String)sesionOk.getAttribute("autorizador");
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

<div class="principal">
	<frameset rows="200,*,100" frameborder="no" border="0" framespacing="0">
		<frame name="cabecera" id="cabecera">  
			<jsp:include page="Header.jsp">
				<jsp:param name="usuario" value="<%=usuario%>" />
				<jsp:param name="nombre" value="<%=nombre1%>" />
				<jsp:param name="puesto" value="<%=puesto%>" />
				<jsp:param name="autorizador" value="<%=auto%>" />
			</jsp:include>
		</frame>
		<frame name="cuerpo" id="cuerpo">
		 	<jsp:include page="Inicio.jsp"></jsp:include>
		</frame> 	
		<frame name="pie" id="pie"> 
			<jsp:include page="Footer.jsp"></jsp:include>
		 </frame>
	</frameset>
</div>
</body>
</html>