var x;
var mes;
var indPag;
var proPag;
var contadorPaginaInd=0;
var contadorPaginaProy=0;
var ponderacionInd=0;
var ponderacionProy=0;
var valorBarraResultado=0;
var valorBarraResultadoP=0;
var mesActual="";
var anoActual="";
var mesNumerico="";

function inicio(){
	direccionaAgregar();
	mensajeApro=document.getElementById("mensajeSolicitud").value;
		if(mensajeApro=="Su hoja de rumbo a sido enviada para aprobacion."){
			alert(mensajeApro);
		}else if(mensajeApro=="Su hoja de rumbo a sido denegada."){
			alert(mensajeApro);
		}else if(mensajeApro=="Su hoja de rumbo a sido aprobada."){
			alert(mensajeApro);
		}
}
function estatus(){

	z=parseInt(document.getElementById("contador").value);
	//alert(z);
		for(x=1;x<=z;x++){
			es=document.getElementById("estatus"+x).value;
				if(es=="Aprobada"){
					document.getElementById("estatus"+x).style.background="#3ADF00";
					document.getElementById("estatus"+x).style.color="while";
					}
				else if(es=="Pendiente"){
					document.getElementById("estatus"+x).style.background="#F4FA58";
					document.getElementById("estatus"+x).style.color="while";
				}
					else if(es=="Denegada"){
						document.getElementById("estatus"+x).style.background="orange";
						document.getElementById("estatus"+x).style.color="while";
						}else if(es=="Solicitada"){
							document.getElementById("estatus"+x).style.background="#2ECCFA";
							document.getElementById("estatus"+x).style.color="while";
						}
				}
}

function estatus2(){
	p=parseInt(document.getElementById("contador2").value);
	//alert(p);
	for(x=1;x<=p;x++){
		es=document.getElementById("estatus2"+x).value;
			if(es=="Aprobada"){
				document.getElementById("estatus2"+x).style.background="#3ADF00";
				document.getElementById("estatus2"+x).style.color="while";
				}
			else if(es=="Pendiente"){
				document.getElementById("estatus2"+x).style.background="#F4FA58";
				document.getElementById("estatus2"+x).style.color="while";
			}
				else if(es=="Denegada"){
					document.getElementById("estatus2"+x).style.background="orange";
					document.getElementById("estatus2"+x).style.color="while";
					}else if(es=="Solicitada"){
						document.getElementById("estatus2"+x).style.background="#2ECCFA";
						document.getElementById("estatus2"+x).style.color="while";
					}
			}
}

function siguienteApro(){
	//Ver paginacion siguiente indicador
		numElem=document.getElementById("contador").value;
		numElem=parseInt(numElem)+1;
		contadorActual=contadorPaginaInd;
		contadorActual=contadorActual+5;
		//alert(contadorActual);
		//alert(indPag);
		//alert(numElem);
		if(indPag=="Hay mas datos"&& numElem>5){
			for(i=contadorPaginaInd;i<contadorActual; i++){
				//alert(i);
				if((i+6)<numElem){
					document.getElementById("tr"+(i+6)).style.display="";
				}
				document.getElementById("tr"+(i+1)).style.display="none";
			}
			//alert(contadorPaginaInd);
			contadorPaginaInd=contadorPaginaInd+5;
			//alert(contadorPaginaInd);
		}
	}

function ocultaCalendario(){
	
	variable=document.getElementById("oculta").style.display;
	if(variable=="none"){
	
		document.getElementById("oculta").style.display="inline";
	
	}else{
	
		//document.getElementById("indicadorestablaVacia").style.display="none";
		document.getElementById("oculta").style.display="none";
	}
}

function estatusa(){
	var es1=document.getElementById("estatusa").value;
	var mes1=document.getElementById("mesbox").value;
	var buscausue=document.getElementById("buscaUsu").value;
	var z=document.getElementById("contadorEqui").value;
		
	for(x=1;x<=z;x++){
		es2=document.getElementById("estatus2"+x).value;
		mes2=document.getElementById("mes2"+x).value;
		if(es1==es2 && mes1==mes2){
			document.getElementById("tr2"+x).style.display="inline";
		}else if(es1=="Esta" && mes1=="Mes"){
			document.getElementById("tr2"+x).style.display="inline";
		}else if(es1==es2 && mes1=="Mes"){
			document.getElementById("tr2"+x).style.display="inline";
		}
		else if(es1==es2 && mes1=="Mes"){
			document.getElementById("tr2"+x).style.display="inline";
		}else if(es1=="Esta" && mes1==mes2){
			document.getElementById("tr2"+x).style.display="inline";
		}
		else{
			document.getElementById("tr2"+x).style.display="none";
		}
	}
}

function fecha(){
	var f = new Date(); 
	fecha2= (f.getDate() + "/" + (f.getMonth() +1) + "/" + f.getFullYear());
//	alert(fecha2);
	document.getElementById("fecha").value=fecha2;
	}

function estatus33(){
	p=parseInt(document.getElementById("contador2").value);
	//alert(p);
	for(x=1;x<=p;x++){
		es=document.getElementById("estatus3"+x).value;
			if(es=="Aprobada"){
				document.getElementById("estatus3"+x).style.background="#27CB68";
				document.getElementById("estatus3"+x).style.color="while";
				}
			else if(es=="Pendiente"){
				document.getElementById("estatus3"+x).style.background="#F4FA58";
				document.getElementById("estatus3"+x).style.color="while";
			}
				else if(es=="Denegada"){
					document.getElementById("estatus3"+x).style.background="orange";
					document.getElementById("estatus3"+x).style.color="while";
					}else if(es=="Solicitada"){
						document.getElementById("estatus3"+x).style.background="#2ECCFA";
						document.getElementById("estatus3"+x).style.color="while";
					}
			}
}


function hojaRumbo(){
	obtieneMes2();
	
	document.getElementById("mesEnviado").value=mesNumerico;
	document.getElementById("usuarioRedireccion").value=document.getElementById("usuario").innerHTML;
	document.getElementById("redireccion").submit();
}

function obtieneMes2(){
	//Obtiene mes actual
		var fechaActual = new Date(); 
		mesActual=fechaActual.getMonth();
		anoActual=fechaActual.getFullYear();
		mesNumerico=mesActual;		
}
var m=0;
var e=0;
function estaMes(){
	 mesa=["Mes","Ene","Feb","Mar","Abr","May","Jun","Jul","Ago","Sep","Oct","Nov","Dic"];
	 esta=["Esta","Aprobada","Solicitada","Denegada","Pendiete"];
     var estatus=document.getElementById("estatusa").value;
     var mes=document.getElementById("mesbox").value;
	 var z=document.getElementById("contadorEqui").value;

	 if(mesa[0]==mes && esta[0]==estatus){
		 for(x=1;x<z;x++){
			 document.getElementById("tr2"+x).style.display="inline";
		 }
	 }else if(mesa[1]==mes && esta[0]==estatus){
		 for(x=1;x<z;x++){
			 for(x=1;x<=z;x++){
					e=document.getElementById("estatus2"+x).value;
						if(e=="Denegada"){
							document.getElementById("tr2"+x).style.display='none';
						}else if(e=="Solicitada"){
							document.getElementById("tr2"+x).style.display='none';
							}
								else if(e=="Pendiente"){
									document.getElementById("tr2"+x).style.display='none';
									}else{
										document.getElementById("tr2"+x).style.display='inline';
									}
					}
		 }
	 }
	 
	 
}

function validaMesApro(){
	f1=document.getElementById("fch1").value;
	f2=document.getElementById("fch2").value;
	//alert(f1+"-"+f2)
	
	//if(f2<f1){ Se cambia por que no pasaba
	if(f2!=f1){
		x=document.getElementById("conta").value;
		for(z=1;z<=x;z++){
			cb=document.getElementById("checkbox-3-"+z).checked;
			if(cb){
				m=document.getElementById("mes"+z).value;
				if(m=="Enero")
					mE=0;
				if(m=="Febrero")
					mE=1;
				if(m=="Marzo")
					mE=2;
				if(m=="Abril")
					mE=3;
				if(m=="Mayo")
					mE=4;
				if(m=="Junio")
					mE=5;
				if(m=="Julio")
					mE=6;
				if(m=="Agosto")
					mE=7;
				if(m=="Septiembre")
					mE=8;
				if(m=="Octubre")
					mE=9;
				if(m=="Noviembre")
					mE=10;
				if(m=="Diciembre")
					mE=11;
				document.getElementById("meshidA1").value=mE;
				
				document.getElementById("consultaAprobadores1").submit();
			}
			
		}
	}
	else{
		alert("Se te paso la fecha de Solicitud");
	}
}


function validaMes(){
	x=document.getElementById("conta").value;
	for(z=1;z<=x;z++){
		cb=document.getElementById("checkbox-3-"+z).checked;
		if(cb){
			m=document.getElementById("mes"+z).value;
			if(mesE=="Enero")
				mesE=0;
			if(mesE=="Febrero")
				mesE=1;
			if(mesE=="Marzo")
				mesE=2;
			if(mesE=="Abril")
				mesE=3;
			if(mesE=="Mayo")
				mesE=4;
			if(mesE=="Junio")
				mesE=5;
			if(mesE=="Julio")
				mesE=6;
			if(mesE=="Agosto")
				mesE=7;
			if(mesE=="Septiembre")
				mesE=8;
			if(mesE=="Octubre")
				mesE=9;
			if(mesE=="Noviembre")
				mesE=10;
			if(mesE=="Diciembre")
				mesE=11;
			document.getElementById("meshid").value=m;
			document.getElementById("meshid2").value=m;
			a=document.getElementById("meshid2").value;
			re1=parseInt(document.getElementById("resultado"+z).value);
			
				if(re1<=50){
					c2=document.getElementById("conta2").value;
					for(n=1;n<c2;n++){
						document.getElementById("porcentajecolor"+z+"-"+c2).style.background="red";
					}
//					alert(c2);
					
				}
//			alert(a+re1);
			c2=document.getElementById("conta2").value;
			for(v=1;v<=c2;v++){
				m2=document.getElementById("mes3"+v).value;
				if(m==m2){
					document.getElementById("trma"+v).style.display="inline";
					document.getElementById("trmb"+v).style.display="inline";
					document.getElementById("trmc"+v).style.display="inline";
					document.getElementById("trmd"+v).style.display="inline";
					m1=document.getElementById("aprobadorUno"+v).value;
					m2=document.getElementById("aprobadorDos"+v).value;
					m3=document.getElementById("aprobadorTres"+v).value;
					m4=document.getElementById("aprobadorCuatro"+v).value;
					document.getElementById("mesSele1").value=m1;
					document.getElementById("mesSele2").value=m2;
					document.getElementById("mesSele3").value=m3;
					document.getElementById("mesSele4").value=m4;
					}else{
					document.getElementById("trma"+v).style.display="none";
					document.getElementById("trmb"+v).style.display="none";
					document.getElementById("trmc"+v).style.display="none";
					document.getElementById("trmd"+v).style.display="none";
				}
			}
		}
	}
}

function funGuardarAprobadores(){
	var nuevoApro = document.getElementById("jefes").value;
	if(nuevoApro!=null && nuevoApro != ""){
		mes=document.getElementById("v").value;
		document.getElementById("nuevoApro").value=nuevoApro;
		document.getElementById("mesauno").value=mes;
		f2 = new Date();
		dia=f2.getDate();
		if(dia<10){
			dia="0"+dia;
		}
		mes=f2.getMonth();
		mes=mes+1;
		if(mes<10){
			mes="0"+mes;
		}
		anio=f2.getFullYear();
		f1=dia+"-"+mes+"-"+anio;
		document.getElementById("fchch").value=f1;
		fch=document.getElementById("fchch").value;
	
		document.getElementById("GuardaAprobadores").submit();
	}else{
		alert("Debe seleccionar un aprobador");
	}
}


function validaMes2(){
	x=document.getElementById("contadorEqui").value; //cuantas consultas trajo a Mi Equipo
	//alert(x);
		for(z=1;z<=x;z++){
			cb=document.getElementById("checkbox-32-"+z).checked;
			if(cb){
				m=document.getElementById("mes2"+z).value;
				if(m=="Enero")
					mm=0;
				if(m=="Febrero")
					mm=1;
				if(m=="Marzo")
					mm=2;
				if(m=="Abril")
					mm=3;
				if(m=="Mayo")
					mm=4;
				if(m=="Junio")
					mm=5;
				if(m=="Julio")
					mm=6;
				if(m=="Agosto")
					mm=7;
				if(m=="Septiembre")
					mm=8;
				if(m=="Octubre")
					mm=9;
				if(m=="Noviembre")
					mm=10;
				if(m=="Diciembre")
					mm=11;
				n=document.getElementById("nombre2"+z).value;
				document.getElementById("mesre2").value=mm;
				document.getElementById("usSel").value=n;
			//	m1=document.getElementById("hidenmesa1").value;
				//n1=document.getElementById("hidennombrea1").value;
				//alert(mm+" - "+n);
				document.getElementById("consultaAprobadores2").submit();
			}

		}
		
}

function controlAprob(){
	var usuario = document.getElementById("usuHojaRumbo").value;
	if(usuario != null && usuario != ""){
		document.getElementById("ControlAprobaciones").submit();
	}
}


function funGuardarAprobadores2(){
	
					a104=document.getElementById("aprobador11").value;
					a105=document.getElementById("aprobador22").value;
					a106=document.getElementById("aprobador33").value;
					a107=document.getElementById("aprobador44").value;
					a108=document.getElementById("nombrece").value;
					mes=document.getElementById("v2").value;
//					alert("--"+a104+a105+a106+a107+mes);
					document.getElementById("aproauno1").value=a104;
					document.getElementById("aproados1").value=a105;
					document.getElementById("aproatres1").value=a106;
					document.getElementById("aproacua1").value=a107;
					
					document.getElementById("nombreeq1").value=a108;
					document.getElementById("mesauno1").value=mes;
					
					div1=document.getElementById("div1").className;
					div2=document.getElementById("div2").className;
					div3=document.getElementById("div3").className;
					div4=document.getElementById("div4").className;
//					alert(div1+div2+div3+div4);
					document.getElementById("dv1").value=div1;
					document.getElementById("dv2").value=div2;
					document.getElementById("dv3").value=div3;
					document.getElementById("dv4").value=div4;
					
					a104=document.getElementById("aprobador11").value;
					a105=document.getElementById("aprobador22").value;
					a106=document.getElementById("aprobador33").value;
					a107=document.getElementById("aprobador44").value;
					document.getElementById("apaa1").value=a104;
					document.getElementById("apaa2").value=a105;
					document.getElementById("apaa3").value=a106;
					document.getElementById("apaa4").value=a107;
					
					for(o=1;o<=4;o++){
						y=document.getElementById("checkbox-15-"+o).checked;
							if(y){
//								alert(y);
								document.getElementById("dv"+o).value="estatusrojo";
								d=document.getElementById("dv"+o).value;
//								alert(d);
							}
					}

	document.getElementById("GuardaAprobadores2").submit();
}

var y=["aprobadorUno","aprobadorDos","aprobadorTres","aprobadorCuatro"];
var zzz=0;
var xxx=0;

function eliminaAprobador(numApro){

	var ap ="aprobador" + numApro;
	a104=document.getElementById(ap).value;
	
	document.getElementById("apElim").value=a104;
	document.getElementById("numApElim").value=numApro;
	if(a104!=""){
		document.getElementById("EliminaAprobador").submit();
	}
}
	

function eliminarAprobador2(){
	for(x=1;x<=4;x++){
		var cb=document.getElementById("checkbox-15-"+x).checked;
			if(cb){
				apro=document.getElementById("aprobador"+x+x).value;
				mes=document.getElementById("v2").value;
				usu=document.getElementById("nombrece").value;
				document.getElementById("nombreea1").value=usu;
				document.getElementById("mesea2").value=mes;
//				alert(apro+mes+usu)
				if(x==1){
					document.getElementById("aproe1").value="apro1";
					}else if(x==2){
						document.getElementById("aproe1").value="apro2";
							}else if(x==3){
								document.getElementById("aproe1").value="apro3";
									}else{
										document.getElementById("aproe1").value="apro4";
										}
			}
	}
	
	div1=document.getElementById("div1").className;
	div2=document.getElementById("div2").className;
	div3=document.getElementById("div3").className;
	div4=document.getElementById("div4").className;
//	alert(div1+div2+div3+div4);
	document.getElementById("div121").value=div1;
	document.getElementById("div122").value=div2;
	document.getElementById("div123").value=div3;
	document.getElementById("div124").value=div4;
	
	a104=document.getElementById("aprobador11").value;
	a105=document.getElementById("aprobador22").value;
	a106=document.getElementById("aprobador33").value;
	a107=document.getElementById("aprobador44").value;
	document.getElementById("aproaa1").value=a104;
	document.getElementById("aproaa2").value=a105;
	document.getElementById("aproaa3").value=a106;
	document.getElementById("aproaa4").value=a107;
	
	for(o=1;o<=4;o++){
//		alert("o"+o);
		cb=document.getElementById("checkbox-15-"+o).checked;
//		alert("alert y"+y);	
		if(cb){
//				alert(cb);
				document.getElementById("div12"+o).value="estatusrojo";
				d=document.getElementById("div12"+o).value;
				document.getElementById("aproaa"+o).value="";
//						alert("alerta de estatus"+d);
		}
//			}alert("No estra");
	}
	
	document.getElementById("EliminaAprobadores2").submit();
}
var usuAE;
var apAE;
var zaa;
function AprobarEmpleado(renglon){
		
	var aprobador=document.getElementById("aprobador"+renglon).value;
	var nbApro = document.getElementById("NbAprobador"+renglon).value;
	var aprobado=document.getElementById("acAprobado").value;
	var mesApro=document.getElementById("mesApro").value;
	var comenApro=document.getElementById("comenA").value;
	document.getElementById("mailAprobador").value=aprobador;	
	document.getElementById("nombreAprobador").value=nbApro;
	document.getElementById("numApro").value=renglon;
	document.getElementById("comentApro").value=comenApro;
	if(comenApro==""){
		alert("Capturar comentario");
	}else if(aprobador!="" && aprobado!="" && mesApro!=""&&nbApro!=""){
		document.getElementById("apruebaUsuario").submit();	
	}else{
		alert("Falta un dato");
	}
}

function DenegarEmpleado(renglon){
	var aprobador=document.getElementById("aprobador"+renglon).value;
	var nbApro = document.getElementById("NbAprobador"+renglon).value;
	var aprobado=document.getElementById("acAprobado1").value;
	var mesApro=document.getElementById("mesApro1").value;
	var comenDenega=document.getElementById("comenA").value;
	document.getElementById("mailAprobador1").value=aprobador;	
	document.getElementById("nombreAprobador1").value=nbApro;
	document.getElementById("numApro1").value=renglon;
	document.getElementById("comentDenega").value=comenDenega;
	if(comenDenega==""){
		alert("Capturar comentario");
	}else if(aprobador!="" && aprobado!="" && mesApro!=""&&nbApro!=""){
		document.getElementById("denegarUsuario").submit();
	}else{
		alert("Falta un dato");
	}
}

 function cargaHojaRumbo(){
	 obtieneMes();
	 cn=document.getElementById("contador").value;
	 mesNum=mesNumerico;
	 mesEnv=regresaNombreMes(mesNum);
		for(z=1;z<=cn;z++){
			cb=document.getElementById("checkbox-3-"+z).checked;
				if(cb){
					mesEnv=document.getElementById("mes"+z).value;
					if(mesEnv=="Enero")
						mesNumerico=0;
					if(mesEnv=="Febrero")
						mesNumerico=1;
					if(mesEnv=="Marzo")
						mesNumerico=2;
					if(mesEnv=="Abril")
						mesNumerico=3;
					if(mesEnv=="Mayo")
						mesNumerico=4;
					if(mesEnv=="Junio")
						mesNumerico=5;
					if(mesEnv=="Julio")
						mesNumerico=6;
					if(mesEnv=="Agosto")
						mesNumerico=7;
					if(mesEnv=="Septiembre")
						mesNumerico=8;
					if(mesEnv=="Octubre")
						mesNumerico=9;
					if(mesEnv=="Noviembre")
						mesNumerico=10;
					if(mesEnv=="Diciembre")
						mesNumerico=11;
				}
		}
		document.getElementById("mesEnviado").value=regresaNombreMes(mesNumerico);
		document.getElementById("mesNumerico").value=mesNum;
		document.getElementById("anioSel").value=anoActual;
		
		document.getElementById("formHR").submit();
}
		
function obtieneMes(){
	//Obtiene mes actual 
		mesActual=fechaActual.getMonth();
		anoActual=fechaActual.getFullYear();
		mesNumerico=mesActual;
	}

function regresaNombreMes(mesNum){
	var mes = "";
	switch (mesNum) {
	case 0:
		mes = "Enero";
		break;
	case 1:
		mes = "Febrero";
		break;
	case 2:
		mes = "Marzo";
		break;
	case 3:
		mes = "Abril";
		break;
	case 4:
		mes = "Mayo";
		break;
	case 5:
		mes = "Junio";
		break;
	case 6:
		mes = "Julio";
		break;
	case 7:
		mes = "Agosto";
		break;
	case 8:
		mes = "Septiembre";
		break;
	case 9:
		mes = "Octubre";
		break;
	case 10:
		mes = "Noviembre";
		break;
	case 11:
		mes = "Diciembre";
		break;
	}
	return mes;
}




function hojaRumboEquipo(){
	obtieneMes();
	 mesNum2=mesNumerico;
	 mesEnv2=regresaNombreMes(mesNum2);
	cn=document.getElementById("contador2").value;
	for(z=1;z<=cn;z++){
		cb=document.getElementById("checkbox-32-"+z).checked;
			if(cb){
				mesEnv2=document.getElementById("mes2"+z).value;
				if(mesEnv2=="Enero")
					mesNum2=0;
				if(mesEnv2=="Febrero")
					mesNum2=1;
				if(mesEnv2=="Marzo")
					mesNum2=2;
				if(mesEnv2=="Abril")
					mesNum2=3;
				if(mesEnv2=="Mayo")
					mesNum2=4;
				if(mesEnv2=="Junio")
					mesNum2=5;
				if(mesEnv2=="Julio")
					mesNum2=6;
				if(mesEnv2=="Agosto")
					mesNum2=7;
				if(mesEnv2=="Septiembre")
					mesNum2=8;
				if(mesEnv2=="Octubre")
					mesNum2=9;
				if(mesEnv2=="Noviembre")
					mesNum2=10;
				if(mesEnv2=="Diciembre")
					mesNum2=11;
				us2=document.getElementById("uss"+z).value;
//				alert(us2);
				document.getElementById("mesEnviado").value=mesEnv2;//Mes de la hoja de rrumbo del equipo que selecciona
				document.getElementById("mesNumerico").value=mesNum2;
				document.getElementById("usuarioRedireccion").value=us2;//Usuario de la hoja de rumbo seleccionada
				document.getElementById("anioSel").value=anoActual;
				document.getElementById("formHR").submit();
			}
	}
}

function ComentarEmp(){
	usuSel = document.getElementById("usuarioACm").value;
	usuAprob = document.getElementById("aprocomen").value;
	cmt=document.getElementById("comenA").value;
	document.getElementById("comentario").value=cmt;
	coment=document.getElementById("comentario").value;
	mes = document.getElementById("mesre").value;
	if(usuSel!=""&& usuAprob!=""&&coment!=""&&mes!=""){
		document.getElementById("guardaComen").submit();
	}else{
		alert("Falta un dato");
	}
}

function ComentarEmp1(){
	var aprocomen;
	algunSel = false;
	for(z=1;z<=4;z++){
		cb=document.getElementById("checkbox-1-"+z).checked;
//		alert(cb);	
		if(cb){
			algunSel=true;
			aprocomen=document.getElementById("aprobador"+z).value;
//				alert("aprobador"+aprocomen);
			document.getElementById("aprocomen").value=aprocomen;
			cm=document.getElementById("comenA").value;
//				alert("comentario"+cm);
			document.getElementById("comentario").value=cm;
			com=document.getElementById("comentario").value;
			//				alert(aprocomen,cm);
			document.getElementById("guardaComen").submit();
		}	
	}
	if(!algunSel){
		alert("Debe seleccionar un aprobador");
	}
}

function controlAprob(){
	var usuario = document.getElementById("usuHojaRumbo").value;
	if(usuario != null && usuario != ""){
		document.getElementById("ControlAprobaciones").submit();
	}
}

//function modalA1(){
//	usu=document.getElementById("usuariohidenA1").value;
//	mes=document.getElementById("meshidA1").value;
//	alert("Flujo del usuario: "+usu+" con el mes: "+mes);
//}

function pruebaFecha(){
	
	f=document.getElementById("fechaAp").value;
//	alert(f);
	f = f.replace("/","-");
	f = f.replace("/","-");
//	alert(f);
	
	f2 = new Date();
	dia=f2.getDate();
	if(dia<10){
		dia="0"+dia;
	}
	mes=f2.getMonth();
	mes=mes+1;
	if(mes<10){
		mes="0"+mes;
	}
	anio=f2.getFullYear();
	f1=dia+"-"+mes+"-"+anio;
//	f0=dia+"/"+mes+"/"+anio;
//	document.getElementById("f0").value=f0;
//	alert(f1);
	
	if(f1<f){
//		alert("Estas a tiempo");
		}else{
//			alert("NO");
		}
	
	document.getElementById("fch1").value=f;
	document.getElementById("fch2").value=f1;

}

function solicitarApro(){
	var aprocomen;
	algunSel = false;
	cantAprob = document.getElementById("CantAprob").value;
	var comentSol = document.getElementById("comenA").value;
	for(z=1;z<=cantAprob;z++){
		if((document.getElementById("chkApro"+z).value)=="true"){
			cb=document.getElementById("checkbox-1-"+z).checked;
			if(cb){
				algunSel=true;
				aprocomen=document.getElementById("aprobador"+z).value;
				document.getElementById("usap"+z).value=aprocomen;
			}
		}
	}
	if(!algunSel){
		alert("Debe seleccionar un aprobador");
	}else if(comentSol ==""){
		alert("Capture el comentario");
	}else{
		ua=document.getElementById("usuariohidenAE1").value;
		ua5=document.getElementById("v").value;
		document.getElementById("usumes").value=ua5;
		document.getElementById("comentSolicita").value=comentSol;
		
		f2 = new Date();
		dia=f2.getDate();
		if(dia<10){
			dia="0"+dia;
		}
		mes=f2.getMonth();
		mes=mes+1;
		if(mes<10){
			mes="0"+mes;
		}
		anio=f2.getFullYear();
		f1=dia+"/"+mes+"/"+anio;
		
		document.getElementById("fch20").value=f1;
		
		document.getElementById("solicitarApro").submit();
	}
}

function direccionaAgregar(){
	variable=document.getElementById("variableAlta").value;
	if(variable=="Dandoalta"){
//		alert(document.getElementById("mesre").value);
//		alert(document.getElementById("usure").value);
		document.getElementById("formalta").submit();
	}else if(variable=="Dandobaja") {
		document.getElementById("formalta").submit();	}
	else if(variable=="Dandoalta2") {
		document.getElementById("formalta2").submit();	}
	else if(variable=="Dandobaja2") {
		document.getElementById("formalta2").submit();	}
}

function buscaUsuario(){
	var usu=document.getElementById("buscaUsu").value;
	z=document.getElementById("contadorEqui").value;
//	alert(usu);
//	alert(z);
	if(usu!=""){
		for(i=1;i<=z;i++){
			nu=document.getElementById("nombre2"+i).value;
//			alert(nu);
//			alert("usu"+usu);
			if(usu==nu){
				document.getElementById("tr2"+i).style.display="inline";
			}
//			else if(usu!=nu){
//				alert(" Nombre de usuario mal escrito o\n no esta en la lista de aprobaciones.");
//			}
			else {
//				alert(" Nombre de usuario mal escrito o\n no esta en la lista de aprobaciones.")
				document.getElementById("tr2"+i).style.display="none";
			}
		}
		usu2=document.getElementById("buscaUsu").value;
	}else
		 {
			 for(a=1;a<=z;a++){
				 document.getElementById("tr2"+a).style.display="inline";
			 }
		 }
}

function literal(obj) { 
	  var m = obj.value;
	  var expreg = /^([\da-z_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
	  if(m!=""){
		  if(!expreg.test(m)){
			alert("El formato de correo es incorrecto"); 
			obj.value = "";
		  }
	  }
	} 