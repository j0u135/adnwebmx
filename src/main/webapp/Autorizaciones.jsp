<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

	 <link rel="stylesheet" href="EstilosADN/bootstrap.min.css">
     <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css">
     <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">    
     <link href="EstilosADN/ui.css" rel="stylesheet">
     <link rel="stylesheet" href="EstilosADN/jquery-ui.css" rel="stylesheet" type="text/css">
     <link href="EstilosADN/style.css" rel="stylesheet">
     <link href="EstilosADN/theme.css" rel="stylesheet">
     <link rel="stylesheet" href="EstilosADN/dis.css" rel="stylesheet" type="text/css">
     
     <script src="js/jquery.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/jquery-ui.js"></script>
     <script src="js/autorizaciones.js"></script>
  
<title>Autorizaciones</title>

<%@ page session="true" %>
<%@page import="java.util.ArrayList"%>
<%@ page import = "com.adn.controlador.AutorizaCambioFiltro"%> 
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
</head>
<body>

<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>

<div class="modaladn">

</div>

<div class="contenido bodyadn sombramodal">
<form method="POST" id="autoriza" action="actualizaAutorizacionesFiltros">
<input type="hidden" id="usuarioSes" name="usuarioSes" value="<%=(request.getAttribute("usuarioSes")!=(null))?request.getAttribute("usuarioSes"): ""%>">
<input type="hidden" id="accionTodos" name="accionTodos" value="">
<input type="hidden" id="accionUno" name="accionUno" value="">
<input type="hidden" id="claveAutorizacion" name="claveAutorizacion" value="">
<input type="hidden" id="claveFiltro" name="claveFiltro" value="">
<div class="modal-header headeradn">
       <a class="close" onclick="linkDir('Index.jsp')"><i class="fa fa-times fa-lg" style="color:#ff0000; padding:10px 0px 0px 0px;"></i></a>
       <h5 class="negritas"><i class="fa fa-eye fa-lg " style="color:#FFFFFF;" ></i> Nueva Iniciativa</h5>
  </div>
        <div class="modal-body">
       		<table align="center">
       		    <tr height=5px></tr>
       			<tr>
	       			<td>
						<a class="btn btn-default" href="#" onclick="autorizaTodos()">
		                 <i class="fa-check-circle fa-lg"></i> Aprobar Todas</a>
					</td>
			        <td >
						<a class="btn btn-default" href="#" onclick="borraTodos()">
		                 <i class="fa fa-trash-o fa-lg"></i> Borrar Todas</a>
					</td>
		        </tr> 
			</table>
       	</div>
        <div class="modal-body" style="border-top: 2px solid #B5B7B9; overflow: scroll; height:250px;"">
        	<table class="table table-striped table table-bordered table table-hover" style="font-size:10px;" >
               <thead>
	               <tr>
		       			<th width=300px><strong>Nombre del NI</strong></th>
		       			<th width=200px><strong>Campo Modificado</strong></th>
		       			<th width=200px><strong>Valor Anterior</strong></th>
		       			<th width=200px><strong>Valor Nuevo</strong></th>
		       			<th colspan=2><strong>Accion</strong></th>
				   </tr>
			   </thead>	
			   <tbody>	
			   <%
			   ArrayList<AutorizaCambioFiltro> arrAutorizaciones =(ArrayList<AutorizaCambioFiltro>)request.getAttribute("arrCambios");
			   if(arrAutorizaciones!=null && arrAutorizaciones.size()>0){
				   for(int i=0; i<arrAutorizaciones.size(); i++){
					   AutorizaCambioFiltro autoCambio = arrAutorizaciones.get(i);
					   String idFiltroInd = autoCambio.getIdFiltroIndicador()+"";
					   String idAutoCambioFiltros = autoCambio.getIdAutoCambioFiltro()+"";
					   String nbIndicador = autoCambio.getNbIndicador();
					   String nbCampo = autoCambio.getNbCampo();
					   String valAnt = autoCambio.getValorAnterior();
					   String valNue = autoCambio.getValorNuevo();
				%>					   
					<tr>
						<td id="cambio"+<%=i%> name="cambio"+<%=i%> ><%=nbIndicador%>
							<input type="hidden" id="filtro<%=i%>" name="filtro<%=i%>" value=<%=idFiltroInd%> >
							<input type="hidden" id="idAutoCambioFiltros<%=i%>" name="idAutoCambioFiltros<%=i%>" value=<%=idAutoCambioFiltros%> >
						</td>
						<td><%=nbCampo%></td>
						<td><%=valAnt%></td>
						<td><%=valNue%></td>
						<td><a onclick="autoriza(<%=i%>)" id="aut"+<%=i%> class="btn btn-primary btn-xs" style="font-size:9px;">Autorizar</a></td>
						<td><a onclick="borrar(<%=i%>)" id="bor"+<%=i%> class="btn btn-danger btn-xs" style="font-size:9px;">Borrar</a></td>
					</tr>   
				<%	   
				   }
			   }
			   %>
				</tbody>
			</table>		
       	</div>
        <div class="modal-footer" style="border-top: 2px solid #B5B7B9; padding:10px 40px 0px 0px">
        	<a onclick="linkDir('Index.jsp')" id="btnAceptar" class="btn btn-success">Guardar</a>
            <a onclick="linkDir('Index.jsp')" class="btn btn-danger" data-dismiss="modal">Cerrar</a>
		</div>
</form>
</div>
<div class="principal contenido" style="background:#F5F0F5;">
<div class="containernuevo" style="width:40%;float:right;height:500px">
<ul class="bxslider">
  <li><img src="ImagenesADN/slide4.jpg" /></li>
</ul>
</div>

<div class="containernuevo" style="width:60%;float:left;height:500px"></div>
</div>
</div>

</body>
</html>