var accion="";


function inicio(){
	obtieneMes();
	validaBotones();
	asignaCombos();
	
	
}

function obtieneMes(){
//Obtiene mes actual
	var fechaActual = new Date(); 
	mesActual=fechaActual.getMonth();
	anoActual=fechaActual.getFullYear();
	arregloMeses=["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"];
	document.getElementById("fechahiden").value=arregloMeses[mesActual]+"-"+anoActual;
	mes=arregloMeses[mesActual];
	//alert(document.getElementById("fechahiden").value);
}
function asignaCombos(){

	comboUH=document.getElementById("comboUnidadH").value;
	comboFrec=document.getElementById("comboFrecuenciaH").value;
	comboSent=document.getElementById("comboSentidoH").value;
	comboTipo=document.getElementById("comboTipoH").value;
	
	if(comboUH!=""){
		document.getElementById("unidad").value=document.getElementById("comboUnidadH").value;
	}
	if(comboFrec!=""){
		document.getElementById("frecuencia").value=document.getElementById("comboFrecuenciaH").value;
	}
	if(comboSent!=""){
		document.getElementById("sentido").value=document.getElementById("comboSentidoH").value;
	}
	if(comboTipo!=""){
		document.getElementById("tipo").value=document.getElementById("comboTipoH").value;
	}
	


}

function agregaIndicadorInteligente(){
	var nombre = document.getElementById("nombre").value;
	var unidad = document.getElementById("unidad").value;
	var meta = document.getElementById("meta").value;
	var resultado = document.getElementById("resultado").value;
	var peso = document.getElementById("peso").value;
	var frecuencia = document.getElementById("frecuencia").value;
	var sentido = document.getElementById("sentido").value;
	var entregamedible = document.getElementById("entregamedible").value;
	var tipo = document.getElementById("tipo").value;
	var corte = document.getElementById("corte").value;
	var rpond = document.getElementById("rpond").value;
	var usuario = document.getElementById("usuariohiden").value;
	var fecha = document.getElementById("fechahiden").value;
	
	
	
	//alert("entra"+usuario+"-"+fecha);
	if(nombre!= "" && unidad!= "" && meta!= "" && resultado!= "" && peso!= "" && frecuencia!= "" && sentido!= ""
		 && entregamedible!= "" && tipo!= "" && corte!= "" && rpond!= "" && usuario!= "" && fecha!= "")
		{
			document.getElementById("GuardaIndicadorInteligente").submit();
		}else{
	alert("Tienen que llenarse todos los campos ");
		}
}

function validaBotones(){
	accion=document.getElementById("indicadorRecibido").value;
	
	if(accion=="Nuevo"){
	
		document.getElementById("actualizar").disabled="true";
		
	
	}else if(accion=="Update"){
	
		//document.getElementById("nombre").disabled="true";
		document.getElementById("agregar").disabled="true";
		
	}


}

function updateIndicadorDos(){
	nombre=document.getElementById("nombre").value;
	document.getElementById("nombreModificado").value=nombre;
	alert(nombre);
	if(nombre!=""){
		document.getElementById("GuardaIndicadorInteligente").action="actualizaIndicadorInteligente";
		document.getElementById("GuardaIndicadorInteligente").submit();
	}
}