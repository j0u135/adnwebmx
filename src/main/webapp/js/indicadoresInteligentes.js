var accion="";
var mesActual=0;
var anoActual="";
var arregloMeses=["ene","feb","mar","abr","may","jun","jul","ago","sep","oct","nov","dic"];
var seleccion="";
var contComent=0;

function inicio(){
	selFrecuencia();
	calculaCeldas();
	rPond();
}

function soloNumeros(comp){
	var valor = comp.value;
	var re = /^(\d{1}\.)?(\d+\.?)+(,\d{2})?$/;///^[+-]?(\.\d+)|(\d+(\.\d+)?)$/;///^(-)?[0-9]*$/;
	if (!re.test(valor)) {
		comp.value="";
	}	
}

function rPond(){
	m=(document.getElementById("meta").value)==""?0:(document.getElementById("meta").value);
	r=(document.getElementById("resultado").value)==""?0:(document.getElementById("resultado").value);
	p=(document.getElementById("peso").value)==""?0:(document.getElementById("peso").value);
	selectorSentido=document.getElementById("sentido").value;
	m=parseFloat(m);
	r=parseFloat(r);
	p=parseInt(p);
	if(m!=""&&(r!=""||r==0)&&p!=""){
		if(selectorSentido!="Seleccione"){
			if(selectorSentido=="Mas"){
				
				valor=(r/m)*p;
				cump=(r/m)*100;
                valor=Math.round(valor*10)/10; 
                //cump=cump.toPrecision(3);
                //cump=Math.round(cump*10)/10; 
                document.getElementById("cumplimiento").value=cump;
				
                //valida codigo de colores
                if(cump>100){
            		
            		document.getElementById("cuadroCump").className="noeditablevista cuadroverde";
            		
            	}else if(cump>95 && cump<101 ){
            		document.getElementById("cuadroCump").className="noeditablevista cuadroverdeclaro";
            	
            	}else if(cump>89 && cump<96 ){
            		document.getElementById("cuadroCump").className="noeditablevista cuadroamarillo";
            	
            	}else if(cump<90){
            		document.getElementById("cuadroCump").className="noeditablevista cuadrorojo";
            	
            	}

                
                
                if(valor<=p){
			        document.getElementById("rpond").value=valor;
			        
			        
				}else{
					document.getElementById("rpond").value=p;
					
				}
			}else if(selectorSentido=="Menos"){
				
				valor=(m/r)*p;
				valor=Math.round(valor*10)/10; 
				cump=(m/r)*100;
				//cump=cump.toPrecision(3);
				//cump=Math.round(cump*10)/10;
				document.getElementById("cumplimiento").value=cump;
				
				//valida codigo de colores
                if(cump>100){
            		
            		document.getElementById("cuadroCump").className="noeditablevista cuadroverde";
            		
            	}else if(cump>95 && cump<101 ){
            		document.getElementById("cuadroCump").className="noeditablevista cuadroverdeclaro";
            	
            	}else if(cump>89 && cump<96 ){
            		document.getElementById("cuadroCump").className="noeditablevista cuadroamarillo";
            	
            	}else if(cump<90){
            		document.getElementById("cuadroCump").className="noeditablevista cuadrorojo";
            	
            	}
				
				if(valor<=p){
					document.getElementById("rpond").value=valor;
					
				    
				}else{
					document.getElementById("rpond").value=p;
					document.getElementById("cumplimiento").value=cump;
				}
			}
		}	
	}
}



function validaPeso(){
	var pesoTot = document.getElementById("pesoHR").value;
	var pesoIndAnt = document.getElementById("pesoIndAnt").value;
	if(pesoIndAnt==""){
		pesoIndAnt=0;
	}
	vP=document.getElementById("peso").value;
	vPint=parseInt(vP);
	pesoIndAntInt=parseInt(pesoIndAnt);
	pesoTotint= parseInt(pesoTot);
	var total = vPint-pesoIndAntInt+pesoTotint;
	if(total>100){
		alert("El peso total no debe ser mayor a 100");
		document.getElementById("peso").value="";
	}
}

function selFrecuencia(){
	sel=document.getElementById("frecuencia").value;
	if(sel=="Semanal"){
		document.getElementById("semanal").style.display="inline";
		document.getElementById("quincenal").style.display="none";
		document.getElementById("mes").style.display="none";
		document.getElementById("tipo").style.display="inline";
	}else if(sel=="Quincenal"){
		document.getElementById("semanal").style.display="none";
		document.getElementById("quincenal").style.display="inline";
		document.getElementById("mes").style.display="none";
		document.getElementById("tipo").style.display="inline";
	 }else if(sel=="Mensual"){
		document.getElementById("semanal").style.display="none";
		document.getElementById("quincenal").style.display="none";
		document.getElementById("mes").style.display="inline"; 
		document.getElementById("tipo").style.display="none";
	 }		
}

function calculaCeldas(){
var resCeldas=0;
var contadorProm=0;
var contadorReal=0;
var totPromProg=0;
var totPromReal=0;
var totAcumProg=0;
var totAcumReal=0;
var seleccion=document.getElementById("frecuencia").value;
var tipo=document.getElementById("tipo").value;
var sentido=document.getElementById("sentido").value;

	if(seleccion=="Semanal"){
		
		var prog=[0,0,0,0,0];
		var real=[0,0,0,0,0];
		for(var i=1; i<=5; i++){
			prog[i-1]=parseFloat(document.getElementById("progSem"+i).value);
			real[i-1]=parseFloat(document.getElementById("realSem"+i).value);		
		}
		
		
		if(sentido=="Mas"){
			
			for(var i=1;i<=5;i++){
			
			    if(real[i-1]==0||prog[i-1]==0)
			    	{
			    	cump="";
			    		
			    	}
			    else{
				cump=real[i-1]/prog[i-1]*100;	
			    }
			
			   
			    if(!isNaN(cump)){
			    	    
			    if(cump>=100){
			      cump=100;
			      document.getElementById("cumpSem"+i).value=parseInt(cump);
			      document.getElementById("cumpSem"+i).className="transparente-sm c-green";
			    }
			    else if(cump!="") {
			      document.getElementById("cumpSem"+i).value=parseInt(cump);
			      document.getElementById("cumpSem"+i).className="transparente-sm c-red";	
				}	
			    }
			    else{
			    	document.getElementById("cumpSem"+i).value="";	
			    }
			}//for	
		}//if
			
		else if(sentido=="Menos")
		
		{
			for(var i=1;i<=5;i++){
		    		
				cump=(prog[i-1]/real[i-1])*100;	
					
				if(!isNaN(cump)){	
				if(cump>=100){
				   cump=100;
				document.getElementById("cumpSem"+i).value=parseInt(cump);
				document.getElementById("cumpSem"+i).className="transparente-sm c-green";
				}
				else{
					document.getElementById("cumpSem"+i).value=parseInt(cump);
					document.getElementById("cumpSem"+i).className="transparente-sm c-red";	
					}	
				}//numero valido
				else{
					document.getElementById("cumpSem"+i).value="";
				}
			  }//for
		}//if
		
		
		if(tipo=="Promedio"){
		
			for(var i=0; i<5; i++){
				
				//verifica que el valor planeado sea un numero valido
				if(!isNaN(prog[i]))
					{
					contadorProm++;
					totAcumProg = totAcumProg + prog[i];
				
					}
				//verifica que el valor real sea un numero valido	
				if(!isNaN(real[i])){
					contadorReal++;
					totAcumReal = totAcumReal+ real[i];
				}	
			}
	
			totPromProg = totAcumProg/contadorProm;
			totPromReal = totAcumReal/contadorReal;	
			document.getElementById("meta").value=totPromProg;
			document.getElementById("resultado").value=totPromReal;
			document.getElementById("hidmeta").value=totPromProg;
			document.getElementById("hidresultado").value=totPromReal;
		
			
		}else if(tipo=="Acumulado"){
			
           for(var i=0; i<5; i++){
				
				//verifica que el valor planeado sea un numero valido
				if(!isNaN(prog[i]))
					{
					contadorProm++;
					totAcumProg = totAcumProg + prog[i];
				
					}
				//verifica que el valor real sea un numero valido	
				if(!isNaN(real[i])){
					contadorReal++;
					totAcumReal = totAcumReal+ real[i];
				}	
			}
			
            document.getElementById("meta").value=totAcumProg;
			document.getElementById("resultado").value=totAcumReal;
			document.getElementById("hidmeta").value=totAcumProg;
			document.getElementById("hidresultado").value=totAcumReal;
		}
	}else if(seleccion=="Quincenal"){
		
		var prog=[0,0,0,0,0];
		var real=[0,0,0,0,0];
		for(var i=1; i<=2; i++){
			prog[i-1]=parseFloat(document.getElementById("progQuin"+i).value);
			real[i-1]=parseFloat(document.getElementById("realQuin"+i).value);		
		}
		if(sentido=="Mas"){
			
			for(i=1;i<=2;i++){
			
			cump=real[i-1]/prog[i-1]*100;	
			
			if(!isNaN(cump)){	
			if(cump>=100){
			   cump=100;
			document.getElementById("cumpQuin"+i).value=cump;
			document.getElementById("cumpQuin"+i).className="transparente-sm c-green";
			}
			else{
				document.getElementById("cumpQuin"+i).value=cump;
				document.getElementById("cumpQuin"+i).className="transparente-sm c-red";	
				}	
			}//validacion
			else{
				document.getElementById("cumpQuin"+i).value="";
			}
			}//for
		}//if
			
		else if(sentido=="Menos")
		
		{
			for(var i=1;i<=2;i++){
		    		
				cump=(prog[i-1]/real[i-1])*100;	
				
				if(!isNaN(cump)){	
					
				
				if(cump>=100){
				   cump=100;
				document.getElementById("cumpQuin"+i).value=cump;
				document.getElementById("cumpQuin"+i).className="transparente-sm c-green";
				}
				else{
					document.getElementById("cumpQuin"+i).value=cump;
					document.getElementById("cumpQuin"+i).className="transparente-sm c-red";	
					}	
				}//validacion
				else{
					document.getElementById("cumpQuin"+i).value="";
				}
			}//for
			}//if sentido
		
		if(tipo=="Promedio"){
          for(var i=0; i<2; i++){
				
				//verifica que el valor planeado sea un numero valido
				if(!isNaN(prog[i]))
					{
					contadorProm++;
					totAcumProg = totAcumProg + prog[i];
				
					}
				//verifica que el valor real sea un numero valido	
				if(!isNaN(real[i])){
					contadorReal++;
					totAcumReal = totAcumReal+ real[i];
				}	
			}
			totPromProg = totAcumProg/contadorProm;
			totPromReal = totAcumReal/contadorReal;
			document.getElementById("meta").value=totPromProg;
			document.getElementById("resultado").value=totPromReal;
			document.getElementById("hidmeta").value=totPromProg;
			document.getElementById("hidresultado").value=totPromReal;
		}else if(tipo=="Acumulado"){
            
			for(var i=0; i<2; i++){
				
				//verifica que el valor planeado sea un numero valido
				if(!isNaN(prog[i]))
					{
					contadorProm++;
					totAcumProg = totAcumProg + prog[i];
				
					}
				//verifica que el valor real sea un numero valido	
				if(!isNaN(real[i])){
					contadorReal++;
					totAcumReal = totAcumReal+ real[i];
				}	
			}
			document.getElementById("meta").value=totAcumProg;
			document.getElementById("resultado").value=totAcumReal;
			document.getElementById("hidmeta").value=totAcumProg;
			document.getElementById("hidresultado").value=totAcumReal;
		    
		}
	}else if(seleccion=="Mensual"){
		var progMes = document.getElementById("progMes").value;
		var realMes = document.getElementById("realMes").value;
		
		if(!isNaN(progMes)&&!isNaN(realMes)){
		document.getElementById("meta").value=progMes;
		document.getElementById("resultado").value=realMes;
		document.getElementById("hidmeta").value=progMes;
		document.getElementById("hidresultado").value=realMes;
		}
		
		if(sentido=="Mas"){
			cump=parseFloat(realMes/progMes*100);
			//valida que cump sea un numero valido
			if(!isNaN(cump)){
			if(cump>=100){
				cump=100;
				document.getElementById("cumpMes").value=cump;	
				document.getElementById("cumpMes").className="transparente-sm c-green";
			}
			else{
				document.getElementById("cumpMes").value=cump;	
				document.getElementById("cumpMes").className="transparente-sm c-red";
			}
			}//validacion
			else
				{
				document.getElementById("cumpMes").value="";
				}
		
		}else if(sentido=="Menos"){
              cump=parseFloat(progMes/realMes*100);
            if(!isNaN(cump)){
			if(cump>=100){
				cump=100;
				document.getElementById("cumpMes").value=cump;	
				document.getElementById("cumpMes").className="transparente-sm c-green";
			}
			else{
				document.getElementById("cumpMes").value=cump;	
				document.getElementById("cumpMes").className="transparente-sm c-red";
			}
		       	
            }//validacion
            else
			{
			document.getElementById("cumpMes").value="";
			}
		}//if
		
	}

}

function valida(){
	var frec = document.getElementById("frecuencia").value;
	var peso = document.getElementById("peso").value;
	var tipo = document.getElementById("tipo").value;
	var rpond = document.getElementById("rpond").value;
	var progSem1 = document.getElementById("progSem1").value;
	var progSem2 = document.getElementById("progSem2").value;
	var progSem3 = document.getElementById("progSem3").value;
	var progSem4 = document.getElementById("progSem4").value;
	var progSem5 = document.getElementById("progSem5").value;
	var progQuin1 = document.getElementById("progQuin1").value;
	var progQuin2 = document.getElementById("progQuin2").value;
	var progMes = document.getElementById("progMes").value;
	var completos = true;
	
	var mes = document.getElementById("mesNum").value;
	var mesNum = parseInt(mes);
	document.getElementById("mesNum").value=mesNum-1;
	document.getElementById("mesNumerico").value=mesNum-1;
	
	if(frec!="Seleccione"){
		if(frec=="Mensual"){
			if(progMes==""){
				var completos = false;
			}
		}else if(frec=="Quicenal"){
			if(tipo=="Seleccione"){
				completos=false;
			}
			if(progQuin1==""){
				completos=false;
			}
			if(progQuin2==""){
				completos=false;
			}
		}else if(frec=="Semanal"){
			if(tipo=="Seleccione"){
				completos=false;
			}
			if(progSem1==""){
				completos=false;
			}
			if(progSem2==""){
				completos=false;
			}
			if(progSem3==""){
				completos=false;
			}
			if(progSem4==""){
				completos=false;
			}
			if(progSem5==""){
				completos=false;
			}
		}
	}else{
		completos=false;
	}
	if(peso==""){
		completos=false;	
	}
	if(rpond==""){
		completos=false;
	}
	if(completos){
		document.getElementById("actualizaIndInte").submit();
	}else{
		alert("Faltan datos por capturar");
	}
}

function agregaComent(){
	var table = document.getElementById("tblComentarios");
	var comentario = document.getElementById("descComent").value;
	var usuario = document.getElementById("usuSes").value;
	var fechaActual = new Date();
	var anoActual=fechaActual.getFullYear();
	var mesActual=fechaActual.getMonth();
	var diaActual=fechaActual.getDay();
	if(comentario!=""){
	  contComent++;
	  var mesInt = parseInt(mesActual) +1;
	  var row = table.insertRow(1);
	  var cell1 = row.insertCell(0);
	  var cell2 = row.insertCell(1);
	  var cell3 = row.insertCell(2);
	  var fecha = diaActual+"/"+mesInt+"/"+anoActual;
	  cell1.innerHTML = fecha+'<input type="hidden" name=fhComen'+contComent+' value='+fecha+'>';
	  cell2.innerHTML = usuario+'<input type="hidden" name=usuComen'+contComent+' value='+usuario+'>';
	  cell3.innerHTML = comentario+"<input type='hidden' name='textComen"+contComent+"' value='"+comentario+"'>";
	  document.getElementById("descComent").value="";
	  document.getElementById("contComent").value=contComent;
	}
}