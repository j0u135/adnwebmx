/**
 * 
 */
var mesNumerico="";

    function validaDatos(){
    	//alert("entra");
    	usuario=document.getElementById("user").value;
    	password=document.getElementById("password").value;
    	conpassword=document.getElementById("conpassword").value;
    	conpassword1=document.getElementById("conpassword1").value;
   	
    	if(conpassword=="" && conpassword1==""){
    		alert("Los campos de nueva y repetir son requeridos");
    	}else{
	    	if(conpassword != conpassword1){
	    		alert("La contraseña tiene que ser igual")
	    	}else{
		    	if(usuario!="" && password!="" && conpassword !="" && conpassword1!=""){
		    		//Ejecuta evento guardar
		    		document.getElementById("usrAct").value = usuario;
		    		//document.getElementById("conpassword").value = conpassword;
		    		document.getElementById("paso").value="guardar";
		    		//alert(usuario+" - "+conpassword+" - "+conpassword1);
		    		document.getElementById("formContrasena").submit();
		    	}else{
		    		alert("Los datos con * son Obligatorios");
		    	}
	    	}
    	}
    }
    
    function inicio(tipo){
    	val = document.getElementById("valido").value;
    	guad = document.getElementById("actualizo").value;
    	validaUsuario(tipo);
    	if(val != ""){
    		if(val == "Ok"){
    			document.getElementById("conpassword").disabled = false;
    			document.getElementById("conpassword1").disabled = false;
    			document.getElementById("password").disabled = true;
    			document.getElementById("user").disabled = true;
    			document.getElementById("btnGuardar").style.display="inline";
    		}else{
    			alert("la información no coincide");
    		}
    	}else if(guad!= ""){
    		if(guad == "true"){
    			alert("Actualizó correctamente");
    			document.getElementById("conpassword").disabled = true;
    			document.getElementById("conpassword1").disabled = true;
    			document.getElementById("password").disabled = true;
    			document.getElementById("user").disabled = true;
    			document.getElementById("btnGuardar").style.display="none";
    		}else{
    			document.getElementById("password").value="";
    			document.getElementById("conpassword").value = "";
    			document.getElementById("conpassword1").value = "";
    			alert("Ocurrio un error al actualizar");
    		}
    	}
    }
    
    function validaUsuario(tipo){
    	if(tipo == "Usr"){
    		document.getElementById("Modif").style.display="none";
    		document.getElementById("Grupos").style.display="none";
    		document.getElementById("Puestos").style.display="none";
    		document.getElementById("AprobOps").style.display="none";
    		document.getElementById("CargaOps").style.display="none";
    	}else{
    		document.getElementById("Modif").style.display="inline";
    		document.getElementById("Grupos").style.display="inline";
    		document.getElementById("Puestos").style.display="inline";
    		document.getElementById("AprobOps").style.display="inline";
    		document.getElementById("CargaOps").style.display="inline";
    	}
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

    function validaPssw(){
    	usr = document.getElementById("user").value; 
    	pssw= document.getElementById("password").value;
    	if(usr!="" && pssw!=""){
    		document.getElementById("paso").value="validar";
    		document.getElementById("formContrasena").submit();	
    	}else{
    		alert("Debe capturar usuario y passw.");
    	}
    	
    }
    
    function hojaRumbo(){
    	obtieneMes();
    	
    	document.getElementById("mesEnviado").value=mesNumerico;
    	document.getElementById("usuarioRedireccion").value=document.getElementById("usuario").innerHTML;
    	
    	document.getElementById("redireccion").submit();
    	
    }

    function obtieneMes(){
    	//Obtiene mes actual
    		var fechaActual = new Date(); 
    		mesActual=fechaActual.getMonth();
    		anoActual=fechaActual.getFullYear();
    		mesNumerico=mesActual;
    		
    		
    }
    
    