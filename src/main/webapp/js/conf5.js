/**
 * 
 */
function inicio(){
	document.getElementById("lblNombre").style.display = "none";
	document.getElementById("nombre").style.display = "none";
	document.getElementById("lblDesc").style.display = "none";
	document.getElementById("desc").style.display = "none";
	document.getElementById("lblLicAd").style.display = "none";
	document.getElementById("numLicAd").style.display = "none";
	document.getElementById("lblLicAc").style.display = "none";
	document.getElementById("numLicAc").style.display = "none";
	document.getElementById("lblFechas").style.display = "none";
	document.getElementById("lblVigencia").style.display = "none";
	document.getElementById("chk1").style.display = "none";
	document.getElementById("chk2").style.display = "none";
	document.getElementById("chk3").style.display = "none";
	document.getElementById("btnGuardar").style.display = "none";
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
 
 function valOp(){
	 var selOP = document.getElementById("empresa").value;
	 if(selOP=="Alta"){
		 nuevaEmpresa();
	 }
 }
 
 function nuevaEmpresa(){
		document.getElementById("lblNombre").style.display = "inline";
		document.getElementById("nombre").style.display = "inline";
		document.getElementById("lblDesc").style.display = "inline";
		document.getElementById("desc").style.display = "inline";
		document.getElementById("lblLicAd").style.display = "inline";
		document.getElementById("numLicAd").style.display = "inline";
		document.getElementById("lblLicAc").style.display = "inline";
		document.getElementById("numLicAc").style.display = "inline";
		document.getElementById("lblFechas").style.display = "inline";
		document.getElementById("lblVigencia").style.display = "inline";
		document.getElementById("chk1").style.display = "inline";
		document.getElementById("btnGuardar").style.display = "inline";
 }