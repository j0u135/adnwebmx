<%@page import="com.adn.controlador.Comentarios"%>
<%@page import="com.adn.controlador.Usuario"%>
<%@page import="java.util.ArrayList"%>


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/bootstrap.min.css">
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">
    <link href="EstilosADN/ui.css" rel="stylesheet">
    
	<link rel="stylesheet" href="EstilosADN/dis.css" type="text/css"> 
	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css" type='text/css'>
    
    
    <script src="js/jquery.min.js"></script>
    <script src="js/interfaz7.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/bootstrap.min.js"></script>
	<link href="EstilosADN/font-awesome.min.css" rel="stylesheet">


<title>Aprobaciones</title>
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

<script type="text/javascript">
    $(window).load(function(){
    	$("#example").modal({backdrop: "static"});
    	$('#example').modal('show');
        
    });
</script>
</head>
<body class="modulodis">
<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>

<div id="cuerpo" class="principal">	
	<table width=100%>
	<tr>
	<td>
	<div class="interfaz">
	<div class="barratitulo" style="padding: 4px 2px 20px 20px">Solicitud de Aprobación</div>
		<div class="barraopciones" >	</div>
			<form method="POST" id="consultaAprobadores1" action="consultaAprobadores1">
				<!-- <input type="hidden" name="namemodalhiden" id="namemodalhiden" value=""/> 
				<input type="hidden" name="hidenapro" id="hidenapro" value=""/>-->
				<input type="hidden" name="usuariohidenA1" id="usuariohidenA1" value="<%=usuario%>"/>
				<input type="hidden" name="meshidA1" id="meshidA1" value=""/>
			</form>
				
			<form method="POST" id="guardaComen" action="guardaComen">
				<input type="hidden" name="usuarioACm" id="usuarioACm" value="<%=usuario%>"/>
				<input type="hidden" name="aprocomen" id="aprocomen" value="">
				<input type="hidden" name="comentario" id="comentario" value="">
				<input type="hidden" id="mesre" name="mesre" value="<%=(request.getAttribute("mesre")!=(null))?request.getAttribute("mesre"): ""%>">
				<input type="hidden" id="origen" name="origen" value="1">
			</form>
			
			<form method="POST" id="redireccion" action="CargaInterfazIndicadores">
				<input type="hidden" id="usuarioRedireccion" name="usuarioRedireccion" value="">
				<input type="hidden" id="mesEnviado" name="mesEnviado" value="">
				<input type="hidden" id="origen" name="origen" value="<%=usuario%>">
			</form>
			
			<form method="POST" id="GuardaAprobadores" action="GuardaAprobadores">
				<input type="hidden" name="usuarioaa1" id="usuarioaa1" value="<%=usuario%>"/>
				<input type="hidden" name="mesauno" id="mesauno" value=""/>
				<input type="hidden" name="nuevoApro" id="nuevoApro" value=""/>
				<input type="hidden" id="fchch" name="fchch" value=""/>
				<input type="hidden" id="mesre" name="mesre" value="<%=(request.getAttribute("mesre")!=(null))?request.getAttribute("mesre"): ""%>">
				<input type="hidden" id="usure" name="usure" value="<%=(request.getAttribute("usure")!=(null))?request.getAttribute("usure"): ""%>">
			</form>
			
			<form method="POST" id="EliminaAprobador" action="EliminaAprobador">
				<!-- <input type="hidden" name="namemodalhiden" id="namemodalhiden" value=""/> -->
				<input type="hidden" name="usuariohidenAE1" id="usuariohidenAE1" value="<%=usuario%>"/>
				<input type="hidden" id="apElim" name="apElim" value=""/>
				<input type="hidden" id="numApElim" name="numApElim" value=""/>
				<input type="hidden" id="mesre" name="mesre" value="<%=(request.getAttribute("mesre")!=(null))?request.getAttribute("mesre"): ""%>">
				<input type="hidden" id="usure" name="usure" value="<%=(request.getAttribute("usure")!=(null))?request.getAttribute("usure"): ""%>">
			</form>
			<form method="POST" id="ControlAprobaciones" action="ControlAprobaciones">
				<input type="hidden" id="usuHojaRumbo" name="usuHojaRumbo" value="<%=usuario%>">
			</form>
	<!--Modal -->
<br>
<div id="example" class="modal fade ">
<div class="modal-dialog ">
<div class="modal-content fondoadn sombramodal " style="height:550px; width:800px;">
	<div class="modal-header headeradn">       
        	<a class="close" data-dismiss="modal" onclick="controlAprob()"><i class="fa fa-times fa-lg" style="color:#ff0000; padding:10px 0px 0px 0px;"></i></a>
            <h5 class="negritas m-t-15">Solicitud de aprobación</h5>
  	</div>
    <div class="modal-body" style="border-top: 2px solid #B5B7B9; overflow:scroll; height:170px;">
		
			
			<% String numAprobadores = (String)request.getAttribute("numApro");
				int numApro=0;
				if(numAprobadores!=null){
					numApro = Integer.parseInt(numAprobadores);
				}
				if(numApro<4){
			%>
			<table id="aprobadoresDisponibles" width=100% align="left">
				<tbody>
				<%if(request.getAttribute("estApro").equals("Pendiente")){%>
					<tr>
						<td>
						<label class="nopadding">Aprobadores disponibles: </label>
						</td>				
						<td>
							<select id="jefes" class="form-control" style="padding: 2px 2px 2px 2px" onchange="" name="jefes">
							<option value="">[Selecciona]</option>
							<%
							ArrayList<Usuario> arrJefes = (ArrayList<Usuario>)request.getAttribute("jefes");
							for(int i=0; i<arrJefes.size();i++){
								Usuario usu = arrJefes.get(i);
								%>
						  		<option value="<%=usu.getCorreo()%>"><%=usu.getNombre()%></option>
							<%}%>	
						</td>
						<td>
							<a class="boton" id="botonAlta" alt="Agregar" title="Agregar" onclick="funGuardarAprobadores()">
								<i class="fa fa-plus"></i>
							</a>
						</td>
					</tr>
					<%}%>
				</tbody>
			</table>
			<%}%>
	<form method="POST" id="solicitarApro" action="solicitarApro">
	<input type="hidden" id="usap" name="usap" value="<%=usuario%>">
	<input type="hidden" id="usumes" name="usumes" value="">
	<input type="hidden" id="usap1" name="usap1" value="">
	<input type="hidden" id="usap2" name="usap2" value="">
	<input type="hidden" id="usap3" name="usap3" value="">
	<input type="hidden" id="usap4" name="usap4" value="">
	<input type="hidden" id="fch20" name="fch20" value="">
	<input type="hidden" name="comentSolicita" id="comentSolicita" value="">
	
	
	<table width=100%>
		<tr>
			<td>
				<table id="contenidoApro" align="center"  width="800px" class="table table-bordered" >
					<tr>
						<td width="35%" class="negritas titulotablero" align="center">Aprobador</td>
						<td width="35%" class="negritas titulotablero" align="center">Correo</td>
						<td width="15%" class="negritas titulotablero" align="center">Estatus</td>
						<%if(request.getAttribute("estApro").equals("Pendiente")){%>
						<td width="15%" class="negritas titulotablero" align="center">Acciones</td>
						<%}%>
						<input name="v" id="v" type="hidden" value="<%=(request.getAttribute("mesA1")!=(null))?request.getAttribute("mesA1"): ""%>">
					</tr>
						<%
						int cantAporb=0;
						String check1="false", check2="false",check3="false", check4="false";
						if(!request.getAttribute("apro1").equals(null) && !request.getAttribute("apro1").equals("")){
						cantAporb++;%>
					<tr>
						<td class="filauno primercolumna">
							<span name="NbAprobador1" id="NbAprobador1" type="text" class="vacio derecha"><%=(request.getAttribute("nbApro1")!=(null))?request.getAttribute("nbApro1"): ""%></span>
							<%if(request.getAttribute("rapro1")!=(null)&&!request.getAttribute("rapro1").equals("estatusverde"))
							{
								check1="true";%>
								<input type="checkbox" id="checkbox-1-1" class="regular-checkbox" />
								<label for="checkbox-1-1"></label>
							<%}%>				
						</td>
						<td class="filauno ">
							<input name="aprobador1" id="aprobador1" type="text" class="vacio derecha"  value="<%=(request.getAttribute("apro1")!=(null))?request.getAttribute("apro1"): ""%>">				
						</td>
						<td class="filauno ultimacolumna">
							<div id="div1" name="div1" class="<%=(request.getAttribute("rapro1")!=(null))?request.getAttribute("rapro1"): ""%>">
								<span id="textDiv1" type="text" class="vacio estatus">
									<%if(request.getAttribute("rapro1")!=(null)&&request.getAttribute("rapro1").equals("estatusverde")){%>
										Aprobado	
									<%}else if(request.getAttribute("rapro1")!=(null)&&request.getAttribute("rapro1").equals("estatusrojo")){%>
										Denegado
									<%}else if(request.getAttribute("rapro1")!=(null)&&request.getAttribute("rapro1").equals("estatusazul")){%>
										Solicitada
									<%}else if(request.getAttribute("rapro1")!=(null)&&request.getAttribute("rapro1").equals("estatusblanco")){%>
										Pendiente
									<%}%>
								</span>
							</div>
						</td>
						<%if(request.getAttribute("estApro").equals("Pendiente")){%>
						<td class="filauno ultimacolumna" align="center">
							<a class="boton" id="botonElimina1" alt="Eliminar" title="Eliminar"  onclick="eliminaAprobador(1)">
								<i class="fa fa-times"></i>
							</a>
						</td>
						<%}%>
					</tr>
						<%}%>
						<%if(!request.getAttribute("apro2").equals(null) && !request.getAttribute("apro2").equals("")){
						cantAporb++;%>
					<tr>
						<td class="primercolumna">
							<span name="NbAprobador2" id="NbAprobador2" type="text" class="vacio derecha"><%=(request.getAttribute("nbApro2")!=(null))?request.getAttribute("nbApro2"): ""%></span>
							<%if(request.getAttribute("rapro2")!=(null)&&!request.getAttribute("rapro2").equals("estatusverde"))
							{
								check2="true";
							%>
								<input type="checkbox" id="checkbox-1-2" class="regular-checkbox" />
								<label for="checkbox-1-2"></label>	
							<%}%>			
						</td>
						<td class="ultimacolumna">
							<input name="aprobador2" id="aprobador2" type="text" class="vacio derecha" value="<%=(request.getAttribute("apro2")!=(null))?request.getAttribute("apro2"): ""%>">
						</td>
						<td class="ultimacolumna">
							<div id="div2" name="div2" class="<%=(request.getAttribute("rapro2")!=(null))?request.getAttribute("rapro2"): ""%>">
								<span id="textDiv2" type="text" class="vacio estatus">
									<%if(request.getAttribute("rapro2")!=(null)&&request.getAttribute("rapro2").equals("estatusverde")){%>
										Aprobado	
									<%}else if(request.getAttribute("rapro2")!=(null)&&request.getAttribute("rapro2").equals("estatusrojo")){%>
										Denegado
									<%}else if(request.getAttribute("rapro2")!=(null)&&request.getAttribute("rapro2").equals("estatusazul")){%>
										Solicitada
									<%}else if(request.getAttribute("rapro2")!=(null)&&request.getAttribute("rapro2").equals("estatusblanco")){%>
										Pendiente
									<%}%>
								</span>
							</div>
						</td>
						<%if(request.getAttribute("estApro").equals("Pendiente")){%>
						<td class="filauno ultimacolumna" align="center">
							<a class="boton" id="botonElimina2" alt="Eliminar" title="Eliminar"  onclick="eliminaAprobador(2)">
								<i class="fa fa-times"></i>
							</a>
						</td>
						<%}%>
					</tr>
					<%}%>
					<%if(!request.getAttribute("apro3").equals(null) && !request.getAttribute("apro3").equals("")){
					cantAporb++;%>
					<tr>
						<td class="primercolumna">
							<span name="NbAprobador3" id="NbAprobador3" type="text" class="vacio derecha"><%=(request.getAttribute("nbApro3")!=(null))?request.getAttribute("nbApro3"): ""%></span>
							<%if(request.getAttribute("rapro3")!=(null)&&!request.getAttribute("rapro3").equals("estatusverde"))
							{
								check3="true";
							%>
								<input type="checkbox" id="checkbox-1-3" class="regular-checkbox" />
								<label for="checkbox-1-3"></label>	
							<%}%>			
						</td>
						<td class="ultimacolumna">
							<input name="aprobador3" id="aprobador3" type="text" class="vacio derecha" value="<%=(request.getAttribute("apro3")!=(null))?request.getAttribute("apro3"): ""%>">
						</td>

						<td class="ultimacolumna">
							<div id="div3" name="div3" class="<%=(request.getAttribute("rapro3")!=(null))?request.getAttribute("rapro3"): ""%>">
								<span id="textDiv3" type="text" class="vacio estatus">
									<%if(request.getAttribute("rapro3")!=(null)&&request.getAttribute("rapro3").equals("estatusverde")){%>
										Aprobado	
									<%}else if(request.getAttribute("rapro3")!=(null)&&request.getAttribute("rapro3").equals("estatusrojo")){%>
										Denegado
									<%}else if(request.getAttribute("rapro3")!=(null)&&request.getAttribute("rapro3").equals("estatusazul")){%>
										Solicitada
									<%}else if(request.getAttribute("rapro3")!=(null)&&request.getAttribute("rapro3").equals("estatusblanco")){%>
										Pendiente
									<%}%>
								</span>
							</div>
						</td>
						<%if(request.getAttribute("estApro").equals("Pendiente")){%>
						<td class="filauno ultimacolumna" align="center">
							<a class="boton" id="botonElimina3" alt="Eliminar" title="Eliminar"  onclick="eliminaAprobador(3)">
								<i class="fa fa-times"></i>
							</a>
						</td>
						<%}%>
					</tr>
					<%}%>
					<%if(!request.getAttribute("apro4").equals(null) && !request.getAttribute("apro4").equals("")){
					cantAporb++;%>
					<tr>
						<td>
							<span name="NbAprobador4" id="NbAprobador4" type="text" class="vacio derecha"><%=(request.getAttribute("nbApro4")!=(null))?request.getAttribute("nbApro4"): ""%></span>
							<%if(request.getAttribute("rapro4")!=(null)&&!request.getAttribute("rapro4").equals("estatusverde"))
							{
								check4="true";
							%>
								<input type="checkbox" id="checkbox-1-4" class="regular-checkbox" />
								<label for="checkbox-1-4"></label>	
							<%}%>			
						</td>
						<td >
							<input name="aprobador4" id="aprobador4" type="text" class="vacio derecha" value="<%=(request.getAttribute("apro4")!=(null))?request.getAttribute("apro4"): ""%>">
						</td>

						<td >
							<div id="div4" name="div4" class="<%=(request.getAttribute("rapro4")!=(null))?request.getAttribute("rapro4"): ""%>">
								<span id="textDiv4" type="text" class="vacio estatus">
									<%if(request.getAttribute("rapro4")!=(null)&&request.getAttribute("rapro4").equals("estatusverde")){%>
										Aprobado	
									<%}else if(request.getAttribute("rapro4")!=(null)&&request.getAttribute("rapro4").equals("estatusrojo")){%>
										Denegado
									<%}else if(request.getAttribute("rapro4")!=(null)&&request.getAttribute("rapro4").equals("estatusazul")){%>
										Solicitada
									<%}else if(request.getAttribute("rapro4")!=(null)&&request.getAttribute("rapro4").equals("estatusblanco")){%>
										Pendiente
									<%}%>
								</span>
							</div>
						</td>
						<%if(request.getAttribute("estApro").equals("Pendiente")){%>
						<td >
							<a class="boton" id="botonElimina4" alt="Eliminar" title="Eliminar" onclick="eliminaAprobador(4)">
								<i class="fa fa-times"></i>
							</a>
						</td>
						<%}%>
					</tr>	
					<%}%>			
				</table>
			</td>
		</tr>
	</table>
	<input type="hidden" id="CantAprob" name="CantAprob" value="<%=cantAporb%>">
	<input type="hidden" id="chkApro1" name="chkApro1" value="<%=check1%>">
	<input type="hidden" id="chkApro2" name="chkApro2" value="<%=check2%>">
	<input type="hidden" id="chkApro3" name="chkApro3" value="<%=check3%>">
	<input type="hidden" id="chkApro4" name="chkApro4" value="<%=check4%>">
	</form>
	
				
		</div>		
		<div class="modal-body" style="overflow:scroll; height:165px; padding-top:0px;">		
			<h4 align="left" class="aprobadores m-t-0">Comentarios</h4>		
				<%
					ArrayList<Comentarios> arrComents = (ArrayList<Comentarios>)request.getAttribute("comentarios");
					String fechac="", comen="", obserc="";
					int contador5=0;
					if(arrComents!=null && arrComents.size()>0){
				%>
				
				<table width="800" class="table table-bordered table-striped" >
					<tr height=25px>
						<td class="negritas titulotablero" align="center" width="15%">Mes</td>
						<td class="negritas titulotablero" align="center" width="30%">Usuario</td>
						<td class="negritas titulotablero" align="center" width="55%">Comentarios</td>
					</tr>
					
					<%
					for(int i=0; i<arrComents.size();i++){
						Comentarios coment = arrComents.get(i);
						fechac=coment.getFecha();
						comen=coment.getComentario();
						obserc=coment.getObservador();
						contador5++;
					%>
					<tr height=3px>
						<td align="center" >
							<input type="text" class="vacio" value="<%=fechac%>">
						</td>
						<td align="center" >
							<input type="text" class="vacio" value="<%=obserc%>">
						</td>
						<td align="center" >
							<input type="text" class="vacio" value="<%=comen%>">
						</td>
					</tr>
						<td style='display:none'><input size='7' type='text' class='form-control estatus' name='conta5' id='conta5' value="<%=contador5%>"></td>
									
					<%}%>
				</table>
			   	
				<%}%>				
			</div>
			<div class="modal-body" style="border-top: 2px solid #B5B7B9; padding-top:0px;">
				<table width=100%>
				<tr>
				<td>
				<h4 align="left" class="aprobadores">Nuevo Comentario</h4>
				<%if(!request.getAttribute("estApro").equals("Aprobada")){%>
				<textarea style="width:100%; height:40px;" name="comenA" id="comenA" size="20" maxlength="200" class="form-control"></textarea>
				<%}%>
				</td>
				</tr>
			  </table>
			</div>
			
			 <div class="modal-footer" style="border-top: 2px solid #B5B7B9; ">
        	<%if(!request.getAttribute("estApro").equals("Aprobada")){%>
				<a class="btn btn-success btn-sm" align="right"  onclick="solicitarApro()">Enviar Solicitud</a> 	
				<%}%>
				<a class="btn btn-danger btn-sm" align="right"  onclick="controlAprob()">Cancelar</a>
		</div>
		</div>
    </div>
   </div>
  </div>
  </td>
  </tr>
  </table><!-- id cuerpo -->
</div><!-- Principal -->

<script>
inicio();
function inicio(){
	var mesNum = <%=(request.getAttribute("mesre")!=(null))?request.getAttribute("mesre"): ""%>;
	var mesLet = regresaNombreMes(mesNum);
	document.getElementById("mesLetra").innerHTML =" del mes de "+mesLet;
}
</script>
</body>
</html>