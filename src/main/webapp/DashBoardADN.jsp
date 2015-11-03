<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

    <LINK href="EstilosADN/StyleADN.css" rel="stylesheet" type="text/css">
      <LINK href="EstilosADN/dis.css" rel="stylesheet" type="text/css">
	<LINK href="js/bootstrap.css" rel="stylesheet" type="text/css">
    
     <!-- Scripts para las graficas -->
    <script src="js/jquery-1.11.1.min.js"></script>
	<script src="js/highcharts.js"></script>
	<script src="js/highcharts-3d.js"></script>
	<script src="js/modulos/exporting.js"></script>
	<script src="js/highcharts-more.js"></script>
	<script src="js/modulos/solid-gauge.js"></script>
	<script src="js/modulos/data.js"></script>
	<script src="js/modulos/funnel.js"></script>
	
	<!-- Script paa drag & drop -->
	<script src="js/jquery-ui.js"></script>
	<link rel="stylesheet" href="EstilosADN/jquery-ui.css">

	<script src="js/bootstrap-modal.js"></script>
	
<title>Dashboard</title>



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
	function funValida(){
		indi1 = document.getElementById("miSelect1").value;
		indi2 = document.getElementById("miSelect2");
			if(indi1 != "noSeleccionado"){
				indi2.disabled=false;
			}else
				indi2.disabled=true;
	}
	
	function funValida2(){
		indi2 = document.getElementById("miSelect2").value;
		indi3 = document.getElementById("miSelect3");
			if(indi2 != "noSeleccionado"){
				indi3.disabled=false;
			}else{
				indi3.disabled=true;
			}
	}
	
	function funValida3(){
		indi3 = document.getElementById("miSelect3").value;
		indi4 = document.getElementById("miSelect4");
			if(indi3 != "noSeleccionado"){
				indi4.disabled=false;
			}else{
				indi4.disabled=true;
			}
	}
</script>


<script>
nombreIndicador1="";
nombreIndicador2="";
nombreIndicador3="";
nombreIndicador4="";
datosIndicador1=[];
datosIndicador2=[];
datosIndicador3=[];
datosIndicador4=[];

function obtenerV(){
	
		contadorSelect=0;		
		valor1=document.getElementById("miSelect1").value;
		valor2=document.getElementById("miSelect2").value;
		valor3=document.getElementById("miSelect3").value;
		valor4=document.getElementById("miSelect4").value;
		selecIn = document.getElementById("selectIndicador");
		datos1="";
		datos2="";
		datos3="";
		datos4="";
		
	
		if(valor1=="noSeleccinado" || valor2=="noSeleccionado"){
				alert("Debe seleccionar al menos 2 Indicadores");
		}
		
		else{
				for(x=1;x<5;x++){
					if(document.getElementById("miSelect"+x).value!="" && document.getElementById("miSelect"+x).value!="noSeleccionado" && document.getElementById("miSelect"+x).value!="noSeleccionado" && document.getElementById("miSelect"+x).value!="noSeleccionado"){
						contadorSelect=contadorSelect+1;
					}
				}
				if(contadorSelect==2){
						for(i=0; i<selecIn.length;i++){
							valtem = selecIn.options[i].value;
							valtem=valtem.split("-");
							if(valor1.indexOf(",")!=(-1)){
								valor1=valor1.split(",");
							}
							if(valor1[0]==valtem[0]){
								datos1="";
								datos1=selecIn.options[i].value;
								//alert(datos1);
							}
						}
				
					//2
						for(i=0; i<selecIn.length;i++){
							valtem = selecIn.options[i].value;
							valtem=valtem.split("-");
								if(valor2.indexOf(",")!=(-1)){
									valor2=valor2.split(",");
								}
								if(valor2[0]==valtem[0]){
									datos2="";
									datos2=selecIn.options[i].value;
									//alert(datos2);
								}
						}	
					
						if(valor1[1]==valor2[1]){
						//alert(valor1[1]);
							if(valor1[1]=="semanal"){
							
								datoX=semanasGraficar;
							
							}else if(valor1[1]=="mensual"){
							
								datoX=mesesGraficar;
							
							}else{
							
								datoX=trimestresGraficar;
							
							}
						
						datosIndicador1=[];
						datosIndicador2=[];
						datos1=datos1.split("-");
							for(r=0; r<(datos1.length-2);r++){
							
								datosIndicador1[r]=datos1[r+1];
								
							}
						datos2=datos2.split("-");
							for(r=0; r<(datos2.length-2);r++){
							
								datosIndicador2[r]=datos2[r+1];
								
							}	
							nombreIndicador="Cruza de Indicadores";
							muestraGraficas("cruzarIndicadores");
							datosIndicador1=parsearArreglo(datosIndicador1);
							datosIndicador2=parsearArreglo(datosIndicador2);
							
							origenDatos="cruzarIndicadores";
							arregloSeries=[{name: nombreIndicador1=datos1[0], data: datosIndicador1},
										   {name: nombreIndicador2=datos2[0], data: datosIndicador2}];
						}else{
							alert("Debe seleccionar las frecuencias iguales");
						}
				}// if contador 2
				else
					if(contadorSelect==3){
						for(i=0; i<selecIn.length;i++){
							valtem = selecIn.options[i].value;
							valtem=valtem.split("-");
							if(valor1.indexOf(",")!=(-1)){
								valor1=valor1.split(",");
							}
							if(valor1[0]==valtem[0]){
								datos1="";
								datos1=selecIn.options[i].value;
								//alert(datos1);
							}
					}
		
		//2
					for(i=0; i<selecIn.length;i++){
						valtem = selecIn.options[i].value;
						valtem=valtem.split("-");
							if(valor2.indexOf(",")!=(-1)){
								valor2=valor2.split(",");
							}
							if(valor2[0]==valtem[0]){
								datos2="";
								datos2=selecIn.options[i].value;
								//alert(datos2);
							}
					}	
		
			//3
					for(i=0; i<selecIn.length;i++){
						valtem = selecIn.options[i].value;
						valtem=valtem.split("-");
							if(valor3.indexOf(",")!=(-1)){
								valor3=valor3.split(",");
							}
							if(valor3[0]==valtem[0]){
								datos3="";
								datos3=selecIn.options[i].value;
								//alert(datos3);
							}
					}	
		
					if(valor1[1]==valor2[1] && valor2[1]==valor3[1]){
						if(valor1[1]=="semanal"){
								
							datoX=semanasGraficar;
						
						}else if(valor1[1]=="mensual"){
						
							datoX=mesesGraficar;
						
						}else{
						
							datoX=trimestresGraficar;
						
						}
					datosIndicador1=[];
					datosIndicador2=[];
					datosIndicador3=[];
					datos1=datos1.split("-");
						for(r=0; r<(datos1.length-2);r++){
						
							datosIndicador1[r]=datos1[r+1];
							
						}
					datos2=datos2.split("-");
						for(r=0; r<(datos2.length-2);r++){
						
							datosIndicador2[r]=datos2[r+1];
							
						}
					datos3=datos3.split("-");
						for(r=0; r<(datos3.length-2);r++){
						
							datosIndicador3[r]=datos3[r+1];
							
						}	
						nombreIndicador="Cruza de Indicadores";						
						muestraGraficas("cruzarIndicadores");
						origenDatos="cruzarIndicadores";
						datosIndicador1=parsearArreglo(datosIndicador1);
						datosIndicador2=parsearArreglo(datosIndicador2);
						datosIndicador3=parsearArreglo(datosIndicador3);
						arregloSeries=[{name: nombreIndicador1=datos1[0], data: datosIndicador1},
									   {name: nombreIndicador2=datos2[0], data: datosIndicador2},
									   {name: nombreIndicador3=datos3[0], data: datosIndicador3}];
					}else{
						alert("Debe seleccionar las frecuencias iguales");
					}
				}// if contador 3

				else
					if(contadorSelect==4){
						for(i=0; i<selecIn.length;i++){
							valtem = selecIn.options[i].value;
							valtem=valtem.split("-");
							if(valor1.indexOf(",")!=(-1)){
								valor1=valor1.split(",");
							}
							if(valor1[0]==valtem[0]){
								datos1="";
								datos1=selecIn.options[i].value;
								//alert(datos1);
							}
					}
			
			//2
					for(i=0; i<selecIn.length;i++){
						valtem = selecIn.options[i].value;
						valtem=valtem.split("-");
							if(valor2.indexOf(",")!=(-1)){
								valor2=valor2.split(",");
							}
							if(valor2[0]==valtem[0]){
								datos2="";
								datos2=selecIn.options[i].value;
								//alert(datos2);
							}
					}	
			
				//3
					for(i=0; i<selecIn.length;i++){
						valtem = selecIn.options[i].value;
						valtem=valtem.split("-");
							if(valor3.indexOf(",")!=(-1)){
								valor3=valor3.split(",");
							}
							if(valor3[0]==valtem[0]){
								datos3="";
								datos3=selecIn.options[i].value;
								//alert(datos3);
							}
					}
				//4
					for(i=0; i<selecIn.length;i++){
						valtem = selecIn.options[i].value;
						valtem=valtem.split("-");
							if(valor4.indexOf(",")!=(-1)){
								valor4=valor4.split(",");
							}
							if(valor4[0]==valtem[0]){
								datos4="";
								datos4=selecIn.options[i].value;
							//	alert(datos4);
							}
					}
			
					if(valor1[1]==valor2[1] && valor2[1]==valor3[1] && valor3[1]==valor4[1]){
						if(valor1[1]=="semanal"){
								
							datoX=semanasGraficar;
						
						}else if(valor1[1]=="mensual"){
						
							datoX=mesesGraficar;
						
						}else{
						
							datoX=trimestresGraficar;
						
						}
					datosIndicador1=[];
					datosIndicador2=[];
					datosIndicador3=[];
					datosIndicador4=[];
					datos1=datos1.split("-");
						for(r=0; r<(datos1.length-2);r++){
						
							datosIndicador1[r]=datos1[r+1];
							
						}
					datos2=datos2.split("-");
						for(r=0; r<(datos2.length-2);r++){
						
							datosIndicador2[r]=datos2[r+1];
							
						}
					datos3=datos3.split("-");
						for(r=0; r<(datos3.length-2);r++){
						
							datosIndicador3[r]=datos3[r+1];
							
						}
					datos4=datos4.split("-");
						for(r=0; r<(datos4.length-2);r++){
						
							datosIndicador4[r]=datos4[r+1];
							
						}				
						nombreIndicador="Cruza de Indicadores";	
						muestraGraficas("cruzarIndicadores");
						origenDatos="cruzarIndicadores";
						datosIndicador1=parsearArreglo(datosIndicador1);
						datosIndicador2=parsearArreglo(datosIndicador2);
						datosIndicador3=parsearArreglo(datosIndicador3);
						datosIndicador4=parsearArreglo(datosIndicador4);
						arregloSeries=[{name: nombreIndicador1=datos1[0], data: datosIndicador1},
									   {name: nombreIndicador2=datos2[0], data: datosIndicador2},
									   {name: nombreIndicador3=datos3[0], data: datosIndicador3},
									   {name: nombreIndicador4=datos4[0], data: datosIndicador4}];
					}else{
						alert("Deben tener las frecuencias iguales");
					}
				}// if contador 4
			} //else	
}	//funcion
</script>


<script>
		function agregaSelect(){
			
			x = document.getElementById("selectIndicador").length;
			for(i=0; i<x;i++)
				{
					sub=(document.getElementById("selectIndicador").options[i].value).split("-");
					lon=sub.length;
					arre=[];
					if(sub.length!=1){
					arre[0]=[sub[0],sub[lon-1]];
					}else{
						arre[0]=sub[0];

					}
					// arre==val,fre && sub==value
					//alert(arre[0]+"--"+sub[0]);
					variable1 = new Option(arre[0],arre[0]);
					variable2 = new Option(arre[0],arre[0]);
					variable3 = new Option(arre[0],arre[0]);
					variable4 = new Option(arre[0],arre[0]);
					
					//variable = new Option(arre[0],sub[0]);
					//variable1 = new Option(arre[0],sub[0]);
					//variable2 = new Option(arre[0],sub[0]);
					//variable3 = new Option(arre[0],sub[0]);
					
					document.getElementById("miSelect1").options[i]=variable1;
					document.getElementById("miSelect2").options[i]=variable2;
					document.getElementById("miSelect3").options[i]=variable3;
					document.getElementById("miSelect4").options[i]=variable4;
				}
			//opcion0=new Option("Enero","Enero");
			//opcion1=new Option("Febrero","Febrero");
			//opcion2=new Option("Marzo","Marzo");
			//obtiene el tamaño
			
			//obtiene el valor
			//alert(document.getElementById("miSelect").options[3].value);
			//substring
			
		//	document.getElementById("miSelect3").disabled=true;
			//document.getElementById("miSelect4").disabled=true;
					
		}
</script>

<script>
//Valores aleatorios para llenar graficas momentaneamente
var randomScalingFactor = function(){ return Math.round(Math.random()*30)};
var valorRandom1=randomScalingFactor();
var valorRandom2=randomScalingFactor();
var valorRandom3=randomScalingFactor();
var valorRandom4=randomScalingFactor();

//Variables globales
var q1, q2, q3, q4, nombreIndicador, tipoGrafica, tipoAlerta, tipoNotif;
var indice=1;
var azul="#000099", negro="#000000", azulC="#0040FF", rojo="#FF0040", gris="#A4A4A4", rojoO="#610B0B", rojoC="#FF0000", grisC="#F2F2F2";
var tamanoLargo="350px";
//variables para drag y drop
var gGraficaDD="", tipoGraficaDD="", tdGraficaDD=""; 
// Variable de alertas
var numeroAlertasBajas=0;
var numeroAlertasAltas=0;

// Variables usadas para guardar dashboard
var dashCargado="";
var dashHistoria=[];
var dashTotal=[];
var dashNuevo=0;

//variable para incrementar dashtotal
var indiceDashTotal=0;

// variable usada para el semaforo
var color="";

//Variable frecuencia
var variableFrecuencia="";
var nuevaFrecuencia="";
var nuevoDatoFrecuencia=[];
var cambioFrecuencia=false;
var cambioFrecGuardar=false;
//Nuevo arreglo que obtiene los valores de indicadores(dinamico)
var datosIndicadores=[];
var realesIndicador=[];
//Arreglos que se envian a las graficas como valores
var indicadorGraficar=[];
var semanasGraficar=["Semana"];
var mesesGraficar=["ene","feb","mar","abr","may","jun","jul","ago","sep","oct","nov","dic"];
var trimestresGraficar=["trim1","trim2","trim3","trim4"];
var datoX=[];
var datoY=[];

//Arreglo para graficar las series en caso de que no sean solo los datos
var arregloSeries=[];
var arregloSeriesAlt=[];
//Origen de los datos
var origenDatos="";

//Valores para grafica quiero casa
QS1=[["Abierto",8],["Cerrado",2],["Pendiente",104],["Por Aprobar",3]];

//Valores datos Alfredo
QS=["Q4-14","Q1-15","Q2-15","Q3-15","Q4-15","Q1-16","Q2-16","Q3-16","Q4-16","Q1-17","Q2-17","Q3-17","Q4-17","Q1-18","Q2-18","Q3-18","Q4-18","Q1-19","Q2-19","Q3-19","Q4-19","Q1-20","Q2-20","Q3-20","Q4-20"];
DQIngreso=[24390,32580,59730,96330,145530,241980,328980,444330,541680,664230,869880,1059030,1289580,1568730,1903680,2301630,2769780,3315330,3949080,4681830,5524380,6487530,7582080,8818830,10208580];
DQContratos=[2,2,2,2,2,5,5,5,5,5,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10];
DQLicencias=[3390,11580,38730,75330,124530,189480,276480,391830,489180,611730,764880,954030,1184580,1463730,1798680,2196630,2664780,3210330,3844080,4576830,5419380,6382530,7477080,8713830,10103580];
DQRSociales=[100,1000,2000,3000,4000,5000,7000,9000,11000,14000,17000,20000,23000,27000,31000,35000,39000,43000,49000,55000,61000,67000,73000,79000,85000];
DQMejoras=["50%","60%"];
//Administrativas
QAL=["1-jul","1-ago","1-sep","1-oct","1-nov","1-dic","1-ene","1-feb","1-mar","1-abr"];
QAIngreso=[0 ,0,2177,6098,6098,6098,10860,10860,10860,19910];
QAGasto=[692,3130,8823,8053,8053,8053,9453,9453,8553,8553];
QAFlujo=[-692,-3130,-6646,-4090,-4090,-4090,1407,1407,2307,11357];

//datos resultado graficas 30 sep

var mesesGraficas=["Oct14","Nov14","Dic14", "Ene15","Feb15","Mar15", "Abr15","May15","Jun15","Jul15", "Ago15","Sep17"];
var ingresoResultado=[20000,69848,69848,122055,122055,122055,239705,239705,239705,398305,398305,398305];
var cVentaResultado=[131758.5278,131758.5278,131758.5278,331758.5278,146758.5278,146758.5278,146758.5278,296758.5278,246758.5278,146758.5278,146758.5278,146758.5278];
var gAdmResultado=[10666.66667,27333.33333,160666.6667,10666.66667,10666.66667,110666.6667,30666.66667,30666.66667,30666.66667,30666.66667,30666.66667,30666.66667];

var utilidad=[-111759,-61911,-61911,-209704,-24704,-24704,92946,-57054,-7054,251546,251546,251546];
var utilidadBruta=[-5.58793,-0.88637,-0.88637,-1.71811,-0.20240,-0.20240,0.38775,-0.23802,-0.02943,0.63154,0.63154,0.63154];
var utilidadOperacion=[-122425,-89244,-222578,-220370,-35370,-135370,62280,-87720,-37720,220880,220880,220880];
var utilidadOperacion=[-6.121259722,-1.277703012,-3.186623636,-1.805499115,-0.289788984,-1.109091757,0.2598185501,-0.3659506245,-0.1573608996,0.554549417,0.554549417,0.554549417];

var egresosFlujo=[142.425,159.092,292.425,342.425,157.425,257.425,177.425,327.425,277.425,177.425,177.425,177.425];
var facturacionFlujo=[20000,69848,69848,122055,122055,122055,239705,239705,239705,398305,398305,398305];
var ingresosFlujo=[20000,69848,69848,122055,122055,122055,239705,239705,239705,398305,398305];
var flujoFlujo=[-142425,-139092,-222578,-272578,-35370,-135370,-55370,-87720,-37720,62280,220880,220880];
var medControl=[70,60];
var admDes=[60,20];
var conocimientoTac=[40,10];
var planeacionTac=[50,15];



function seleccionFrecuencia(l){
	
	origenDatos="datosBase";
	
	if(l.indexOf("semanal")!=-1){
	
			document.getElementById("tdSemanal").style.display="inline";
			document.getElementById("tdMensual").style.display="none";
			document.getElementById("tdTrimestral").style.display="none";
			variableFrecuencia="semanal"
			
	}else if(l.indexOf("mensual")!=-1){
			
			document.getElementById("tdSemanal").style.display="none";
			document.getElementById("tdMensual").style.display="inline";
			document.getElementById("tdTrimestral").style.display="none";
			variableFrecuencia="mensual"
	
	}else if(l.indexOf("trimestral")!=-1){
	
			document.getElementById("tdSemanal").style.display="none";
			document.getElementById("tdMensual").style.display="none";
			document.getElementById("tdTrimestral").style.display="inline";
			variableFrecuencia="trimestral"
	}else{
	
			document.getElementById("tdSemanal").style.display="none";
			document.getElementById("tdMensual").style.display="none";
			document.getElementById("tdTrimestral").style.display="none";
			variableFrecuencia=""
	
	}
}

function asignaMeta(valor){
	datosIndicadores=[];
	
	//if(variableFrecuencia=="semanal"||variableFrecuencia=="mensual"||variableFrecuencia=="trimestral"){
		valor=valor.split("-");
		
		for(r=0; r<valor.length; r++){
			if(r==0){
				nombreIndicador=valor[0];
				
			}else if(r!=(valor.length-1)){
				datosIndicadores[r-1]=valor[r];
				
			}
			
			
		}
		variableFrecuencia=valor[valor.length-1];
		
}


function asignaFrecuencia(p){
	//alert("frecuencia del indicador= "+variableFrecuencia+ " Frecuencia a la que se cambio= "+p);
	if(p!=variableFrecuencia){
		//alert(variableFrecuencia+ " entra cambio");
		if(p=="mensual"){
		//alert("entra cambio mensual");
			datosIndicadores=parsearArreglo(datosIndicadores); //Se parsea por si no viene int
			nuevoDatoFrecuencia[0]=datosIndicadores[0];
			nuevoDatoFrecuencia[0]=((nuevoDatoFrecuencia[0]*52)/12);
			nuevoDatoFrecuencia[0]=Math.round(nuevoDatoFrecuencia[0]);
			cambioFrecuencia=true;
			cambioFrecGuardar=true;
			nuevaFrecuencia="mensual";
			//alert(nuevoDatoFrecuencia);
			//alert(datosIndicadores+" dentro de cambio mensual");
		}else if(p=="trimestral"&&variableFrecuencia=="semanal"){
		//alert("entra cambio trimestral con semana");
			datosIndicadores=parsearArreglo(datosIndicadores); //Se parsea por si no viene int
			nuevoDatoFrecuencia[0]=datosIndicadores[0];	
			nuevoDatoFrecuencia[0]=((nuevoDatoFrecuencia[0]*52)/12);
			nuevoDatoFrecuencia[0]=nuevoDatoFrecuencia[0]*3;
			//alert(datoTrimestral);
			nuevoDatoFrecuencia[0]=Math.round(nuevoDatoFrecuencia[0]);
			cambioFrecuencia=true;
			cambioFrecGuardar=true;
			nuevaFrecuencia="trimestral";
			//alert(nuevoDatoFrecuencia);
			//alert(cambioFrecuencia);
			//alert(datosIndicadores+" dentro de cambio mensual");
		}else if(p=="trimestral"&&variableFrecuencia=="mensual"){
		//alert("entra cambio trimestral con mensual");
			datosIndicadores=parsearArreglo(datosIndicadores); //Se parsea por si no viene int
			trim1=datosIndicadores[0]+datosIndicadores[1]+datosIndicadores[2];
			trim2=datosIndicadores[3]+datosIndicadores[4]+datosIndicadores[5];
			trim3=datosIndicadores[6]+datosIndicadores[7]+datosIndicadores[8];
			trim4=datosIndicadores[9]+datosIndicadores[10]+datosIndicadores[11];
			nuevoDatoFrecuencia[0]=trim1;
			nuevoDatoFrecuencia[1]=trim2;
			nuevoDatoFrecuencia[2]=trim3;
			nuevoDatoFrecuencia[3]=trim4;
			cambioFrecuencia=true;
			cambioFrecGuardar=true;
			nuevaFrecuencia="trimestral";
			//alert(nuevoDatoFrecuencia);
			//alert(cambioFrecuencia);
			
		}
	}else{
		//alert("no hace cambio");
		datosIndicadores=parsearArreglo(datosIndicadores); //Se parsea por si no viene int
		//alert(variableFrecuencia+ " no entra cambio");
		//alert(datosIndicadores+ " no entra cambio");
		nuevoDatoFrecuencia=datosIndicadores;
		//alert(nuevoDatoFrecuencia);
		cambioFrecuencia=false;
		cambioFrecGuardar=false;
		//alert(datosIndicadores+ " saliendo no entra cambio");
		//alert(cambioFrecuencia);
		nuevaFrecuencia=variableFrecuencia;
	}	
	//alert(datosIndicadores+ " antes de ir a graficar");
	datosGraficar();

}

function datosGraficar(){
	//alert(" nueva frecuencia valor "+nuevaFrecuencia);
	if(cambioFrecuencia){
		//alert(datosIndicadores+ " entrando frecuencia true graficar");
		if(nuevaFrecuencia=="mensual"){
			//alert(datosIndicadores+ " entrando a nuevafrecuencia mensual");
			datosIndicadoresTemp=[];
			datosIndicadoresTemp[0]=datosIndicadores[0];
			//alert(datosIndicadoresTemp+ " temporal");
			datoX=mesesGraficar;
			for(n=0;n<12;n++){
				datoY[n]=nuevoDatoFrecuencia[0];
			}
			//alert(datoY);
			//alert(datosIndicadores+ " fin a nuevafrecuencia");
			datosIndicadores=datosIndicadoresTemp;
			//alert(datosIndicadores+ " fin a nuevafrecuencia asignando temp");
		}else if(nuevaFrecuencia=="trimestral"){
			//alert(datosIndicadores+ " entrando a nuevafrecuencia trimestral");
			datoY=[];
			//alert(datoY+ " entrando a nueva frecuencia trimestral");
			datosIndicadoresTemp=[];
			datosIndicadoresTemp[0]=datosIndicadores[0];
			datoX=trimestresGraficar;
			for(n=0;n<4;n++){
				datoY[n]=nuevoDatoFrecuencia[0];
			}
			//alert(datosIndicadores+ " saliendo a nuevafrecuencia trimestral");
			datosIndicadores=datosIndicadoresTemp;
			//alert(datosIndicadores+ " saliendo a nuevafrecuencia trimestral despues de temp");
		}
	}else{
		//alert(datosIndicadores+ " entrando false graficar");
		if(variableFrecuencia=="semanal"){
			//alert(" entra semanal");
			datoX=semanasGraficar;
			//alert(datosIndicadores+ " antes del parseo");
			datoParaY=datosIndicadores;
			datoY=parsearArreglo(datoParaY);
			//alert(datosIndicadores+ " despues del parseo");
			//alert("dato y "+datoY);
			//alert("dato x "+datoX);
			
		}else if(variableFrecuencia=="mensual"){
			//alert(" entra mensual");
			datoX=mesesGraficar;
			datoParaY=datosIndicadores;
			datoY=parsearArreglo(datoParaY);
			//alert("dato y "+datoY);
			//alert("dato x "+datoX);
		
		}else if(variableFrecuencia=="trimestral"){
			//alert(" entra trimestral");
			datoX=trimestresGraficar;
			datoParaY=datosIndicadores;
			datoY=parsearArreglo(datoParaY);
			//alert("dato y "+datoY);
			//alert("dato x "+datoX);
		}
	}
	
	cambioFrecuencia=false;
	

}


function parsearArreglo(arreglo){

	for(x=0;x<arreglo.length;x++){
 
		temp=arreglo[x];
		temp=parseInt(temp);
		arreglo[x]=temp; 
	
	}
	return arreglo;
}

function fijaRealesIndicador(){
	//alert("entra a colocar valores reales random");
	realesIndicador=[];
	randomScalingFactor = function(){ return Math.round(Math.random()*100)};
	//alert(" revisamos la longitud de x "+datoX.length);
	for(d=0;d<datoX.length;d++){
	
		realesIndicador[d]=randomScalingFactor();
		
	}
	
	//alert("reales indicador despues de asignar con el mismo tamaño de x "+realesIndicador);

}
function metasReales(){

	// Aqui se va a hacer la validacion de googleSheets
	//alert("origen datos en metas reales()= "+origenDatos);
	if(origenDatos=="cruzarIndicadores"){
	//Si se realizo un cruce de indicadores
		muestraGraficas("cruzarIndicadores");
	
	
	
	}else if(origenDatos=="googleSheets"){
	//Si los datos vienen del googleSheets
	//alert("entra googleSheets");
	//alert(datoX);
	//alert(mes);
	//alert(arregloSeries);
	//alert(series);
	
		datoX=variables;
		arregloSeries=series;
	
	
	}else{
	//Si los datos llegan normalmente de la base
		//alert("arreglo datox entrando datos base "+datoX);
		//alert("arreglo datoY entrando datos base "+datoY);
		//alert("arreglo realesIndicador entrando datos base "+realesIndicador);
		
		if(datoX.length!=datoY.length)
		{
			//alert("arreglo datoY dentro for inicio "+datoY);
			var1=datoY[0];
			//alert("var1 despues de asignar y "+var1);
			for(h=0;h<datoX.length;h++){
			
			datoY[h]=var1;
			//alert("arreglo datoY despues de asignar for "+datoY);
			}
			
		}
		//alert("arreglo datoY saliendo for "+datoY);
		//Limpiamos el arreglo al ingresar para evitar datos erroneos
		arregloSeries=[];
		
		checado = document.getElementById("checkCruzar").checked;
		if(checado){
			//alert("entra a checado para hacer arreglo series");
			//Si necesita cruzar indicador ejecuta la funcion que obtendra los datos del indicador asociado
			fijaRealesIndicador();
			
			//alert("dato y antes de series "+datoY);
			//alert("reales indicador antes de series "+realesIndicador);
			arregloSeries=[{
				name: 'Meta',
				data: datoY
			}, {
				name: 'Real',
				data: realesIndicador
			}]
			
			// arregloSeriesAlt=[{
				// data: datoY
			// }, {
				// data: realesIndicador
			// }]
			
		}else{
			//Arreglo cuando solo mostrara las metas
			arregloSeries=[{
				name: 'Metas',
				data: datoY
			}]
			
			//arregloSeriesAlt=[{data: datoY}]
		}
		
	}
}

function asignaTamano(r){
	
	tamanoLargo=r;
	
}

function asignaDragDrop(a,b,c){
	gGraficaDD=a;
	tipoGraficaDD=b;
	tdGraficaDD=c;
	
}


function asignaGrafica(grafica){
	
	tipoGrafica=grafica;
	
	
}

function asignaAlerta(metas){
	tipoAlerta=metas;
	
}

function asignaNotificacion(nt){
	tipoNotif=nt;
	
}




//Graficas de inicio
function graficasInicio(){

    document.getElementById("contenedorGraficas").innerHTML="";	
	
     	nombreIndicador="Resultado";
    	tipoGrafica="resultado1";
     	crearHerramienta();
     	nombreIndicador="Resultado";
    	tipoGrafica="resultado2";
     	crearHerramienta();
}
function graficasInicio2(){

	 document.getElementById("contenedorGraficas").innerHTML="";	
	
 	nombreIndicador="Utilidad";
	tipoGrafica="utilidad1";
 	crearHerramienta();
 	nombreIndicador="Utilidad";
	tipoGrafica="utilidad2";
 	crearHerramienta();
}
function graficasInicio3(){

	 document.getElementById("contenedorGraficas").innerHTML="";	
 	nombreIndicador="Flujo";
	tipoGrafica="flujo1";
 	crearHerramienta();
 	nombreIndicador="Flujo";
	tipoGrafica="flujo2";
 	crearHerramienta();
}

function chartIngreso(){
	document.getElementById("grafica"+indice).style.heigth="350px";
	document.getElementById("grafica"+indice).style.width="350px";
	$("#grafica"+indice).highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: 'Servicios Post-Venta, 2014'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: false
                },
                showInLegend: true
            }
        },
        series: [{
            type: 'pie',
            name: 'Porcentaje',
            data: QS1
        }]
    });
}

function chartContratos(){
	document.getElementById("grafica"+indice).style.heigth="350px";
	document.getElementById("grafica"+indice).style.width="1000px";
	$("#grafica"+indice).highcharts({
		title: {
            text: 'Grafica de crecimiento',
            x: -20 //center
        },
        
        xAxis: {
            categories:QAL
        },
        yAxis: {
            title: {
                text: 'Dolares'
            },
            plotLines: [{
                value: 0,
                width: 1,
                color: '#808080'
            }]
        },
        tooltip: {
            valuePrefix: '$'
        },
        legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle',
            borderWidth: 0
        },
        series: [{
            name: 'Ingreso',
            data: QAIngreso
        }, {
            name: 'Gasto',
            data: QAGasto
        }, {
            name: 'Flujo',
            data: QAFlujo
        }]
    });			
}

function chartLicencias(){
	document.getElementById("grafica"+indice).style.heigth="350px";
	document.getElementById("grafica"+indice).style.width="1000px";
	$("#grafica"+indice).highcharts({
		chart: {
            type: 'area'
        },
        title: {
            text: 'Grafica de crecimiento'
        },
        
        xAxis: {
            categories: QS,
            tickmarkPlacement: 'on',
            title: {
                enabled: false
            }
        },
        yAxis: {
            title: {
                text: 'Porcentaje'
            }
        },
       
        plotOptions: {
            area: {
                stacking: 'percent',
                lineColor: '#ffffff',
                lineWidth: 1,
                marker: {
                    lineWidth: 1,
                    lineColor: '#ffffff'
                }
            }
        },
        series: [{
            name: 'Ingreso',
            data: DQIngreso
        }, {
            name: 'Contratos',
            data: DQContratos
        }, {
            name: 'Licencias',
            data: DQLicencias
        }, {
            name: 'Redes Sociales',
            data: DQRSociales
        }, {
            name: 'Mejoras',
            data: DQMejoras
        }]
    });	
}

function chartSociales(){
	
	document.getElementById("grafica"+indice).style.heigth="350px";
	document.getElementById("grafica"+indice).style.width="450px";
	$("#grafica"+indice).highcharts({
		chart: {
            type: 'column'
        },
        title: {
            text: 'Grafica de crecimiento'
        },
        xAxis: {
            categories: QAL
        },
        credits: {
            enabled: false
        },
        series: [{
            name: 'Ingreso',
            data: QAIngreso
        }, {
            name: 'Gasto',
            data: QAGasto
        }, {
            name: 'Flujo',
            data: QAFlujo
        }]
    });	
}

function chartMejoras(){
	$("#grafica"+indice).highcharts({
		chart: {
            type: 'gauge',
            plotBackgroundColor: null,
            plotBackgroundImage: null,
            plotBorderWidth: 0,
            plotShadow: false
        },

        title: {
            text: 'Mejoras'
        },

        pane: {
            startAngle: -150,
            endAngle: 150,
            background: [{
                backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                        [0, '#FFF'],
                        [1, '#333']
                    ]
                },
                borderWidth: 0,
                outerRadius: '109%'
            }, {
                backgroundColor: {
                    linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                    stops: [
                        [0, '#333'],
                        [1, '#FFF']
                    ]
                },
                borderWidth: 1,
                outerRadius: '107%'
            }, {
                // default background
            }, {
                backgroundColor: '#DDD',
                borderWidth: 0,
                outerRadius: '105%',
                innerRadius: '103%'
            }]
        },

        // the value axis
        yAxis: {
            min: 0,
            max: 100,

            minorTickInterval: 'auto',
            minorTickWidth: 1,
            minorTickLength: 10,
            minorTickPosition: 'inside',
            minorTickColor: '#666',

            tickPixelInterval: 30,
            tickWidth: 2,
            tickPosition: 'inside',
            tickLength: 10,
            tickColor: '#666',
            labels: {
                step: 2,
                rotation: 'auto'
            },
            title: {
                text: 'km/h'
            },
            plotBands: [{
                from: 0,
                to: 120,
                color: '#55BF3B' // green
            }, {
                from: 120,
                to: 160,
                color: '#DDDF0D' // yellow
            }, {
                from: 160,
                to: 200,
                color: '#DF5353' // red
            }]
        },

        series: [{
            name: 'Speed',
            data: [60],
            tooltip: {
                valueSuffix: ' %'
            }
        }]

    },
        // Add some life
        function (chart) {
            
        });	
}

function chartQIngreso(){
	document.getElementById("grafica"+indice).style.heigth="350px";
	document.getElementById("grafica"+indice).style.width="1000px";
	$("#grafica"+indice).highcharts({
		title: {
            text: 'Combination chart'
        },
        xAxis: {
            categories: QS
        },
        labels: {
            items: [{
                html: 'Crecimiento',
                style: {
                    left: '50px',
                    top: '18px',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                }
            }]
        },
        series: [{
            type: 'column',
            name: 'Ingreso',
            data: DQIngreso
        }, {
            type: 'column',
            name: 'Contratos',
            data: DQContratos
        }, {
            type: 'column',
            name: 'Licencias',
            data: DQLicencias
        }, {
            type: 'spline',
            name: 'Sociales',
            data: DQRSociales,
            marker: {
                lineWidth: 2,
                lineColor: Highcharts.getOptions().colors[3],
                fillColor: 'white'
            }
        }, {
            type: 'pie',
            name: 'Total',
            data: [{
                name: 'Ingreso',
                y: 13,
                color: Highcharts.getOptions().colors[0] 
            }, {
                name: 'Contratos',
                y: 23,
                color: Highcharts.getOptions().colors[1] 
            }, {
                name: 'licencias',
                y: 19,
                color: Highcharts.getOptions().colors[2] 
            }],
            center: [100, 80],
            size: 100,
            showInLegend: false,
            dataLabels: {
                enabled: false
            }
        }]
    });		
}
function google(){

	 document.getElementById("grafica"+indice).style.heigth="550px";
		document.getElementById("grafica"+indice).style.width="500px";	
	$("#grafica"+indice).highcharts({
		chart: {
            plotBackgroundColor: null,
            plotBorderWidth: 1,//null,
            plotShadow: false
        },
        title: {
            text: 'Google'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                    style: {
                        color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                    }
                }
            }
        },
        series: [{
            type: 'pie',
            name: 'Views',
            data: [
	                ['Klip Folio',   27997],
	                ['Click Data',       4365],
	                ['Qlik',    64115],
	                ['QlikViewMexico',     551],
	                ['Rithym-Gazelles',   614]
	            ]
        }]
    });
}
function facebook(){
	 document.getElementById("grafica"+indice).style.heigth="550px";
		document.getElementById("grafica"+indice).style.width="500px";	
	$("#grafica"+indice).highcharts({
	
	chart: {
        plotBackgroundColor: null,
        plotBorderWidth: 1,//null,
        plotShadow: false
    },
    title: {
        text: 'facebook'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        type: 'pie',
        name: 'Likes',
         data: [
                ['Klip Folio',   742],
                ['Click Data',       115],
                ['Qlik',    21769],
                ['QlikViewMexico',     2693],
                ['Rithym-Gazelles',   1898]
            ]
    }]
});
	
}

function twiter(){
	 document.getElementById("grafica"+indice).style.heigth="550px";
		document.getElementById("grafica"+indice).style.width="500px";	
	$("#grafica"+indice).highcharts({
	chart: {
        plotBackgroundColor: null,
        plotBorderWidth: 1,//null,
        plotShadow: false
    },
    title: {
        text: 'Twiter'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        type: 'pie',
        name: 'Twits',
         data: [
                ['Klip Folio',   2178],
                ['Click Data',       203],
                ['Qlik',    5548],
                ['QlikViewMexico',     1248],
                ['Rithym-Gazelles',   139],
                ['Yellow Fin',   6667]
            ]
    }]
});
	
}

function youtube(){
	 document.getElementById("grafica"+indice).style.heigth="550px";
		document.getElementById("grafica"+indice).style.width="500px";	
	$("#grafica"+indice).highcharts({
	chart: {
        plotBackgroundColor: null,
        plotBorderWidth: 1,//null,
        plotShadow: false
    },
    title: {
        text: 'Youtube'
    },
    tooltip: {
        pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
    },
    plotOptions: {
        pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
                enabled: true,
                format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                style: {
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black'
                }
            }
        }
    },
    series: [{
        type: 'pie',
        name: 'Views',
        data: [
                ['Klip Folio',   79895],
                ['Click Data',       16925],
                ['Qlik',    647199],
                ['QlikViewMexico',     0],
                ['Rithym-Gazelles',   21894],
                ['Yellow Fin',   63451]
            ]
    }]
});
	
}

function crearHerramienta(){
	
	//alert(q1+q2+q3+q4+nombreIndicador+tipoGrafica+tipoAlerta+tipoNotif);
	
	//Crea Div que contendra la grafica y asigna drag&drop
	 original=document.getElementById("herramientas");
	 nuevo=original.cloneNode(true);
	 nuevo.id="herramienta"+indice;
	 destino=document.getElementById("contenedorGraficas");
	 destino.appendChild(nuevo);
	 document.getElementById("herramienta"+indice).style.display = "inline-block";
	 //alert("creo herramienta");
	 
	 original=document.getElementById("label");
	 nuevo=original.cloneNode(true);
	 nuevo.id="label"+indice;
	 nuevo.innerHTML="Gráfica "+nombreIndicador;
	 destino=document.getElementById("herramienta"+indice);
	 destino.appendChild(nuevo);
	 //alert("creo label");
	 
	 original=document.getElementById("salto");
	 nuevo=original.cloneNode(true);
	 nuevo.id="salto"+indice;
	 destino=document.getElementById("herramienta"+indice);
	 destino.appendChild(nuevo);
	 //alert("creo salto");
     
  	 original=document.getElementById("formGrafica");
	 nuevo=original.cloneNode(true);
	 nuevo.id="formGrafica"+indice;
	 destino=document.getElementById("herramienta"+indice);
	 destino.appendChild(nuevo);
	 
	 original=document.getElementById("hiddenAlerta");
	 nuevo=original.cloneNode(true);
	 nuevo.id="hiddenAlerta"+indice;
	 destino=document.getElementById("formGrafica"+indice);
	 destino.appendChild(nuevo);
	 
	 original=document.getElementById("valoresAlertas");
	 nuevo=original.cloneNode(true);
	 nuevo.id="valoresAlertas"+indice;
	 nuevo.name="valoresAlertas"+indice;
	 destino=document.getElementById("formGrafica"+indice);
	 destino.appendChild(nuevo);
	 
	 original=document.getElementById("graficaConfigurada");
	 nuevo=original.cloneNode(true);
	 nuevo.id="graficaConfigurada"+indice;
	 destino=document.getElementById("formGrafica"+indice);
	 destino.appendChild(nuevo);
	 
	 original=document.getElementById("usuarioCorreo");
	 nuevo=original.cloneNode(true);
	 nuevo.id="usuarioCorreo"+indice;
	 destino=document.getElementById("formGrafica"+indice);
	 destino.appendChild(nuevo);
	 //Esta siguiente linea interfiere con el pintado de la grafica
	 //document.getElementById("herramienta"+indice).style.display = "inline"
	 //new Draggable("herramienta"+indice);
	 
	 
	$( "#herramienta"+indice ).draggable();
	//$( "#herramienta"+indice  ).resizable();
	 
	 //Crea grafica dentro del div
	 original=document.getElementById("grafica");
	 nuevo=original.cloneNode(true);
	 nuevo.id="grafica"+indice;
	 destino=document.getElementById("herramienta"+indice);
	 destino.appendChild(nuevo);
	 document.getElementById("grafica"+indice).style.display = "inline";
	 //alert("crea div contiene grafica");
	 //new Draggable("canvas"+indice);
	 
	 //Incrementa indice para no sobreescribir la grafica antes creada y obtenemos asi el id donde se va a pintar
	 nombreGraficaPintar="grafica"+indice;
	 
	 creaGrafica(nombreGraficaPintar);
	 
	 
	 indice=indice+1;
}


function creaGrafica(nombreGraficaPintar){
	//alert(nombreGraficaPintar);
	//Esta variable solo se usa para pruebas aleatorias
	
	//alert(nombreGraficaPintar+"--"+tipoGrafica);
	//Con esta linea se captura el tamaño asignado de las graficas
	document.getElementById("grafica"+indice).style.width=tamanoLargo;
	
	
	switch(tipoGrafica) {
    case "gBarras":
    	chartBarras();
        break;
    case "gLineal":
    	chartLineal();
        break;
    case "gCircular":
    	chartCircular();
    	break;
    case "gBarraApilada":
    	chartBarraApilada();
        break;
    case "gDona":
    	chartDona();
        break;
    case "gBurbuja":
    	chartBurbuja();
        break;
    case "gBarrasConNegativo":
    	chartBarrasConNegativo();
        break;
    case "gBarrasConVariaciones":
    	chartBarrasConVariaciones();
        break; 
    case "gCombinada":
    	chartCombinada();
        break;
    case "gLineaCombinada":
    	chartLineaCombinada();
        break;
    case "gLineaBarras":
    	chartLineaBarras();
        break;
    // case "gLineaTiempo":
    	// chartLineaTiempo();
        // break;
    case "gError":
    	chartError();
        break;
    case "gMultilinea":
    	chartMultilinea();
        break;
    case "gArea":
    	chartArea();
        break;
    case "gMedioCirculo":
	//alert("entraMediocirculo")
    	chartMedioCirculo();
        break;
    case "gPolar":
    	chartPolar();
        break;
    case "gSpider":
    	chartSpider();
        break;
    case "gRosa":
    	chartRosa();
        break;
    case "gPiramide":
    	chartPiramide();
        break;
	case "gFunel":
		chartFunel();
		break;
    case "gVelocimetro":
    	chartVelocimetro();
        break;
    case "gVelocimetroSolido":
    	chartVelocimetroSolido();
        break;
    case "gReportesDrive":
    	reportesDrive();
        break;
        //Graficas de inicio***************************************
    case "ingreso":
    	chartIngreso();
        break;
    case "contratos":
    	chartContratos();
        break;
    case "licencias":
    	chartLicencias();
        break;
    case "sociales":
    	chartSociales();
        break;
    case "mejoras":
    	chartMejoras();
        break;
    case "qIngreso":
    	chartQIngreso();
        break;
    case "google+":
    	google();
        break;
    case "facebook":
    	facebook();
        break;
    case "twiter":
    	twiter();
        break;
    case "youtube":
    	youtube();
        break;
    case "resultado":
    	resultadoGraficas();
        break;
    case "resultado1":
    	resultadoGraficas1();
        break;
    case "resultado2":
    	resultadoGraficas2();
        break;
    case "utilidad1":
    	utilidadUno();
        break;
    case "utilidad2":
    	utilidadDos();
        break;
    case "flujo1":
    	flujoUno();
        break;
    case "flujo2":
    	flujoDos();
        break;
    case "semaforo":
    	semaforo();
        break;
	}
}

function reportesDrive(){
	
	document.getElementById("grafica"+indice).style.heigth="400px";
	document.getElementById("grafica"+indice).style.width="1000px";
	
	$("#grafica"+indice).html("<iframe width='1100px' height='800px' src='https://docs.google.com/spreadsheets/d/1cvJBiu23ynYb-EYrav_N4QMmc1tHjACHsRzf5Lm4uY8/pubhtml?gid=402711987&single=true'></iframe>"); 
	
}

function flujoUno(){
	document.getElementById("grafica"+indice).style.heigth="350px";
	document.getElementById("grafica"+indice).style.width="1000px";
	//alert("entra");
	 $("#grafica"+indice).highcharts({
		 title: {
	            text: nombreIndicador,
	            x: -20 //center
	        },
	        
	        xAxis: {
	            categories: mesesGraficas
	        },
	        yAxis: {
	            title: {
	                text: 'Valores'
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }]
	        },
	       
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        
	       series:  [{
	            name: 'Egreso',
	            data: egresosFlujo
	        }, {
	            name: 'Facturacion',
	            data: facturacionFlujo
	        }, {
	            name: 'Ingreso',
	            data: ingresosFlujo
	        }, {
	            name: 'Flujo',
	            data: flujoFlujo
	        }]
	    });
	
}
	 function flujoDos(){
			document.getElementById("grafica"+indice).style.heigth="350px";
			document.getElementById("grafica"+indice).style.width="1000px";
			//alert("entra");
			 $("#grafica"+indice).highcharts({
				 chart: {
			            type: 'column',
			            margin: 75,
			            options3d: {
			                enabled: true,
			                alpha: 10,
			                beta: 25,
			                depth: 70
			            }
			        },
			        title: {
			            text: nombreIndicador
			        },
			       
			        plotOptions: {
			            column: {
			                depth: 25
			            }
			        },
			        xAxis: {
			            categories: mesesGraficas
			        },
			        yAxis: {
			            opposite: true
			        },
			 series:  [{
			            name: 'Egreso',
			            data: egresosFlujo
			        }, {
			            name: 'Facturacion',
			            data: facturacionFlujo
			        }, {
			            name: 'Ingreso',
			            data: ingresosFlujo
			        }, {
			            name: 'Flujo',
			            data: flujoFlujo
			        }]
			    });
			
		}


function utilidadUno(){
	document.getElementById("grafica"+indice).style.heigth="350px";
	document.getElementById("grafica"+indice).style.width="1000px";
	//alert("entra");
	 $("#grafica"+indice).highcharts({
		
		 title: {
	            text: nombreIndicador,
	            x: -20 //center
	        },
	        
	        xAxis: {
	            categories: mesesGraficas
	        },
	        yAxis: {
	            title: {
	                text: 'Valores'
	            },
	            plotLines: [{
	                value: 0,
	                width: 1,
	                color: '#808080'
	            }]
	        },
	       
	        legend: {
	            layout: 'vertical',
	            align: 'right',
	            verticalAlign: 'middle',
	            borderWidth: 0
	        },
	        
	       series:  [{
	            name: 'utilidad bruta',
	            data: utilidad
	        }, {
	            name: 'Porcentaje',
	            data: utilidadBruta
	        }, {
	            name: 'Utilidad operacion',
	            data: utilidadOperacion
	        }, {
	            name: 'Porcentaje Op',
	            data: utilidadOperacion
	        }]
	    });
	
}
	 function utilidadDos(){
			document.getElementById("grafica"+indice).style.heigth="350px";
			document.getElementById("grafica"+indice).style.width="1000px";
			//alert("entra");
			 $("#grafica"+indice).highcharts({
				  chart: {
			            type: 'column',
			            margin: 75,
			            options3d: {
			                enabled: true,
			                alpha: 10,
			                beta: 25,
			                depth: 70
			            }
			        },
			        title: {
			            text: nombreIndicador
			        },
			       
			        plotOptions: {
			            column: {
			                depth: 25
			            }
			        },
			        xAxis: {
			            categories: mesesGraficas
			        },
			        yAxis: {
			            opposite: true
			        },
			      series:  [{
			            name: 'utilidad bruta',
			            data: utilidad
			        }, {
			            name: 'Porcentaje',
			            data: utilidadBruta
			        }, {
			            name: 'Utilidad operacion',
			            data: utilidadOperacion
			        }, {
			            name: 'Porcentaje Op',
			            data: utilidadOperacion
			        }]
			    });
				
			
		}

function resultadoGraficas1(){
	document.getElementById("grafica"+indice).style.heigth="350px";
	document.getElementById("grafica"+indice).style.width="1000px";
	//alert("entra");
	 $("#grafica"+indice).highcharts({
		
		        chart: {
		            type: 'column',
		            margin: 75,
		            options3d: {
		                enabled: true,
		                alpha: 10,
		                beta: 25,
		                depth: 70
		            }
		        },
		        title: {
		            text: nombreIndicador
		        },
		       
		        plotOptions: {
		            column: {
		                depth: 25
		            }
		        },
		        xAxis: {
		            categories: mesesGraficas
		        },
		        yAxis: {
		            opposite: true
		        },
		      series:  [{
		            name: 'Ingresos',
		            data: ingresoResultado
		        }, {
		            name: 'Costo de Venta',
		            data: cVentaResultado
		        }, {
		            name: 'Gastos',
		            data: gAdmResultado
		        }]
		    });
	 
	
}
function resultadoGraficas2(){
	document.getElementById("grafica"+indice).style.heigth="350px";
	document.getElementById("grafica"+indice).style.width="1000px";
	//alert("entra");
	 $("#grafica"+indice).highcharts({
		
		        title: {
		            //text: nombreIndicador,
		            text: null
		        },
		       
		        xAxis: {
		            categories: mesesGraficas
		        },
		        yAxis: {
		            title: {
		                text: 'Valores'
		            },
		            plotLines: [{
		                value: 0,
		                width: 1,
		                color: '#808080'
		            }]
		        },
		       
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        
		        series: [{
		            name: 'Ingresos',
		            data: ingresoResultado
		        }, {
		            name: 'Costo de Venta',
		            data: cVentaResultado
		        }, {
		            name: 'Gastos',
		            data: gAdmResultado
		        }]
		    });
	
}

//+++++++++++++++++++++ Barras ++++++++++++++++++++++++++++++++++++++++
function chartBarras(){
	
	$("#grafica"+indice).highcharts({
	    chart: {
	        type: 'column',
	        options3d: {
				enabled: true,
	            alpha: 10,
	            beta: 25,
	            depth: 70
	        }
	    },
	    title: {
	        //text: nombreIndicador
	        text:null
	    },
// 	   
	    plotOptions: {
	        column: {
	            depth: 25
	        }
	    },
	    xAxis: {
	    	categories: datoX
	        
	    },
	    yAxis: {
	        opposite: true
	    },
	    series: arregloSeries
	   
	});
}

//+++++++++++++++++++++ Lineal ++++++++++++++++++++++++++++++++++++++++
function chartLineal(){
	$("#grafica"+indice).highcharts({
	        chart: {
				zoomType: 'x',
				borderColor: '#708090',
				type: 'line'
			},
	        title: {
	            //text: nombreIndicador
	            text:null
	        },
	        xAxis: {
	            categories: datoX
	        },
	        // yAxis: {
	            // title: {
	                // text: 'Meta/Reales'
	            // }
	        // },
			
			tooltip: {
				shared: true,
				crosshairs: true,
			},
			
	        plotOptions: {
	            line: {
	                dataLabels: {
	                    enabled: true
	                },
	                enableMouseTracking: false
	            }
	        },
	        series: arregloSeries
	    });
	}

//+++++++++++++++++++++ Circular ++++++++++++++++++++++++++++++++++++++++
function chartCircular(){

	document.getElementById("grafica"+indice).style.width="350px";
	arregloCombinado=[];
	contador=datoX.length;
    for(x=0;x<contador;x++){
        arregloCombinado[x]=[datoX[x],datoY[x]];
        //alert(arregloCombinado[x]);
    }

	$("#grafica"+indice).highcharts({
        chart: {
            type: 'pie',
            options3d: {
				enabled: true,
                alpha: 45,
                beta: 0
            }
        },
        title: {
            //text: nombreIndicador
        	text: null
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
                }
            }
        },
        series: [{
            type: 'pie',
            name: "Valor",
            data: arregloCombinado
        }]
    });
	
}

//+++++++++++++++++++++ BarraApilada ++++++++++++++++++++++++++++++++++++++++
function chartBarraApilada(){
	
	$("#grafica"+indice).highcharts({

	        chart: {
	            type: 'column',
	            options3d: {
	                enabled: true,
	                alpha: 15,
	                beta: 15,
	                viewDistance: 25,
	                depth: 40
	            },
	            marginTop: 80,
	            marginRight: 40
	        },

	        title: {
	            //text: nombreIndicador
	            text: null
	        },

	        xAxis: {
	            categories: ['Q1', 'Q2', 'Q3', 'Q4']
	        },

	        yAxis: {
	            allowDecimals: false,
	            min: 0,
	            title: {
	                text: 'Metas/Reales'
	            }
	        },

	        tooltip: {
	            headerFormat: '<b>{point.key}</b><br>',
	            pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
	        },

	        plotOptions: {
	            column: {
	                stacking: 'normal',
	                depth: 40
	            }
	        },

	        series: [{
	            name: 'Reales',
	            data: [valorRandom1,valorRandom2,valorRandom3,valorRandom4],
	            stack: 'male'
	        }, 
// 	        {
// 	            name: 'Real Q2',
// 	            data: [3, 4, 4, 2, 5],
// 	            stack: 'male'
// 	        }, {
// 	            name: 'Real Q3',
// 	            data: [2, 5, 6, 2, 1],
// 	            stack: 'female'
// 	        }, 
	        {
	            name: 'Metas',
	            data: [q1,q2,q3,q4],
	            stack: 'female'
	        }]
	    });
	
}
//+++++++++++++++++++++ Dona ++++++++++++++++++++++++++++++++++++++++
function chartDona(){
	
	document.getElementById("grafica"+indice).style.width="350px";
	arregloCombinado=[];
    contador=datoX.length;
    for(x=0;x<contador;x++){
        arregloCombinado[x]=[datoX[x],datoY[x]];
       // alert(arregloCombinado[x]);
    }
	
	
	$("#grafica"+indice).highcharts({
        chart: {
            type: 'pie',
            options3d: {
				enabled: true,
                alpha: 45
            }
        },
        title: {
            //text: nombreIndicador
            text: null
        },
//         subtitle: {
//             text: '3D donut in Highcharts'
//         },
        plotOptions: {
            pie: {
                innerSize: 100,
                depth: 45
            }
        },
        series: [{
            name: "valor",
            data: arregloCombinado
        }]
    });
	
}
//+++++++++++++++++++++ Burbuja ++++++++++++++++++++++++++++++++++++++++
function chartBurbuja(){
	
	$("#grafica"+indice).highcharts({

		    chart: {
		        type: 'bubble',
		        zoomType: 'xy'
		    },

		    title: {
		    	//text: nombreIndicador
		    	text: null
		    },
		
		    series: arregloSeries
		
		});
	
}
//+++++++++++++++++++++ BarrasConNegativo ++++++++++++++++++++++++++++++++++++++++
function chartBarrasConNegativo(){
	
	$("#grafica"+indice).highcharts({
        chart: {
            type: 'column'
            
        },
        title: {
            //text: nombreIndicador
            text: null
        },
        xAxis: {
            categories: datoX
        },
        credits: {
            enabled: false
        },
        series: arregloSeries
    });
	
}
//+++++++++++++++++++++ BarrasConVariaciones ++++++++++++++++++++++++++++++++++++++++
function chartBarrasConVariaciones(){
	
	arregloCombinado=[];
    contador=datoX.length;
    for(x=0;x<contador;x++){
        arregloCombinado[x]=[datoX[x],datoY[x]];
       // alert(arregloCombinado[x]);
    }
	
	
	
	$("#grafica"+indice).highcharts({
		
	    chart: {
	        type: 'columnrange',
	        inverted: true
	    },
	    
	    title: {
	        //text: nombreIndicador
	        text: null
	    },
	    
// 		subtitle: {
// 	        text: 'Observed in Vik i Sogn, Norway, 2009'
// 	    },
	
	    xAxis: {
	        categories: datoX
	    },
	    
	    yAxis: {
	        title: {
	            text: 'Metas--Reales'
	        }
	    },
	
// 	    tooltip: {
// 	        valueSuffix: '°C'
// 	    },
	    
	    plotOptions: {
	        columnrange: {
	        	dataLabels: {
	        		enabled: true,
	        		formatter: function () {
	        			return this.y ;
	        		}
	        	}
	        }
	    },
	    
	    legend: {
	        enabled: false
	    },
	
	    series: [{
	        name: 'Meta/Real',
	        data: arregloCombinado
	    }]
	
	});
	
}
//+++++++++++++++++++++ Combinada ++++++++++++++++++++++++++++++++++++++++
function chartCombinada(){
	
	$("#grafica"+indice).highcharts({
	        title: {
	            //text: 'Combination chart'
	            text: null
	        },
	        xAxis: {
	            categories: ['Trimestre 1','Trimestre 2','Trimestre 3','Trimestre 4']
	        },
	        labels: {
	            items: [{
	                html: nombreIndicador,
	                style: {
	                    left: '50px',
	                    top: '18px',
	                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
	                }
	            }]
	        },
	        series: [{
	            type: 'column',
	            name: 'Metas',
	            data: [q1,q2,q3,q4]
	        }, {
	            type: 'column',
	            name: 'Reales',
	            data: [valorRandom1,valorRandom2,valorRandom3,valorRandom4]
	        }, {
	            type: 'spline',
	            name: 'Metas',
	            data: [q1,q2,q3,q4],
	            marker: {
	            	lineWidth: 2,
	            	lineColor: Highcharts.getOptions().colors[3],
	            	fillColor: 'white'
	            }
	        }, {
	            type: 'pie',
	            name: 'Metas/Reales',
	            data: [{
	                name: 'Metas',
	                y: q1+q2+q3+q4,
	                color: Highcharts.getOptions().colors[0] // Jane's color
	            }, {
	                name: 'Reales',
	                y: valorRandom1+valorRandom2+valorRandom3+valorRandom2,
	                color: Highcharts.getOptions().colors[1] // John's color
	            }],
	            center: [210, 0],
	            size: 50,
	            showInLegend: false,
	            dataLabels: {
	                enabled: false
	            }
	        }]
	    });
	
}
//+++++++++++++++++++++ LineaCombinada ++++++++++++++++++++++++++++++++++++++++
function chartLineaCombinada(){
	
	$("#grafica"+indice).highcharts({
         chart: {
             zoomType: 'xy'
         },
         title: {
             //text: nombreIndicador
             text: null
         },
//          subtitle: {
//              text: 'Source: WorldClimate.com'
//          },
         xAxis: [{
             categories: datoX
         }],
         yAxis: [{ // Primary yAxis
             labels: {
                 format: '{value}',
                 style: {
                     color: Highcharts.getOptions().colors[1]
                 }
             },
             title: {
                 text: 'Metas',
                 style: {
                     color: Highcharts.getOptions().colors[1]
                 }
             }
         }, { // Secondary yAxis
             title: {
                 text: 'Reales',
                 style: {
                     color: Highcharts.getOptions().colors[0]
                 }
             },
             labels: {
                 format: '{value} ',
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
         series: arregloSeries
     });
	
}
//+++++++++++++++++++++ LineaBarras ++++++++++++++++++++++++++++++++++++++++
function chartLineaBarras(){
	
	//alert("x "+datoX);
	//alert("y "+datoY);
	
	
	
	$("#grafica"+indice).highcharts({
        chart: {
            zoomType: 'xy'
        },
        title: {
            //text: nombreIndicador
            text: null
        },

        xAxis: [{
            categories: datoX
        }],
        yAxis: [{ // Primary yAxis
            labels: {
                format: '{value}',
                style: {
                    color: Highcharts.getOptions().colors[2]
                }
            },
            title: {
                text: 'Metas',
                style: {
                    color: Highcharts.getOptions().colors[2]
                }
            },
            opposite: true

        }, { // Secondary yAxis
            gridLineWidth: 0,
            title: {
                text: 'Reales',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            },
            labels: {
                format: '{value}',
                style: {
                    color: Highcharts.getOptions().colors[0]
                }
            }

        }],
        tooltip: {
            shared: true
        },
        legend: {
            layout: 'vertical',
            align: 'left',
            x: 120,
            verticalAlign: 'top',
            y: 80,
            floating: true,
            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
        },
        series: [{
            name: 'Reales',
            type: 'column',
            yAxis: 1,
            data: realesIndicador,
            tooltip: {
                valueSuffix: ' Valores'
            }

        }, {
            name: 'Metas',
            type: 'spline',
            data: datoY,
            tooltip: {
                valueSuffix: ' Valores'
            }
        }]
    });
	
}

//+++++++++++++++++++++ Error ++++++++++++++++++++++++++++++++++++++++
function chartError(){
	
	$("#grafica"+indice).highcharts({
		chart: {
			zoomType: 'xy'
		},
		title: {
			//text: nombreIndicador
			text: null
		},
		xAxis: [{
			categories: datoX
		}],
		yAxis: [{ // Primary yAxis
			labels: {
				format: '{value}',
				style: {
					color: Highcharts.getOptions().colors[1]
				}
			},
			title: {
				text: 'Metas',
				style: {
					color: Highcharts.getOptions().colors[1]
				}
			}
		}, { // Secondary yAxis
			title: {
				text: 'Reales',
				style: {
					color: Highcharts.getOptions().colors[0]
				}
			},
			labels: {
				format: '{value}',
				style: {
					color: Highcharts.getOptions().colors[0]
				}
			},
			opposite: true
		}],

		tooltip: {
			shared: true
		},

		//series: arregloSeries
		
		series: [{
            name: 'Metas',
            type: 'column',
            yAxis: 1,
            data: datoY,
            tooltip: {
                pointFormat: '<span style="font-weight: bold; color: {series.color}">{series.name}</span>: <b>{point.y:.1f} mm</b> '
            }
        }, {
            name: 'Reales',
            type: 'errorbar',
            yAxis: 1,
            data: realesIndicador,
            tooltip: {
                pointFormat: '(error range: {point.low}-{point.high} mm)<br/>'
            }
        }]
		
	});
	
}
//+++++++++++++++++++++ Multilinea ++++++++++++++++++++++++++++++++++++++++
function chartMultilinea(){
	
	$("#grafica"+indice).highcharts({
         title: {
             //text: nombreIndicador,
             text: null
             
         },
//          subtitle: {
//              text: 'Source: WorldClimate.com',
//              x: -20
//          },
         xAxis: {
             categories: datoX
         },
         yAxis: {
             title: {
                 text: 'Metas/Reales'
             },
             plotLines: [{
                 value: 0,
                 width: 1,
                 color: '#808080'
             }]
         },
         tooltip: {
             valueSuffix: ''
         },
         legend: {
             layout: 'vertical',
             align: 'right',
             verticalAlign: 'middle',
             borderWidth: 0
         },
         series: arregloSeries
     });
	
}
//+++++++++++++++++++++ Area ++++++++++++++++++++++++++++++++++++++++
function chartArea(){
	
	$("#grafica"+indice).highcharts({
	        chart: {
	            type: 'areaspline'
	        },
	        title: {
	            //text: nombreIndicador
	            text: null
	        },
	        legend: {
	            layout: 'vertical',
	            align: 'left',
	            verticalAlign: 'top',
	            x: 150,
	            y: 100,
	            floating: true,
	            borderWidth: 1,
	            backgroundColor: (Highcharts.theme && Highcharts.theme.legendBackgroundColor) || '#FFFFFF'
	        },
	        xAxis: {
	            categories: datoX,
	            plotBands: [{ // visualize the weekend
	                from: 4.5,
	                to: 6.5,
	                color: 'rgba(68, 170, 213, .2)'
	            }]
	        },
	        yAxis: {
	            title: {
	                text: 'Metas--Reales'
	            }
	        },
// 	        tooltip: {
// 	            shared: true,
// 	            valueSuffix: ' units'
// 	        },
	        credits: {
	            enabled: false
	        },
	        plotOptions: {
	            areaspline: {
	                fillOpacity: 0.5
	            }
	        },
	        series: arregloSeries
	    });
	
}
//+++++++++++++++++++++ MedioCirculo ++++++++++++++++++++++++++++++++++++++++
function chartMedioCirculo(){
	
	document.getElementById("grafica"+indice).style.width="350px";
	arregloCombinado=[];
    contador=datoX.length;
    for(x=0;x<contador;x++){
        arregloCombinado[x]=[datoX[x],datoY[x]];
       // alert(arregloCombinado[x]);
    }
	
	$("#grafica"+indice).highcharts({
       chart: {
            plotBackgroundColor: null,
            plotBorderWidth: 0,
            plotShadow: false
        },
        title: {
            //text: 'Valores',
            text: null
            
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                dataLabels: {
                    enabled: true,
                    distance: -50,
                    style: {
                        fontWeight: 'bold',
                        color: 'white',
                        textShadow: '0px 1px 2px black'
                    }
                },
                startAngle: -90,
                endAngle: 90,
                center: ['50%', '75%']
            }
        },
        series: [{
            type: 'pie',
            name: 'Valor',
            innerSize: '50%',
            data: arregloCombinado
        }]
    });
	
}
//+++++++++++++++++++++ Polar ++++++++++++++++++++++++++++++++++++++++
function chartPolar(){
	
	document.getElementById("grafica"+indice).style.width="350px";
	$("#grafica"+indice).highcharts({
        
	    chart: {
	        polar: true
	    },
	    
	    title: {
	        //text: nombreIndicador
	        text: null
	    },
	    
	    pane: {
	        startAngle: 0,
	        endAngle: 360
	    },
	
	    xAxis: {
	        tickInterval: 45,
	        min: 0,
	        max: 360,
	        labels: {
	        	formatter: function () {
	        		return this.value + '°';
	        	}
	        }
	    },
	        
	    yAxis: {
	        min: 0
	    },
	    
	    plotOptions: {
	        series: {
	            pointStart: 0,
	            pointInterval: 45
	        },
	        column: {
	            pointPadding: 0,
	            groupPadding: 0
	        }
	    },
	
	    series: arregloSeries
	});
	
}
//+++++++++++++++++++++ Spider ++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++ Rosa ++++++++++++++++++++++++++++++++++++++++
//+++++++++++++++++++++ Piramide ++++++++++++++++++++++++++++++++++++++++
function chartPiramide(){
	
	arregloCombinado=[];
    contador=datoX.length;
    for(x=0;x<contador;x++){
        arregloCombinado[x]=[datoX[x],datoY[x]];
       // alert(arregloCombinado[x]);
    }
	
	
	$("#grafica"+indice).highcharts({
        chart: {
            type: 'pyramid',
            marginRight: 100
        },
        title: {
            //text:nombreIndicador,
            text: null
            
        },
        plotOptions: {
            series: {
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b> ({point.y:,.0f})',
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
                    softConnector: true
                }
            }
        },
        legend: {
            enabled: false
        },
        series: [{
           // name: 'Unique users',
            data: arregloCombinado
        }]
    });
	
}

//+++++++++++++++++++++ Funel ++++++++++++++++++++++++++++++++++++++++
function chartFunel(){
	arregloCombinado=[];
    contador=datoX.length;
    for(x=0;x<contador;x++){
        arregloCombinado[x]=[datoX[x],datoY[x]];
       // alert(arregloCombinado[x]);
    }
	
	
	$("#grafica"+indice).highcharts({
	
	 chart: {
            type: 'funnel',
            marginRight: 100
        },
        title: {
            //text: nombreIndicador,
            text: null,
           
        },
        plotOptions: {
            series: {
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b> ({point.y:,.0f})',
                    color: (Highcharts.theme && Highcharts.theme.contrastTextColor) || 'black',
                    softConnector: true
                },
                neckWidth: '30%',
                neckHeight: '25%'

                //-- Other available options
                // height: pixels or percent
                // width: pixels or percent
            }
        },
        legend: {
            enabled: false
        },
        series: [{
            name: 'Valor',
            data: arregloCombinado
        }]
    });

}
//+++++++++++++++++++++ Velocimetro ++++++++++++++++++++++++++++++++++++++++
function chartVelocimetro(){
	//suma para sacar promedio
	//datoY=parsearArreglo(datoY);
	//realesIndicador=parsearArreglo(realesIndicador);
	qProm=0;
	for(x=0;x<datoY.length;x++){
		qProm=qProm+datoY[x];
		
	}
	//alert("meta promedio "+qProm);
	mProm=0;
	for(x=0;x<realesIndicador.length;x++){
		mProm=mProm+realesIndicador[x];
		
	}
	//alert("realPromedio "+mProm);
	topeTac=0;
	if(mProm>qProm){
		topeTac=mProm;
	}else{
		topeTac=qProm;
	}
	
	$("#grafica"+indice).highcharts({

    chart: {
        type: 'gauge',
        plotBackgroundColor: null,
        plotBackgroundImage: null,
        plotBorderWidth: 0,
        plotShadow: false
    },

    title: {
        text: nombreIndicador
    },

    pane: {
        startAngle: -150,
        endAngle: 150,
        background: [{
            backgroundColor: {
                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                stops: [
                    [0, '#FFF'],
                    [1, '#333']
                ]
            },
            borderWidth: 0,
            outerRadius: '109%'
        }, {
            backgroundColor: {
                linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
                stops: [
                    [0, '#333'],
                    [1, '#FFF']
                ]
            },
            borderWidth: 1,
            outerRadius: '107%'
        }, {
            // default background
        }, {
            backgroundColor: '#DDD',
            borderWidth: 0,
            outerRadius: '105%',
            innerRadius: '103%'
        }]
    },

    // the value axis
    yAxis: {
    	
    	
    	
    	
        min: 0,
        max: topeTac,

        minorTickInterval: 'auto',
        minorTickWidth: 1,
        minorTickLength: 10,
        minorTickPosition: 'inside',
        minorTickColor: '#666',

        tickPixelInterval: 30,
        tickWidth: 2,
        tickPosition: 'inside',
        tickLength: 10,
        tickColor: '#666',
        labels: {
            step: 2,
            rotation: 'auto'
        },
        title: {
            text:'Meta: '+qProm
        },
        plotBands: [{
            from: 0,
            to:topeTac- (topeTac/2),
            color: '#DF5353' // red
        }, {
            from: topeTac- (topeTac/2),
            to: topeTac- (topeTac/7),
            color: '#DDDF0D' // yellow
        }, {
            from: topeTac- (topeTac/5),
            to: topeTac,
            color:  '#55BF3B' // green
        }]
    },

    series: [{
        name: 'Valores',
        data: [mProm],
        tooltip: {
            valueSuffix: ' Valor Real'
        }
    }]

},
    // Add some life
    function (chart) {
     
    });
	
}

function chartVelocimetro1(){
	
	$("#grafica"+indice).highcharts({
		
	    chart: {
	        type: 'gauge',
	        alignTicks: false,
	        plotBackgroundColor: null,
	        plotBackgroundImage: null,
	        plotBorderWidth: 0,
	        plotShadow: false
	    },
	
	    title: {
	        text: nombreIndicador
	    },
	    
	    pane: {
	        startAngle: -150,
	        endAngle: 150
	    },	        
	
	    yAxis: [{
	        min: 0,
	        max: 200,
	        lineColor: '#339',
	        tickColor: '#339',
	        minorTickColor: '#339',
	        offset: -25,
	        lineWidth: 2,
	        labels: {
	            distance: -20,
	            rotation: 'auto'
	        },
	        tickLength: 5,
	        minorTickLength: 5,
	        endOnTick: false
	    }, {
	        min: 0,
	        max: 124,
	        tickPosition: 'outside',
	        lineColor: '#933',
	        lineWidth: 2,
	        minorTickPosition: 'outside',
	        tickColor: '#933',
	        minorTickColor: '#933',
	        tickLength: 5,
	        minorTickLength: 5,
	        labels: {
	            distance: 12,
	            rotation: 'auto'
	        },
	        offset: -20,
	        endOnTick: false
	    }],
	
	    series: [{
	        name: 'Metas',
	        data: [q1,q2,q3,q4],
	        dataLabels: {
	            formatter: function () {
	                var kmh = this.y,
	                    mph = Math.round(kmh * 0.621);
	                return '<span style="color:#339">'+ kmh + ' </span><br/>' +
	                    '<span style="color:#933">' + mph + ' </span>';
	            },
	            backgroundColor: {
	                linearGradient: {
	                    x1: 0,
	                    y1: 0,
	                    x2: 0,
	                    y2: 1
	                },
	                stops: [
	                    [0, '#DDD'],
	                    [1, '#FFF']
	                ]
	            }
	        },
	        tooltip: {
	            valueSuffix: ' Meta'
	        }
	    }]
	
	},
	// Add some life
	function(chart) {
	    setInterval(function() {
	        var point = chart.series[0].points[0],
	            newVal, inc = Math.round((Math.random() - 0.5) * 20);
	
	        newVal = point.y + inc;
	        if (newVal < 0 || newVal > 200) {
	            newVal = point.y - inc;
	        }
	
	        point.update(newVal);
	
	    }, 3000);
	
	});
}
//+++++++++++++++++++++ Semaforo ++++++++++++++++++++++++++++++++++++++++

function semaforo(){
	contador=0;
	color="";
	metaTotal=0;
	realTotal=0;
	for(x=0; x<datoY.length;x++){
		if(datoY[x]>realesIndicador[x]){
			contador=contador-1;
		}else{
			contador=contador+1;
		}
	}
	
	for(z=0;z<datoY.length;z++){
		metaTotal=metaTotal+datoY[z];
	}
	for(q=0;q<realesIndicador.length;q++){
		realTotal=realTotal+realesIndicador[q];
	}
	
	//alert("meta total ="+metaTotal+" realTotal="+realTotal+" contador="+contador);
	
	if(metaTotal<=realTotal&&contador>=2){
		color="verde";
		creaImagen(color);
		//alert("semaforo verde");
	}else if(metaTotal<=realTotal&&contador<2){
		color="amarillo";
		creaImagen(color);
		//alert("semaforo amarillo");
	}else if(metaTotal>=realTotal&&contador>=2){
		color="amarillo";
		creaImagen(color);
		//alert("semaforo amarillo");
	}else if(metaTotal>=realTotal&&contador<2){
		color="rojo";
		creaImagen(color);
		//alert("semaforo rojo");
	}
	
}

function creaImagen(color){

	var imagen= document.createElement("img"); //creas un elemento de imagen.
	if(color=="verde"){
		imagen.setAttribute("src", "ADNFiles/semaforoVerde.png");
	}else if(color=="amarillo"){
		imagen.setAttribute("src", "ADNFiles/semaforoAmarillo.png");
	}else{
		imagen.setAttribute("src", "ADNFiles/semaforoRojo.png");
	}
	
    //ahora le acabas de agregar el src de la imagen (la ruta de donde se encuetra). 

	var bloq=document.getElementById("herramienta"+indice); //ahora tomas la referencia al elemento de bloque. 

	bloq.appendChild(imagen); // y despues insertas la imagen en el elemento de bloque (div). 
	
}


function agregaAlertas(){
	

	
	//crea div Contenedor
	 original=document.getElementById("ventana");
	 nuevo=original.cloneNode(true);
	 nuevo.id="ventana"+indice;
	 destino=document.getElementById("modal");
	 destino.appendChild(nuevo);
	 
	//crea tabla
	 original=document.getElementById("tablaAlertas");
	 nuevo=original.cloneNode(true);
	 nuevo.id="tablaAlertas"+indice;
	 destino=document.getElementById("ventana"+indice);
	 destino.appendChild(nuevo);
	
	//crea tr
	 original=document.getElementById("trAlertas");
	 nuevo=original.cloneNode(true);
	 nuevo.id="trAlertas"+indice;
	 destino=document.getElementById("tablaAlertas"+indice);
	 destino.appendChild(nuevo);
	 
	 original=document.getElementById("tdAlertas");
	 nuevo=original.cloneNode(true);
	 nuevo.id="tdCausa"+indice;
	 destino=document.getElementById("trAlertas"+indice);
	 destino.appendChild(nuevo);
	 
	 original=document.getElementById("tdAlertas");
	 nuevo=original.cloneNode(true);
	 nuevo.id="tdRiesgo"+indice;
	 destino=document.getElementById("trAlertas"+indice);
	 destino.appendChild(nuevo);
	 
	 original=document.getElementById("tdAlertas");
	 nuevo=original.cloneNode(true);
	 nuevo.id="tdNotificacion"+indice;
	 destino=document.getElementById("trAlertas"+indice);
	 destino.appendChild(nuevo);
	 
	 original=document.getElementById("labelCausa");
	 nuevo=original.cloneNode(true);
	 nuevo.id="labelCausa"+indice;
	 destino=document.getElementById("tdCausa"+indice);
	 destino.appendChild(nuevo);
	 
	 original=document.getElementById("labelRiesgo");
	 nuevo=original.cloneNode(true);
	 nuevo.id="labelRiesgo"+indice;
	 destino=document.getElementById("tdRiesgo"+indice);
	 destino.appendChild(nuevo);
	 
	 original=document.getElementById("labelTipNotificacion");
	 nuevo=original.cloneNode(true);
	 nuevo.id="labelTipNotificacion"+indice;
	 destino=document.getElementById("tdNotificacion"+indice);
	 destino.appendChild(nuevo);
	 
	 cau1="";
	 cau2="";
	 cau3="";
	 cau4="";
	 contadorMetas=0;
	 if(q1>=valorRandom1){
		 cau1="Q1 por debajo de la meta"
		 document.getElementById("valoresAlertas"+(indice-1)).value= document.getElementById("valoresAlertas"+(indice-1)).value+" Trimestre uno por debajo de la meta establecida.";
		 contadorMetas=contadorMetas+1;
		 numeroAlertasBajas=numeroAlertasBajas+1;
		 
	 }
	 if(q2>=valorRandom2){
		 cau2="Q2 por debajo de la meta"
			 document.getElementById("valoresAlertas"+(indice-1)).value= document.getElementById("valoresAlertas"+(indice-1)).value+" Trimestre dos por debajo de la meta establecida.";
		 contadorMetas=contadorMetas+1;
		 numeroAlertasBajas=numeroAlertasBajas+1;
	 }
	 if(q3>=valorRandom3){
		 cau3="Q3 por debajo de la meta"
			 document.getElementById("valoresAlertas"+(indice-1)).value= document.getElementById("valoresAlertas"+(indice-1)).value+" Trimestre tres por debajo de la meta establecida.";
		 contadorMetas=contadorMetas+1;
		 numeroAlertasBajas=numeroAlertasBajas+1;
	 }
	 if(q4>=valorRandom4){
		 cau4="Q4 por debajo de la meta"
			 document.getElementById("valoresAlertas"+(indice-1)).value= document.getElementById("valoresAlertas"+(indice-1)).value+" Trimestre cuatro por debajo de la meta establecida.";
		 contadorMetas=contadorMetas+1;
		 numeroAlertasBajas=numeroAlertasBajas+1;
	 }
	// alert(indice);
	 //alert(numeroAlertasBajas);
	 document.getElementById("hiddenAlerta"+(indice-1)).value=numeroAlertasBajas;
	 numeroAlertasBajas=0;
	 
	 document.getElementById("labelCausa"+indice).innerHTML=cau1+" "+cau2+" "+cau3+" "+cau4;
	 document.getElementById("labelRiesgo"+indice).innerHTML="Los siguientes riesgos pueden ocurrir:";
	 
	 if(tipoNotif==""||tipoNotif==null){
		 tipoNotif="Aun no hay tipo de aviso seleccionado";
		 document.getElementById("labelTipNotificacion"+indice).innerHTML=tipoNotif;
	 }else{
	 	document.getElementById("labelTipNotificacion"+indice).innerHTML="Se realizo un "+tipoNotif+" a encargado";
	 }
	 
}

function llamado(){

	//Asigna metas reales
	metasReales();
	
	if(gGraficaDD=="tabla"){
		creaTabla();
		agregaAlertas();
		historiaDashboard(gGraficaDD);
	}else{
		asignaGrafica(gGraficaDD);
		crearHerramienta();
		
		historiaDashboard(gGraficaDD);
	}
	
}

function borraArrastrado(idImagen,tdImagen,rutaImagen){
	
	imgX = document.getElementById(idImagen);
	imgX.parentNode.removeChild(imgX);
	
	// Crear nodo de tipo Element
	imagen= document.createElement("img");
	 
	// Crear nodo de tipo Text
	imagen.setAttribute("src", "ImagenesADN/"+rutaImagen);
	imagen.id=idImagen;
	 
	var bloq=document.getElementById(tdImagen); //ahora tomas la referencia al elemento de bloque. 

	bloq.appendChild(imagen); // y despues insertas la imagen en el elemento de bloque (div). 
}

function muestraGraficas(){
	
	valor=document.getElementById("selectIndicador").valor;
	if(valor=="noSeleccionado"){
		document.getElementById("graficasDesahabilitadas").style.display="inline";
		document.getElementById("graficasHabilitadas").style.display="none";
		
	}else{
		document.getElementById("graficasDesahabilitadas").style.display="none";
		document.getElementById("graficasHabilitadas").style.display="inline";
		
		checado=document.getElementById("checkCruzar").checked;
		
			if(checado){
				document.getElementById("pieActivada").style.display="none";
				document.getElementById("donaActivada").style.display="none";
				document.getElementById("medioCirculoActivada").style.display="none";
				document.getElementById("piramideActivada").style.display="none";
				//document.getElementById("funelActivada").style.display="none";
				document.getElementById("lineasBarrasDesactivadas").style.display="none";
				document.getElementById("velocimetroDesactivado").style.display="none";
				document.getElementById("semaforoDesactivado").style.display="none";
				
				document.getElementById("pieDesactivada").style.display="inline";
				document.getElementById("donaDesactivada").style.display="inline";
				document.getElementById("medioCirculoDesactivada").style.display="inline";
				document.getElementById("piramideDesactivada").style.display="inline";
				//document.getElementById("funelDesactivada").style.display="inline";
				document.getElementById("lineasBarrasActivada").style.display="inline";
				document.getElementById("velocimetroActivado").style.display="inline";
				document.getElementById("semaforoActivado").style.display="inline";
			}else{
				document.getElementById("pieActivada").style.display="inline";
				document.getElementById("donaActivada").style.display="inline";
				document.getElementById("medioCirculoActivada").style.display="inline";
				document.getElementById("piramideActivada").style.display="inline";
				//document.getElementById("funelActivada").style.display="inline";
				document.getElementById("lineasBarrasDesactivadas").style.display="inline";
				document.getElementById("velocimetroDesactivado").style.display="inline";
				document.getElementById("semaforoDesactivado").style.display="inline";
				
				document.getElementById("pieDesactivada").style.display="none";
				document.getElementById("donaDesactivada").style.display="none";
				document.getElementById("medioCirculoDesactivada").style.display="none";
				document.getElementById("piramideDesactivada").style.display="none";
				//document.getElementById("funelDesactivada").style.display="none";
				document.getElementById("lineasBarrasActivada").style.display="none";
				document.getElementById("velocimetroActivado").style.display="none";
				document.getElementById("semaforoActivado").style.display="none";
			}
	
		
	}	
	
}
var ventanaOcultar=0;

function dobleClic(x){
	x=x.substring(11);
	x=parseInt(x);
	x=x+1;
	ventanaOcultar=x;
	//alert(x);
	toogle('modal',x);
}

function toogle(b,c)
{
  //alert(b+c);
  document.getElementById(b).style.display="block";
  ventanaActiva();
  
}
function ventanaActiva(){
	//alert(document.getElementById("ventana"+ventanaOcultar).value);
	document.getElementById("ventana"+ventanaOcultar).style.display="block";
	//alert("realiza");
}

function toogleOcultar(b)
{
  //alert("ventana"+ventanaOcultar);
  document.getElementById(b).style.display="none";
  document.getElementById("ventana"+ventanaOcultar).style.display="none";
}

function creaTabla(){
	
	//Crea Div que contendra la grafica y asigna drag&drop
	 original=document.getElementById("herramientas");
	 nuevo=original.cloneNode(true);
	 nuevo.id="herramienta"+indice;
	 destino=document.getElementById("contenedorGraficas");
	 destino.appendChild(nuevo);
	 document.getElementById("herramienta"+indice).style.display = "inline-block";
	 
	 original=document.getElementById("label");
	 nuevo=original.cloneNode(true);
	 nuevo.id="label"+indice;
	 nuevo.innerHTML="Herramienta "+nombreIndicador;
	 destino=document.getElementById("herramienta"+indice);
	 destino.appendChild(nuevo);
	 
	 original=document.getElementById("salto");
	 nuevo=original.cloneNode(true);
	 nuevo.id="salto"+indice;
	 destino=document.getElementById("herramienta"+indice);
	 destino.appendChild(nuevo);

	 //Esta siguiente linea interfiere con el pintado de la grafica
	 //document.getElementById("herramienta"+indice).style.display = "inline"
	 new Draggable("herramienta"+indice);
	 
	 //Crea grafica dentro del div
	 original=document.getElementById("tablaIndicador");
	 nuevo=original.cloneNode(true);
	 nuevo.id="tablaIndicador"+indice;
	 destino=document.getElementById("herramienta"+indice);
	 destino.appendChild(nuevo);
	 document.getElementById("tablaIndicador"+indice).style.display = "inline";
	 //new Draggable("canvas"+indice);
	 
	 //Incrementa indice para no sobreescribir la grafica antes creada
	
	 indice=indice+1;
	
}

function configuracionHerramientas(a,b,c){
	 // alert("si hace");
	  document.getElementById(b).style.display=a;
	  document.getElementById(c).style.display=a;
}

function habilitaRangos(r){
	if(r!="Sin Alerta"){
		document.getElementById("trRangoAlerta").style.display="inline";
		document.getElementById("trMinMax").style.display="inline";
		document.getElementById("numeroEventos").style.display="inline";
	}else{
		document.getElementById("trRangoAlerta").style.display="none";
		document.getElementById("trMinMax").style.display="none";
		document.getElementById("numeroEventos").style.display="none";
	}
	
}

function guardaAlertaHerramienta(){
	alerta=document.getElementById("alertas").value;
	notificacion=document.getElementById("notificaciones").value;
	maximo=document.getElementById("rMaximo").value;
	minimo=document.getElementById("rMinimo").value;
	eventos=document.getElementById("eventos").value;
	eventoAlerta=document.getElementById("hiddenAlerta"+herramientaConfigurada).value
	
	if(alerta!="Sin Alerta"&notificacion!="Sin Notificacion"&maximo!=""&minimo!=""){
		
		//Mail
		document.getElementById("numeroAlerta").value=herramientaConfigurada;
		if(notificacion=="mail"&& eventoAlerta>=eventos){
			//Ejecuta servlet envio mail
			//alert(herramientaConfigurada+" herramienta configurada");
			document.getElementById("graficaConfigurada"+(indice-1)).value=herramientaConfigurada;
			document.getElementById("formGrafica"+herramientaConfigurada).submit();
			
		}
		//Ejecuta guardar
		configuracionHerramientas("none","modalModificacion","ventanaModificacion");
	}else{
		alert("Debe seleccionar el tipo de alerta, sus rangos y notificacion")
	}
}


var herramientaConfigurada; //Nos indica el numero de la herramienta, para obtener el id del label y despues obtener que indicador es, para sacar las metas por el select y hacer el calculo de los rangos
function obtieneIndicadorHerramienta(f){
	
	f=f.substring(11);
	herramientaConfigurada=f;
}

var visibleGoogle=0;
function muestraGoogleTools(){
	if(visibleGoogle==1){
		document.getElementById("herramientasGoogle").style.display="none";
		visibleGoogle=0;
	}else{
		document.getElementById("herramientasGoogle").style.display="inline";
		visibleGoogle=1;
	}
}

function guardarDashboard(){
	//alert(document.getElementById("dashboardGuardar").value);
	confirmar=confirm("¿Esta seguro que desea guardar este Dashboard?");
	
	if (confirmar){
		//Funciones que guarden en base de datos
		var reply = prompt("Ingresa el nombre con el que se guardara el Dashboard", "")
		document.getElementById("nombreDashboard").value=reply;
		//document.getElementById("llena").action="UpdateIndicador";
		document.getElementById("guardaDas").submit();
	}
}

function mostrarGraficas(){
	if(document.getElementById("iconosGraficas").style.display=="none"){
		document.getElementById("iconosGraficas").style.display="inline";
	}else{
		document.getElementById("iconosGraficas").style.display="none"
	}
}

function mostrarMedidores(){
	if(document.getElementById("medidores").style.display=="none"){
		if(document.getElementById("selectIndicador").value=="noSeleccionado"){
			document.getElementById("medidoresDes").style.display="inline";
			document.getElementById("medidores").style.display="none";
			
		}else{
			document.getElementById("medidoresDes").style.display="none";
			document.getElementById("medidores").style.display="inline";	
		}
	}else{
		document.getElementById("medidores").style.display="none"
	}
}

function cerrarHerramienta(idHerramienta){
	//alert(idHerramienta);
	confirmar=confirm("¿Esta seguro que desea cerrar esta Herramienta?");
	if (confirmar){
		eliminaHistorial(idHerramienta);
		herramienta=document.getElementById(idHerramienta);
		padre = herramienta.parentNode;
		padre.removeChild(herramienta);
	}
}

function historiaDashboard(m){
	if(dashHistoria==""){
		//alert("entra dash historial");
		dashHistoria[0]="herramienta"+(indice-1); //id herramienta
		dashHistoria[1]=nombreIndicador;			//Nombre graficado ind
		dashHistoria[2]=tamanoLargo;				//Tamaño div
		dashHistoria[3]=m;							//Grafica
		dashHistoria[4]="posicion";					//Posicion

		if(nuevaFrecuencia==""){
			nuevaFrecuencia=variableFrecuencia;
		}
		dashHistoria[5]=nuevaFrecuencia;			//Campo para capturar cambio frecuencia
		//alert(cambioFrecGuardar);
		dashHistoria[6]=document.getElementById("checkCruzar").checked;		//Campo para saber si fue dato cruzado con reales
		//alert(" checkbox "+document.getElementById("checkCruzar").checked);
		dashHistoria[7]=origenDatos;				//Campo para saber el origen de los datos
	
		//alert(dashHistoria+" dashistoria");
		
		dashTotal[indiceDashTotal]=dashHistoria+"-";
		indiceDashTotal=indiceDashTotal+1;
		//alert("dash total "+dashTotal);
		document.getElementById("dashboardGuardar").value=dashTotal;
		
	}else{
		//alert(dashHistoria+" dashistoria");
		// Se limpia variable para que no se repita al guardar en el array definitivo
		dashHistoria=[];
		//alert(dashHistoria);
		dashHistoria[0]="herramienta"+(indice-1);
		dashHistoria[1]=nombreIndicador;
		dashHistoria[2]=tamanoLargo;
		dashHistoria[3]=m;
		dashHistoria[4]="posicion";
		if(nuevaFrecuencia==""){
			nuevaFrecuencia=variableFrecuencia;
		}
		dashHistoria[5]=nuevaFrecuencia;			//Campo para capturar cambio frecuencia
		//alert(cambioFrecGuardar);
		dashHistoria[6]=document.getElementById("checkCruzar").checked;		//Campo para saber si fue dato cruzado con reales
		//alert(document.getElementById("checkCruzar").checked);
		dashHistoria[7]=origenDatos;				//Campo para saber el origen de los datos
		//alert(origenDatos);
		
		
		dashTotal[indiceDashTotal]=dashHistoria+"-";
		indiceDashTotal=indiceDashTotal+1;
		
		//alert(dashHistoria+" dashistoria");
		//alert("dash total "+dashTotal);
		
		document.getElementById("dashboardGuardar").value=dashTotal;
		//alert(document.getElementById("dashboardGuardar").value);
	}
}

function eliminaHistorial(v){
	
	//alert(v);
	for(x=0; x<dashTotal.length; x++){
		//alert(dashTotal.length);
		//alert(dashTotal[x].indexOf(v));
		if(dashTotal[x].indexOf(v)!=-1){
			//alert(dashTotal+" total antes de");
			dashTotal.splice(x, 1);
			indiceDashTotal=indiceDashTotal-1;
			document.getElementById("dashboardGuardar").value=dashTotal;
			//alert(dashTotal+" total despues de");	
		}
	}// se quito este punto y coma;
}

function splitFuncion(){
	
	dashboardunido = document.getElementById("ultimoDasActivo"+variableDashboard).value;
	
	if(dashboardunido!=""){
		
		posicion = dashboardunido.lastIndexOf('-');
		
		porcion = dashboardunido.substring(0,posicion);
		
		palabras = porcion.split("-,");
		
		numeropalabras=palabras.length;
		//alert(numeropalabras);
		for(i=0;i<numeropalabras;i++){
			graficaString=palabras[i];
			graficaString = graficaString.split(",");
			//alert(graficaString);
			
			nombreIndicador=graficaString[1];
	 		//alert("nombre indicador "+nombreIndicador);
	 		tamanoLargo=graficaString[2];
	 		tipoGrafica=graficaString[3];
			//posicion=graficaString[4];
			nuevaFrecuencia=graficaString[5];
			//alert("valor que viene en el arreglo "+graficaString[6]);
			if(graficaString[6]=="false"){
				$("#checkCruzar").prop("checked", false);
			}else{
				$("#checkCruzar").prop("checked", true);
			}
			//alert("checado que devuelve "+document.getElementById("checkCruzar").checked);
			origenDatos=graficaString[7];
	 		//alert("tipo grafica "+tipoGrafica);
			//Sacar aqui la nueva frecuencia
	 		
	 		for(ii=0;ii< document.getElementById("selectIndicador").options.length;ii++){ 
	 			valorSelectInd=document.getElementById("selectIndicador").options[ii].value;
	 			valorSelectInd=valorSelectInd.split("-");
	 			
	 		    if(valorSelectInd[0] == nombreIndicador ){ 
	 		    	//alert(valorSelectInd[0]+" valor indicador del select");
	 		        document.getElementById("selectIndicador").options[ii].selected = 'selected'; 
	 		        valores=document.getElementById("selectIndicador").value;
					//alert(valores);
	 		        asignaMeta(valores);
					asignaFrecuencia(nuevaFrecuencia);
					//Necesario para cargar
					//cambioFrecuencia=false;
					//datosGraficar(); Esta se quita por que se ejecuta en automatico despues de asignafrecuencia
					metasReales();
					
	 		    } 
	 		}
	 		
	 		crearHerramienta();
			agregaAlertas();
	 		
			dashTotal[i]=palabras[i]+"-";
			//alert(dashTotal);
			indiceDashTotal=i;
			//alert(indiceDashTotal);
		}
		
		indiceDashTotal=indiceDashTotal+1;
		//alert(indiceDashTotal);
	}
}


function limpiaDashboard(){
	
	dashCargado="";
	dashHistoria=[];
	dashTotal=[];
	dashNuevo=0;
	indiceDashTotal=0;
	document.getElementById("contenedorGraficas").innerHTML="";	
	//alert(nuevaFrecuencia);
	nuevaFrecuencia="";
	tamanoLargo="350px";
	//alert(nombreIndicador);
	//alert(tamanoLargo);
	//alert(variableFrecuencia);
	//alert(origenDatos);
	
}
</script>

<script>
// Datos google Sheets
variables = new Array();
dato = new Array();
series = new Array();
totalfrases = 0;
 
var entrada;
var ejemplo;
var renglon;
var tituloColumna = new Array();
indTit = 0;
comp = 0;
var json1;

function cargar(){
	//Borrar variables

	series=[];
	variables=[];
	indTit = 0;
	comp = 0;
	document.getElementById("divDatosGoogle").innerHTML="";
	//alert("borra div");
	
	
	key=document.getElementById("keyGoogle").value;
	//alert(key);
	json="";
	archivo="https://spreadsheets.google.com/feeds/list/"+key+"/1/public/values?alt=json-in-script&callback=leerArchivo"
	include(archivo);
	//arregloSeries=[];
	
}


function include(archivo) {
	if ( document.getElementById( "scriptLeer" )) {
		//alert("entra borrar");
		var scriptGoogle = document.getElementById("scriptLeer");
		scriptGoogle.parentNode.removeChild(scriptGoogle);
		 
	}


	var nuevo = document.createElement('script');
	nuevo.setAttribute('type', 'text/javascript');
	nuevo.id="scriptLeer";
	nuevo.setAttribute('src', archivo);
	document.getElementsByTagName('head')[0].appendChild(nuevo);
}


function leerArchivo(json) {
		contador=1;
		totalfrases=0;
		entrada=0;
		 totalfrases = json.feed.entry.length;
		//alert("total frases "+totalfrases);	 
		
		entrada = json.feed.entry[0].content.$t;
		 //alert("total entrada "+entrada);
		 ejemplo = entrada.split(",");
		//alert("total ejemplo "+ejemplo);
		 json1 = json;
		// alert("total json1 "+json1);
		
		// for(i=0; i<totalfrases; i++) {
		
			// dato[i] = json1.feed.entry[i].gsx$dato.$t;
			// alert("dato[i] "+dato[i]);
		// } 
		 recorrerRenglon();
		 
		 // var columas = document.getElementById("columnas");
			// for (var i = 0; i < tituloColumna.length; i++)
			  // {
				// columas.options[i] = new Option(tituloColumna[i]);
			  // }
			  //alert(tituloColumna.length);
			//Agrega checked
			for (var i = 0; i < tituloColumna.length; i++)
			  {
				 //alert(tituloColumna[i]);
				//columas.options[i] = new Option(tituloColumna[i]);
				//alert(columas.options[i].value);
				//Crea ckeckbox
				 original=document.getElementById("labelDatosGoogle");
				 nuevo=original.cloneNode(true);
				 nuevo.id="labelDatosGoogle"+contador;
				 nuevo.innerHTML=tituloColumna[i];
				 destino=document.getElementById("divDatosGoogle");
				 destino.appendChild(nuevo);
				 
				 original=document.getElementById("checkDatosGoogle");
				 nuevo=original.cloneNode(true);
				 nuevo.id="checkDatosGoogle"+contador;
				 destino=document.getElementById("divDatosGoogle");
				 destino.appendChild(nuevo);
				 
				 original=document.getElementById("salto");
				 nuevo=original.cloneNode(true);
				 nuevo.id="salto"+contador;
				 destino=document.getElementById("divDatosGoogle");
				 destino.appendChild(nuevo);

				contador=contador+1;
			  } 
	 }
	 
	//Recorre el primer renglon para obtener cuantas columnas son 
	function recorrerRenglon() {	
		//alert(ejemplo.length+ " ejemplolength");
		for(a=0; a < ejemplo.length; a++){
			renglon =  ejemplo[a].split(":");
			//alert("renglon "+renglon);
			obtenerTitulo();
		}
		
	 }

	//Obtiene el título de cada columna
	function obtenerTitulo() {	
		tituloColumna[indTit] = renglon[comp];
		//alert("tituloColumna[indTit] "+tituloColumna[indTit]);
		indTit ++;
	}
	
	function obtenerDatosGooogle(){
		//Limpia las series
		series=[];
		var indicadores=[];
		var nomSerie;
		var serie;
		var nombre = new Array();
		//alert(contador);
		iteraSerie=0;
		for(c=1;c<(contador);c++){
			//alert(document.getElementById("checkDatosGoogle"+c).checked);
			if(document.getElementById("checkDatosGoogle"+c).checked){
				//alert("entra "+c);
				
				nomSerie=document.getElementById("labelDatosGoogle"+c).innerHTML;
				nomSerie=nomSerie.trim();
				
				serie = new Array();
				//alert(totalfrases);
				for(i=0; i<totalfrases; i++) {
					serie[i] = parseInt(json1.feed.entry[i]["gsx$"+nomSerie].$t);
				}
				
				series[iteraSerie] = {name: nomSerie, data: serie};
				//alert(series[iteraSerie]);
				iteraSerie=iteraSerie+1;
			}
			//indicadores[c]=document.getElementById("cols").value;
		
		}
		for(i=0; i<totalfrases; i++) {
				variables[i] = json1.feed.entry[i].gsx$variables.$t;
				
				//alert("dato[i] "+dato[i]);
		} 
		
		nombreIndicador="Google Sheets";
		muestraGraficas("googleSheets");
		origenDatos="googleSheets";
		datoX=variables;
		arregloSeries=series;
	}
</script>

<%@ page import = "com.adn.conexion.Operaciones"%>
<%@ page import = "java.sql.ResultSet"%> 

<body onload="MM_preloadImages('ImagenesADN/direccion-rollover.png','ImagenesADN/analisis-rollover.png','ImagenesADN/gerencia-rollover.png','ImagenesADN/planeacion-rollover.png','ImagenesADN/tablero-rollover.png','ImagenesADN/admon-rollover.png')">

<div id="cabecera">
	<jsp:include page="Header.jsp">
		<jsp:param name="usuario" value="<%=usuario%>" />
		<jsp:param name="nombre" value="<%=nombre1%>" />
		<jsp:param name="puesto" value="<%=puesto%>" />
	</jsp:include>
</div>
<div class="principal" ng-app='DashBoardMainModule' ng-controller="MainController">
<br>
<div width="98%">
<div class="barratitulo" style="padding:0px 0px 0px 20px; width:28%">
<table style="margin: 5px 0px 0px 20px">
<tr>
<td>Dashboards ADN</td>
</tr>
</table>
</div>
<div class="barraopciones" style="padding:0px 0px 0px 0px">
<table align="center" width="100%" >
    
    	<tr>
    		<td>
    			<!--<img src="ImagenesADN/boton-guardar-desact.png" style="display:none" align="left" onclick="">
				<img src="ImagenesADN/boton-guardar.png" align="left" onclick="guardarDashboard();">
    			<!--<input type="button" class="googlesheets" value="Limpiar Dashboard" onclick="limpiaDashboard()">-->
				<button type="button" id="botonGuardarDashboard" data-loading-text="Guardar.." class="btn btn-primary" autocomplete="off" onclick="guardarDashboard();">
					 Guardar
				</button>
				<button type="button" id="botonAgregar" data-loading-text="Limpiar.." class="btn btn-primary" autocomplete="off" onclick="limpiaDashboard()">
					 Limpiar
			    </button>
				<button type="button" id="dashboard1" class="btn btn-info" autocomplete="off" onclick="asignaValorDashboard(1,'uno');limpiaDashboard();splitFuncion()">
					Dashboard 1
				</button>
				<button type="button" id="dashboard2" class="btn btn-info" autocomplete="off" onclick="asignaValorDashboard(2,'dos');limpiaDashboard();splitFuncion()">
					Dashboard 2
				</button>
				<button type="button" id="dashboard3" class="btn btn-info" autocomplete="off" onclick="asignaValorDashboard(3,'tres');limpiaDashboard();splitFuncion()">
					Dashboard 3
				</button>
    		</td>
    		<td>
    		
    		</td>
    		
    	</tr>
</table>

</div>

</div>
   <table align="center" width="100%" style="display:none">
        <tr>
            <td width="70%" align="left">
                <div class="shadow" id="alertas">
                <table align="center" width="100%" id="tablaAlertas">
                    <tr>
			    		<td colspan="4" align="center">
			    			<label class="titulodivs">CONSOLA DE ALERTAS</label>
			    		</td>
			    	</tr>
			    	<tr >

			    		<td align="center">
			    			<label id="labelCausa" class="cajatextocausariesgo">CAUSA</label>
			    		</td>
			    		<td align="center">
			    			<label id="labelRiesgo" class="cajatextocausariesgo">RIESGO</label>
			    		</td>
			    		<td align="center">
			    			<label id="labelTipNotificacion" class="cajatextocausariesgo">TIPO DE NOTIFICACION</label>
			    		</td>
			    	</tr>
                </table>
                </div>
            </td>
            <td width="30%" align="rigth">
                <div class="shadow" id="consolareportes">
                    <table>
                        <tr>
                            <td colspan="2" align="center">
                                <label class="titulodivs">Titulo</label>
                            </td>
                        </tr>
                        <tr>
                            <td width="25%" align="center">
                                <div class="causasriesgos" id="causas" align="center">Reporte</div>
                            </td>
                            <td width="75%" align="center">
                                <div class="causasriesgos" id="causas" align="center">Descripcion</div>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    
    <table align="center" width="100%" style="margin: 60px 0px 0px 0px">
    
        <tr>
        	<%
				String dashboardActivo="",busquedaDas="", stringDas="";
        		int cont=1;
			
				Operaciones objetoDas=new Operaciones();
				busquedaDas="SELECT contenido FROM dashboard where usuario='"+usuario+"'";
				ResultSet rsDas=objetoDas.consultar(busquedaDas);
				
				while(rsDas.next()){
					stringDas=rsDas.getString(1);
					
			%>
				 <input type="hidden" value="<%=stringDas%>" name="ultimoDasActivo<%=cont %>" id="ultimoDasActivo<%=cont %>"> 
				
			<%
				cont=cont+1;
			}
			
			if(stringDas==""){
			
			%>
				 <input type="hidden" value="" name="ultimoDasActivo" id="ultimoDasActivo">
			
			<%	
			
			}
			
			%>    
            <td width="95%" valign="top">
            	<form id="guardaDas" action="guardarDashboard" method="post">
	                <div width="100%" height="800px" id="contenedorGraficas" name="contenedorGraficas"><br></div>
	 				<input type="hidden" name="nombreDashboard" id="nombreDashboard">
	 				<input type="hidden" name="dashboardGuardar" id="dashboardGuardar" value="">
	 				<input type="hidden" name="hiddenUno" id="hiddenUno" value="">	
	 				<input type="hidden" name="indicadorDash" id="indicadorDash" value="uno">
	 				<input type="hidden" name="usuarioLogueado" id="usuarioLogueado" value="<%=usuario%>">	
	 			</form>	
            </td>
            <td width="5%" align="center" valign="top">
                <table width="80%" class="sidebar" border="0">
                    	<tr>
                    		<td align="center">
                    			<img id="" src="ImagenesADN/google.png" onclick="muestraGoogleTools()">
                    		</td>
                    	</tr>
                    	<tr>
                    		<td align="center">
                    			<!--<input data-toggle="modal" href="#example" class="googlesheets" type="button" value="Google Sheets">-->
								<button type="button" data-loading-text="Google Sheets.." class="btn btn-primary" autocomplete="off" data-toggle="modal" href="#example">
									 Conectar datos externos
								</button>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td align="center">
                    			<!--<input data-toggle="modal" href="#example2" onclick="agregaSelect()" class="googlesheets" type="button" value="Cruzar Indicador">-->
								<button type="button" data-loading-text="Cruzar Indicadores.." class="btn btn-primary" autocomplete="off" data-toggle="modal" href="#example2" onclick="agregaSelect()">
									 Comparar Indicadores
								</button>
                    		</td>
                    	</tr>
                    	<tr>
                    		<td>
                    			<table id="herramientasGoogle" style="display:none" width="100%">
                    				<tr >
	                    				<td width="45%" align="center" id="">
	                    					<a href="https://mail.google.com/mail/?tab=mm&amp;authuser=0">
												<img src="ImagenesADN/gmail.png" />	
											</a>
			                    		</td>
			                    	</tr>
			                    	<tr >
			                    		<td width="45%" align="center" id="">
			                    			<a href="https://drive.google.com/?tab=mo&amp;authuser=0">
												<img src="ImagenesADN/googledrive.png"/>	
											</a>
			                    		</td>
			                    	</tr>
			                    	<tr >
			                    		<td width="45%" align="center" id="">
			                    			<a href="https://www.google.com/calendar?tab=mc&amp;authuser=0">
												<img src="ImagenesADN/googlecalendar.png" />	
											</a>
			                    		</td>
			                    	</tr>
                    			</table>
                    		</td>
                       
                        <tr>
                            <td align="center">
			                   <label class="titulodivs">Indicador</label>
			                </td>
                        </tr>
                        <tr>
                        	<td align="center">
			               	<%
								String idIndicador="", mes="", nombre="", Q1="", busquedaq="", busquedamen="", Q2="", semana="", busquedasem="", tri1="",tri2="",tri3="",tri4="", Q3="", busquedaf="", Q4="", busqueda="",ene="",feb="",mar="",abr="",may="",jun="",jul="",ago="",sep="",oct="",nov="",dic="",frecuencia="";
							%>
								
			                   <select id="selectIndicador" class="selectEstilo" onchange="seleccionFrecuencia(this.value);asignaMeta(this.value);muestraGraficas();datosGraficar()"
			                   ng-model="indicador_seleccionado" ng-change="changeSelectIndicador()">
			                       <option ng-repeat="indicador in lista_indicadores" value="{{indicador.idIndicador}}">{{indicador.nb_indicador}}</option>
			                   </select>
			               </td>
                        </tr>
                        <tr>
                            <td align="center">
			                   <label class="titulodivs">Año</label>
			                </td>
                        </tr>
                        <tr>
                        	<td align="center">							
			                   <select id="selectYear" class="selectEstilo" ng-change="changeSelectYear()" ng-model="year_seleccionado">
			                       <option ng-repeat="year in lista_years" value="{{year}}">{{year}}</option>
			                   </select>
			               </td>
                        </tr>
                        <tr>
                        	<td id="tdSemanal" style="display:none">
                        		<select onchange="asignaFrecuencia(this.value);" id="selectSemanal" class="selectEstilo">
			                       <option value="semanal" selected>Semanal</option>
			                       <option value="mensual">Mensual</option>
			                       <option value="trimestral">Trimestral</option>
			                   </select>
                        	</td>   
                        </tr>
                        <tr>
                        	<td id="tdMensual" style="display:none">
                        		<select onchange="asignaFrecuencia(this.value);" id="selectMensual" class="selectEstilo">
			                       <option value="mensual" selected>Mensual</option>
			                       <option value="trimestral">Trimestral</option>
			                   </select>
                        	</td>   
                        </tr>	
                        <tr>
                        	<td id="tdTrimestral" style="display:none">
                        		<select onchange="asignaFrecuencia(this.value);" id="selectTrimestral" class="selectEstilo" disabled>			                   
			                       <option value="trimestral" selected>Trimestral</option>
			                   </select>
                        	</td>    
                        </tr>		
                         <tr>
                        	<td>
                        		<select onchange="asignaTamano(this.value);" class="selectEstilo">
			                       <option value="350px">Chica</option>
			                       <option value="500px">Mediana</option>
			                       <option value="1000px">Grande</option>
			                   </select>
                        	</td>   
                        </tr>
						<tr>
                        	<td width="45%" align="center" id="">
								<input type="checkbox" name="cruzarIndicador" id="checkCruzar" value="" onclick="muestraGraficas();"><label align="center" value="" id="" class="" onclick="metasReales()">Meta & Real</label>										                        					
							</td>
                        </tr>						
                        <tr>
                        	<td width="45%" align="center" id="tdBarras">
								<img id="" src="ImagenesADN/barra-graficas1.png" onclick="mostrarGraficas()">										                        					
							</td>
                        </tr>
                        <tr id="iconosGraficas" style="display:none">
                        	<td id="graficasHabilitadas" style="display:none">
                        		<table width="100%" id="contenedorImagenes">
									<tr>
										<td width="45%" align="center" id="tdBarras">
											<img id="barras" src="ImagenesADN/barra-graficas.png" draggable="true" ondragstart="asignaDragDrop('gBarras','barras','tdBarras');llamado()" onclick="asignaDragDrop('gBarras','barras','tdBarras');llamado()" ondblclick="asignaDragDrop('gBarras','barras','tdBarras');llamado()">										                        					
										</td>
									</tr>
									<tr>	
										<td width="45%" align="center" id="tdLineal">
											<img id="lineal" src="ImagenesADN/grafica-linea.png" draggable="true" ondragstart="asignaDragDrop('gLineal','lineal','tdLineal');llamado()" onclick="asignaDragDrop('gLineal','lineal','tdLineal');llamado()" ondblclick="asignaDragDrop('gLineal','lineal','tdLineal');llamado()">								                        					
										</td>
									</tr>
									<tr id="pieActivada" align="center">
										<td width="45%" align="center" id="tdCircular">
											<img id="circular" src="ImagenesADN/grafica-pastel.png" draggable="true" ondragstart="asignaDragDrop('gCircular','circular','tdCircular');llamado()" onclick="asignaDragDrop('gCircular','circular','tdCircular');llamado()" ondblclick="asignaDragDrop('gCircular','circular','tdCircular');llamado()">										                        					
										</td>
									</tr>
									<tr  id="pieDesactivada" style="display:none" align="center">
										<td width="45%" align="center">
											<img src="ImagenesADN/g04-desact.png">
										</td>
									</tr>									
									<!-- <tr>
										<td width="45%" align="center" id="tdSemaforo">
											<img id="barrasApiladas" src="ImagenesADN/barraApilada.png" draggable="true" ondragstart="asignaDragDrop('gBarraApilada','barraApilada','tdBarraApilada');llamado()" onclick="asignaDragDrop('gBarraApilada','barraApilada','tdBarraApilada');llamado()" ondblclick="asignaDragDrop('gBarraApilada','barraApilada','tdBarraApilada');llamado()">							                        					
										</td>
									</tr> -->
									<tr id="donaActivada" align="center">
										<td width="45%" align="center" id="tdVelocimetro">
											<img id="dona" src="ImagenesADN/dona.png" draggable="true" ondragstart="asignaDragDrop('gDona','dona','tdDona');llamado()" onclick="asignaDragDrop('gDona','dona','tdDona');llamado()" ondblclick="asignaDragDrop('gDona','dona','tdDona');llamado()">										                        					
										</td>
									</tr>
									<tr id="donaDesactivada" style="display:none" align="center">
										<td width="45%" align="center">
											<img src="ImagenesADN/g05-desact.png">
										</td>
									</tr>	
									<tr>
										<td width="45%" align="center" id="tdTabla">
											<img id="burbuja" src="ImagenesADN/burbuja.png" draggable="true" ondragstart="asignaDragDrop('gBurbuja','burbuja','tdBurbuja');llamado()" onclick="asignaDragDrop('gBurbuja','burbuja','tdBurbuja');llamado()" ondblclick="asignaDragDrop('gBurbuja','burbuja','tdBurbuja');llamado()">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="tdTabla">
											<img id="barrasConNegativo" src="ImagenesADN/barrasConNegativo.png" draggable="true" ondragstart="asignaDragDrop('gBarrasConNegativo','barrasConNegativo','tdBarrasConNegativo');llamado()" onclick="asignaDragDrop('gBarrasConNegativo','barrasConNegativo','tdBarrasConNegativo');llamado()" ondblclick="asignaDragDrop('gBarrasConNegativo','barrasConNegativo','tdBarrasConNegativo');llamado()">										                        					
										</td>
									</tr>
									<!--<tr>
										<td width="45%" align="center" id="tdTabla">
											<img id="barrasConVariaciones" src="ImagenesADN/barrasConVariaciones.png" draggable="true" ondragstart="asignaDragDrop('gBarrasConVariaciones','barrasConVariaciones','tdBarrasConVariaciones');llamado()" onclick="asignaDragDrop('gBarrasConVariaciones','barrasConVariaciones','tdBarrasConVariaciones');llamado()" ondblclick="asignaDragDrop('gBarrasConVariaciones','barrasConVariaciones','tdBarrasConVariaciones');llamado()">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="tdTabla">
											<img id="graficaCombinada" src="ImagenesADN/graficaCombinada.png" draggable="true" ondragstart="asignaDragDrop('gCombinada','graficaCombinada','tdGraficaCombinada');llamado()" onclick="asignaDragDrop('gCombinada','graficaCombinada','tdGraficaCombinada');llamado()" ondblclick="asignaDragDrop('gCombinada','graficaCombinada','tdGraficaCombinada');llamado()">										                        					
										</td>
									</tr>-->
									<!-- <tr>
										<td width="45%" align="center" id="tdTabla">
											<img id="graficaLineaCombinada" src="ImagenesADN/graficaLineaCombinada.png" draggable="true" ondragstart="asignaDragDrop('gLineaCombinada','graficaLineaCombinada','tdGraficaLineaCombinada');llamado()" onclick="asignaDragDrop('gLineaCombinada','graficaLineaCombinada','tdGraficaLineaCombinada');llamado()" ondblclick="asignaDragDrop('gLineaCombinada','graficaLineaCombinada','tdGraficaLineaCombinada');llamado()">										                        					
										</td>
									</tr> -->
									<tr id="lineasBarrasActivada" style="display:none" align="center">
										<td width="45%" align="center" id="tdTabla">
											<img id="graficaLineaBarras" src="ImagenesADN/graficaLineaBarras.png" draggable="true" ondragstart="asignaDragDrop('gLineaBarras','graficaLineaBarras','tdGraficaLineaBarras');llamado()" onclick="asignaDragDrop('gLineaBarras','graficaLineaBarras','tdGraficaLineaBarras');llamado()" ondblclick="asignaDragDrop('gLineaBarras','graficaLineaBarras','tdGraficaLineaBarras');llamado()">										                        					
										</td>
									</tr>
									<tr id="lineasBarrasDesactivadas" align="center">
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g12-desact.png">										                        					
										</td>
									</tr>
									<!--<tr>
										<td width="45%" align="center" id="tdTabla">
											<img id="graficaError" src="ImagenesADN/graficaError.png" draggable="true" ondragstart="asignaDragDrop('gError','graficaError','tdGraficaError');llamado()" onclick="asignaDragDrop('gError','graficaError','tdGraficaError');llamado()" ondblclick="asignaDragDrop('gError','graficaError','tdGraficaError');llamado()">										                        					
										</td>
									</tr>-->
									<tr>
										<td width="45%" align="center" id="tdTabla">
											<img id="graficaMultilinea" src="ImagenesADN/graficaMultilinea.png" draggable="true" ondragstart="asignaDragDrop('gMultilinea','graficaMultilinea','tdGraficaMultilinea');llamado()" onclick="asignaDragDrop('gMultilinea','graficaMultilinea','tdGraficaMultilinea');llamado()" ondblclick="asignaDragDrop('gMultilinea','graficaMultilinea','tdGraficaMultilinea');llamado()">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="tdTabla">
											<img id="graficaArea" src="ImagenesADN/graficaArea.png" draggable="true" ondragstart="asignaDragDrop('gArea','graficaArea','tdGraficaArea');llamado()" onclick="asignaDragDrop('gArea','graficaArea','tdGraficaArea');llamado()" ondblclick="asignaDragDrop('gArea','graficaArea','tdGraficaArea');llamado()">										                        					
										</td>
									</tr>
									<tr id="medioCirculoActivada" align="center">
										<td width="45%" align="center" id="tdTabla">
											<img id="graficaMedioCirculo" src="ImagenesADN/graficaMedioCirculo.png" draggable="true" ondragstart="asignaDragDrop('gMedioCirculo','graficaMedioCirculo','tdGraficaMedioCirculo');llamado()" onclick="asignaDragDrop('gMedioCirculo','graficaMedioCirculo','tdGraficaMedioCirculo');llamado()" ondblclick="asignaDragDrop('gMedioCirculo','graficaMedioCirculo','tdGraficaMedioCirculo');llamado()">										                        					
										</td>
									</tr>
									<tr id="medioCirculoDesactivada" style="display:none" align="center">
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g21-desact.png">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="tdTabla">
											<img id="graficaPolar" src="ImagenesADN/graficaPolar.png" draggable="true" ondragstart="asignaDragDrop('gPolar','graficaPolar','tdGraficaPolar');llamado()" onclick="asignaDragDrop('gPolar','graficaPolar','tdGraficaPolar');llamado()" ondblclick="asignaDragDrop('gPolar','graficaPolar','tdGraficaPolar');llamado()">										                        					
										</td>
									</tr>
									<tr id="piramideActivada" align="center">
										<td width="45%" align="center" id="tdTabla">
											<img id="graficaPiramide" src="ImagenesADN/graficaPiramide.png" draggable="true" ondragstart="asignaDragDrop('gPiramide','graficaPiramide','tdGraficaPiramide');llamado()" onclick="asignaDragDrop('gPiramide','graficaPiramide','tdGraficaPiramide');llamado()" ondblclick="asignaDragDrop('gPiramide','graficaPiramide','tdGraficaPiramide');llamado()">										                        					
										</td>
									</tr>
									<tr id="piramideDesactivada" style="display:none" align="center">
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g25-desact.png">										                        					
										</td>
									</tr>
									<!--<tr id="funelActivada" align="center">
										<td width="45%" align="center" id="tdTabla">
											<img id="graficaFunel" src="ImagenesADN/graficaFunel.png" draggable="true" ondragstart="asignaDragDrop('gFunel','graficaFunel','tdGraficaFunel');llamado()" onclick="asignaDragDrop('gFunel','graficaFunel','tdGraficaFunel');llamado()" ondblclick="asignaDragDrop('gFunel','graficaFunel','tdGraficaFunel');llamado()">										                        					
										</td>
									</tr>
									<tr id="funelDesactivada" style="display:none" align="center">
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/funel-desact.png">										                        					
										</td>
									</tr>-->
									

								</table>
                        	</td>
                        	<td id="graficasDesahabilitadas" style="display:inline">
                        		<table width="100%" id="contenedorImagenes">
									<tr>
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g02-desact.png">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center">
											<img src="ImagenesADN/g06-desact.png">
										</td>
									</tr>
									<tr>
										<td width="45%" align="center">
											<img src="ImagenesADN/g04-desact.png">
										</td>
									</tr>
									<!-- <tr>
										<td width="45%" align="center">
											<img src="ImagenesADN/g03-desact.png">
										</td>
									</tr> -->
									<tr>
										<td width="45%" align="center">
											<img src="ImagenesADN/g05-desact.png">
										</td>
									</tr>	
									<tr>
										<td width="45%" align="center">
											<img src="ImagenesADN/g08-desact.png">
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g09-desact.png">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g07-desact.png">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g11-desact.png">										                        					
										</td>
									</tr>
									<!-- <tr>
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g18-desact.png">										                        					
										</td>
									</tr> -->
									<tr>
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g12-desact.png">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g15-desact.png">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g17-desact.png">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g19-desact.png">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g21-desact.png">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g22-desact.png">										                        					
										</td>
									</tr>
									<tr>
										<td width="45%" align="center" id="">
											<img src="ImagenesADN/g25-desact.png">										                        					
										</td>
									</tr>
									
								</table>
                        	</td>
                        </tr>
                        <tr id="velocimetroActivado">
                        	<td width="45%" align="center" id="">
								<img id="velocimetro" src="ImagenesADN/barra-medidor.png" ondragstart="asignaDragDrop('gVelocimetro','velocimetro','tdVelocimetro');llamado()" onclick="asignaDragDrop('gVelocimetro','velocimetro','tdVelocimetro');llamado()" ondblclick="asignaDragDrop('gVelocimetro','velocimetro','tdVelocimetro');llamado()">										                        					
							</td>
                        </tr>
						<tr id="velocimetroDesactivado" style="display:none">
                        	<td width="45%" align="center" id="">
								<img id="velocimetro" src="ImagenesADN/barra-medidor-desactivado.png" >										                        					
							</td>
                        </tr>
                        <tr id="semaforoActivado">
                        	<td width="45%" align="center" id="tdBarras">
								<img id="semaforo" src="ImagenesADN/barra-indicadores.png" ondragstart="asignaDragDrop('semaforo','semaforo','tdSemaforo');llamado()" onclick="asignaDragDrop('semaforo','semaforo','tdsemaforo');llamado()" ondblclick="asignaDragDrop('semaforo','semaforo','tdsemaforo');llamado()">										                        					
							</td>
                        </tr>
						<tr id="semaforoDesactivado" style="display:none">
                        	<td width="45%" align="center" id="tdBarras">
								<img id="semaforo" src="ImagenesADN/barra-indicadores-desactivado.png" >										                        					
							</td>
                        </tr>
                        <!--<tr>
                        	<td width="45%" align="center" id="">
								<img id="" src="ImagenesADN/barra-reportes.png" draggable="true" ondragstart="asignaDragDrop('gReportesDrive','reportes','tdReportes');llamado()" onclick="asignaDragDrop('gReportesDrive','reportes','tdReportes');llamado()" ondblclick="asignaDragDrop('gReportesDrive','reportes','tdReportes');llamado()">	
								</a>									                        					
							</td>
                        </tr>-->
                    </table>
                   
            </td>
        </tr>
    </table>
	<div align="center">
  <p class="footer">Powered by: ADN. Todos los derechos reservados. 2015</p>
  <div id="logodiezequis"><img src="ImagenesADN/logo-adn.png" width="53" height="37" /></div>
</div>
</div>
<!--Aqui estan todos los objetos que se clonan en las funciones-->
<!-- <div id="herramientas" ondblclick="dobleClic(this.id)" class="" style="display:none"> El doble clic para info -->
<div id="herramientas"  class="areagrafica" style="display:none">
<img src="ImagenesADN/cerrar.png" align="left" onclick="cerrarHerramienta(parentNode.id)"><!--  <img src="ImagenesADN/configuracion.png" align="left" onclick="configuracionHerramientas('block','modalModificacion','ventanaModificacion');obtieneIndicadorHerramienta(parentNode.id);">-->
</div>
<form id="formGrafica" action="ServletCorreo" method="post"></form>
<input type="hidden" id="graficaConfigurada" name="graficaConfigurada" value="">
<input type="hidden" id="hiddenAlerta" value="">
<input type="hidden" value="<%=usuario%>" id="usuarioCorreo" name="usuarioCorreo">
<input type="hidden" name="valoresAlertas" value="" id="valoresAlertas" style="display:none">
<label align="center" value="" id="label" class="titulodivs"><br></label>
<canvas id="canvas" style="display:none;" width="300" height="300"></canvas>
<div id="grafica" style="min-width:350px; height: 350px; margin: 0 auto; display:none"></div>
<label id="labelDatosGoogle"></label>
<input id="checkDatosGoogle" type="checkbox">
<br id="salto">

<div id="contenedorModales"></div>
<div id="modal" style="display:none"></div>



<div id="outer">
  <div id="middle">
    <div id="inner">
     <div id="ventana" class="modal hide fade in" style="display: none; ">
		<table>
			<tr id="trAlertas"></tr>
			<td id="tdAlertas" align="center"></td>
		</table>
		<a href="#close" title="Cerrar" onclick="toogleOcultar('modal')" >Close</a>
	</div>
    </div>
  </div>
</div>



<div id="contenedorModalesModificacion" ></div>
<div id="modalModificacion" style="display:none; width:100%; height:100%">
	<div id="ventanaModificacion" class="modal hide fade in" style="display: none; ">
		<table align="center">
			<tr align="center">
				<td><label class="titulodivs">Modificacion de Herramienta</label></td>
			</tr>
			<tr>
				<td><label class="cajatextocausariesgo">Agregar alerta</label></td>
			</tr>
			<tr>
				<td align="left" >
	                 <select class="selectEstiloGrande" onchange="asignaAlerta(this.value);habilitaRangos(this.value);" id="">
	                     <option value="Sin Alerta">Sin Alerta</option>
	                     <option value="metaSup">Meta Superada</option>
	                     <option value="metaBaj">Por debajo de la meta</option>
	                     <option value="metaInsuf">Tendencia a la baja</option>
	                     <option value="metaAlta">Tendencia a la alta</option>
	                 </select>
	            </td>
	            <td id="numeroEventos" style="display:none">
	            	<label class="cajatextocausariesgo">Número de eventos</label>
	            	<input type="text" size="4" id="eventos" name="">
	            </td>
	        </tr>
	        <tr id="trRangoAlerta" style="display:none">
				<td><label class="cajatextocausariesgo">Rango de alerta</label></td>
			</tr>
			<tr id="trMinMax" style="display:none">
				<td>
					<label class="cajatextocausariesgo">Maximo</label>
				</td>
				<td>
					%<input type="text" size="4" id="rMaximo" name="">
				</td>
				<td>
					<label class="cajatextocausariesgo">Minimo</label>
				</td>
				<td>
					%<input type="text" size="4" id="rMinimo" name="">
				</td>
			</tr>
	        <tr>
				<td><label class="cajatextocausariesgo">Agregar Notificacion</label></td>
			</tr>
	        <tr>      
	             <td align="left">
	                 <select class="selectEstiloMediano" onchange="asignaNotificacion(this.value)" id="notificaciones">
	                     <option value="Sin Notificacion">Sin Notificaciones</option>
	                     <option value="mail">Mail</option>
	                     <option value="reporte">Reporte</option>
	                     <option value="pop">PopUp</option>
	                 </select>
	             </td>
	       </tr>
	       <tr>
	       		<td>
	             	<input type="button" value="Guardar" onclick="guardaAlertaHerramienta();">
	       		</td>
	       </tr>		   	
	    </table>
	<a href="#close" title="Cerrar" onclick="configuracionHerramientas('none','modalModificacion','ventanaModificacion')" >Close</a>
	</div>
</div>

<table id="tablaIndicador" border="3" bordercolor = "#0404B4" style="display:none" >
	<tr>
		<td colspan="5" align="center">
			Tabla por Indicador
		</td>
	</tr>
	<tr>
		<td bgcolor= "#81DAF5" align="center" rowspan="2">
			Nombre Indicador
		</td>
		<td bgcolor= "#81DAF5" align="center">
			Meta 1
		</td>
		<td bgcolor= "#81DAF5" align="center">
			Meta 2
		</td>
		<td bgcolor= "#81DAF5" align="center">
			Meta 3
		</td>
		<td bgcolor= "#81DAF5" align="center">
			Meta 4
		</td>
	</tr>
	<tr>
		<td  align="center">
			Real 1
		</td>
		<td  align="center">
			Real 2
		</td>
		<td  align="center">
			Real 3
		</td>
		<td  align="center">
			Real 4
		</td>
	</tr>		
</table>
<!--<input type="button" onclick="graficasInicio()"> es para pintar las graficas de Alfredo-->
<!--  <input type="button" onclick="splitFuncion()"> prueba de string guardar dash--> 
<!--  <input type="button" onclick="graficasInicio()">-->
<form id="alertasServlet" action="ServletCorreo" method="post">

<input type="hidden" name="numeroAlerta" value="muchas cosas" id="numeroAlerta" style="display:none">
</form>
<div class="container2">
	<div id="example" class="modal hide fade in" style="display: none; ">
    	<div class="modal-header">
        	<a class="close" data-dismiss="modal">×</a>
            <h3>Desde Google Sheets</h3>
        </div>
        <div class="modal-body">
       		<table>
            	<tr>
              		<td>
              		<label>Key:</label><input id="keyGoogle" type="text" name="clave" size="50" value=""/> 
              		</td>
              	</tr>
            </table>		        
       	</div>
		<table>
			<tr>
				<td colspan="3" align="right" id="tdInsertarIndicadores">
					<div id="divDatosGoogle"></div>
				</td>
			</tr>
		</table>
        <div class="modal-footer">
            <a href="#" class="btn" data-dismiss="modal">Cerrar</a>
			<a  onClick="obtenerDatosGooogle();" class="btn btn-success">Obtener</a>
			<a  onClick="cargar()" class="btn btn-success">Cargar</a>
		</div>
	</div>
</div>

<div class="container2">
	<div id="example2" class="modal hide fade in" style="display: none; ">
    	<div class="modal-header">
        	<a class="close" data-dismiss="modal">×</a>
            <h3>Indicador</h3>
        </div>
        <div class="modal-body">
       		<table align="center">
       			<tr>
       				<td>
       					<select onchange="funValida()" id="miSelect1">
						</select>
					</td>
				</tr>
				<tr>
       				<td>
       					<select disabled onchange="funValida2()" id="miSelect2" >
						</select>
					</td>
				</tr>
				<form>
				<tr>
					<td>
       					<select onchange="funValida3()" id="miSelect3" disabled>
						</select>
					</td>
				</tr>
				<tr>
       				<td>
       				<select name="miSelect4" id="miSelect4" disabled>
					</select>
					</td>
					<!-- <td>
						<input type="checkbox" id="check" onclick="miSelect4.disabled= this.checked">
					</td>-->
					</td>
				</tr>
			</form>
			</table>
       	</div>
        <div class="modal-footer">
        	<a onclick="obtenerV()" class="btn btn-success">Guardar</a>
            <a href="#" class="btn" data-dismiss="modal">Cerrar</a>
		</div>
	</div>
</div>








<script>


</script>

</body >
<script>

var variableDashboard=1;
splitFuncion();

function asignaValorDashboard(valor,indicadorDash){
	
	variableDashboard=valor;
	document.getElementById("indicadorDash").value=indicadorDash;
	
}


</script>

<script type="text/javascript" src="js/angular.js"></script>
<script type="text/javascript" src="js/modulos_angular/dashboard/DashBoardMainModule.js"></script>
<script type="text/javascript" src="js/modulos_angular/dashboard/controllers/DashBoardControllers.js"></script>
<script type="text/javascript" src="js/modulos_angular/services/indicadores_inteligentes/IndicadoresInteligentesServices.js"></script>
<script type="text/javascript" src="js/modulos_angular/services/hoja_ruta/HojaRutaServices.js"></script>

</html>