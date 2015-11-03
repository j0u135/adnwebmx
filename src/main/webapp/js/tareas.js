function tareas(){
	ta=document.getElementById("mostrarTareas").style.display;
	if(ta=="none"){
	document.getElementById("mostrarTareas").style.display="inline";
	}else{
		document.getElementById("mostrarTareas").style.display="none";
	}
}
	
function proyecto(){	
	a=document.getElementById("proyecto").value;
	cont=document.getElementById("contadoract").value;
//	alert(cont);
		for(z=1;z<cont;z++){
			lista=document.getElementById("op"+z).value;
		//	alert(a+"-"+lista);
			if(a==lista){
				document.getElementById("op"+z).style.display="inline";				
			}else{
				document.getElementById("op"+z).style.display="none";	
			}
		}	
}

function guardarTareas(){
	nombre=document.getElementById("nombre").value;
	tipomodal=document.getElementById("tipomodal").value;
	origenmodal=document.getElementById("origenmodal").value;
	prioridadmodal=document.getElementById("prioridadmodal").value;
	inicio=document.getElementById("inicio").value;
	fin=document.getElementById("fin").value;
	asignarmodal=document.getElementById("asignarmodal").value;
	notalmodal=document.getElementById("notasmodal").value;
//	alert(nombre+"-"+tipomodal+"-"+origenmodal+"-"+prioridadmodal+"-"+inicio+"-"+fin+"-"+asignarmodal+"-"+notalmodal);
	
	document.getElementById("nombreT").value=nombre;
	document.getElementById("tipoT").value=tipomodal;
	document.getElementById("origenT").value=origenmodal;
	document.getElementById("prioridadT").value=prioridadmodal;
	document.getElementById("periodoiT").value=inicio;
	document.getElementById("periodofT").value=fin;
	document.getElementById("asignaT").value=asignarmodal;
	document.getElementById("notasT").value=notalmodal;
	
	document.getElementById("guardaTareas").submit();
	
}

function editarTarea(){
	nombre2=document.getElementById("nombre2").value;
	tipomodal2=document.getElementById("tipomodal2").value;
	origenmodal2=document.getElementById("origenmodal2").value;
	prioridadmodal2=document.getElementById("prioridadmodal2").value;
	inicio2=document.getElementById("inicio2").value;
	fin2=document.getElementById("fin2").value;
	asignarmodal2=document.getElementById("asignarmodal2").value;
	notalmodal2=document.getElementById("notasmodal2").value;
	idT=document.getElementById("idT").value;
//	alert(nombre2+"-"+tipomodal2+"-"+origenmodal2+"-"+prioridadmodal2+"-"+inicio2+"-"+fin2+"-"+asignarmodal2+"-"+notalmodal2+"-"+idT);
	
	document.getElementById("nombreeT").value=nombre2;
	document.getElementById("tipoeT").value=tipomodal2;
	document.getElementById("origeneT").value=origenmodal2;
	document.getElementById("prioridadeT").value=prioridadmodal2;
	document.getElementById("periodoieT").value=inicio2;
	document.getElementById("periodofeT").value=fin2;
	document.getElementById("asignaeT").value=asignarmodal2;
	document.getElementById("notaseT").value=notalmodal2;
	document.getElementById("ideT").value=idT;
	
	document.getElementById("editarTareas").submit();
}

function refrescar() 
{ 
    location.reload(true); 
} 

function buscaFechas(){
	
	fIn=document.getElementById("hidenfecha1").value;
	fFin=document.getElementById("hidenfecha2").value;
	// alert(fIn+"-"+fFin);
	diai=fIn.substring(0,2);
	mesi=fIn.substring(3,5);
	anioi=fIn.substring(6,11);
//	alert(diai+mesi+anioi);
	diaf=fFin.substring(0,2);
	mesf=fFin.substring(3,5);
	aniof=fFin.substring(6,11);
//	alert(diaf+mesf+aniof);
	
	a=document.getElementById("conCompleta").value;
	a=a-1;
//	alert(a);

	for(z=1;z<=a;z++){
		var x=z;
		iT=document.getElementById("iniciatarea"+z).value;
		fT=document.getElementById("fintarea"+z).value;
		di=iT.substring(0,2);
		mi=iT.substring(3,5);
		ai=iT.substring(6,11);
//		alert(di+"-"+mi+"-"+ai);
		df=fT.substring(0,2);
		mf=fT.substring(3,5);
		af=fT.substring(6,11);
//		alert(df+"-"+mf+"-"+af);
			
			if(di>=diai && df<=diaf && mi>=mesi && mf<=mesf && ai>=anioi && af<=aniof){
//				alert(x);
				//document.getElementById("tr"+x).style.display="inline-block";
			}else{
				
				document.getElementById("tr"+x).style.display="none";
			}
		
//		alert(iT+"-"+fT);
	}
}

function eliminarTareas(){
	
	var c=document.getElementById("contadorTareasT").value;
	
	for(z=1;z<c;z++){
		cb=document.getElementById("radio"+z).checked;
			if(cb){
				id=document.getElementById("id"+z).value;
				// alert(id);
				document.getElementById("idtarea").value=id;
				document.getElementById("eliminarTarea").submit();
			}
	}
}

function tareasHoy(){
	var f = new Date(); 
	dia=f.getDate();
	mes=f.getMonth()+1;
		if(mes<10){
			mes="0"+mes;
		}
	anio=f.getFullYear();
	fechaT=dia+"/"+mes+"/"+anio;
//	 alert(fechaT);
	
	tt=document.getElementById("conCompleta").value;
//	 alert(tt);
	for(z=1;z<tt;z++){
		tareaHoy=document.getElementById("fintarea"+z).value;
//		alert(tareaHoy);
		if(fechaT==tareaHoy){
			
		}else{
			document.getElementById("tr"+z).style.display="none";
		}
	}
//	document.getElementById("fecha").value=fecha2;
}

function tareasVencidas(){
	
	var fv = new Date(); 
	diav=fv.getDate();
	mesv=fv.getMonth()+1;
		if(mesv<10){
			mesv="0"+mesv;
		}
	aniov=f.getFullYear();
	fechaTv=diav+"/"+mesv+"/"+aniov;
//	alert(fechaTv);
	
	var ct=document.getElementById("contadorTareasT").value;
		for(z=1;z<ct;z++){
			fT=document.getElementById("fintarea"+z).value;
			df=fT.substring(0,2);
			mf=fT.substring(3,5);
			af=fT.substring(6,11);
				if(df<diav && mf<=mesv && af<=aniov){
					
				}else{
					document.getElementById("tr"+z).style.display="none";
				}
		}
}

function tareasAtiempo(){
	
	var fa = new Date(); 
	diaa=fa.getDate();
	mesa=fa.getMonth()+1;
		if(mesa<10){
			mesa="0"+mesa;
		}
	anioa=fa.getFullYear();
//	fechaTv=diav+"/"+mesv+"/"+aniov;
//	alert(fechaTv);
	
	var cta=document.getElementById("contadorTareasT").value;
		for(z=1;z<cta;z++){
			fa=document.getElementById("fintarea"+z).value;
			da=fa.substring(0,2);
			ma=fa.substring(3,5);
			aa=fa.substring(6,11);
				if(da>=diaa && ma>=mesa && aa>=anioa){
					
				}else{
					document.getElementById("tr"+z).style.display="none";
				}
		}
}
