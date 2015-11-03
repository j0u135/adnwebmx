
<%@page import="java.util.ArrayList"%>
<%@page language="java" %>
<%@ page import="com.adn.controlador.Actividad"%>
<%@ page import="com.adn.controlador.AvanceActividades"%>
<%@ page import="com.adn.controlador.UrlDetalle"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

	<link href='EstilosADN/fuente.css' rel='stylesheet' type='text/css'>
    <LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/bootstrap.min.css">
    <link rel="stylesheet" href="EstilosADN/bootstrap-theme.min.css">
    <link rel="stylesheet" href="EstilosADN/jquery-ui.css" rel="stylesheet" type="text/css">
    <link href="EstilosADN/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="EstilosADN/dis.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="EstilosADN/disO.css" rel="stylesheet" type="text/css">
    
    
    <script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/highcharts.js"></script>
	<script src="js/highcharts-3d.js"></script>
	<script src="js/modulos/exporting.js"></script>
	<script src="js/highcharts-more.js"></script>
	<script src="js/modulos/solid-gauge.js"></script>
	<script src="js/modulos/data.js"></script>
	<script src="js/modulos/funnel.js"></script>
	<script src="js/jquery-ui.js"></script>
    <script src="js/interfaz11.js"></script>
    <script src="js/calendario.js"></script>
    <script src="js/bootstrap-modal.js"></script>

	
	
<title>Interfaz 4 - ADN</title>

<%@ page session="true" %>
<%int z=1;%>
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
	$(function() {
		$("#datepicker").datepicker();
	});
</script>
<script>
	$(function() {
	     $('#datepicker1').datepicker();
	    }); 
</script>
<script>
	$(function() {
		$("#datepicker2").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker3").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker4").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker4").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker5").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker6").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker7").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker8").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker9").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker10").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker11").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker12").datepicker();
	});
</script>
<script>
function graficahiden(){
	val1=parseInt(document.getElementById("Lape").innerHTML);
	val2=parseInt(document.getElementById("Lare").innerHTML);
	val3=parseInt(document.getElementById("Lapf").innerHTML);
	val4=parseInt(document.getElementById("Larf").innerHTML);
	val5=parseInt(document.getElementById("Lapm").innerHTML);
	val6=parseInt(document.getElementById("Larm").innerHTML);
	val7=parseInt(document.getElementById("Lapa").innerHTML);
	val8=parseInt(document.getElementById("Lara").innerHTML);
	val9=parseInt(document.getElementById("Lapma").innerHTML);
	val10=parseInt(document.getElementById("Larma").innerHTML);
	val11=parseInt(document.getElementById("Lapjn").innerHTML);
	val12=parseInt(document.getElementById("Larjn").innerHTML);
	val13=parseInt(document.getElementById("Lapjl").innerHTML);
	val14=parseInt(document.getElementById("Larjl").innerHTML);
	val15=parseInt(document.getElementById("Lapag").innerHTML);
	val16=parseInt(document.getElementById("Larag").innerHTML);
	val17=parseInt(document.getElementById("Laps").innerHTML);
	val18=parseInt(document.getElementById("Lars").innerHTML);
	val19=parseInt(document.getElementById("Lapo").innerHTML);
	val20=parseInt(document.getElementById("Laro").innerHTML);
	val21=parseInt(document.getElementById("Lapn").innerHTML);
	val22=parseInt(document.getElementById("Larn").innerHTML);
	val23=parseInt(document.getElementById("Lapd").innerHTML);
	val24=parseInt(document.getElementById("Lard").innerHTML);
	
	
	//alert("--"+val1+val2+"--"+val3+val4+"--"+val5+val6+"--"+val7+val8+"--"+val9+val10+"--"+val11+val12+"--"+val13+val14+"--"+val15+val16+"--"+val17+val18+"--"+val19+val20+"--"+val21+val22+"--"+val23+val24);
	var datosX=["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"];
   var datosZ=[val1,val3,val5,val7,val9,val11,val13,val15,val17,val19,val21,val23];
   var datosY=[val2,val4,val6,val8,val10,val12,val14,val16,val18,val20,val22,val24];
 //  alert(datosZ);
  // alert(datosY);
   $('#container').highcharts({
       title: {
           text: 'Avance de Proyecto'
       },
       xAxis: [{
           categories: datosX
       }],
       yAxis: [{ // Primary yAxis
           labels: {
               style: {
                   color: Highcharts.getOptions().colors[1]
               }
           },

       }, { // Secondary yAxis
           labels: {
      
               style: {
                   color: Highcharts.getOptions().colors[0]
               }
           },
           opposite: true
       }],
       tooltip: {
           shared: true
       },
       legend: {
           layout: 'vertical',
           align: 'right',
           x: 120,
           verticalAlign: 'top',
           y: 100,
           floating: true,
           backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
       },
       series: [{
           type: 'column',
           data: datosY,
           name:'real',

       }, {
           name: 'planeado',
    	   data: datosZ,
          
       }]
   });
   	display=document.getElementById("container").style.display;
   if(display=="none"){
	document.getElementById("container").style.display = 'inline';
	display="none";
   }else{
	   //alert("hola");	 
   }
}
</script>

<script>
function graficahiden2(){
		  
		document.getElementById("container").style.display = 'block';
		
		document.getElementById("container").style.display = 'none';
		val1=parseInt(document.getElementById("Lape").innerHTML);
		val2=parseInt(document.getElementById("Lare").innerHTML);
		val3=parseInt(document.getElementById("Lapf").innerHTML);
		val4=parseInt(document.getElementById("Larf").innerHTML);
		val5=parseInt(document.getElementById("Lapm").innerHTML);
		val6=parseInt(document.getElementById("Larm").innerHTML);
		val7=parseInt(document.getElementById("Lapa").innerHTML);
		val8=parseInt(document.getElementById("Lara").innerHTML);
		val9=parseInt(document.getElementById("Lapma").innerHTML);
		val10=parseInt(document.getElementById("Larma").innerHTML);
		val11=parseInt(document.getElementById("Lapjn").innerHTML);
		val12=parseInt(document.getElementById("Larjn").innerHTML);
		val13=parseInt(document.getElementById("Lapjl").innerHTML);
		val14=parseInt(document.getElementById("Larjl").innerHTML);
		val15=parseInt(document.getElementById("Lapag").innerHTML);
		val16=parseInt(document.getElementById("Larag").innerHTML);
		val17=parseInt(document.getElementById("Laps").innerHTML);
		val18=parseInt(document.getElementById("Lars").innerHTML);
		val19=parseInt(document.getElementById("Lapo").innerHTML);
		val20=parseInt(document.getElementById("Laro").innerHTML);
		val21=parseInt(document.getElementById("Lapn").innerHTML);
		val22=parseInt(document.getElementById("Larn").innerHTML);
		val23=parseInt(document.getElementById("Lapd").innerHTML);
		val24=parseInt(document.getElementById("Lard").innerHTML);
	
	
	//alert("--"+val1+val2+"--"+val3+val4+"--"+val5+val6+"--"+val7+val8+"--"+val9+val10+"--"+val11+val12+"--"+val13+val14+"--"+val15+val16+"--"+val17+val18+"--"+val19+val20+"--"+val21+val22+"--"+val23+val24);
	var datosX=["Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"];
   var datosZ=[val1,val3,val5,val7,val9,val11,val13,val15,val17,val19,val21,val23];
   var datosY=[val2,val4,val6,val8,val10,val12,val14,val16,val18,val20,val22,val24];
   //alert(datosZ);
   //alert(datosY);

	display=document.getElementById("container").style.display;
	   if(display=="none"){
		   			$('#graficaprioridad').highcharts({
		       title: {
		           text: 'Avance de Proyecto'
		       },
		       xAxis: [{
		           categories: datosX
		       }],
		       yAxis: [{ // Primary yAxis
		    	   title: {
		                text: 'Porcentaje de Cumplimiento'
		            },
		    	   labels: {
		               style: {
		                   color: Highcharts.getOptions().colors[1]
		               }
		           },
		
		       }, { // Secondary yAxis
		           labels: {
		      
		               style: {
		                   color: Highcharts.getOptions().colors[0]
		               }
		           },
		           opposite: true
		       }],
		       tooltip: {
		           shared: true,
		           valueSuffix: '%',
		       },
		       legend: {
		           layout: 'horizontal',
		           align: 'center',
		           
		           verticalAlign: 'bottom',
		           
		           
		           backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
		       },
		       series: [{
		           type: 'column',
		           data: datosZ,
		           name: 'Real',
		
		       }, {
		           data: datosY,
		           name: 'Planeado',
		       }]
		   });
		document.getElementById("container").style.display = 'block';
	   }else{
		   document.getElementById("container").style.display = 'none';
		   $('#graficaprioridad').highcharts({
		       title: {
		           text: 'Entrega de Resultados'
		       },
		       xAxis: [{
		           categories: datosX
		       }],
		       yAxis: [{ // Primary yAxis
		           labels: {
		               style: {
		                   color: Highcharts.getOptions().colors[1]
		               }
		           },
		
		       }, { // Secondary yAxis
		           labels: {
		      
		               style: {
		                   color: Highcharts.getOptions().colors[0]
		               }
		           },
		           opposite: true
		       }],
		       tooltip: {
		           shared: true
		       },
		       legend: {
		           layout: 'vertical',
		           align: 'left',
		           x: 120,
		           verticalAlign: 'top',
		           y: 100,
		           floating: true,
		           backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
		       },
		       series: [{
		           type: 'column',
		           data: datosY,
		
		       }, {
		           data: datosZ,
		          
		       }]
		   });
		   document.getElementById("container").style.display = 'block';
		   
   }
}
</script>
<script>
	$(function() {
		$("#datepicker13").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker14").datepicker();
		
	});
</script>
<script>
	$(function() {
		$("#datepicker15").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker16").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker17").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker18").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker19").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker20").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker21").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker22").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker23").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker24").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker25").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker26").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker27").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker28").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker29").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker30").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker31").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker32").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker33").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker34").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker35").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker36").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker37").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker38").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker39").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker40").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker41").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker42").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker43").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker44").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker45").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker46").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker47").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker48").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker49").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker50").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker51").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker52").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker53").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker54").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker55").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker56").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker57").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker58").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker59").datepicker();
	});
</script>
<script>
	$(function() {
		$("#datepicker60").datepicker();
	});
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
<script>
var click=0;

//var fila=p;		
		function clone() {
			
			p=document.getElementById("ora").value; //4
			
			aa=document.getElementById("agregaAc").value;	
				if(aa!=""){
						document.getElementById("act"+p).value=aa;
						document.getElementById("tr"+p).style.display = "inline";
						p++;
					//	alert("dentro del if: "+p);
						document.getElementById("ora").value=p;
					}
					else{
					alert("Debe insertar una actividad");
					}				
				document.getElementById("agregaAc").value="";	
}
</script>

<script>
	function agregar(){
		var area = document.getElementById("area").value;
		if(area!= "")
			{
				document.getElementById("GuardaArea").submit();
			}
	}
</script>
</head>

<script language="javascript">
window.onload = function() {
ponderacion();
fun();
con();
}
</script>

<script>
var fecha;

function obFecha1(){
	
	var fecha = $('#datepicker1').val();
	//alert(fecha);
	document.getElementById("hidenfecha1").value=fecha;
}
</script>
<script>
var fecha;

function obFecha2(){
	
	var fecha = $('#datepicker2').val();
	//alert(fecha);
	document.getElementById("hidenfecha2").value=fecha;
}
</script>
<script>
var fecha;

function obFecha3(){
	
	var fecha = $('#datepicker3').val();
	//alert(fecha);
	document.getElementById("hidenfecha3").value=fecha;
}
</script>
<script>
var fecha;

function obFecha4(){
	
	var fecha = $('#datepicker4').val();
//	alert(fecha);
	document.getElementById("hidenfecha4").value=fecha;
}
</script>
<script>
var fecha;

function obFecha5(){
	
	var fecha = $('#datepicker5').val();
	//alert(fecha);
	document.getElementById("hidenfecha5").value=fecha;
}
</script>
<script>
var fecha;

function obFecha6(){
	
	var fecha = $('#datepicker6').val();
	//alert(fecha);
	document.getElementById("hidenfecha6").value=fecha;
}
</script>
<script>
var fecha;

function obFecha7(){
	
	var fecha = $('#datepicker7').val();
	//alert(fecha);
	document.getElementById("hidenfecha7").value=fecha;
}
</script>
<script>
var fecha;

function obFecha8(){
	
	var fecha = $('#datepicker8').val();
	//alert(fecha);
	document.getElementById("hidenfecha8").value=fecha;
}
</script>
<script>
var fecha;

function obFecha9(){
	
	var fecha = $('#datepicker9').val();
	//alert(fecha);
	document.getElementById("hidenfecha9").value=fecha;
}
</script>
<script>
var fecha;

function obFecha10(){
	
	var fecha = $('#datepicker10').val();
	//alert(fecha);
	document.getElementById("hidenfecha10").value=fecha;
}
</script>
<script>
var fecha;

function obFecha11(){
	
	var fecha = $('#datepicker11').val();
	//alert(fecha);
	document.getElementById("hidenfecha11").value=fecha;
}
</script>
<script>
var fecha;

function obFecha12(){
	
	var fecha = $('#datepicker12').val();
	//alert(fecha);
	document.getElementById("hidenfecha12").value=fecha;
}
</script>
<script>
var fecha;

function obFecha13(){
	
	var fecha = $('#datepicker13').val();
	//alert(fecha);
	document.getElementById("hidenfecha13").value=fecha;
}
</script>
<script>
var fecha;

function obFecha14(){
	
	var fecha = $('#datepicker14').val();
	//alert(fecha);
	document.getElementById("hidenfecha14").value=fecha;
}
</script>
<script>
var fecha;

function obFecha15(){
	
	var fecha = $('#datepicker15').val();
	//alert(fecha);
	document.getElementById("hidenfecha15").value=fecha;
}
</script>
<script>
var fecha;

function obFecha16(){
	
	var fecha = $('#datepicker16').val();
	//alert(fecha);
	document.getElementById("hidenfecha16").value=fecha;
}
</script>
<script>
var fecha;

function obFecha17(){
	
	var fecha = $('#datepicker17').val();
	//alert(fecha);
	document.getElementById("hidenfecha17").value=fecha;
}
</script>
<script>
var fecha;

function obFecha18(){
	
	var fecha = $('#datepicker18').val();
	//alert(fecha);
	document.getElementById("hidenfecha18").value=fecha;
}
</script>
<script>
var fecha;

function obFecha19(){
	
	var fecha = $('#datepicker19').val();
	//alert(fecha);
	document.getElementById("hidenfecha19").value=fecha;
}
</script>
<script>
var fecha;

function obFecha20(){
	
	var fecha = $('#datepicker20').val();
	//alert(fecha);
	document.getElementById("hidenfecha20").value=fecha;
}
</script>

<script>
var fecha;

function obFecha21(){
	
	var fecha = $('#datepicker21').val();
	//alert(fecha);
	document.getElementById("hidenfecha22").value=fecha;
}
</script>
<script>
var fecha;

function obFecha23(){
	
	var fecha = $('#datepicker23').val();
	//alert(fecha);
	document.getElementById("hidenfecha23").value=fecha;
}
</script>
<script>
var fecha;

function obFecha24(){
	
	var fecha = $('#datepicker24').val();
	//alert(fecha);
	document.getElementById("hidenfecha24").value=fecha;
}
</script>
<script>
var fecha;

function obFecha25(){
	
	var fecha = $('#datepicker25').val();
	//alert(fecha);
	document.getElementById("hidenfecha25").value=fecha;
}
</script>
<script>
var fecha;

function obFecha26(){
	
	var fecha = $('#datepicker26').val();
	//alert(fecha);
	document.getElementById("hidenfecha26").value=fecha;
}
</script>
<script>
var fecha;

function obFecha27(){
	
	var fecha = $('#datepicker27').val();
	//alert(fecha);
	document.getElementById("hidenfecha27").value=fecha;
}
</script>
<script>
var fecha;

function obFecha28(){
	
	var fecha = $('#datepicker28').val();
	//alert(fecha);
	document.getElementById("hidenfecha28").value=fecha;
}
</script>
<script>
var fecha;

function obFecha29(){
	
	var fecha = $('#datepicker29').val();
	//alert(fecha);
	document.getElementById("hidenfecha29").value=fecha;
}
</script>
<script>
var fecha;

function obFecha30(){
	
	var fecha = $('#datepicker30').val();
	//alert(fecha);
	document.getElementById("hidenfecha30").value=fecha;
}
</script>
<script>
var fecha;

function obFecha31(){
	
	var fecha = $('#datepicker31').val();
	//alert(fecha);
	document.getElementById("hidenfecha31").value=fecha;
}
</script>
<script>
var fecha;

function obFecha32(){
	
	var fecha = $('#datepicker32').val();
	//alert(fecha);
	document.getElementById("hidenfecha32").value=fecha;
}
</script>
<script>
var fecha;

function obFecha33(){
	
	var fecha = $('#datepicker33').val();
	//alert(fecha);
	document.getElementById("hidenfecha33").value=fecha;
}
</script>
<script>
var fecha;

function obFecha34(){
	
	var fecha = $('#datepicker34').val();
	//alert(fecha);
	document.getElementById("hidenfecha34").value=fecha;
}
</script>
<script>
var fecha;

function obFecha35(){
	
	var fecha = $('#datepicker35').val();
	//alert(fecha);
	document.getElementById("hidenfecha35").value=fecha;
}
</script>
<script>
var fecha;

function obFecha36(){
	
	var fecha = $('#datepicker36').val();
	//alert(fecha);
	document.getElementById("hidenfecha36").value=fecha;
}
</script>
<script>
var fecha;

function obFecha37(){
	
	var fecha = $('#datepicker37').val();
	//alert(fecha);
	document.getElementById("hidenfecha37").value=fecha;
}
</script>
<script>
var fecha;

function obFecha38(){
	
	var fecha = $('#datepicker38').val();
	//alert(fecha);
	document.getElementById("hidenfecha38").value=fecha;
}
</script>
<script>
var fecha;

function obFecha39(){
	
	var fecha = $('#datepicker39').val();
	//alert(fecha);
	document.getElementById("hidenfecha39").value=fecha;
}
</script>
<script>
var fecha;

function obFecha40(){
	
	var fecha = $('#datepicker40').val();
	//alert(fecha);
	document.getElementById("hidenfecha40").value=fecha;
}
</script>
<script>
var fecha;

function obFecha41(){
	
	var fecha = $('#datepicker41').val();
	//alert(fecha);
	document.getElementById("hidenfecha41").value=fecha;
}
</script>
<script>
var fecha;

function obFecha42(){
	
	var fecha = $('#datepicker42').val();
	//alert(fecha);
	document.getElementById("hidenfecha42").value=fecha;
}
</script>
<script>
var fecha;

function obFecha43(){
	
	var fecha = $('#datepicker43').val();
	//alert(fecha);
	document.getElementById("hidenfecha43").value=fecha;
}
</script>
<script>
var fecha;

function obFecha44(){
	
	var fecha = $('#datepicker44').val();
	//alert(fecha);
	document.getElementById("hidenfecha44").value=fecha;
}
</script>
<script>
var fecha;

function obFecha45(){
	
	var fecha = $('#datepicker45').val();
	//alert(fecha);
	document.getElementById("hidenfecha45").value=fecha;
}
</script>
<script>
var fecha;

function obFecha46(){
	
	var fecha = $('#datepicker46').val();
	//alert(fecha);
	document.getElementById("hidenfecha46").value=fecha;
}
</script>
<script>
var fecha;

function obFecha47(){
	
	var fecha = $('#datepicker47').val();
	//alert(fecha);
	document.getElementById("hidenfecha47").value=fecha;
}
</script>
<script>
var fecha;

function obFecha48(){
	
	var fecha = $('#datepicker48').val();
	//alert(fecha);
	document.getElementById("hidenfecha48").value=fecha;
}
</script>
<script>
var fecha;

function obFecha49(){
	
	var fecha = $('#datepicker49').val();
	//alert(fecha);
	document.getElementById("hidenfecha49").value=fecha;
}
</script>
<script>
var fecha;

function obFecha50(){
	
	var fecha = $('#datepicker50').val();
	//alert(fecha);
	document.getElementById("hidenfecha50").value=fecha;
}
</script>
<script>
var fecha;

function obFecha51(){
	
	var fecha = $('#datepicker51').val();
	//alert(fecha);
	document.getElementById("hidenfecha51").value=fecha;
}
</script>
<script>
var fecha;

function obFecha52(){
	
	var fecha = $('#datepicker52').val();
	//alert(fecha);
	document.getElementById("hidenfecha52").value=fecha;
}
</script>
<script>
var fecha;

function obFecha53(){
	
	var fecha = $('#datepicker53').val();
	//alert(fecha);
	document.getElementById("hidenfecha53").value=fecha;
}
</script>
<script>
var fecha;

function obFecha54(){
	
	var fecha = $('#datepicker54').val();
	//alert(fecha);
	document.getElementById("hidenfecha54").value=fecha;
}
</script>
<script>
var fecha;

function obFecha55(){
	
	var fecha = $('#datepicker55').val();
	//alert(fecha);
	document.getElementById("hidenfecha55").value=fecha;
}
</script>
<script>
var fecha;

function obFecha56(){
	
	var fecha = $('#datepicker56').val();
	//alert(fecha);
	document.getElementById("hidenfecha56").value=fecha;
}
</script>
<script>
var fecha;

function obFecha57(){
	
	var fecha = $('#datepicker57').val();
	//alert(fecha);
	document.getElementById("hidenfecha57").value=fecha;
}
</script>
<script>
var fecha;

function obFecha58(){
	
	var fecha = $('#datepicker58').val();
	//alert(fecha);
	document.getElementById("hidenfecha58").value=fecha;
}
</script>
<script>
var fecha;

function obFecha59(){
	
	var fecha = $('#datepicker59').val();
	//alert(fecha);
	document.getElementById("hidenfecha59").value=fecha;
}
</script>
<script>
var fecha;

function obFecha60(){
	
	var fecha = $('#datepicker60').val();
	//alert(fecha);
	document.getElementById("hidenfecha60").value=fecha;
}

function obFecha100(){
	
	var fecha = $('#datepicker100').val();
	//alert(fecha);
	document.getElementById("hidenfecha100").value=fecha;
}
function obFecha101(){
	
	var fecha = $('#datepicker101').val();
	//alert(fecha);
	document.getElementById("hidenfecha101").value=fecha;
}
</script>



<body onload="ponderacion();fun();mesProyecto();">
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
	    <div class="barratitulo">Edición de Prioridades</div>
    <div class="barraopciones">
    <table width="100%" align="center" id="tablabarra">
			<tbody>
				<tr>
					<td>Mes</td>
					<td>
						<input type="text" id="mesBarra" value="<%=(request.getAttribute("mesBarra")!=(null))?request.getAttribute("mesBarra"): ""%>" disabled class="noeditable porcentaje"></td>
					</td>
					<td>Peso Total: <input type="text" id="ponderacionFinal" value="<%=(request.getAttribute("pesoTotal")!=(null))?request.getAttribute("pesoTotal"): ""%>" disabled class="noeditable porcentaje"></td>
					<td>Desempeño Mensual: <input type="text" id="resultadoFinal" value="<%=(request.getAttribute("desMensual")!=(null))?request.getAttribute("desMensual"): ""%>"  disabled class="noeditable porcentaje"></td>
				    <td width="200px"></td>
				</tr>
			</tbody>
			</table>
    </div>
		<div class="tablas" style="align:left">
			<br>
			<br>
			
			<!--EL FORM DE PROYECTOTABLA -->
			<form method="POST" id="actualizaActividades" action="actualizaActividades">
			<input type="hidden" id="mesBarra" name="mesBarra" value="<%=(request.getAttribute("mesBarra")!=(null))?request.getAttribute("mesBarra"): ""%>">
			<input type="hidden" id="clavePrio" name="clavePrio" value="<%=(request.getAttribute("idPrioridad")!=(null))?request.getAttribute("idPrioridad"): ""%>">
			<input type="hidden" id="usuarioHR" name="usuarioHR" value="<%=(request.getAttribute("usuarioHR")!=(null))?request.getAttribute("usuarioHR"): ""%>">
			<input type="hidden" id="anioSel" name="anioSel" value="<%=(request.getAttribute("anioSel")!=(null))?request.getAttribute("anioSel"): ""%>">
			<input type="hidden" id="mesNum" name="mesNum" value="<%=(request.getAttribute("mesNum")!=(null))?request.getAttribute("mesNum"): ""%>">
			<input type="hidden" id="avProg" name="avProg" value="<%=(request.getAttribute("avProg")!=(null))?request.getAttribute("avProg"): ""%>">
			<input type="hidden" id="avReal" name="avReal" value="<%=(request.getAttribute("avReal")!=(null))?request.getAttribute("avReal"): ""%>">
			<input type="hidden" id="avInicial" name="avInicial" value="<%=(request.getAttribute("avInicial")!=(null))?request.getAttribute("avInicial"): ""%>">
			<table id="proyectostabla" width="100%" class="tope">
				<tr>
					<th class="primero" >Nombre de la Prioridad</th>
					<th>*Unidad</th>
					<th>*Fecha Inicio</th>
					<th>*Fecha Fin</th>
					<th>Inicial</th>
					<th>Prog</th>
					<th>Real</th>
					<th class="ultimo">*Peso</th>
				</tr>
				<tr>
					
					<td><input id="nombre1"  style="width:650px" name="nombre1" type="text" class="noeditable" value="<%=(request.getAttribute("nombreP")!=(null))?request.getAttribute("nombreP"): ""%>"></td>
					
					<td><input id="unidadVal" name="unidadVal" type="hidden" class="form-control noventa" value="<%=(request.getAttribute("unidadP")!=(null))?request.getAttribute("unidadP"): ""%>">
						<select height="50px" id="unidad1" name="unidad1" class="form-select">
										<option value="Seleccione">Seleccione</option>
										<option value="Porcentaje">Porcentaje</option>
										<option value="Tiempo">Tiempo</option>
										<option value="Monto">Monto</option>
										<option value="Unidad">Unidad</option>
										<option value="Otro">Otro</option>
									</select></td>
					<td><input id="datepicker101" name="datepicker101"  type="text" class="form-control fecha" value="<%=(request.getAttribute("fechaI")!=(null))?request.getAttribute("fechaI"): ""%>"></td>
					<td><input id="datepicker100" name="datepicker100"  type="text" class="form-control fecha" value="<%=(request.getAttribute("fechaP")!=(null))?request.getAttribute("fechaP"): ""%>"></td>
					<td><input id="inicial" disabled name="inicial" type="text" class="noeditable porcentaje" value="<%=(request.getAttribute("inicialP")!=(null))?request.getAttribute("inicialP"): ""%>"></td>
					<td><input id="programado" disabled name="programado" type="text" class="noeditable porcentaje" value="<%=(request.getAttribute("programadoP")!=(null))?request.getAttribute("programadoP"): ""%>"></td>
					<td><input id="real" disabled name="real" type="text" class="noeditable porcentaje amarillo" value="<%=(request.getAttribute("realP")!=(null))?request.getAttribute("realP"): ""%>"></td>
					<td><input id="peso" name="peso" class="form-control porcentaje" value="<%=(request.getAttribute("pesoP")!=(null))?request.getAttribute("pesoP"): ""%>"></td>
					<input type="hidden" id="nombreactualizado" name="nombreactualizado" value="<%=(request.getAttribute("nombreP")!=(null))?request.getAttribute("nombreP"): ""%>"/>	
				</tr>
			</table>
			<input type="hidden" id="usuariohiden" name="usuariohiden" value="<%=usuario%>">
			<input type="hidden" id="hidenfecha1" name="hidenfecha1" value="">
			<input type="hidden" id="hidenfecha2" name="hidenfecha2" value="">
			<input type="hidden" id="hidenfecha3" name="hidenfecha3" value="">
			<input type="hidden" id="hidenfecha4" name="hidenfecha4" value="">
			<input type="hidden" id="hidenfecha5" name="hidenfecha5" value="">
			<input type="hidden" id="hidenfecha6" name="hidenfecha6" value="">
			<input type="hidden" id="hidenfecha7" name="hidenfecha7" value="">
			<input type="hidden" id="hidenfecha8" name="hidenfecha8" value="">
			<input type="hidden" id="hidenfecha9" name="hidenfecha9" value="">
			<input type="hidden" id="hidenfecha10" name="hidenfecha10" value="">
			<input type="hidden" id="hidenfecha11" name="hidenfecha11" value="">
			<input type="hidden" id="hidenfecha12" name="hidenfecha12" value="">
			<input type="hidden" id="hidenfecha13" name="hidenfecha13" value="">
			<input type="hidden" id="hidenfecha14" name="hidenfecha14" value="">
			<input type="hidden" id="hidenfecha15" name="hidenfecha15" value="">
			<input type="hidden" id="hidenfecha16" name="hidenfecha16" value="">
			<input type="hidden" id="hidenfecha17" name="hidenfecha17" value="">
			<input type="hidden" id="hidenfecha18" name="hidenfecha18" value="">
			<input type="hidden" id="hidenfecha19" name="hidenfecha19" value="">
			<input type="hidden" id="hidenfecha20" name="hidenfecha20" value="">
			<input type="hidden" id="hidenfecha100" name="hidenfecha100" value="">
			<input type="hidden" id="hidenfecha101" name="hidenfecha101" value="">
			
			<input type="hidden" id="lape" name="lape" value="">
			<input type="hidden" id="lare" name="lare" value="">
			<input type="hidden" id="lapf" name="lapf" value="">
			<input type="hidden" id="larf" name="larf" value="">
			<input type="hidden" id="lapm" name=lapm value="">
			<input type="hidden" id="larm" name="larm" value="">
			<input type="hidden" id="lapa" name="lapa" value="">
			<input type="hidden" id="lara" name="lara" value="">
			<input type="hidden" id="lapma" name="lapma" value="">
			<input type="hidden" id="larma" name="larma" value="">
			<input type="hidden" id="lapjn" name="lapjn" value="">
			<input type="hidden" id="larjn" name="larjn" value="">
			<input type="hidden" id="lapjl" name="lapjl" value="">
			<input type="hidden" id="larjl" name="larjl" value="">
			<input type="hidden" id="lapag" name="lapag" value="">
			<input type="hidden" id="larag" name="larag" value="">
			<input type="hidden" id="laps" name="laps" value="">
			<input type="hidden" id="lars" name="lars" value="">
			<input type="hidden" id="lapo" name="lapo" value="">
			<input type="hidden" id="laro" name="laro" value="">
			<input type="hidden" id="lapn" name="lapn" value="">
			<input type="hidden" id="larn" name="larn" value="">
			<input type="hidden" id="lapd" name="lapd" value="">
			<input type="hidden" id="lard" name="lard" value="">
			
			<table class="tablaadn tope" width="100%">
				<tr>
					<td width="20%" align="center">Ingresar Actividades</td>
					<td width="30%" align="center"><input name="" id="agregaAc" type="text" class="form-control" style="width:550px"></td>
					<td width="45%" align="left"><a onclick="clone()" class="boton"><i class="fa fa-plus"></i></a> 
					<a onclick="eliminaActCon();ponderacion();fun()" class="boton"><i class="fa fa-times"></i></a> <a class="boton grafica" onclick="graficahiden2();">
								<i class="fa fa-bar-chart"></i>
							</a></td>
					<td align="center"></td>
				</tr>
			</table>
			<div class="sortear"></div>
			
			<div class="tablerodos abajo" style="width:100%; overflow: scroll;">
				<table style="width:100%;">
					<tr >
						<td> </td>
						<td colspan="2"> </td>
						
						<td> </td>
						<td width="154" colspan="2" align="center" class="negritas titulotablero">Ene</td>
						<td width="154" colspan="2" align="center" class="negritas titulotablero">Feb</td>
						<td width="154" colspan="2" align="center" class="negritas titulotablero">Mar</td>
						<td width="154" colspan="2" align="center" class="negritas titulotablero">Abr</td>
						<td width="154" colspan="2" align="center" class="negritas titulotablero">May</td>
						<td width="154" colspan="2" align="center" class="negritas titulotablero">Jun</td>
						<td width="154" colspan="2" align="center" class="negritas titulotablero">Jul</td>
						<td width="154" colspan="2" align="center" class="negritas titulotablero">Ago</td>
						<td width="154" colspan="2" align="center" class="negritas titulotablero">Sep</td>
						<td width="154" colspan="2" align="center" class="negritas titulotablero">Oct</td>
						<td width="154" colspan="2" align="center" class="negritas titulotablero">Nov</td>
						<td width="154" colspan="2" align="center" class="negritas titulotablero">Dic</td>
												
					</tr>
					<tr style="height:6px;">
						<td></td>
						<td colspan="2" align="right" onchange="calcuPonde()" value="">Peso Total de las Actividades:</td>
						<td align="center"><input size="7" style="text-align:center" type="text" id="ponde2" name="ponde2"></td>
						
						<td align="center" class="negritas celdasprograma mestablero bordeazul">P</td>
						<td align="center" class="negritas celdasprograma bordeazul">R</td>
						<td align="center" class="negritas celdasprograma mestablero bordeazul">P</td>
						<td align="center" class="negritas celdasprograma bordeazul">R</td>
						<td align="center" class="negritas celdasprograma mestablero bordeazul">P</td>
						<td align="center" class="negritas celdasprograma bordeazul">R</td>
						<td align="center" class="negritas celdasprograma mestablero bordeazul">P</td>
						<td align="center" class="negritas celdasprograma bordeazul">R</td>
						<td align="center" class="negritas celdasprograma mestablero bordeazul">P</td>
						<td align="center" class="negritas celdasprograma bordeazul">R</td>
						<td align="center" class="negritas celdasprograma mestablero bordeazul">P</td>
						<td align="center" class="negritas celdasprograma bordeazul">R</td>
						<td align="center" class="negritas celdasprograma mestablero bordeazul">P</td>
						<td align="center" class="negritas celdasprograma bordeazul">R</td>
						<td align="center" class="negritas celdasprograma mestablero bordeazul">P</td>
						<td align="center" class="negritas celdasprograma bordeazul">R</td>
						<td align="center" class="negritas celdasprograma mestablero bordeazul">P</td>
						<td align="center" class="negritas celdasprograma bordeazul">R</td>
						<td align="center" class="negritas celdasprograma mestablero bordeazul">P</td>
						<td align="center" class="negritas celdasprograma bordeazul">R</td>
						<td align="center" class="negritas celdasprograma mestablero bordeazul">P</td>
						<td align="center" class="negritas celdasprograma bordeazul">R</td>
						<td align="center" class="negritas celdasprograma mestablero bordeazul">P</td>
						<td align="center" class="negritas celdasprograma bordeazul">R</td>
					</tr>
					<tr >
						<td width="20" align="center" class="titulotablero"></td>
						<td width="265" align="center" class="titulotablero" >Nombre</td>
						<td width="95" align="center" class="titulotablero">Fecha Entrega</td>
						<td width="73" align="center" class="titulotablero">Peso</td>
						<td width="31" align="center" class="mestablero bordeazul"><label class="titulomes" id="Lape" name="Lape"></label></td>
						<td width="31" align="center" class="mestablero bordeazul"><label class="titulomes" id="Lare" name="Lare"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lapf" name="Lapf"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Larf" name="Larf"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lapm" name="Lapm"></label></td>
						<td align="center" width="31"  class="mestablero bordeazul"><label class="titulomes" id="Larm" name="Larm"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lapa" name="Lapa"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lara" name="Lara"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lapma" name="Lapma"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Larma" name="Larma"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lapjn" name="Lapjn"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Larjn" name="Larjn"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lapjl" name="Lapjl"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Larjl" name="Larjl"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lapag" name="Lapag"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Larag" name="Larag"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Laps" name="Laps"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lars" name="Lars"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lapo" name="Lapo"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Laro" name="Laro"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lapn" name="Lapn"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Larn" name="Larn"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lapd" name="Lapd"></label></td>
						<td align="center" width="31" class="mestablero bordeazul"><label class="titulomes" id="Lard" name="Lard"></label></td>
					</tr>
								
					<% 
					String proyecto="";
					String oMes= (String)request.getAttribute("nombreP");
					
					ArrayList<Actividad> lista = (ArrayList<Actividad>)request.getAttribute("arrActividad");
					if(lista!=null && lista.size()>0){
						for (int i=0;i<lista.size();i++)
							{
								Actividad act = lista.get(i);
	//System.out.println("antes"+z);
   out.println("<tr id='tr"+z+"'>");
   out.println("<td width='50' align='center'><input type='checkbox' id='"+z+"'/></td>");
   out.println("<td hidden align='center' class='filauno'><input name='id"+z+"' id='id"+z+"' type='hidden' class='inicio centro fondoblanco sombraceldas' value='"+act.getIdActividad()+"'></td>");
   out.println("<td width='550' align='center' class='filauno'><input name='act"+z+"' id='act"+z+"' type='text' class='inicio centro fondoblanco sombraceldas' value='"+act.getNbActividad()+"'></td>");
   out.println("<td style='display:none' align='center' class='filauno'><input name='id"+z+"' id='id"+z+"' type='text' class='centro porcentaje2 fondoblanco sombraceldas' value='"+act.getIdActividad()+"'></td>");
   out.println("<td width='70' align='center' class='filauno'><input style='text-align:center' size='11' id='datepicker"+z+"' class='centro derecha porcentaje fondoblanco sombraceldas' type='text' onchange='obFecha"+z+"() validaFechaFin(this)' value='"+act.getFhFin()+"'></td>");
   out.println("<td width='56' align='center' class='filauno'><input name='por"+z+"' id='por"+z+"' type='text'  class='centro porcentaje2 fondoblanco sombraceldas' onchange='ponderacion();fun()'  value='"+act.getPeso()+"'></td>"); 
   out.println("<td width='60' align='center' class='mestablero bordeazul'><input style='text-align:center' name='pe"+z+"' id='pe"+z+"' type='text' onchange='fun();' class='vaciodos centro fondoblanco' value='"+(act.getProgEne()!=null?act.getProgEne():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input style='text-align:center' name='re"+z+"' id='re"+z+"' type='text' class='vaciodos centro fondoblanco' onchange='fun()' value='"+(act.getResuEne()!=null?act.getResuEne():"")+"'></td>");
   out.println("<td width='60' align='center' class='mestablero bordeazul'><input style='text-align:center' name='pf"+z+"' id='pf"+z+"' type='text' class='vaciodos centro fondoblanco' onchange='fun()' value='"+(act.getProgFeb()!=null?act.getProgFeb():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input style='text-align:center' name='rf"+z+"' id='rf"+z+"' type='text' class='vaciodos centro fondoblanco' onchange='fun()' value='"+(act.getResuFeb()!=null?act.getResuFeb():"")+"'></td>");
   out.println("<td width='60' align='center' class='mestablero bordeazul'><input style='text-align:center' name='pm"+z+"' id='pm"+z+"' type='text' class='vaciodos centro fondoblanco' onchange='fun()' value='"+(act.getProgMar()!=null?act.getProgMar():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input style='text-align:center' name='rm"+z+"' id='rm"+z+"' type='text' class='vaciodos centro fondoblanco' onchange='fun()' value='"+(act.getResuMar()!=null?act.getResuMar():"")+"'></td>");
   out.println("<td width='60' align='center' class='mestablero bordeazul'><input style='text-align:center' name='pa"+z+"' id='pa"+z+"' type='text' onchange='fun()' class='vaciodos centro fondoblanco' value='"+(act.getProgAbr()!=null?act.getProgAbr():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input style='text-align:center' name='ra"+z+"' id='ra"+z+"' type='text' onchange='fun()' class='vaciodos centro fondoblanco' value='"+(act.getResuAbr()!=null?act.getResuAbr():"")+"'></td>");
   out.println("<td width='60' align='center' class='mestablero bordeazul'><input style='text-align:center' name='pma"+z+"' id='pma"+z+"' onchange='fun()' type='text' class='vaciodos centro fondoblanco' value='"+(act.getProgMay()!=null?act.getProgMay():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input style='text-align:center' name='rma"+z+"' id='rma"+z+"' type='text' onchange='fun()' class='vaciodos centro fondoblanco' value='"+(act.getResuMay()!=null?act.getResuMay():"")+"'></td>");
   out.println("<td width='60' align='center' class='mestablero bordeazul'><input style='text-align:center' name='pjn"+z+"' id='pjn"+z+"' onchange='fun()' type='text' class='vaciodos centro fondoblanco' value='"+(act.getProgJun()!=null?act.getProgJun():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input style='text-align:center' name='rjn"+z+"' id='rjn"+z+"' type='text' onchange='fun()' class='vaciodos centro fondoblanco' value='"+(act.getResuJun()!=null?act.getResuJun():"")+"'></td>");
   out.println("<td width='60' align='center' class='mestablero bordeazul'><input style='text-align:center' name='pjl"+z+"' id='pjl"+z+"' onchange='fun()' type='text' class='vaciodos centro fondoblanco' value='"+(act.getProgJul()!=null?act.getProgJul():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input style='text-align:center' name='rjl"+z+"' id='rjl"+z+"' type='text' onchange='fun();' class='vaciodos centro fondoblanco' value='"+(act.getResuJul()!=null?act.getResuJul():"")+"'></td>");
   out.println("<td width='60' align='center' class='mestablero bordeazul'><input style='text-align:center' name='pag"+z+"' id='pag"+z+"' onchange='fun();' type='text' class='vaciodos centro fondoblanco' value='"+(act.getProgAgo()!=null?act.getProgAgo():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input style='text-align:center' name='rag"+z+"' id='rag"+z+"' type='text' onchange='fun();' class='vaciodos centro fondoblanco' value='"+(act.getResuAgo()!=null?act.getResuAgo():"")+"'></td>");
   out.println("<td width='60' align='center' class='mestablero bordeazul'><input style='text-align:center' name='ps"+z+"' id='ps"+z+"' onchange='fun();' type='text' class='vaciodos centro fondoblanco' value='"+(act.getProgSep()!=null?act.getProgSep():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input style='text-align:center' name='rs"+z+"' id='rs"+z+"' type='text' onchange='fun();' class='vaciodos centro fondoblanco' value='"+(act.getResuSep()!=null?act.getResuSep():"")+"'></td>");
   out.println("<td width='60' align='center' class='mestablero bordeazul'><input style='text-align:center' name='po"+z+"' id='po"+z+"' type='text' class='vaciodos centro fondoblanco' onchange='fun();' value='"+(act.getProgOct()!=null?act.getProgOct():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input style='text-align:center' name='ro"+z+"' id='ro"+z+"' type='text' class='vaciodos centro fondoblanco' onchange='fun();' value='"+(act.getResuOct()!=null?act.getResuOct():"")+"'></td>");
   out.println("<td width='60' align='center' class='mestablero bordeazul'><input style='text-align:center' name='pn"+z+"' id='pn"+z+"' type='text' onchange='fun();' class='vaciodos centro fondoblanco' value='"+(act.getProgNov()!=null?act.getProgNov():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input style='text-align:center' name='rn"+z+"' id='rn"+z+"' type='text' onchange='fun();' class='vaciodos centro fondoblanco' value='"+(act.getResuNov()!=null?act.getResuNov():"")+"'></td>");
   out.println("<td width='60' align='center' class='mestablero bordeazul'><input style='text-align:center' name='pd"+z+"' id='pd"+z+"' onchange='fun();' type='text' class='vaciodos centro fondoblanco' value='"+(act.getProgDic()!=null?act.getProgDic():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input style='text-align:center' name='rd"+z+"' id='rd"+z+"' type='text' onchange='fun();' class='vaciodos centro fondoblanco' value='"+(act.getResuDic()!=null?act.getResuDic():"")+"'></td>");
   out.println("<td width='60' align='center' class='bordeazul'><input type='hidden' id='"+z+"' value='"+z+"'></td>");
   out.println("<input type='hidden' id='po' value='"+z+"'>");
   out.println("</tr>");
z++;
}
out.println("<input type='hidden' name='listanueva' id='lista' value='"+lista.size()+"'>");
}
//System.out.println("despues"+z);
out.println("<input type='hidden' id='ora' value='"+z+"'>");

//System.out.println("consulta"+lista.size()+"z"+z);

%>
</table>
<table width="99%">
<tr id="tr1" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="1"></td>
						<td width="590" align="center" class="filauno"><input name="act1" id="act1" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha1();validaFechaFin(this);" type="text" id="datepicker1" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por1" name="por1" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe1" name="pe1" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re1" name="re1"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf1" name="pf1" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf1" name="rf1"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm1" name="pm1"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm1" name="rm1"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa1" name="pa1"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra1" name="ra1"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma1" name="pma1"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma1" name="rma1"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn1" name="pjn1"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn1" name="rjn1"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl1" name="pjl1"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl1" name="rjl1"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag1" name="pag1"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag1" name="rag1"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps1" name="ps1"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs1" name="rs1"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po1" name="po1"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro1" name="ro1"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn1" name="pn1"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn1" name="rn1"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd1" name="pd1"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd1" name="rd1"></td>

					</tr>
<tr id="tr2" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="2"></td>
						<td width="590" align="center" class="filauno"><input name="act2" id="act2" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha2();validaFechaFin(this);" type="text" id="datepicker2" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por2" name="por2" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe2" name="pe2" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re2" name="re2"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf2" name="pf2" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf2" name="rf2"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm2" name="pm2"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm2" name="rm2"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa2" name="pa2"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra2" name="ra2"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma2" name="pma2"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma2" name="rma2"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn2" name="pjn2"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn2" name="rjn2"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl2" name="pjl2"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl2" name="rjl2"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag2" name="pag2"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag2" name="rag2"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps2" name="ps2"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs2" name="rs2"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po2" name="po2"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro2" name="ro2"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn2" name="pn2"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn2" name="rn2"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd2" name="pd2"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd2" name="rd2"></td>

					</tr>

<tr id="tr3" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="3"></td>
						<td width="590" align="center" class="filauno"><input name="act3" id="act3" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha3();validaFechaFin(this);" type="text" id="datepicker3" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por3" name="por3" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe3" name="pe3" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re3" name="re3"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf3" name="pf3" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf3" name="rf3"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm3" name="pm3"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm3" name="rm3"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa3" name="pa3"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra3" name="ra3"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma3" name="pma3"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma3" name="rma3"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn3" name="pjn3"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn3" name="rjn3"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl3" name="pjl3"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl3" name="rjl3"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag3" name="pag3"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag3" name="rag3"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps3" name="ps3"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs3" name="rs3"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po3" name="po3"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro3" name="ro3"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn3" name="pn3"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn3" name="rn3"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd3" name="pd3"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd3" name="rd3"></td>

					</tr>

<tr id="tr4" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="4"></td>
						<td width="590" align="center" class="filauno"><input name="act4" id="act4" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha4();validaFechaFin(this);" type="text" id="datepicker4" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por4" name="por4" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe4" name="pe4" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re4" name="re4"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf4" name="pf4" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf4" name="rf4"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm4" name="pm4"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm4" name="rm4"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa4" name="pa4"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra4" name="ra4"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma4" name="pma4"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma4" name="rma4"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn4" name="pjn4"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn4" name="rjn4"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl4" name="pjl4"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl4" name="rjl4"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag4" name="pag4"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag4" name="rag4"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps4" name="ps4"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs4" name="rs4"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po4" name="po4"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro4" name="ro4"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn4" name="pn4"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn4" name="rn4"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd4" name="pd4"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd4" name="rd4"></td>

					</tr>

<tr id="tr5" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="5"></td>
						<td width="590" align="center" class="filauno"><input name="act5" id="act5" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha5();validaFechaFin(this);" type="text" id="datepicker5" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por5" name="por5" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe5" name="pe5" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re5" name="re5"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf5" name="pf5" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf5" name="rf5"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm5" name="pm5"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm5" name="rm5"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa5" name="pa5"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra5" name="ra5"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma5" name="pma5"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma5" name="rma5"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn5" name="pjn5"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn5" name="rjn5"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl5" name="pjl5"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl5" name="rjl5"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag5" name="pag5"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag5" name="rag5"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps5" name="ps5"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs5" name="rs5"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po5" name="po5"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro5" name="ro5"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn5" name="pn5"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn5" name="rn5"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd5" name="pd5"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd5" name="rd5"></td>

					</tr>

<tr id="tr6" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="6"></td>
						<td width="590" align="center" class="filauno"><input name="act6" id="act6" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha6();validaFechaFin(this);" type="text" id="datepicker6" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por6" name="por6" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe6" name="pe6" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re6" name="re6"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf6" name="pf6" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf6" name="rf6"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm6" name="pm6"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm6" name="rm6"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa6" name="pa6"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra6" name="ra6"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma6" name="pma6"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma6" name="rma6"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn6" name="pjn6"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn6" name="rjn6"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl6" name="pjl6"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl6" name="rjl6"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag6" name="pag6"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag6" name="rag6"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps6" name="ps6"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs6" name="rs6"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po6" name="po6"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro6" name="ro6"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn6" name="pn6"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn6" name="rn6"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd6" name="pd6"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd6" name="rd6"></td>

					</tr>

<tr id="tr7" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="7"></td>
						<td width="590" align="center" class="filauno"><input name="act7" id="act7" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha7();validaFechaFin(this);" type="text" id="datepicker7" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por7" name="por7" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe7" name="pe7" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re7" name="re7"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf7" name="pf7" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf7" name="rf7"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm7" name="pm7"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm7" name="rm7"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa7" name="pa7"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra7" name="ra7"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma7" name="pma7"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma7" name="rma7"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn7" name="pjn7"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn7" name="rjn7"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl7" name="pjl7"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl7" name="rjl7"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag7" name="pag7"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag7" name="rag7"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps7" name="ps7"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs7" name="rs7"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po7" name="po7"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro7" name="ro7"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn7" name="pn7"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn7" name="rn7"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd7" name="pd7"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd7" name="rd7"></td>

					</tr>

<tr id="tr8" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="8"></td>
						<td width="590" align="center" class="filauno"><input name="act8" id="act8" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha8();validaFechaFin(this);" type="text" id="datepicker8" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por8" name="por8" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe8" name="pe8" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re8" name="re8"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf8" name="pf8" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf8" name="rf8"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm8" name="pm8"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm8" name="rm8"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa8" name="pa8"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra8" name="ra8"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma8" name="pma8"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma8" name="rma8"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn8" name="pjn8"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn8" name="rjn8"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl8" name="pjl8"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl8" name="rjl8"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag8" name="pag8"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag8" name="rag8"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps8" name="ps8"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs8" name="rs8"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po8" name="po8"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro8" name="ro8"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn8" name="pn8"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn8" name="rn8"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd8" name="pd8"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd8" name="rd8"></td>

					</tr>

<tr id="tr9" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="9"></td>
						<td width="590" align="center" class="filauno"><input name="act9" id="act9" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha9();validaFechaFin(this);" type="text" id="datepicker9" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por9" name="por9" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe9" name="pe9" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re9" name="re9"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf9" name="pf9" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf9" name="rf9"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm9" name="pm9"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm9" name="rm9"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa9" name="pa9"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra9" name="ra9"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma9" name="pma9"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma9" name="rma9"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn9" name="pjn9"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn9" name="rjn9"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl9" name="pjl9"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl9" name="rjl9"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag9" name="pag9"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag9" name="rag9"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps9" name="ps9"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs9" name="rs9"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po9" name="po9"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro9" name="ro9"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn9" name="pn9"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn9" name="rn9"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd9" name="pd9"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd9" name="rd9"></td>

					</tr>

<tr id="tr10" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="10"></td>
						<td width="590" align="center" class="filauno"><input name="act10" id="act10" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha10();validaFechaFin(this);" type="text" id="datepicker10" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por10" name="por10" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe10" name="pe10" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re10" name="re10"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf10" name="pf10" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf10" name="rf10"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm10" name="pm10"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm10" name="rm10"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa10" name="pa10"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra10" name="ra10"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma10" name="pma10"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma10" name="rma10"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn10" name="pjn10"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn10" name="rjn10"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl10" name="pjl10"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl10" name="rjl10"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag10" name="pag10"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag10" name="rag10"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps10" name="ps10"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs10" name="rs10"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po10" name="po10"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro10" name="ro10"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn10" name="pn10"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn10" name="rn10"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd10" name="pd10"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd10" name="rd10"></td>

					</tr>

<tr id="tr11" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="11"></td>
						<td width="590" align="center" class="filauno"><input name="act11" id="act11" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha11();validaFechaFin(this);" type="text" id="datepicker11" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por11" name="por11" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe11" name="pe11" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re11" name="re11"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf11" name="pf11" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf11" name="rf11"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm11" name="pm11"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm11" name="rm11"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa11" name="pa11"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra11" name="ra11"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma11" name="pma11"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma11" name="rma11"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn11" name="pjn11"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn11" name="rjn11"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl11" name="pjl11"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl11" name="rjl11"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag11" name="pag11"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag11" name="rag11"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps11" name="ps11"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs11" name="rs11"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po11" name="po11"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro11" name="ro11"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn11" name="pn11"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn11" name="rn11"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd11" name="pd11"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd11" name="rd11"></td>

					</tr>

<tr id="tr12" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="12"></td>
						<td width="590" align="center" class="filauno"><input name="act12" id="act12" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha12();validaFechaFin(this);" type="text" id="datepicker12" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por12" name="por12" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe12" name="pe12" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re12" name="re12"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf12" name="pf12" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf12" name="rf12"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm12" name="pm12"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm12" name="rm12"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa12" name="pa12"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra12" name="ra12"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma12" name="pma12"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma12" name="rma12"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn12" name="pjn12"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn12" name="rjn12"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl12" name="pjl12"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl12" name="rjl12"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag12" name="pag12"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag12" name="rag12"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps12" name="ps12"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs12" name="rs12"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po12" name="po12"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro12" name="ro12"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn12" name="pn12"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn12" name="rn12"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd12" name="pd12"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd12" name="rd12"></td>

					</tr>

<tr id="tr13" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="13"></td>
						<td width="590" align="center" class="filauno"><input name="act13" id="act13" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha13();validaFechaFin(this);" type="text" id="datepicker13" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por13" name="por13" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe13" name="pe13" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re13" name="re13"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf13" name="pf13" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf13" name="rf13"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm13" name="pm13"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm13" name="rm13"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa13" name="pa13"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra13" name="ra13"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma13" name="pma13"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma13" name="rma13"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn13" name="pjn13"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn13" name="rjn13"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl13" name="pjl13"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl13" name="rjl13"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag13" name="pag13"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag13" name="rag13"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps13" name="ps13"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs13" name="rs13"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po13" name="po13"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro13" name="ro13"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn13" name="pn13"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn13" name="rn13"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd13" name="pd13"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd13" name="rd13"></td>

					</tr>

<tr id="tr14" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="14"></td>
						<td width="590" align="center" class="filauno"><input name="act14" id="act14" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="1414" style="text-align:center" onchange="obFecha14();validaFechaFin(this);" type="text" id="datepicker14" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por14" name="por14" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe14" name="pe14" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re14" name="re14"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf14" name="pf14" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf14" name="rf14"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm14" name="pm14"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm14" name="rm14"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa14" name="pa14"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra14" name="ra14"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma14" name="pma14"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma14" name="rma14"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn14" name="pjn14"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn14" name="rjn14"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl14" name="pjl14"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl14" name="rjl14"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag14" name="pag14"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag14" name="rag14"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps14" name="ps14"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs14" name="rs14"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po14" name="po14"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro14" name="ro14"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn14" name="pn14"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn14" name="rn14"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd14" name="pd14"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd14" name="rd14"></td>

					</tr>

<tr id="tr15" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="15"></td>
						<td width="590" align="center" class="filauno"><input name="act15" id="act15" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha15();validaFechaFin(this);" type="text" id="datepicker15" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por15" name="por15" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe15" name="pe15" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re15" name="re15"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf15" name="pf15" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf15" name="rf15"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm15" name="pm15"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm15" name="rm15"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa15" name="pa15"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra15" name="ra15"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma15" name="pma15"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma15" name="rma15"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn15" name="pjn15"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn15" name="rjn15"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl15" name="pjl15"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl15" name="rjl15"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag15" name="pag15"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag15" name="rag15"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps15" name="ps15"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs15" name="rs15"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po15" name="po15"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro15" name="ro15"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn15" name="pn15"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn15" name="rn15"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd15" name="pd15"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd15" name="rd15"></td>

					</tr>

<tr id="tr16" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="16"></td>
						<td width="590" align="center" class="filauno"><input name="act16" id="act16" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha16();validaFechaFin(this);" type="text" id="datepicker16" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por16" name="por16" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe16" name="pe16" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re16" name="re16"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf16" name="pf16" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf16" name="rf16"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm16" name="pm16"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm16" name="rm16"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa16" name="pa16"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra16" name="ra16"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma16" name="pma16"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma16" name="rma16"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn16" name="pjn16"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn16" name="rjn16"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl16" name="pjl16"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl16" name="rjl16"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag16" name="pag16"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag16" name="rag16"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps16" name="ps16"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs16" name="rs16"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po16" name="po16"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro16" name="ro16"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn16" name="pn16"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn16" name="rn16"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd16" name="pd16"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd16" name="rd16"></td>

					</tr>
<tr id="tr17" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="17"></td>
						<td width="590" align="center" class="filauno"><input name="act17" id="act17" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha17();validaFechaFin(this);" type="text" id="datepicker17" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por17" name="por17" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe17" name="pe17" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re17" name="re17"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf17" name="pf17" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf17" name="rf17"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm17" name="pm17"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm17" name="rm17"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa17" name="pa17"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra17" name="ra17"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma17" name="pma17"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma17" name="rma17"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn17" name="pjn17"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn17" name="rjn17"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl17" name="pjl17"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl17" name="rjl17"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag17" name="pag17"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag17" name="rag17"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps17" name="ps17"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs17" name="rs17"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po17" name="po17"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro17" name="ro17"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn17" name="pn17"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn17" name="rn17"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd17" name="pd17"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd17" name="rd17"></td>

					</tr>
<tr id="tr18" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="18"></td>
						<td width="590" align="center" class="filauno"><input name="act18" id="act18" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha18();validaFechaFin(this);" type="text" id="datepicker18" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por18" name="por18" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe18" name="pe18" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re18" name="re18"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf18" name="pf18" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf18" name="rf18"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm18" name="pm18"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm18" name="rm18"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa18" name="pa18"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra18" name="ra18"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma18" name="pma18"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma18" name="rma18"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn18" name="pjn18"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn18" name="rjn18"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl18" name="pjl18"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl18" name="rjl18"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag18" name="pag18"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag18" name="rag18"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps18" name="ps18"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs18" name="rs18"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po18" name="po18"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro18" name="ro18"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn18" name="pn18"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn18" name="rn18"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd18" name="pd18"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd18" name="rd18"></td>

					</tr>
<tr id="tr19" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="19"></td>
						<td width="590" align="center" class="filauno"><input name="act19" id="act19" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha19();validaFechaFin(this);" type="text" id="datepicker19" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por19" name="por19" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe19" name="pe19" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re19" name="re19"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf19" name="pf19" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf19" name="rf19"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm19" name="pm19"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm19" name="rm19"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa19" name="pa19"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra19" name="ra19"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma19" name="pma19"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma19" name="rma19"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn19" name="pjn19"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn19" name="rjn19"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl19" name="pjl19"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl19" name="rjl19"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag19" name="pag19"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag19" name="rag19"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps19" name="ps19"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs19" name="rs19"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po19" name="po19"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro19" name="ro19"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn19" name="pn19"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn19" name="rn19"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd19" name="pd19"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd19" name="rd19"></td>

					</tr>

<tr id="tr20" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="20"></td>
						<td width="590" align="center" class="filauno"><input name="act20" id="act20" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha20();validaFechaFin(this);" type="text" id="datepicker20" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por20" name="por20" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe20" name="pe20" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re20" name="re20"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf20" name="pf20" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf20" name="rf20"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm20" name="pm20"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm20" name="rm20"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa20" name="pa20"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra20" name="ra20"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma20" name="pma20"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma20" name="rma20"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn20" name="pjn20"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn20" name="rjn20"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl20" name="pjl20"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl20" name="rjl20"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag20" name="pag20"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag20" name="rag20"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps20" name="ps20"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs20" name="rs20"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po20" name="po20"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro20" name="ro20"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn20" name="pn20"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn20" name="rn20"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd20" name="pd20"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd20" name="rd20"></td>

					</tr>

<tr id="tr21" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="21"></td>
						<td width="590" align="center" class="filauno"><input name="act21" id="act21" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha21();validaFechaFin(this);" type="text" id="datepicker21" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por21" name="por21" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe21" name="pe21" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re21" name="re21"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf21" name="pf21" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf21" name="rf21"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm21" name="pm21"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm21" name="rm21"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa21" name="pa21"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra21" name="ra21"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma21" name="pma21"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma21" name="rma21"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn21" name="pjn21"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn21" name="rjn21"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl21" name="pjl21"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl21" name="rjl21"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag21" name="pag21"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag21" name="rag21"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps21" name="ps21"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs21" name="rs21"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po21" name="po21"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro21" name="ro21"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn21" name="pn21"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn21" name="rn21"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd21" name="pd21"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd21" name="rd21"></td>

					</tr>

<tr id="tr22" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="22"></td>
						<td width="590" align="center" class="filauno"><input name="act22" id="act22" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha22();validaFechaFin(this);" type="text" id="datepicker22" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por22" name="por22" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe22" name="pe22" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re22" name="re22"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf22" name="pf22" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf22" name="rf22"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm22" name="pm22"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm22" name="rm22"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa22" name="pa22"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra22" name="ra22"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma22" name="pma22"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma22" name="rma22"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn22" name="pjn22"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn22" name="rjn22"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl22" name="pjl22"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl22" name="rjl22"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag22" name="pag22"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag22" name="rag22"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps22" name="ps22"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs22" name="rs22"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po22" name="po22"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro22" name="ro22"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn22" name="pn22"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn22" name="rn22"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd22" name="pd22"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd22" name="rd22"></td>

					</tr>

<tr id="tr23" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="23"></td>
						<td width="590" align="center" class="filauno"><input name="act23" id="act23" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha23();validaFechaFin(this);" type="text" id="datepicker23" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por23" name="por23" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe23" name="pe23" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re23" name="re23"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf23" name="pf23" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf23" name="rf23"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm23" name="pm23"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm23" name="rm23"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa23" name="pa23"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra23" name="ra23"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma23" name="pma23"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma23" name="rma23"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn23" name="pjn23"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn23" name="rjn23"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl23" name="pjl23"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl23" name="rjl23"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag23" name="pag23"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag23" name="rag23"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps23" name="ps23"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs23" name="rs23"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po23" name="po23"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro23" name="ro23"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn23" name="pn23"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn23" name="rn23"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd23" name="pd23"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd23" name="rd23"></td>

					</tr>

<tr id="tr24" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="24"></td>
						<td width="590" align="center" class="filauno"><input name="act24" id="act24" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="2424" style="text-align:center" onchange="obFecha24();validaFechaFin(this);" type="text" id="datepicker24" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por24" name="por24" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe24" name="pe24" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re24" name="re24"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf24" name="pf24" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf24" name="rf24"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm24" name="pm24"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm24" name="rm24"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa24" name="pa24"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra24" name="ra24"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma24" name="pma24"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma24" name="rma24"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn24" name="pjn24"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn24" name="rjn24"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl24" name="pjl24"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl24" name="rjl24"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag24" name="pag24"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag24" name="rag24"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps24" name="ps24"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs24" name="rs24"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po24" name="po24"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro24" name="ro24"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn24" name="pn24"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn24" name="rn24"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd24" name="pd24"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd24" name="rd24"></td>

					</tr>

<tr id="tr25" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="25"></td>
						<td width="590" align="center" class="filauno"><input name="act25" id="act25" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha25();validaFechaFin(this);" type="text" id="datepicker25" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por25" name="por25" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe25" name="pe25" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re25" name="re25"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf25" name="pf25" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf25" name="rf25"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm25" name="pm25"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm25" name="rm25"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa25" name="pa25"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra25" name="ra25"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma25" name="pma25"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma25" name="rma25"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn25" name="pjn25"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn25" name="rjn25"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl25" name="pjl25"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl25" name="rjl25"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag25" name="pag25"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag25" name="rag25"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps25" name="ps25"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs25" name="rs25"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po25" name="po25"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro25" name="ro25"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn25" name="pn25"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn25" name="rn25"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd25" name="pd25"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd25" name="rd25"></td>

					</tr>

<tr id="tr26" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="26"></td>
						<td width="590" align="center" class="filauno"><input name="act26" id="act26" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha26();validaFechaFin(this);" type="text" id="datepicker26" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por26" name="por26" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe26" name="pe26" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re26" name="re26"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf26" name="pf26" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf26" name="rf26"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm26" name="pm26"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm26" name="rm26"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa26" name="pa26"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra26" name="ra26"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma26" name="pma26"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma26" name="rma26"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn26" name="pjn26"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn26" name="rjn26"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl26" name="pjl26"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl26" name="rjl26"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag26" name="pag26"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag26" name="rag26"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps26" name="ps26"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs26" name="rs26"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po26" name="po26"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro26" name="ro26"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn26" name="pn26"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn26" name="rn26"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd26" name="pd26"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd26" name="rd26"></td>

					</tr>

<tr id="tr27" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="27"></td>
						<td width="590" align="center" class="filauno"><input name="act27" id="act27" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha27();validaFechaFin(this);" type="text" id="datepicker27" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por27" name="por27" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe27" name="pe27" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re27" name="re27"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf27" name="pf27" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf27" name="rf27"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm27" name="pm27"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm27" name="rm27"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa27" name="pa27"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra27" name="ra27"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma27" name="pma27"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma27" name="rma27"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn27" name="pjn27"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn27" name="rjn27"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl27" name="pjl27"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl27" name="rjl27"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag27" name="pag27"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag27" name="rag27"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps27" name="ps27"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs27" name="rs27"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po27" name="po27"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro27" name="ro27"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn27" name="pn27"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn27" name="rn27"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd27" name="pd27"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd27" name="rd27"></td>

					</tr>

<tr id="tr28" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="28"></td>
						<td width="590" align="center" class="filauno"><input name="act28" id="act28" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha28();validaFechaFin(this);" type="text" id="datepicker28" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por28" name="por28" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe28" name="pe28" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re28" name="re28"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf28" name="pf28" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf28" name="rf28"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm28" name="pm28"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm28" name="rm28"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa28" name="pa28"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra28" name="ra28"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma28" name="pma28"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma28" name="rma28"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn28" name="pjn28"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn28" name="rjn28"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl28" name="pjl28"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl28" name="rjl28"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag28" name="pag28"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag28" name="rag28"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps28" name="ps28"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs28" name="rs28"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po28" name="po28"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro28" name="ro28"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn28" name="pn28"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn28" name="rn28"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd28" name="pd28"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd28" name="rd28"></td>

					</tr>

<tr id="tr29" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="29"></td>
						<td width="590" align="center" class="filauno"><input name="act29" id="act29" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha29();validaFechaFin(this);" type="text" id="datepicker29" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por29" name="por29" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe29" name="pe29" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re29" name="re29"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf29" name="pf29" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf29" name="rf29"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm29" name="pm29"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm29" name="rm29"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa29" name="pa29"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra29" name="ra29"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma29" name="pma29"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma29" name="rma29"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn29" name="pjn29"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn29" name="rjn29"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl29" name="pjl29"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl29" name="rjl29"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag29" name="pag29"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag29" name="rag29"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps29" name="ps29"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs29" name="rs29"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po29" name="po29"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro29" name="ro29"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn29" name="pn29"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn29" name="rn29"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd29" name="pd29"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd29" name="rd29"></td>

					</tr>

<tr id="tr30" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="30"></td>
						<td width="590" align="center" class="filauno"><input name="act30" id="act30" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha30();validaFechaFin(this);" type="text" id="datepicker30" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por30" name="por30" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe30" name="pe30" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re30" name="re30"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf30" name="pf30" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf30" name="rf30"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm30" name="pm30"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm30" name="rm30"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa30" name="pa30"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra30" name="ra30"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma30" name="pma30"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma30" name="rma30"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn30" name="pjn30"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn30" name="rjn30"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl30" name="pjl30"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl30" name="rjl30"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag30" name="pag30"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag30" name="rag30"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps30" name="ps30"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs30" name="rs30"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po30" name="po30"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro30" name="ro30"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn30" name="pn30"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn30" name="rn30"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd30" name="pd30"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd30" name="rd30"></td>

					</tr>

<tr id="tr31" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="31"></td>
						<td width="590" align="center" class="filauno"><input name="act31" id="act31" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha31();validaFechaFin(this);" type="text" id="datepicker31" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por31" name="por31" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe31" name="pe31" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re31" name="re31"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf31" name="pf31" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf31" name="rf31"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm31" name="pm31"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm31" name="rm31"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa31" name="pa31"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra31" name="ra31"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma31" name="pma31"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma31" name="rma31"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn31" name="pjn31"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn31" name="rjn31"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl31" name="pjl31"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl31" name="rjl31"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag31" name="pag31"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag31" name="rag31"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps31" name="ps31"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs31" name="rs31"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po31" name="po31"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro31" name="ro31"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn31" name="pn31"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn31" name="rn31"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd31" name="pd31"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd31" name="rd31"></td>

					</tr>

<tr id="tr32" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="32"></td>
						<td width="590" align="center" class="filauno"><input name="act32" id="act32" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha32();validaFechaFin(this);" type="text" id="datepicker32" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por32" name="por32" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe32" name="pe32" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re32" name="re32"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf32" name="pf32" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf32" name="rf32"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm32" name="pm32"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm32" name="rm32"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa32" name="pa32"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra32" name="ra32"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma32" name="pma32"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma32" name="rma32"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn32" name="pjn32"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn32" name="rjn32"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl32" name="pjl32"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl32" name="rjl32"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag32" name="pag32"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag32" name="rag32"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps32" name="ps32"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs32" name="rs32"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po32" name="po32"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro32" name="ro32"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn32" name="pn32"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn32" name="rn32"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd32" name="pd32"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd32" name="rd32"></td>

					</tr>

<tr id="tr33" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="33"></td>
						<td width="590" align="center" class="filauno"><input name="act33" id="act33" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha33();validaFechaFin(this);" type="text" id="datepicker33" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por33" name="por33" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe33" name="pe33" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re33" name="re33"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf33" name="pf33" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf33" name="rf33"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm33" name="pm33"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm33" name="rm33"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa33" name="pa33"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra33" name="ra33"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma33" name="pma33"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma33" name="rma33"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn33" name="pjn33"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn33" name="rjn33"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl33" name="pjl33"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl33" name="rjl33"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag33" name="pag33"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag33" name="rag33"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps33" name="ps33"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs33" name="rs33"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po33" name="po33"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro33" name="ro33"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn33" name="pn33"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn33" name="rn33"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd33" name="pd33"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd33" name="rd33"></td>

					</tr>

<tr id="tr34" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="34"></td>
						<td width="590" align="center" class="filauno"><input name="act34" id="act34" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha34();validaFechaFin(this);" type="text" id="datepicker34" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por34" name="por34" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe34" name="pe34" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re34" name="re34"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf34" name="pf34" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf34" name="rf34"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm34" name="pm34"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm34" name="rm34"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa34" name="pa34"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra34" name="ra34"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma34" name="pma34"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma34" name="rma34"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn34" name="pjn34"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn34" name="rjn34"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl34" name="pjl34"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl34" name="rjl34"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag34" name="pag34"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag34" name="rag34"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps34" name="ps34"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs34" name="rs34"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po34" name="po34"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro34" name="ro34"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn34" name="pn34"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn34" name="rn34"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd34" name="pd34"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd34" name="rd34"></td>

					</tr>

<tr id="tr35" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="35"></td>
						<td width="590" align="center" class="filauno"><input name="act35" id="act35" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha35();validaFechaFin(this);" type="text" id="datepicker35" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por35" name="por35" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe35" name="pe35" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re35" name="re35"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf35" name="pf35" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf35" name="rf35"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm35" name="pm35"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm35" name="rm35"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa35" name="pa35"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra35" name="ra35"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma35" name="pma35"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma35" name="rma35"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn35" name="pjn35"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn35" name="rjn35"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl35" name="pjl35"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl35" name="rjl35"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag35" name="pag35"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag35" name="rag35"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps35" name="ps35"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs35" name="rs35"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po35" name="po35"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro35" name="ro35"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn35" name="pn35"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn35" name="rn35"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd35" name="pd35"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd35" name="rd35"></td>

					</tr>

<tr id="tr36" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="36"></td>
						<td width="590" align="center" class="filauno"><input name="act36" id="act36" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha36();validaFechaFin(this);" type="text" id="datepicker36" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por36" name="por36" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe36" name="pe36" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re36" name="re36"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf36" name="pf36" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf36" name="rf36"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm36" name="pm36"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm36" name="rm36"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa36" name="pa36"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra36" name="ra36"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma36" name="pma36"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma36" name="rma36"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn36" name="pjn36"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn36" name="rjn36"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl36" name="pjl36"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl36" name="rjl36"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag36" name="pag36"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag36" name="rag36"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps36" name="ps36"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs36" name="rs36"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po36" name="po36"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro36" name="ro36"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn36" name="pn36"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn36" name="rn36"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd36" name="pd36"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd36" name="rd36"></td>

					</tr>

<tr id="tr37" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="37"></td>
						<td width="590" align="center" class="filauno"><input name="act37" id="act37" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha37();validaFechaFin(this);" type="text" id="datepicker37" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por37" name="por37" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe37" name="pe37" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re37" name="re37"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf37" name="pf37" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf37" name="rf37"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm37" name="pm37"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm37" name="rm37"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa37" name="pa37"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra37" name="ra37"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma37" name="pma37"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma37" name="rma37"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn37" name="pjn37"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn37" name="rjn37"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl37" name="pjl37"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl37" name="rjl37"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag37" name="pag37"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag37" name="rag37"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps37" name="ps37"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs37" name="rs37"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po37" name="po37"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro37" name="ro37"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn37" name="pn37"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn37" name="rn37"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd37" name="pd37"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd37" name="rd37"></td>

					</tr>

<tr id="tr38" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="38"></td>
						<td width="590" align="center" class="filauno"><input name="act38" id="act38" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha38();validaFechaFin(this);" type="text" id="datepicker38" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por38" name="por38" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe38" name="pe38" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re38" name="re38"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf38" name="pf38" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf38" name="rf38"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm38" name="pm38"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm38" name="rm38"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa38" name="pa38"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra38" name="ra38"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma38" name="pma38"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma38" name="rma38"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn38" name="pjn38"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn38" name="rjn38"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl38" name="pjl38"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl38" name="rjl38"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag38" name="pag38"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag38" name="rag38"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps38" name="ps38"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs38" name="rs38"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po38" name="po38"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro38" name="ro38"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn38" name="pn38"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn38" name="rn38"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd38" name="pd38"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd38" name="rd38"></td>

					</tr>

<tr id="tr39" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="39"></td>
						<td width="590" align="center" class="filauno"><input name="act39" id="act39" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha39();validaFechaFin(this);" type="text" id="datepicker39" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por39" name="por39" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe39" name="pe39" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re39" name="re39"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf39" name="pf39" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf39" name="rf39"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm39" name="pm39"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm39" name="rm39"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa39" name="pa39"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra39" name="ra39"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma39" name="pma39"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma39" name="rma39"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn39" name="pjn39"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn39" name="rjn39"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl39" name="pjl39"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl39" name="rjl39"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag39" name="pag39"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag39" name="rag39"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps39" name="ps39"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs39" name="rs39"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po39" name="po39"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro39" name="ro39"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn39" name="pn39"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn39" name="rn39"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd39" name="pd39"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd39" name="rd39"></td>

					</tr>

<tr id="tr40" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="40"></td>
						<td width="590" align="center" class="filauno"><input name="act40" id="act40" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha40();validaFechaFin(this);" type="text" id="datepicker40" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por40" name="por40" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe40" name="pe40" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re40" name="re40"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf40" name="pf40" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf40" name="rf40"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm40" name="pm40"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm40" name="rm40"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa40" name="pa40"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra40" name="ra40"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma40" name="pma40"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma40" name="rma40"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn40" name="pjn40"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn40" name="rjn40"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl40" name="pjl40"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl40" name="rjl40"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag40" name="pag40"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag40" name="rag40"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps40" name="ps40"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs40" name="rs40"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po40" name="po40"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro40" name="ro40"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn40" name="pn40"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn40" name="rn40"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd40" name="pd40"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd40" name="rd40"></td>

					</tr>

<tr id="tr41" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="41"></td>
						<td width="590" align="center" class="filauno"><input name="act41" id="act41" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha41();validaFechaFin(this);" type="text" id="datepicker41" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por41" name="por41" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe41" name="pe41" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re41" name="re41"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf41" name="pf41" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf41" name="rf41"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm41" name="pm41"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm41" name="rm41"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa41" name="pa41"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra41" name="ra41"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma41" name="pma41"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma41" name="rma41"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn41" name="pjn41"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn41" name="rjn41"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl41" name="pjl41"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl41" name="rjl41"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag41" name="pag41"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag41" name="rag41"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps41" name="ps41"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs41" name="rs41"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po41" name="po41"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro41" name="ro41"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn41" name="pn41"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn41" name="rn41"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd41" name="pd41"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd41" name="rd41"></td>

					</tr>

<tr id="tr42" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="42"></td>
						<td width="590" align="center" class="filauno"><input name="act42" id="act42" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha42();validaFechaFin(this);" type="text" id="datepicker42" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por42" name="por42" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe42" name="pe42" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re42" name="re42"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf42" name="pf42" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf42" name="rf42"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm42" name="pm42"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm42" name="rm42"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa42" name="pa42"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra42" name="ra42"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma42" name="pma42"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma42" name="rma42"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn42" name="pjn42"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn42" name="rjn42"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl42" name="pjl42"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl42" name="rjl42"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag42" name="pag42"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag42" name="rag42"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps42" name="ps42"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs42" name="rs42"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po42" name="po42"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro42" name="ro42"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn42" name="pn42"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn42" name="rn42"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd42" name="pd42"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd42" name="rd42"></td>

					</tr>

<tr id="tr43" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="43"></td>
						<td width="590" align="center" class="filauno"><input name="act43" id="act43" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha43();validaFechaFin(this);" type="text" id="datepicker43" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por43" name="por43" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe43" name="pe43" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re43" name="re43"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf43" name="pf43" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf43" name="rf43"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm43" name="pm43"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm43" name="rm43"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa43" name="pa43"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra43" name="ra43"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma43" name="pma43"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma43" name="rma43"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn43" name="pjn43"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn43" name="rjn43"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl43" name="pjl43"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl43" name="rjl43"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag43" name="pag43"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag43" name="rag43"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps43" name="ps43"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs43" name="rs43"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po43" name="po43"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro43" name="ro43"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn43" name="pn43"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn43" name="rn43"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd43" name="pd43"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd43" name="rd43"></td>

					</tr>

<tr id="tr44" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="44"></td>
						<td width="590" align="center" class="filauno"><input name="act44" id="act44" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha44();validaFechaFin(this);" type="text" id="datepicker44" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por44" name="por44" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe44" name="pe44" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re44" name="re44"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf44" name="pf44" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf44" name="rf44"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm44" name="pm44"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm44" name="rm44"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa44" name="pa44"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra44" name="ra44"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma44" name="pma44"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma44" name="rma44"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn44" name="pjn44"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn44" name="rjn44"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl44" name="pjl44"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl44" name="rjl44"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag44" name="pag44"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag44" name="rag44"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps44" name="ps44"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs44" name="rs44"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po44" name="po44"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro44" name="ro44"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn44" name="pn44"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn44" name="rn44"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd44" name="pd44"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd44" name="rd44"></td>

					</tr>

<tr id="tr45" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="45"></td>
						<td width="590" align="center" class="filauno"><input name="act45" id="act45" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha45();validaFechaFin(this);" type="text" id="datepicker45" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por45" name="por45" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe45" name="pe45" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re45" name="re45"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf45" name="pf45" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf45" name="rf45"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm45" name="pm45"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm45" name="rm45"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa45" name="pa45"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra45" name="ra45"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma45" name="pma45"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma45" name="rma45"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn45" name="pjn45"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn45" name="rjn45"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl45" name="pjl45"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl45" name="rjl45"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag45" name="pag45"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag45" name="rag45"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps45" name="ps45"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs45" name="rs45"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po45" name="po45"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro45" name="ro45"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn45" name="pn45"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn45" name="rn45"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd45" name="pd45"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd45" name="rd45"></td>

					</tr>

<tr id="tr46" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="46"></td>
						<td width="590" align="center" class="filauno"><input name="act46" id="act46" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha46();validaFechaFin(this);" type="text" id="datepicker46" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por46" name="por46" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe46" name="pe46" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re46" name="re46"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf46" name="pf46" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf46" name="rf46"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm46" name="pm46"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm46" name="rm46"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa46" name="pa46"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra46" name="ra46"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma46" name="pma46"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma46" name="rma46"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn46" name="pjn46"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn46" name="rjn46"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl46" name="pjl46"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl46" name="rjl46"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag46" name="pag46"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag46" name="rag46"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps46" name="ps46"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs46" name="rs46"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po46" name="po46"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro46" name="ro46"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn46" name="pn46"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn46" name="rn46"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd46" name="pd46"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd46" name="rd46"></td>

					</tr>

<tr id="tr47" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="47"></td>
						<td width="590" align="center" class="filauno"><input name="act47" id="act47" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha47();validaFechaFin(this);" type="text" id="datepicker47" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por47" name="por47" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe47" name="pe47" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re47" name="re47"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf47" name="pf47" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf47" name="rf47"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm47" name="pm47"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm47" name="rm47"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa47" name="pa47"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra47" name="ra47"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma47" name="pma47"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma47" name="rma47"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn47" name="pjn47"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn47" name="rjn47"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl47" name="pjl47"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl47" name="rjl47"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag47" name="pag47"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag47" name="rag47"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps47" name="ps47"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs47" name="rs47"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po47" name="po47"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro47" name="ro47"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn47" name="pn47"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn47" name="rn47"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd47" name="pd47"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd47" name="rd47"></td>

					</tr>

<tr id="tr48" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="48"></td>
						<td width="590" align="center" class="filauno"><input name="act48" id="act48" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha48();validaFechaFin(this);" type="text" id="datepicker48" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por48" name="por48" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe48" name="pe48" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re48" name="re48"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf48" name="pf48" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf48" name="rf48"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm48" name="pm48"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm48" name="rm48"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa48" name="pa48"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra48" name="ra48"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma48" name="pma48"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma48" name="rma48"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn48" name="pjn48"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn48" name="rjn48"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl48" name="pjl48"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl48" name="rjl48"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag48" name="pag48"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag48" name="rag48"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps48" name="ps48"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs48" name="rs48"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po48" name="po48"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro48" name="ro48"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn48" name="pn48"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn48" name="rn48"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd48" name="pd48"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd48" name="rd48"></td>

					</tr>

<tr id="tr49" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="49"></td>
						<td width="590" align="center" class="filauno"><input name="act49" id="act49" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha49();validaFechaFin(this);" type="text" id="datepicker49" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por49" name="por49" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe49" name="pe49" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re49" name="re49"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf49" name="pf49" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf49" name="rf49"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm49" name="pm49"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm49" name="rm49"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa49" name="pa49"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra49" name="ra49"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma49" name="pma49"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma49" name="rma49"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn49" name="pjn49"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn49" name="rjn49"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl49" name="pjl49"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl49" name="rjl49"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag49" name="pag49"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag49" name="rag49"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps49" name="ps49"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs49" name="rs49"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po49" name="po49"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro49" name="ro49"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn49" name="pn49"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn49" name="rn49"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd49" name="pd49"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd49" name="rd49"></td>

					</tr>

<tr id="tr50" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="50"></td>
						<td width="590" align="center" class="filauno"><input name="act50" id="act50" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha50();validaFechaFin(this);" type="text" id="datepicker50" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por50" name="por50" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe50" name="pe50" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re50" name="re50"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf50" name="pf50" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf50" name="rf50"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm50" name="pm50"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm50" name="rm50"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa50" name="pa50"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra50" name="ra50"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma50" name="pma50"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma50" name="rma50"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn50" name="pjn50"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn50" name="rjn50"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl50" name="pjl50"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl50" name="rjl50"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag50" name="pag50"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag50" name="rag50"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps50" name="ps50"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs50" name="rs50"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po50" name="po50"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro50" name="ro50"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn50" name="pn50"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn50" name="rn50"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd50" name="pd50"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd50" name="rd50"></td>

					</tr>

<tr id="tr51" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="51"></td>
						<td width="590" align="center" class="filauno"><input name="act51" id="act51" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha51();validaFechaFin(this);" type="text" id="datepicker51" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por51" name="por51" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe51" name="pe51" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re51" name="re51"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf51" name="pf51" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf51" name="rf51"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm51" name="pm51"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm51" name="rm51"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa51" name="pa51"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra51" name="ra51"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma51" name="pma51"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma51" name="rma51"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn51" name="pjn51"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn51" name="rjn51"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl51" name="pjl51"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl51" name="rjl51"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag51" name="pag51"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag51" name="rag51"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps51" name="ps51"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs51" name="rs51"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po51" name="po51"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro51" name="ro51"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn51" name="pn51"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn51" name="rn51"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd51" name="pd51"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd51" name="rd51"></td>

					</tr>

<tr id="tr52" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="52"></td>
						<td width="590" align="center" class="filauno"><input name="act52" id="act52" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha52();validaFechaFin(this);" type="text" id="datepicker52" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por52" name="por52" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe52" name="pe52" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re52" name="re52"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf52" name="pf52" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf52" name="rf52"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm52" name="pm52"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm52" name="rm52"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa52" name="pa52"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra52" name="ra52"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma52" name="pma52"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma52" name="rma52"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn52" name="pjn52"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn52" name="rjn52"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl52" name="pjl52"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl52" name="rjl52"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag52" name="pag52"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag52" name="rag52"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps52" name="ps52"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs52" name="rs52"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po52" name="po52"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro52" name="ro52"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn52" name="pn52"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn52" name="rn52"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd52" name="pd52"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd52" name="rd52"></td>

					</tr>

<tr id="tr53" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="53"></td>
						<td width="590" align="center" class="filauno"><input name="act53" id="act53" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha53();validaFechaFin(this);" type="text" id="datepicker53" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por53" name="por53" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe53" name="pe53" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re53" name="re53"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf53" name="pf53" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf53" name="rf53"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm53" name="pm53"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm53" name="rm53"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa53" name="pa53"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra53" name="ra53"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma53" name="pma53"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma53" name="rma53"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn53" name="pjn53"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn53" name="rjn53"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl53" name="pjl53"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl53" name="rjl53"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag53" name="pag53"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag53" name="rag53"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps53" name="ps53"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs53" name="rs53"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po53" name="po53"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro53" name="ro53"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn53" name="pn53"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn53" name="rn53"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd53" name="pd53"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd53" name="rd53"></td>

					</tr>

<tr id="tr54" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="54"></td>
						<td width="590" align="center" class="filauno"><input name="act54" id="act54" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha54();validaFechaFin(this);" type="text" id="datepicker54" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por54" name="por54" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe54" name="pe54" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re54" name="re54"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf54" name="pf54" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf54" name="rf54"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm54" name="pm54"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm54" name="rm54"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa54" name="pa54"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra54" name="ra54"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma54" name="pma54"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma54" name="rma54"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn54" name="pjn54"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn54" name="rjn54"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl54" name="pjl54"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl54" name="rjl54"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag54" name="pag54"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag54" name="rag54"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps54" name="ps54"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs54" name="rs54"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po54" name="po54"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro54" name="ro54"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn54" name="pn54"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn54" name="rn54"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd54" name="pd54"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd54" name="rd54"></td>

					</tr>

<tr id="tr55" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="55"></td>
						<td width="590" align="center" class="filauno"><input name="act55" id="act55" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha55();validaFechaFin(this);" type="text" id="datepicker55" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por55" name="por55" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe55" name="pe55" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re55" name="re55"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf55" name="pf55" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf55" name="rf55"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm55" name="pm55"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm55" name="rm55"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa55" name="pa55"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra55" name="ra55"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma55" name="pma55"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma55" name="rma55"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn55" name="pjn55"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn55" name="rjn55"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl55" name="pjl55"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl55" name="rjl55"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag55" name="pag55"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag55" name="rag55"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps55" name="ps55"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs55" name="rs55"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po55" name="po55"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro55" name="ro55"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn55" name="pn55"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn55" name="rn55"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd55" name="pd55"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd55" name="rd55"></td>

					</tr>

<tr id="tr56" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="56"></td>
						<td width="590" align="center" class="filauno"><input name="act56" id="act56" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha56();validaFechaFin(this);" type="text" id="datepicker56" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por56" name="por56" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe56" name="pe56" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re56" name="re56"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf56" name="pf56" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf56" name="rf56"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm56" name="pm56"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm56" name="rm56"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa56" name="pa56"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra56" name="ra56"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma56" name="pma56"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma56" name="rma56"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn56" name="pjn56"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn56" name="rjn56"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl56" name="pjl56"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl56" name="rjl56"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag56" name="pag56"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag56" name="rag56"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps56" name="ps56"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs56" name="rs56"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po56" name="po56"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro56" name="ro56"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn56" name="pn56"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn56" name="rn56"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd56" name="pd56"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd56" name="rd56"></td>

					</tr>

<tr id="tr57" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="57"></td>
						<td width="590" align="center" class="filauno"><input name="act57" id="act57" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha57();validaFechaFin(this);" type="text" id="datepicker57" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por57" name="por57" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe57" name="pe57" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re57" name="re57"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf57" name="pf57" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf57" name="rf57"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm57" name="pm57"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm57" name="rm57"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa57" name="pa57"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra57" name="ra57"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma57" name="pma57"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma57" name="rma57"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn57" name="pjn57"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn57" name="rjn57"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl57" name="pjl57"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl57" name="rjl57"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag57" name="pag57"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag57" name="rag57"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps57" name="ps57"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs57" name="rs57"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po57" name="po57"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro57" name="ro57"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn57" name="pn57"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn57" name="rn57"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd57" name="pd57"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd57" name="rd57"></td>

					</tr>

<tr id="tr58" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="58"></td>
						<td width="590" align="center" class="filauno"><input name="act58" id="act58" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha58();validaFechaFin(this);" type="text" id="datepicker58" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por58" name="por58" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe58" name="pe58" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re58" name="re58"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf58" name="pf58" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf58" name="rf58"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm58" name="pm58"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm58" name="rm58"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa58" name="pa58"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra58" name="ra58"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma58" name="pma58"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma58" name="rma58"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn58" name="pjn58"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn58" name="rjn58"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl58" name="pjl58"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl58" name="rjl58"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag58" name="pag58"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag58" name="rag58"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps58" name="ps58"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs58" name="rs58"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po58" name="po58"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro58" name="ro58"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn58" name="pn58"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn58" name="rn58"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd58" name="pd58"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd58" name="rd58"></td>

					</tr>

<tr id="tr59" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="59"></td>
						<td width="590" align="center" class="filauno"><input name="act59" id="act59" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha59();validaFechaFin(this);" type="text" id="datepicker59" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por59" name="por59" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe59" name="pe59" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re59" name="re59"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf59" name="pf59" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf59" name="rf59"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm59" name="pm59"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm59" name="rm59"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa59" name="pa59"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra59" name="ra59"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma59" name="pma59"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma59" name="rma59"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn59" name="pjn59"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn59" name="rjn59"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl59" name="pjl59"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl59" name="rjl59"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag59" name="pag59"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag59" name="rag59"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps59" name="ps59"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs59" name="rs59"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po59" name="po59"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro59" name="ro59"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn59" name="pn59"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn59" name="rn59"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd59" name="pd59"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd59" name="rd59"></td>

					</tr>

<tr id="tr60" style="display:none">
						<td width="20" align="center"><input type="checkbox" id="60"></td>
						<td width="590" align="center" class="filauno"><input name="act60" id="act60" type="text" class="inicio centro fondoblanco sombraceldas" value="">
						<td width="70" align="center" class="filauno"><input size="11" style="text-align:center" onchange="obFecha60();validaFechaFin(this);" type="text" id="datepicker60" class="centro derecha porcentaje fondoblanco sombraceldas" value=""></td>
						<td width="56" align="center" class="filauno"><input id="por60" name="por60" value="" onchange="ponderacion();fun()" type="text" class="centro porcentaje2 fondoblanco sombraceldas"></td>
						<td width="60" align="center" class="mestablero bordeazul "><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pe60" name="pe60" value=""></td>
						<td width="60" align="center" class="bordeazul "><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="re60" name="re60"></td>
						<td width="60"  align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" onchange="fun()" id="pf60" name="pf60" value=""></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rf60" name="rf60"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pm60" name="pm60"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rm60" name="rm60"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pa60" name="pa60"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ra60" name="ra60"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pma60" name="pma60"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rma60" name="rma60"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjn60" name="pjn60"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjn60" name="rjn60"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pjl60" name="pjl60"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rjl60" name="rjl60"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pag60" name="pag60"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rag60" name="rag60"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ps60" name="ps60"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rs60" name="rs60"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="po60" name="po60"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="ro60" name="ro60"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pn60" name="pn60"></td>
						<td  width="60" align="center" class="bordeazul"><input type="text" style="text-align:center" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rn60" name="rn60"></td>
						<td  width="60" align="center" class="mestablero bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="pd60" name="pd60"></td>
						<td  width="60" align="center" class="bordeazul"><input style="text-align:center" type="text" class="vaciodos centro fondoblanco" value="" onchange="fun()" id="rd60" name="rd60"></td>

		</tr>
					</table>
				
				
				<table>
				<tr>
				
				<div id="container"  style="width:1260px; height:350px; background:#FFFFFF; display:none;"> 
			    <img src="ImagenesADN/cerrar.png" align="left" id="botonQuitarInd" onclick="quitaGraficaProyec()">
			    
				<div  id="graficaprioridad" style=" min-width: 1200px; height: 300px; margin: 0 auto"></div>
				</div>
				
										
				</tr>
				</table>
			</div>
			<div align="center">
			<button style="display:none" align="center" id="botonQuitarProyecto" type="button" class="btn btn-primary" onclick="quitaGraficaProyec()">
							 Quitar
						</button>
			</div>	
			
			             <div>		<table>
			                        <tr>
			                        <td class="negritas resalta">
			                        Lista de archivos de soporte
			                        </td>
			                        <td width=400px>
			                        <select id="keyFrame" class="form-control nopadding" name="clave">
			                        <%
			                        ArrayList<UrlDetalle> arrUrl = (ArrayList<UrlDetalle>)request.getAttribute("arrUrl");
			                        String nbUrl="", desUrl="";
									if(arrUrl!=null && arrUrl.size()>0){
										for(int i=0; i<arrUrl.size();i++){
											UrlDetalle url = arrUrl.get(i);
											nbUrl = url.getNbURL();
											desUrl = url.getUrl();
											%>
											 <option value="<%=desUrl%>"><%=nbUrl%></option>
											<%
										}
									}%>
			                        </select>
			                        </td>
			                        <td>
			                        <button type="button" id="botonProg" data-loading-text="Agr/Act..." class="btn btn-info btn-sm" autocomplete="off" onclick="cambiaframe()">
										 Consultar programa
									</button>
			                        </td>
			                        <td>
			                        <button type="button"  class="btn btn-info btn-sm" autocomplete="off" data-toggle="modal" href="#example">
									 Editar Lista
                                    </button>
			                        
			                        </td>
			                        </tr>
			                        <tr Height=10px>
			                        </tr>
			                        </table>							
									<button type="button" id="botonAgregar" data-loading-text="Agr/Act..." class="btn btn-primary btn-sm " autocomplete="off" onclick="actualizaAcCon()">
										 Aceptar
										</button>
									<button type="button" id="botonCancelar" data-loading-text="Agr/Act..." class="btn btn-danger btn-sm" autocomplete="off" onclick="hojaRumbo()">
										 Cancelar
										</button>	
									                                    
							</div>		
									
			<div>
			<br/>
			
			<IFRAME WIDTH=1200 HEIGHT=700 FRAMEBORDER=0 style="display:none" id="frame" src="#"></IFRAME>
			</div>
			</form>
				</div>
			<br/>
		 </td>
		 </tr>
		</table>
								
		</div>

<div id="example" class="modal fade ">
<div class="modal-dialog " style="width:800px;">
<div class="modal-content fondoadn sombramodal " style="width:1100px;">
<form method="POST" id="actualizaURL" action="actualizaURL">
	<input type="hidden" id="usuarioHR1" name="usuarioHR1" value="<%=(request.getAttribute("usuarioHR")!=(null))?request.getAttribute("usuarioHR"): ""%>">
	<input type="hidden" id="pesoTotal1" name="pesoTotal1" value="<%=(request.getAttribute("pesoTotal")!=(null))?request.getAttribute("pesoTotal"): ""%>">
	<input type="hidden" id="desMensual1" name="desMensual1" value="<%=(request.getAttribute("desMensual")!=(null))?request.getAttribute("desMensual"): ""%>">
	<input type="hidden" id="mesBarra1" name="mesBarra1" value="<%=(request.getAttribute("mesBarra")!=(null))?request.getAttribute("mesBarra"): ""%>">
	<input type="hidden" id="anioSel1" name="anioSel1" value="<%=(request.getAttribute("anioSel")!=(null))?request.getAttribute("anioSel"): ""%>">
	<input type="hidden" id="mesNumerico1" name="mesNumerico1" value="<%=(request.getAttribute("mesNum")!=(null))?request.getAttribute("mesNum"): ""%>">
	<input type="hidden" id="clavePrio1" name="clavePrio1" value="<%=(request.getAttribute("idPrioridad")!=(null))?request.getAttribute("idPrioridad"): ""%>">
	<input type="hidden" id="contURL" name="contURL" value="">
	<input type="hidden" id="urlBorrar" name="urlBorrar" value="">
	<div class="modal-header headeradn">       
        	<a class="close" data-dismiss="modal" onclick=""><i class="fa fa-times fa-lg" style="color:#ff0000; padding:10px 0px 0px 0px;"></i></a>
            <h5 class="negritas m-t-15">Archivos de Soporte</h5>
  	</div>
    <div class="modal-body" style="border-top: 2px solid #B5B7B9;">
       	<table name="tablamaestra" width=100%>
	       	<tr class="nopadding" style="height:20px;">
    	   	  <td class="textBarra resalta nopadding" style="text-align:left;">Nombre del Archivo</td>
       		  <td class="textBarra resalta nopadding" style="text-align:left;">URL</td>
       	  	  <td></td>
       		</tr>
	       	<tr>
    	   		<td width=30%>
       			    <div class="input-group margin-bottom-sm">
             			<span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-check-square-o fa-fw"></i></span>
             			<input class="form-control input-xs" id="nombreURL" id="nombreURL" type="text" placeholder="Nombre"></input>
           			</div>
         		</td>
        		<td width=60%>
       	   			<div class="input-group margin-bottom-sm">
             			<span class="input-group-addon" style="padding: 0px 6px 0px 6px;"><i class="fa fa-check-square-o fa-fw"></i></span>
             			<input class="form-control input-xs" id="descURL" name="descURL" type="text" placeholder="URL"></input>
           			</div>
         		</td>
         		<td>
		            <a onclick="validaURL()" class="boton"><i class="fa fa-plus"></i></a>         
        		</td>
       		</tr>
       	</table><!-- tablamaestra --> 	
       	</div>
       	   <div class="modal-body">
       
       		<table id="tblURLs" class="table table-striped table table-bordered table table-hover" style="font:Arial; font-size:12px; ">
                <tr>
       			<th style="background:#6487CE"><strong>Nombre</strong></th>
       			<th style="background:#6487CE"><strong>URL</strong></th>
       			<th style="background:#6487CE"><strong></strong></th>
       		    </tr>
				 <%ArrayList<UrlDetalle> arrUrls = (ArrayList<UrlDetalle>) request.getAttribute("arrUrl");
			    	if(arrUrls!=null && arrUrls.size()>0){
			    		for(int i=0; i<arrUrls.size(); i++){
			    			UrlDetalle coment = arrUrls.get(i);
			    			String nomUrl = coment.getNbURL();
			    			String url = coment.getUrl();
			    %>
			    <tr>
			    	<td><%=nomUrl%></td>
			    	<td style="max-width:500px; overflow:hidden;"><%=url%><input type="hidden" id="url<%=i%>" name="url<%=i%>" value="<%=coment.getIdURLdetalle()%>" > </td>
			    	<td><a onclick="borraURL(<%=i%>)" id="borrar<%=i%>" class='btn btn-danger btn-xs'>Borrar</a></td>	
			    </tr>
			    <%		}
			    	}
			    %>
			    
			</table>	       	
       	</div> 
	        <div class="modal-footer " style="border-top: 2px solid #B5B7B9;">
	        	<a onclick="actualizaURL()" id="btnAceptar" class="btn btn-success h-25" data-dismiss="modal">Guardar</a>
	            <a onclick="" id="btnCancelar" class="btn btn-danger h-25" data-dismiss="modal">Cerrar</a>
			</div>
			
</form>
</div>
</div>
</div>
		
<div align="center">
  <p class="footer">Powered by: ADN. Todos los derechos reservados. 2015</p>
  <div id="logodiezequis"><img src="ImagenesADN/logo-adn.png" width="53" height="37" /></div>
</div>
	
<form method="POST" id="redireccion" action="CargaInterfazIndicadores">
	<input type="hidden" id="usuarioRedireccion" name="usuarioRedireccion" value="<%=(request.getAttribute("usuarioHR")!=(null))?request.getAttribute("usuarioHR"): ""%>">
	<input type="hidden" id="mesEnviado" name="mesEnviado" value="<%=(request.getAttribute("mesBarra")!=(null))?request.getAttribute("mesBarra"): ""%>">
	<input type="hidden" id="mesNumerico" name="mesNumerico" value="<%=(request.getAttribute("mesNum")!=(null))?request.getAttribute("mesNum"): ""%>">
	<input type="hidden" id="anioSel" name="anioSel" value="<%=(request.getAttribute("anioSel")!=(null))?request.getAttribute("anioSel"): ""%>">
	<input type="hidden" id="origen" name="origen" value="">
</form>
<form method="POST" id="linkDireccion" action="linkDireccion">
	<input type="hidden" id="linkDestino" name="linkDestino" value="">
</form>
</body>
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


inicio("Modif");

function linkDir(link){
	document.getElementById("linkDestino").value=link;
	document.getElementById("linkDireccion").submit();
	
}

function cambiaframe(){
	var liga= document.getElementById("keyFrame").value;

	var estatus=document.getElementById("frame").style.display

	if(liga==""){
	alert("Por favor ingrese la URL del documento de apoyo que desea mostrar");
	}
	else{
		if (estatus=="none"){
		    document.getElementById("frame").src=liga;
			document.getElementById("frame").style.display="inline";
			}		
	else
		{
		
		document.getElementById("frame").style.display="none";
		}
	}
}

var fechaActual = new Date();
var mesActual;
var anoActual;
var mesNumerico;

function hojaRumbo(){
	var mes = document.getElementById("mesNum").value;
	var mesNum = parseInt(mes);
	document.getElementById("mesNumerico").value=mesNum-1;  
	document.getElementById("origen").value="Otro";
	document.getElementById("redireccion").submit();
}

function obtieneMes(){
	//Obtiene mes actual 
		mesActual=fechaActual.getMonth();
		anoActual=fechaActual.getFullYear();
		mesNumerico=mesActual;
		
		
	}

function regresaNombreMes(mesNum){
	var mes = "";
	switch (mesNum) {
	case 0:
		mes = "Enero";
		break;
	case 1:
		mes = "Febrero";
		break;
	case 2:
		mes = "Marzo";
		break;
	case 3:
		mes = "Abril";
		break;
	case 4:
		mes = "Mayo";
		break;
	case 5:
		mes = "Junio";
		break;
	case 6:
		mes = "Julio";
		break;
	case 7:
		mes = "Agosto";
		break;
	case 8:
		mes = "Septiembre";
		break;
	case 9:
		mes = "Octubre";
		break;
	case 10:
		mes = "Noviembre";
		break;
	case 11:
		mes = "Diciembre";
		break;
	}
	return mes;
}
</script>
<script>
$(function() {
	$("#datepicker100").datepicker();
});
$(function() {
	$("#datepicker101").datepicker();
});

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

</html>
