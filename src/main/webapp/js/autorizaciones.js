/**
 * 
 */
function autorizaTodos(){
	document.getElementById("accionTodos").value="Aprobar";
	document.getElementById("accionUno").value="";
	document.getElementById("claveAutorizacion").value="";
	document.getElementById("autoriza").submit();
}

function borraTodos(){
	document.getElementById("accionTodos").value="Borrar";
	document.getElementById("accionUno").value="";
	document.getElementById("claveAutorizacion").value="";
	document.getElementById("autoriza").submit();
}

function autoriza(fila){
	document.getElementById("accionTodos").value="";
	document.getElementById("accionUno").value="Aprobar";
	var idFil = document.getElementById("filtro"+fila).value;
	var idAut = document.getElementById("idAutoCambioFiltros"+fila).value;
	document.getElementById("claveAutorizacion").value=idAut;
	document.getElementById("claveFiltro").value=idFil;
	document.getElementById("autoriza").submit();
}

function borrar(fila){
	document.getElementById("accionTodos").value="";
	document.getElementById("accionUno").value="Borrar";
	var idFil = document.getElementById("filtro"+fila).value;
	var idAut = document.getElementById("idAutoCambioFiltros"+fila).value;
	document.getElementById("claveAutorizacion").value=idAut;
	document.getElementById("claveFiltro").value=idFil;
	document.getElementById("autoriza").submit();
}