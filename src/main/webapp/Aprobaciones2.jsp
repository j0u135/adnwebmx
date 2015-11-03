<%@page import="com.adn.controlador.Usuario"%>
<%@page import="com.adn.controlador.Comentarios"%>
<%@page import="com.adn.controlador.HojaRumbo"%>
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
String correoUsu ="";
HttpSession sesionOk = request.getSession();
if (sesionOk.getAttribute("usuario") == null) {
	 request.getRequestDispatcher("LoginADN.jsp").forward(request, response);
} else {
usuario = (String)sesionOk.getAttribute("usuario");
nombre1 = (String)sesionOk.getAttribute("nombre");
puesto = (String)sesionOk.getAttribute("puesto");
correoUsu = (String)sesionOk.getAttribute("correo");
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
<script language="javascript">
window.onload = function() {
estatus();
estatus2();
estatusa();

}
</script>

<body onload="estatus();estatus2();">
<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>
<div class="principal">
		
	<table width="100%">
	<tr>
	<td>
	<div class="interfaz">
	<div class="barratitulo" style="padding: 4px 2px 20px 20px">Aprobación de Periodo</div>
		<div class="barraopciones" >	</div>
	<br>
	<br>
	<form method="POST" id="consultaAprobadores1" action="consultaAprobadores1"> 
		<input type="hidden" name="hidenapro" id="hidenapro" value=""/>
		<input type="hidden" name="usuariohidenA1" id="usuariohidenA1" value="<%=correoUsu%>"/>
		<input type="hidden" name="meshidA1" id="meshidA1" value=""/>
	</form>	
					
	<form method="POST" id="redireccion" action="CargaInterfazIndicadores">
		<input type="hidden" id="usuarioRedireccion" name="usuarioRedireccion" value="">
		<input type="hidden" id="mesEnviado" name="mesEnviado" value="">
		<input type="hidden" id="origen" name="origen" value="<%=usuario%>">
	</form>
	
	<form method="POST" id="consultaAprobadores2" action="consultaAprobadores2">
		<input type="hidden" name="hidennombrea1" id="hidennombrea1" value=""/> 
		<input type="hidden" name="hidenapro" id="hidenapro" value=""/>	
		<input type="hidden" name="hidenmesa1" id="hidenmesa1" value=""/>
	</form>	
	<form method="POST" id="ControlAprobaciones" action="ControlAprobaciones">
	<input type="hidden" id="usuHojaRumbo" name="usuHojaRumbo" value="<%=usuario%>">
	</form>
					
	<form method="POST" id="apruebaUsuario" action="apruebaUsuario">
		<input type="hidden" name="mailAprobador" id="mailAprobador" value="">
		<input type="hidden" name="nombreAprobador" id="nombreAprobador" value="">
		<input type="hidden" name="usuarioSes" id="usuarioSes" value="<%=usuario%>">
		<input type="hidden" name="acAprobado" id="acAprobado" value="<%=(request.getAttribute("UsuSel")!=(null))?request.getAttribute("UsuSel"):""%>"/>
		<input type="hidden" name="mesApro" id="mesApro" value="<%=(request.getAttribute("mesre2")!=(null))?request.getAttribute("mesre2"): ""%>">
		<input type="hidden" name="comentApro" id="comentApro" value="">
		<input type="hidden" name="numApro" id="numApro" value="">
	</form>
					
	<form method="POST" id="denegarUsuario" action="denegarUsuario">
		<input type="hidden" name="mailAprobador1" id="mailAprobador1" value="">
		<input type="hidden" name="nombreAprobador1" id="nombreAprobador1" value="">
		<input type="hidden" name="usuarioSes1" id="usuarioSes1" value="<%=usuario%>">
		<input type="hidden" name="acAprobado1" id="acAprobado1" value="<%=(request.getAttribute("UsuSel")!=(null))?request.getAttribute("UsuSel"):""%>"/>
		<input type="hidden" name="mesApro1" id="mesApro1" value="<%=(request.getAttribute("mesre2")!=(null))?request.getAttribute("mesre2"): ""%>">
		<input type="hidden" name="comentDenega" id="comentDenega" value="">
		<input type="hidden" name="numApro1" id="numApro1" value="">
	</form>
			
	<form method="POST" id="guardaComen" action="guardaComen">
			<input type="hidden" name="usuarioACm" id="usuarioACm" value="<%=(request.getAttribute("UsuSel")!=(null))?request.getAttribute("UsuSel"): ""%>"/>
			<input type="hidden" name="aprocomen" id="aprocomen" value="<%=usuario%>">
			<input type="hidden" name="comentario" id="comentario" value="">
			<input type="hidden" id="mesre" name="mesre" value="<%=(request.getAttribute("mesre2")!=(null))?request.getAttribute("mesre2"): ""%>">
			<input type="hidden" id="origen" name="origen" value="2">
	</form>

 <div id="example" class="modal fade ">
<div class="modal-dialog ">
<div class="modal-content fondoadn sombramodal " style="height:550px; width:800px;">
	<div class="modal-header headeradn">       
        	<a class="close" data-dismiss="modal" onclick="controlAprob()"><i class="fa fa-times fa-lg" style="color:#ff0000; padding:10px 0px 0px 0px;"></i></a>
            <h5 class="negritas m-t-15">Solicitud de aprobación</h5>
  	</div>
    <div class="modal-body" style="border-top: 2px solid #B5B7B9; overflow:scroll; height:160px;">
			
				<h4 align="left" class="aprobadores">Aprobadores de <%=(request.getAttribute("nomUsuSel")!=(null))?request.getAttribute("nomUsuSel"): ""%></h4>
	<table width=100%>
		<tr>
			<td>
				<table align="center"  width="100%" class="table table-bordered table-stripped" >
					<tr>
						<th width="30%" class="" align="center">Aprobador</th>
						<th width="30%" class="" align="center">Correo</th>
						<th width="10%" class="" align="center">Estatus</th>
						<th width="30%" class="" align="center">Acciones</th>
					</tr>
						<%
						int cantAporb=0;
						String usuSesion=(String)request.getAttribute("usuario");
						//System.out.println("usuario sesion "+usuSesion);
						String usuAprobador="";
						if(!request.getAttribute("apro1").equals(null) && !request.getAttribute("apro1").equals("")){
						cantAporb++;%>

					<tr>
						<td class="">
							<span name="NbAprobador1" id="NbAprobador1" type="text" class="vacio derecha"><%=(request.getAttribute("nbApro1")!=(null))?request.getAttribute("nbApro1"): ""%></span>			
						</td>
						<td class="">
							<input name="aprobador1" id="aprobador1" type="text" class="vacio derecha" value="<%=(request.getAttribute("apro1")!=(null))?request.getAttribute("apro1"): ""%>">
							<input name="v2" id="v2" type="hidden" value="<%=(request.getAttribute("mesA1")!=(null))?request.getAttribute("mesA1"): ""%>">
							<input name="nombrece" id="nombrece" type="hidden" value="<%=(request.getAttribute("usuario")!=(null))?request.getAttribute("usuario"): ""%>">
							<input name="usss" id="usss" type="hidden" value="<%=(request.getAttribute("usuario")!=(null))?request.getAttribute("usuario"): ""%>">
						</td>
						<td class="">
							<div id="div1" name="div1" class="<%=(request.getAttribute("rapro1")!=(null))?request.getAttribute("rapro1"): ""%>">
								<span id="textDiv1" type="text" class="vacio estatus">
									<%if(request.getAttribute("rapro1")!=(null)&&request.getAttribute("rapro1").equals("estatusverde")){%>
										Aprobado	
									<%}else if(request.getAttribute("rapro1")!=(null)&&request.getAttribute("rapro1").equals("estatusrojo")){%>
										Denegado
									<%}else if(request.getAttribute("rapro1")!=(null)&&request.getAttribute("rapro1").equals("estatusazul")){%>
										Solicitada
									<%}else if(request.getAttribute("rapro1")!=(null)&&request.getAttribute("rapro1").equals("estatusblanco")){%>
										No Solicitada
									<%}%>
								</span>
							</div>
						</td>
						<td class="" align="center">
							<%usuAprobador=(String)request.getAttribute("usuApro1");
							//System.out.println("usuario aprobador1 "+usuAprobador);
							if(request.getAttribute("rapro1")!=(null)&&request.getAttribute("rapro1").equals("estatusazul")&&usuSesion.equals(usuAprobador)){%>
								<a class="btn btn-success btn-xs" align="center"  onclick="AprobarEmpleado(1)">Aprobar</a> 
								<a class="btn btn-primary btn-xs" align="center" onclick="DenegarEmpleado(1)">Denegar</a>
						    <%}%>
						</td>
					</tr>
					<%}%>
					<%if(!request.getAttribute("apro2").equals(null) && !request.getAttribute("apro2").equals("")){
						cantAporb++;%>
					<tr>
					<td class="">
							<span name="NbAprobador2" id="NbAprobador2" type="text" class="vacio derecha"><%=(request.getAttribute("nbApro2")!=(null))?request.getAttribute("nbApro2"): ""%></span>				
						</td>
						<td class="">
							<input name="aprobador2" id="aprobador2" type="text" class="vacio derecha" value="<%=(request.getAttribute("apro2")!=(null))?request.getAttribute("apro2"): ""%>">
						</td>
						<td class="">
							<div id="div2" name="div2" class="<%=(request.getAttribute("rapro2")!=(null))?request.getAttribute("rapro2"): ""%>">
								<span id="textDiv2" type="text" class="vacio estatus">
									<%if(request.getAttribute("rapro2")!=(null)&&request.getAttribute("rapro2").equals("estatusverde")){%>
										Aprobado	
									<%}else if(request.getAttribute("rapro2")!=(null)&&request.getAttribute("rapro2").equals("estatusrojo")){%>
										Denegado
									<%}else if(request.getAttribute("rapro2")!=(null)&&request.getAttribute("rapro2").equals("estatusazul")){%>
										Solicitada
									<%}else if(request.getAttribute("rapro2")!=(null)&&request.getAttribute("rapro2").equals("estatusblanco")){%>
										No Solicitada
									<%}%>
								</span>
							</div>
						</td>
						<td class="" align="center">
							<%usuAprobador=(String)request.getAttribute("usuApro2");
							//System.out.println("usuario aprobador2 "+usuAprobador);
							if(request.getAttribute("rapro2")!=(null)&&request.getAttribute("rapro2").equals("estatusazul")&&usuSesion.equals(usuAprobador)){%>
								<a class="btn btn-success btn-xs" align="center"  onclick="AprobarEmpleado(2)">Aprobar</a> 
								<a class="btn btn-primary btn-xs" align="center" onclick="DenegarEmpleado(2)">Denegar</a>
							<%}%>
						</td>
					</tr>
					<%}%>
					<%if(!request.getAttribute("apro3").equals(null) && !request.getAttribute("apro3").equals("")){
						cantAporb++;%>
					<tr>
						<td class="">
							<span name="NbAprobador3" id="NbAprobador3" type="text" class="vacio derecha"><%=(request.getAttribute("nbApro3")!=(null))?request.getAttribute("nbApro3"): ""%></span>		
						</td>
						<td class="">
							<input name="aprobador3" id="aprobador3" type="text" class="vacio derecha" value="<%=(request.getAttribute("apro3")!=(null))?request.getAttribute("apro3"): ""%>">
						</td>
						<td class="">
							<div id="div3" name="div3" class="<%=(request.getAttribute("rapro3")!=(null))?request.getAttribute("rapro3"): ""%>">
								<span id="textDiv2" type="text" class="vacio estatus">
									<%if(request.getAttribute("rapro3")!=(null)&&request.getAttribute("rapro3").equals("estatusverde")){%>
										Aprobado	
									<%}else if(request.getAttribute("rapro3")!=(null)&&request.getAttribute("rapro3").equals("estatusrojo")){%>
										Denegado
									<%}else if(request.getAttribute("rapro3")!=(null)&&request.getAttribute("rapro3").equals("estatusazul")){%>
										Solicitada
									<%}else if(request.getAttribute("rapro3")!=(null)&&request.getAttribute("rapro3").equals("estatusblanco")){%>
										No Solicitada
									<%}%>
								</span>
							</div>
						</td>
						<td class="" align="center">
							<%usuAprobador=(String)request.getAttribute("usuApro3");
							//System.out.println("usuario aprobador3 "+usuAprobador);
							if(request.getAttribute("rapro3")!=(null) && request.getAttribute("rapro3").equals("estatusazul")&& usuSesion.equals(usuAprobador)){%>
								<a class="btn btn-success btn-xs" align="center"  onclick="AprobarEmpleado(3)">Aprobar</a> 
								<a class="btn btn-primary btn-xs" align="center" onclick="DenegarEmpleado(3)">Denegar</a>
							<%}%>
						</td>
					</tr>
					<%}%>
					<%if(!request.getAttribute("apro4").equals(null) && !request.getAttribute("apro4").equals("")){
						cantAporb++;%>
					<tr>
						<td class="">
							<span name="NbAprobador4" id="NbAprobador4" type="text" class="vacio derecha"><%=(request.getAttribute("nbApro4")!=(null))?request.getAttribute("nbApro4"): ""%></span>
						</td>
						<td class="">
							<input name="aprobador4" id="aprobador4" type="text" class="vacio derecha" value="<%=(request.getAttribute("apro4")!=(null))?request.getAttribute("apro4"): ""%>">
						</td>
						<td class="">
							<div id="div4" name="div4" class="<%=(request.getAttribute("rapro4")!=(null))?request.getAttribute("rapro4"): ""%>">
								<span id="textDiv2" type="text" class="vacio estatus">
									<%if(request.getAttribute("rapro3")!=(null)&&request.getAttribute("rapro4").equals("estatusverde")){%>
										Aprobado	
									<%}else if(request.getAttribute("rapro4")!=(null)&&request.getAttribute("rapro4").equals("estatusrojo")){%>
										Denegado
									<%}else if(request.getAttribute("rapro4")!=(null)&&request.getAttribute("rapro4").equals("estatusazul")){%>
										Solicitada
									<%}else if(request.getAttribute("rapro4")!=(null)&&request.getAttribute("rapro4").equals("estatusblanco")){%>
										No Solicitada
									<%}%>
								</span>
							</div>
							<td class="" align="center">
							<%usuAprobador=(String)request.getAttribute("usuApro4");
							//System.out.println("usuario aprobador4 "+usuAprobador);
							if(request.getAttribute("rapro4")!=(null) && request.getAttribute("rapro4").equals("estatusazul")&&usuSesion.equals(usuAprobador)){%>
									<a class="btn btn-success btn-xs" align="center"  onclick="AprobarEmpleado(4)">Aprobar</a> 
									<a class="btn btn-primary btn-xs" align="center" onclick="DenegarEmpleado(4)">Denegar</a>
							<%}%>
						</td>
						</td>
					</tr>
					<%}%>
				</table>
			</form>
			</td>
		</tr>
	</table>
				</div>
				<div class="modal-body" style="overflow:scroll; height:180px; padding-top:0px;">
				<h2 align="left" class="aprobadores m-t-0">Comentarios</h2>
				<%
					ArrayList<Comentarios> arrComents = (ArrayList<Comentarios>)request.getAttribute("comentarios");
					String fechac="", comen="", obserc="";
					int contador5=0;
					if(arrComents!=null && arrComents.size()>0){
				%>
				<table width="800" class="table table-stripped">
					<tr>
						<th class="" align="center" width="15%">Fecha</th>
						<th class="" align="center" width="30%">Usuario</th>
						<th class="" align="center" width="55%">Comentarios</th>
					</tr>
					<%
					for(int i=0; i<arrComents.size();i++){
						Comentarios coment = arrComents.get(i);
						fechac=coment.getFecha();
						comen=coment.getComentario();
						obserc=coment.getObservador();
						contador5++;
					%>
					<tr name="trc<%=contador5%>" id="trc<%=contador5%>">
						<td align="center" name="fch<%=contador5%>" id="fch<%=contador5%>" class="">
							<input type="text" class="vacio" value="<%=fechac%>">
						</td>
						<td align="center" name="cmta<%=contador5%>" id="cmta<%=contador5%>" class="">
							<input type="text" class="vacio" value="<%=obserc%>">
						</td>
						<td align="center" name="obsv<%=contador5%>" id="obsvs<%=contador5%>" class="">
							<input type="text" class="vacio" value="<%=comen%>">
						</td>
						<input type="hidden" name="noap" id="noap" value="<%=obserc%>">
					</tr>
					<td style='display:none'><input size='7' type='text' class='' name='ctc' id='ctc' value='<%=contador5%>'></td>
					<%
						}
					%>
				</table>
				<%} %>
				</div>
				
				<div class="modal-body" style="border-top: 2px solid #B5B7B9; padding-top:0px;">
				<table width=100%>
				<tr>
				<td>
				    <h2 align="left" class="aprobadores m-t-0">Nuevo Comentario</h2>
				    <%if(!request.getAttribute("estApro").equals("Aprobada")){%>
				    <textarea name="comenA" id="comenA" size="20" class="form-control" style="width:100%; height:40px;"></textarea>
				    <%}%>
				</td>
				</tr>
				</table>
				</div>
				
				<div class="modal-footer" style="border-top: 2px solid #B5B7B9; ">
        	       <a class="btn btn-success" align="right" onclick="controlAprob()">Aceptar</a>
		        </div>
					
			
			
			</div>
			</div>
			</div>
		</div>
    </div><!-- modal -->
  
  
  
  </div>
  
   </td>
   <td>
   <div>
	
	</div>
 <script>
$('.bar-percentage[data-percentage]').each(function () {
  var progress = $(this);
  var percentage = Math.ceil($(this).attr('data-percentage'));
  $({countNum: 0}).animate({countNum: percentage}, {
    duration: 2000,
    easing:'linear',
    step: function() {
      // What todo on every count
    var pct = '';
    if(percentage == 0){
      pct = Math.floor(this.countNum) + '%';
    }else{
      pct = Math.floor(this.countNum+1) + '%';
    }
    progress.text(pct) && progress.siblings().children().css('width',pct);
    }
  });
});
</script>
   
</div>
<table width="100%">
<tr><br>
<td>
<div align="center">
  <p class="footer">Powered by: ADN. Todos los derechos reservados. 2015</p>
  <div id="logodiezequis"><img src="ImagenesADN/logo-adn.png" width="53" height="37" /></div>
</div>
</td>
</tr>
</table>
</body>
</html>