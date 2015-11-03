/**
 * 
 */
	var indice=0;
	var tipoUsr;
//Funciones usuarios
/*
 * Valida que los datos esten completos
 */
function validaDatos(){
	//alert("entra");
	usuario=document.getElementById("user").value;
	password=document.getElementById("password").value;
	//conpassword=document.getElementById("conpassword").value;
	correo=document.getElementById("correo").value;
	nombre=document.getElementById("nombre").value;
	tipoUsuario=document.getElementById("tipoUsuario").value;
	puesto = document.getElementById("puesto").value;
	area=document.getElementById("area").value;
	jefe=document.getElementById("jefe").value;
	actualiza = document.getElementById("actualizar").value; 
	document.getElementById("usrAct").value = usuario;
	if(tipoUsr=="Administrador"){
		tipoUsuario="3"
	}
	if(actualiza == "" || actualiza != "busco"){    	
    	if(usuario!="" && password!="" && correo!="" && nombre!="" && tipoUsuario>0 && area>0 && puesto>0){
    		//Ejecuta evento guardar
    		
    		document.getElementById("guardarUsr").submit();
    	}else{
    		alert("Todos los datos son Obligatorios");
    	}
	}else{
		if(usuario!="" && correo!="" && nombre!="" && tipoUsuario>0 && area>0 && puesto>0){
    		//Ejecuta evento guardar
    		document.getElementById("guardarUsr").submit();
    		
    	}else{
    		alert("Todos los datos son Obligatorios");
    	}
	}
	
}
/**
 * Busca el usuario 
 */
function buscaUsuario(){
	
	//Asignar el valor de el id usuario para buscar en la base
	usuario=document.getElementById("user").value;
	if(usuario!=""){
		document.getElementById("password").style.display="none";
		//ejecuta para buscar
		document.getElementById("actualizar").value = "si";
		document.getElementById("usuarioBuscado").value=usuario;
		document.getElementById("busca").submit();
	}else{
		alert("Debe ingresar un usuario")
	}
	
}

/**
 * Elimina el usuario 
 */
function eliminaUsuario(){
	
	//Asignar el valor de el id usuario para buscar en la base
	usuario=document.getElementById("usuarioBusc").value;
	if(usuario!=""){
		document.getElementById("password").style.display="none";
		//ejecuta para buscar
		document.getElementById("actualizar").value = "si";
		document.getElementById("usuarioBuscado").value=usuario;
		document.getElementById("elimina").submit();
	}else{
		alert("Debe ingresar un usuario")
	}
	
}

/**
 * 
 */
function clone() {
	 original=document.getElementById("jefe2");
   	 nuevo=original.cloneNode(true);
   	 nuevo.id="jefe"+indice;
   	 destino=document.getElementById("datosjefe");
   	 destino.appendChild(nuevo);
   	 document.getElementById("jefe"+indice).style.display = "inline";
   	 
   	 indice=indice+1;
}

function inicio(tipo){
	validaUsuario(tipo);
	actualiza =  document.getElementById("actualizar").value;
	mensaje = document.getElementById("msgBus").value;
	if(actualiza != "" && actualiza == "busco"){
		document.getElementById("lbPassword").style.display="none";
		document.getElementById("password").style.display="none";
		document.getElementById("user").disabled ="disabled";
		document.getElementById("actualizar").value = "busco";
		document.getElementById("eliminaUsu").style.display="inline";
	}else{
		document.getElementById("password").style.display="inline";
		document.getElementById("lbPassword").style.display="inline";
		document.getElementById("user").disabled ="";
		document.getElementById("eliminaUsu").style.display="none";
	}
	if(mensaje!=""&& mensaje!="Ok"){
		alert(mensaje);
		document.getElementById("user").value="";
		document.getElementById("user").disabled =false;
	}
}

function validaUsuario(tipo){
	tipoUsr=tipo;
	if(tipo=="Administrador"){
		document.getElementById("lbTipo").style.display="none";
		document.getElementById("tipoUsuario").style.display="none";
		document.getElementById("tipoUsuario").value="";
	}else if(tipo=="AdministradorADN"){
		document.getElementById("lbTipo").style.display="inline";
		document.getElementById("tipoUsuario").style.display="inline";
	}
}

function linkDir1(link){
	document.getElementById("linkDestino1").value=link;
	document.getElementById("linkDireccion1").submit();
	
}

function linkDir2(accion){
	document.getElementById("confPuestos").action=accion;
	document.getElementById("confPuestos").submit();
}

/**
 * Limpia los campos para captura
 */
function altaUsuario(){
	document.getElementById("user").value="";
	document.getElementById("user").disabled =false;
	document.getElementById("password").value ="";
	document.getElementById("password").style.display="inline";
	document.getElementById("lbPassword").style.display="inline";
	document.getElementById("nombre").value="";
	document.getElementById("correo").value="";
	document.getElementById("personal").selected = "NO";
	document.getElementById("autorizador").selected = "NO";
	document.getElementById("departamento").selectedIndex = "0";
	document.getElementById("jefe").selectedIndex = "0";
	document.getElementById("puesto").selectedIndex = "0";
	document.getElementById("area").selectedIndex = "0";
	document.getElementById("tipoUsuario").selectedIndex = "0";
	document.getElementById("eliminaUsu").style.display="none";
}
/**
 * Obtiene los valores del form para poder llenar el combo de departamento
 */
function llenaDepto(){
	var usuBusc = document.getElementById("user").value;
	var nbUsu = document.getElementById("nombre").value;
	var correoUsu = document.getElementById("correo").value;
	var pssUsu = document.getElementById("password").value;
	var persCargoUsu = document.getElementById("personal").value;
	var autoUsu = document.getElementById("autorizador").value;
	var areaUsu = document.getElementById("area").value;
	var deptoUsu = document.getElementById("departamento").value;
	var puestoUsu = document.getElementById("puesto").value;
	var tipoUsu = document.getElementById("tipoUsuario").value;
	var jefeUsu = document.getElementById("jefe").value;
	var opUsu = "Deptos";
	document.getElementById("usuBusc").value = usuBusc;
	document.getElementById("nbUsu").value = nbUsu;
	document.getElementById("correoUsu").value = correoUsu;
	document.getElementById("pssUsu").value = pssUsu;
	document.getElementById("persCargoUsu").value = persCargoUsu;
	document.getElementById("autoUsu").value = autoUsu;
	document.getElementById("areaUsu").value = areaUsu;
	document.getElementById("deptoUsu").value = deptoUsu;
	document.getElementById("puestoUsu").value = puestoUsu;
	document.getElementById("tipoUsu").value = tipoUsu;
	document.getElementById("jefeUsu").value = jefeUsu;
	document.getElementById("opUsu").value = opUsu;
	document.getElementById("cargaCombo").submit();
}
/**
 * Obtiene los valores del form para poder llenar el combo de puesto
 */
function llenaPuesto(){
	var usuBusc = document.getElementById("user").value;
	var nbUsu = document.getElementById("nombre").value;
	var correoUsu = document.getElementById("correo").value;
	var pssUsu = document.getElementById("password").value;
	var persCargoUsu = document.getElementById("personal").value;
	var autoUsu = document.getElementById("autorizador").value;
	var areaUsu = document.getElementById("area").value;
	var deptoUsu = document.getElementById("departamento").value;
	var puestoUsu = document.getElementById("puesto").value;
	var tipoUsu = document.getElementById("tipoUsuario").value;
	var jefeUsu = document.getElementById("jefe").value;
	var opUsu = "Puestos";
	document.getElementById("usuBusc").value = usuBusc;
	document.getElementById("nbUsu").value = nbUsu;
	document.getElementById("correoUsu").value = correoUsu;
	document.getElementById("pssUsu").value = pssUsu;
	document.getElementById("persCargoUsu").value = persCargoUsu;
	document.getElementById("autoUsu").value = autoUsu;
	document.getElementById("areaUsu").value = areaUsu;
	document.getElementById("deptoUsu").value = deptoUsu;
	document.getElementById("puestoUsu").value = puestoUsu;
	document.getElementById("tipoUsu").value = tipoUsu;
	document.getElementById("jefeUsu").value = jefeUsu;
	document.getElementById("opUsu").value = opUsu;
	document.getElementById("cargaCombo").submit();
}
