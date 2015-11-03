/**
 *  Valida los campos requeridos
 */
function valida(){
	var desc=document.getElementById("txtDescripcion").value;
	var UM=document.getElementById("cmbUM").value;
	var formula=document.getElementById("txtFormula").value;
	var fuente=document.getElementById("txtFuenDatos").value;
	var nombre=document.getElementById("txtNombre").value;
	var dis=document.getElementById("txtDistribucion").value;
	var puesto=document.getElementById("lblPuesto").value;
	var frec=document.getElementById("txtFrecEmi").value;
	var fecha=document.getElementById("txtFhCorte").value;
	var sentido=document.getElementById("cmbSentido").value;
	var tipocarga=document.getElementById("cmbTpCarga").value;
	
	if(desc==""||formula==""||UM==""||fuente==""||nombre==""||dis==""||puesto==""||frec==""||fecha==""||sentido==""||tipocarga=="")	{
	
	alert("Debe llenar todos los campos antes de continuar");
}
	else{
		document.getElementById("guardaFiltro").submit();
	}
	
}
/**
 * ejecuta el form de consulta de NIs
 */
function buscarNIs(){
	document.getElementById("buscaNI").value = "buscaNI";
	document.getElementById("cargaDeptos").submit();
}