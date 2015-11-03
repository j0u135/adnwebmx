/**
 * 
 */

function agregaIndicadorInteligente(){
	var completos = true;
	var niselec = document.getElementById("selNI").value;
	var peso = document.getElementById("inpPeso").value;
	if(niselec<0){
		completos=false;
	}
	if(peso=="" || peso<=0 ){
		completos=false;
	}
	
	if(completos==true){
		document.getElementById("indicadorRecibido").value=niselec;
		document.getElementById("pesoRecibido").value=peso;
		document.getElementById("GuardaIndicadorInteligente").submit();
	}else{
		document.getElementById("alertas").style.display="inline";
		document.getElementById("txtAlerta").innerHTML ="Faltan datos requeridos por capturar";
	}
}

function validaPeso(){
	var pesoTot = document.getElementById("pesoHR").value;
	vP=document.getElementById("inpPeso").value;
	vPint=parseInt(vP);
	pesoTotint= parseInt(pesoTot);
	var total = vPint+pesoTotint;
	if(total>100){
		alert("El peso no debe ser mayor a 100");
		document.getElementById("inpPeso").value="";
	}
}

function soloNumeros(comp){
	var valor = comp.value;
	var re = /^(-)?[0-9]*$/;
	if (!re.test(valor)) {
		comp.value=0;
	}	
}