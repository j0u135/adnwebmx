
function guardarArea(){
	var completos = validaReqs("area");
	if(completos){
		document.getElementById("altaArea").submit();
	}else{
		alert("Faltan datos requeridos (*) por capturar");
	}
}
/**
 * Valida requeridos del alta de área
 * @returns {Boolean}
 */
function validaReqs(accion){
	var completos=true;
	var area = document.getElementById("area").value;
	var cvArea = document.getElementById("cbArea").value;
	var puesto = document.getElementById("nombre").value;
	if(accion=="area"){
		if(area==""){
			completos=false;
		}
	}else if(accion=="puesto"){
		if(cvArea=="[Seleccione]" || puesto=="" || cvArea=="nuevaArea"){
			completos=false;
		}
	}
	return completos;
}

function guardarPuesto(){
	var completos = validaReqs("puesto");
	if(completos){
		document.getElementById("altaPuesto").submit();
	}else{
		alert("Faltan datos requeridos (*) por capturar");
	}
}

function validaOp(){
	var cvArea = document.getElementById("cbArea").value;
	if(cvArea == "nuevaArea"){
		document.getElementById("divAltaArea").style.display = "inline";
		document.getElementById("divAltaPuesto").style.display = "none";
	}else{
		document.getElementById("divAltaArea").style.display = "none";
		document.getElementById("divAltaPuesto").style.display = "inline";
	}
}

function cancelar(){
	document.getElementById("divAltaArea").style.display = "none";
	document.getElementById("divAltaPuesto").style.display = "inline";
}

function linkDir(link){
	document.getElementById("linkDestino").value=link;
	document.getElementById("linkDireccion").submit();
	
}

function linkDir1(link){
	document.getElementById("linkDestino1").value=link;
	document.getElementById("linkDireccion1").submit();
}

function linkDir2(accion){
	document.getElementById("confPuestos").action=accion;
	document.getElementById("confPuestos").submit();
}



