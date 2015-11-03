<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	 
	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
	<LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/jquery-ui.css">
	<link rel="stylesheet" href="EstilosADN/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="EstilosADN/dis.css" type="text/css"> 
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css" type='text/css'>
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet"> 
    <link rel="stylesheet" href="js/jquery/ui-lightness/jquery-ui-1.10.2.custom.css" />
	<link href="css/primitives.latest.css?207" media="screen" rel="stylesheet" type="text/css" />
    
    <script src="js/jquery.min.js"></script>  
    <script src="js/jquery-ui.js"></script>
	<script type="text/javascript" src="js/jquery/jquery-1.9.1.js"></script>
	<script type="text/javascript" src="js/jquery/jquery-ui-1.10.2.custom.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript" src="js/primitives.min.js?207"></script>
	<script type="text/javascript" src="js/ConsultaNIs.js"></script>
	


<title>Arbol Indicadores</title>

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

<%@ page import = "com.adn.conexion.ClaseArbol"%> 
<%@ page import = "com.adn.conexion.ClaseDiagrama"%> 
<%@ page import = "java.sql.ResultSet"%>
<%@ page import ="java.sql.SQLException"%> 


<!-- Filtro ind -->
<%@ page import = "com.adn.conexion.Operaciones"%>
<%@ page import = "com.adn.conexion.Conexion"%> 
<%@ page import = "java.sql.ResultSet"%> 
<%@ page import = "java.sql.Statement"%> 
<%@ page import = "com.adn.conexion.ClaseIndicador"%> 

<script>

</script>
<script type="text/javascript">
    function MM_swapImgRestore() { //v3.0
        var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
    }
    function MM_preloadImages() { //v3.0
        var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
            var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
                if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
    }

    function MM_findObj(n, d) { //v4.01
        var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
            d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}

        if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
        for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
        if(!x && d.getElementById) x=d.getElementById(n); return x;
    }

    function MM_swapImage() { //v3.0
        var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
            if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
    }
</script>
</head>
<body ng-app="ScoreCardApp">

<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>

<div class="principal">
		<br>
				
	<div id="izquierda" class="izquierda" ng-controller="ScoreCardMainController">				
		<div class="barratitulo"  >Diagrama Balanced ScoreCard</div>
		<div class="barraopciones" style="padding: 0px 0px 20px 2px"></div>
		<div name="container" class="contenido" width>
		   	<div style="width: 90%; height: 90%; margin: 10px; position: relative; min-height: 80%; display: flex; align-items: center;" >
		   		<div ng-show="score_card.source.length == 0 || score_card.source == undefined" class="row" style="width:100%">
		   			<button data-toggle="modal" data-target="#nuevaScoreCardModal" type="button" class="btn btn-default col-md-2 col-md-offset-5" ng-click="ventanaNuevaCard()">A&ntilde;adir ScoreCard</button>
		   		</div>
		   		<div ng-show="score_card.source.length > 0" style="width:98%; height:98%">
		   			<iframe allowfullscreen frameborder="0" style="width:98%; height:98%" src="{{trustSrc(score_card.source)}}" id="YhMRK46~S1wo"></iframe>
		   			<%if(!tipo.equals("Usr")){%>
		   			<div>
						<a style="padding:15px" class="boton" data-toggle="modal" data-target="#editarScoreCardModal" ng-click="ventanaEditarCard(score_card)">
							<i class="fa fa-pencil"></i>
						</a>
					</div>
					<% } %>
		   		</div>
			</div>
	    </div><!-- Container -->
		<%if(!tipo.equals("Usr")){%>
		<div id="nuevaScoreCardModal" class="modal fade" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Nueva ScoreCard</h4>
						</div>
					</div>
					<div class="modal-body">
						<div>
							<h5 class="modal-title">Agregue la liga de la presentaci&oacute;n.</h5>
							<form id="nuevaScoreCardForm">
								<div class="form-group">
									<label for="descripcionInput">URL</label>
									<input type="text" class="form-control" id="descripcionInput" name="descripcionInput"
												placeholder="URL" ng-model="nueva_card.source">
								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" ng-click="crearScoreCard(nueva_card)">Guardar</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					</div>
				</div>
			</div>
		</div><!-- Fin Nuevo ScoreCard Modal -->
		<!-- Inicia Editar ScoreCard Modal -->
		<div id="editarScoreCardModal" class="modal fade in" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<div>
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">Editar ScoreCard</h4>
						</div>
					</div>
					<div class="modal-body">
						<div>
							<h5 class="modal-title">Agregue la liga de la presentaci&oacute;n.</h5>
							<form id="nuevaScoreCardForm">
								<div class="form-group">
									<label for="descripcionInput">URL</label>
									<input type="text" class="form-control" id="descripcionInput" name="descripcionInput"
												placeholder="URL" ng-model="editar_card.source">
								</div>
							</form>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-success" ng-click="editarScoreCard(editar_card)">Guardar</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
					</div>
				</div>
			</div>
		</div><!-- Inicia Editar ScoreCard Modal -->
		<% } %>
	</div><!-- Izquierda -->
	<div id="barraDerecha" class="barraDerecha">
 		<table width="100%" class="sidebar" border="0">
			<tr>
				<td align="center">
					<a href="#"><img src="ImagenesADN/BSC.png" title="BSC" width="25" height="25"  alt="BSC" onclick="linkDir('BSC.jsp')"></a>
				  <p>Balanced Scorecard</p>
				</td>
			</tr>
			<tr>
				<td align="center">
					<a href="#"><img src="ImagenesADN/arbolC.png" title="Control" width="25" height="20" alt="Nis Control" onclick="sistInd('NIs')"></a>
				<p>NIs Control</p>
				</td>
			</tr>
			<tr>
				<td align="center">
				  <a href="#"> <img src="ImagenesADN/arbolOrg.png" title="Organigrama" width="25" height="25" alt="Organigrama" onclick="sistInd('Org')"/></a>
			    <p>Organigrama</p>	
				</td>
			</tr>
			<tr>
				<td align="center">
					<a href="#"><img src="ImagenesADN/listaNis.png" title="Lista NIs" width="30" height="30" alt="Lista Nis" onclick="linkDir2()"></a>
				<p>Consulta de NIs</p>
				</td>
			</tr>
		</table>       
	</div>
</div><!--Div principal-->


<form method="POST" id="linkDireccion" action="linkDireccion">
	<input type="hidden" id="linkDestino" name="linkDestino" value="">
</form>
<form method="POST" id="sistInd" action="CargaSistInd">
	<input type="hidden" id="propiedad" name="propiedad" value="inicio">
	<input type="hidden" id="TpUsr" name="TpUsr" value="<%=request.getParameter("tipo")%>">
	<input type="hidden" id="diagMos" name="diagMos" value="">
</form>
<form method="POST" id="consultaNIs" action="cargaConsultaNIs">
</form>
		
</body>

	<script>
		$( ".puestosmas" ).click(function() {
			$( "#puestos" ).show( "fast" );
		});
		$( "#menos" ).click(function() {
			$( "#puestos" ).hide( "fast" );
		});
	</script>

<script>

var mes;
var mesNumerico;
var anoActual="";

function linkDir(link){
	document.getElementById("linkDestino").value=link;
	document.getElementById("linkDireccion").submit();
	
}

function sistInd(diag){
	document.getElementById("diagMos").value=diag;
	document.getElementById("sistInd").submit();
}

function linkDir2(){
	document.getElementById("consultaNIs").submit();
	
}
</script>

<script>
inicio();
</script>
<script>
$('.bar-percentage[data-percentage]').each(function () {
  var progress = $(this);
  var percentage = Math.ceil($(this).attr('data-percentage'));
  $({countNum: 0}).animate({countNum: percentage}, {
    duration: 2000,
    easing:'linear',
    step: function() {
      
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

	<script>
		$( "#botonNIs" ).click(function() {
			$( "#divNIs" ).show( "fast" );
			$( "#divGrafica" ).hide( "fast" );
		});
		$( "#botonResumen" ).click(function() {
			$( "#divNIs" ).hide( "fast" );
			$( "#divGrafica" ).show( "fast" );
		});
	</script>

	<script type="text/javascript" src="js/angular.js"></script>
	<script type="text/javascript" src="js/modulos_angular/diagrama_score_card/ScoreCardMainModule.js"></script>
	<script type="text/javascript" src="js/modulos_angular/diagrama_score_card/controllers/ScoreCardControllers.js"></script>
	<script type="text/javascript" src="js/modulos_angular/services/score_card/ScoreCardServices.js"></script>
</html>