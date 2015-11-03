var x=1;
var cont=1;
var meses=["en","feb","mar","ab","may","jun","jul","ag","se","oc","nov","dic"];
var fechaActual = new Date();
var anoActual=fechaActual.getFullYear();
var contURL=0;

function trunc(n) { return Math.round(n*10)/10; }

function fun(){
	var fechaFin = document.getElementById("datepicker100").value;
	var mesConsultado = parseInt(document.getElementById("mesNum").value);
	//alert("hola fun");
	arrFecha = fechaFin.split("/");
	var mesFin = parseInt(arrFecha[0]);
	var anioFin = parseInt(arrFecha[2]);
	var anioAct = parseInt(anoActual);
	mesFin = mesFin *2;
	mesConsultado=mesConsultado*2;
	var mes=0;
	var arreglomeses=["pe","re","pf","rf","pm","rm","pa","ra","pma","rma","pjn","rjn","pjl","rjl","pag","rag","ps","rs","po","ro","pn","rn","pd","rd"];
	lon=arreglomeses.length;
	//alert(lon);
	for(m=0;m<arreglomeses.length;m++){
			mes=arreglomeses[m];
			//alert("mes: "+mes);
			por=[];
			porcentaje=[];
			ene=[];
			total=0;
			if((m<mesFin && anioFin == anioAct) || (anioAct < anioFin)){
				for(x=1;x<=30;x++){
					//alert("antes de arreglo"+document.getElementById("pe"+x).value);
					//alert(x);
					variable2=document.getElementById("por"+x).value;
					variable1=document.getElementById(mes+x).value;
				//	variable3=document.getElementById()

					if(variable1=="" | variable2==""){
						variable1=0;
						variable2=0;
					}
					ene[x-1]=parseInt(variable1);
					//alert("despues de arreglo"+ene[x-1]);
					por[x-1]=parseInt(variable2);
						if(ene[x-1]!="" && por[x-1]!=""){
							//	alert(por[x-1]);
							//alert(ene[x]+"+"+por1);
							ene[x-1]=(ene[x-1]/100);
							porcentaje[x-1]=ene[x-1]*por[x-1];
							//alert(porcentaje);
							total=(total+porcentaje[x-1]);
							//alert("dentro for"+total);
						}
						if(mes=="pe" | mes=="re" | mes=="pf" | mes=="rf" | mes=="pm" | mes=="rm" | mes=="pa" | mes=="ra" | mes=="pma" | mes=="rma" | mes=="pjn" | mes=="rjn" | mes=="pjl" | mes=="rjl" | mes=="pag" | mes=="rag" | mes=="ps" | mes=="rs" | mes=="po" | mes=="ro" | mes=="pn" | mes=="rn" | mes=="pd" | mes=="rd"){
							switch(mes){
							case "pe":
								//alert("lape"+total);
								total=trunc(total);
								document.getElementById("Lape").innerHTML=total;
								break;
							case "re":
								total=trunc(total);
								document.getElementById("Lare").innerHTML=total;
								//la1=parseInt(document.getElementById("Lare").innerHTML);
								//document.getElementById("Lapf").innerHTML=total;
								break;
								
							case "pf":

								lape=(document.getElementById("Lape").innerHTML);
								lape=Math.round(lape*100)/100;
								if(lape==100){
									document.getElementById("Lapf").innerHTML="";
								}else if(lape<100){
									
									lapeint=(document.getElementById("Lape").innerHTML);
									lapeint= trunc(lapeint);
									pff=document.getElementById("Lapf").innerHTML=trunc(total+lapeint);
								}
								else if(pff>100){
									document.getElementById("Lapf").innerHTML=100;
								}

								break;
								
							case "rf":
								lare=document.getElementById("Lare").innerHTML;
								if(lare==100){
									document.getElementById("Larf").innerHTML="";
								}else if(lare<100){
									lareint=document.getElementById("Lare").innerHTML;
									lareint=trunc(lareint);
								rff=document.getElementById("Larf").innerHTML=trunc(total+lareint);
								}
								else if(rff>100){
									document.getElementById("Larf").innerHTML=100;
								}
								break;
							case "pm":
								//alert("lape"+total);
								lapf=document.getElementById("Lapf").innerHTML;
								//alert("lapf:"+lapf);
								if(lapf==100 | lapf==""){
									document.getElementById("Lapm").innerHTML="";
								}else if(lapf<100){
									lapfint=document.getElementById("Lapf").innerHTML;
									lapfint=trunc(lapfint);
								lapm=document.getElementById("Lapm").innerHTML=trunc(total+lapfint);
								}
								else if(lapm>100){
									document.getElementById("Lapm").innerHTML=100;
								}
								break;
								
							case "rm":
								larf=document.getElementById("Larf").innerHTML;
								//alert("larf:"+larf)
								if(larf==100 | larf==""){
									document.getElementById("Larm").innerHTML="";
								}else if(larf<100){
									larfint=document.getElementById("Larf").innerHTML;
									larfint=trunc(larfint);
									larm=document.getElementById("Larm").innerHTML=trunc(total+larfint);
								}
								else if(larm>100){
									document.getElementById("Larm").innerHTML=100;
								}
								break;
								
							case "pa":
								lapmm=document.getElementById("Lapm").innerHTML;
								if(lapmm==100 | lapmm==""){
									document.getElementById("Lapa").innerHTML="";
								}else if(lapmm<100){
									lapmmint=document.getElementById("Lapm").innerHTML;
									lapmmint=trunc(lapmmint);
								lapa=document.getElementById("Lapa").innerHTML=trunc(total+lapmmint);
								
					
								}
								else if(lapa>100){
									document.getElementById("Lapa").innerHTML=100;
								}
								break;
								
							case "ra":
								larm=document.getElementById("Larm").innerHTML;
								if(larm==100 | larm==""){
									document.getElementById("Lara").innerHTML="";
								}else if(larm<100){
									larmint=document.getElementById("Larm").innerHTML;
									larmint=trunc(larmint);
								ara=document.getElementById("Lara").innerHTML=trunc(total+larmint);
								}
								else if(ara>100){
									document.getElementById("Lara").innerHTML=100;
								}
								break;
								
							case "pma":
								lpa=document.getElementById("Lapa").innerHTML;
								if(lpa==100 | lpa==""){
									document.getElementById("Lapma").innerHTML="";
								}else if(lpa<100){
									lpaint=document.getElementById("Lapa").innerHTML;
									lpaint=trunc(lpaint);
									lapma=document.getElementById("Lapma").innerHTML=trunc(total+lpaint);
								}
								else if(lapma>100){
									document.getElementById("Lapma").innerHTML=100;
								}
								break;
								
							case "rma":
								rma=document.getElementById("Lara").innerHTML;
								if(rma==100 | rma==""){
									document.getElementById("Larma").innerHTML="";
								}else if(rma<100){
									rmaint=document.getElementById("Lara").innerHTML;
									rmaint=trunc(rmaint);
								larma=document.getElementById("Larma").innerHTML=trunc(total+rmaint);
								}
								else if(larma>100){
									document.getElementById("Larma").innerHTML=100;
								}
								break;
								
							case "pjn":
								ljn=document.getElementById("Lapma").innerHTML;
								if(ljn==100 | ljn==""){
									document.getElementById("Lapjn").innerHTML="";
								}else if(ljn<100){
									ljnint=document.getElementById("Lapma").innerHTML;
									ljnint=trunc(ljnint);
								lajn=document.getElementById("Lapjn").innerHTML=trunc(total+ljnint);
								}
								else if(lajn>100){
									document.getElementById("Lapjn").innerHTML=100;
								}
								break;
								
							case "rjn":
								maa=document.getElementById("Larma").innerHTML;
								if(maa==100 | maa==""){
									document.getElementById("Larjn").innerHTML="";
								}else if(maa<100){
									maaint=document.getElementById("Larma").innerHTML;
									maaint=trunc(maaint);
								lrjn=document.getElementById("Larjn").innerHTML=trunc(total+maaint);
								}
								else if(lrjn>100){
									document.getElementById("Larjn").innerHTML=100;
								}
								break;
								
							case "pjl":
								lapjn=document.getElementById("Lapjn").innerHTML;
								if(lapjn==100 | lapjn==""){
									document.getElementById("Lapjl").innerHTML="";
								}else if(lapjn<100){
									lapjnint=document.getElementById("Lapjn").innerHTML;
									lapjnint=trunc(lapjnint);
									lpjl=document.getElementById("Lapjl").innerHTML=trunc(total+lapjnint);
								}
								else if(lpjl>100){
									document.getElementById("Lapjl").innerHTML=100;
								}
								break;
								
							case "rjl":
								larjn=document.getElementById("Larjn").innerHTML;
								if(larjn==100 | larjn==""){
									document.getElementById("Larjl").innerHTML="";
								}else if(larjn<100){
									larjnint=document.getElementById("Larjn").innerHTML;
									larjnint=trunc(larjnint);
								lrjl=document.getElementById("Larjl").innerHTML=trunc(total+larjnint);
								}
								else if(lrjl>100){
									document.getElementById("Larjl").innerHTML=100;
								}
								break;
								
							case "pag":
								lapjl=document.getElementById("Lapjl").innerHTML;
								if(lapjl==100 | lapjl==""){
									document.getElementById("Lapag").innerHTML="";
								}else if(lapjl<100){
									lapjlint=document.getElementById("Lapjl").innerHTML;
									lapjlint=trunc(lapjlint);
									lapag=document.getElementById("Lapag").innerHTML=trunc(total+lapjlint);
								}
								else if(lapag>100){
									document.getElementById("Lapag").innerHTML=100;
								}
								break;
								
							case "rag":
								larjl=document.getElementById("Larjl").innerHTML;
								if(larjl==100 | larjl==""){
									document.getElementById("Larag").innerHTML="";
								}else if(larjl<100){
									larjlint=document.getElementById("Larjl").innerHTML;
									larjlint=trunc(larjlint);
								larag=document.getElementById("Larag").innerHTML=trunc(total+larjlint);
								}
								else if(larag>100){
									document.getElementById("Lapag").innerHTML=100;
								}
								break;
							
							case "ps":
								lapag=document.getElementById("Lapag").innerHTML;
								if(lapag==100 | lapag==""){
									document.getElementById("Laps").innerHTML="";
								}else if(lapag<100){
									Lapsint=document.getElementById("Lapag").innerHTML;
									Lapsint=trunc(Lapsint);
								Laps=document.getElementById("Laps").innerHTML=trunc(total+Lapsint);
								}
								else if(Laps>100){
									document.getElementById("Laps").innerHTML=100;
								}
								break;
								
							case "rs":
								larag=document.getElementById("Larag").innerHTML;
								if(larag==100 | larag==""){
									document.getElementById("Lars").innerHTML="";
								}else if(larag<100){
									Larsint=document.getElementById("Larag").innerHTML;
									Larsint=trunc(Larsint);
								Lars=document.getElementById("Lars").innerHTML=trunc(total+Larsint);
								}
								else if(Lars>100){
									document.getElementById("Lars").innerHTML=100;
								}
								break;
								
							case "po":
								laps=document.getElementById("Laps").innerHTML;
								if(laps==100 | laps==""){
									document.getElementById("Lapo").innerHTML="";
								}else if(laps<100){
									lapsint=document.getElementById("Laps").innerHTML;
									lapsint=trunc(lapsint);
								Lapoint=document.getElementById("Lapo").innerHTML=trunc(total+lapsint);
								}
								else if(Lapoint>100){
									document.getElementById("Lapo").innerHTML=100;
								}
								break;
								
							case "ro":
								lars=document.getElementById("Lars").innerHTML;
								if(lars==100 | lars==""){
									document.getElementById("Laro").innerHTML="";
								}else if(lars<100){
									larsint=document.getElementById("Lars").innerHTML;
									larsint=trunc(larsint);
								Laro=document.getElementById("Laro").innerHTML=trunc(total+larsint);
								}
								else if(Laro>100){
									document.getElementById("Laro").innerHTML=100;
								}
								break;
								
							case "pn":
								lapo=document.getElementById("Lapo").innerHTML;
								if(lapo==100 | lapo==""){
									document.getElementById("Lapn").innerHTML="";
								}else if(lapo<100){
									lapoint=document.getElementById("Lapo").innerHTML;
									lapoint=trunc(lapoint);
								lapnint=document.getElementById("Lapn").innerHTML=trunc(total+lapoint);
								}
								else if(lapnint>100){
									document.getElementById("Lapn").innerHTML=100;
								}
								break;
								
							case "rn":
								laro=document.getElementById("Laro").innerHTML;
								if(laro==100 | laro==""){
									document.getElementById("Larn").innerHTML="";
								}else if(laro<100){
									laroint=document.getElementById("Laro").innerHTML;
									laroint=trunc(laroint);
									larnint=document.getElementById("Larn").innerHTML=trunc(total+laroint);
								}
								else if(larnint>100){
									document.getElementById("Larn").innerHTML=100;
								}
								break;
							
							case "pd":
								lapn=document.getElementById("Lapn").innerHTML;
								if(lapn==100 | lapn==""){
									document.getElementById("Lapd").innerHTML="";
								}else if(lapn<100){
									lapnint=document.getElementById("Lapn").innerHTML;
									lapnint=trunc(lapnint);
								lapd=document.getElementById("Lapd").innerHTML=trunc(total+lapnint);
								}
								else if(lapd>100){
									document.getElementById("Lapd").innerHTML=100;
								}
								break;
								
							case "rd":
								larn=document.getElementById("Larn").innerHTML;
								if(larn==100 | larn==""){
									document.getElementById("Lard").innerHTML="";
								}else if(larn<100){
									larnint=document.getElementById("Larn").innerHTML;
									larnint=trunc(larnint);
								lard=document.getElementById("Lard").innerHTML=trunc(total+larnint);
								}
								else if(lard>100){
									document.getElementById("Lard").innerHTML=100;
								}
								break;									
							}
						}
						//document.getElementById("Lape").innerHTML=total;
				}
			}
				
		}
		arregloIPR = ["Lape","Lare","Lapf","Larf","Lapm","Larm","Lapa","Lara","Lapma","Larma","Lapjn","Larjn","Lapjl","Larjl","Lapag","Larag","Laps","Lars","Lapo","Laro","Lapn","Larn","Lapd","Lard"];
//		arregloIPR = ["Lape","Lare","Lapf","Larf","Lapm","Larm","Lapa","Lara","Lapma","Larma","Lapjn","Larjn","Lapjl","Larjl","Lapag","Larag","Laps","Lars","Lapo","Laro","Lapn","Larn","Lapd","Lard"];
		//fechaIPR = new Date();
		//mes = (fechaIPR.getMonth()+1);
//		alert("mes1"+mes);
		mes=mesConsultado;
//		alert("mes2"+mes);
		mesr=mes-1;
//		alert("mesr"+mesr);
		mesp=mes-2;
//		alert("mesp"+mesp);
		mesra=mes-3;
		
//		alert("mesra"+mesra);
//		alert("P "+mesp+"R "+mesr);
		m1=arregloIPR[mesp];
		m2=arregloIPR[mesr];
//		alert("--"+arregloIPR[mesp]+arregloIPR[mesr]);
//		alert("mes1y2"+m1+m2);
		m11=document.getElementById(m1).innerHTML;
		m22=document.getElementById(m2).innerHTML;
		if(mesra<0){
			m33 = 0;
		}else{
			m3=arregloIPR[mesra];
			m33=document.getElementById(m3).innerHTML;
		}
//		alert("1122"+m11+m22);
		document.getElementById("programado").value=m11;
		document.getElementById("real").value=m22;
		document.getElementById("inicial").value=m33;
		document.getElementById("avProg").value=m11;
		document.getElementById("avReal").value=m22;
		document.getElementById("avInicial").value=m33;
}

function inicio(pantalla){
	
	ponderacion();

	fun2();
	unidad=document.getElementById("unidadVal").value;
	document.getElementById("unidad1").value=unidad;
//Ejecutara las funciones que se consideren de inicio

//Evaluacion de resultados cargados de las tablas, si es menor a la meta se pone rojo, igual o mayor verde.
//ponderacion por tabla

//LLenado de barras de resultado parcial
	
}


function asignaComboMes(){
	document.getElementById("comboSelectMes").value=mes;
	}

function muestraAltaInd(){
//funcion que va a ocultar o mostrar la parte de dar de alta
	expandir=document.getElementById("botonExpandir").style.display;
	visible=document.getElementById("tablaIndicadoresCarga").style.display;
	//alert(visible);
	if(expandir=="inline"){
		
		document.getElementById("camposAlta").style.display="inline";
	
	}else if(visible=="inline"){
		//alert("entra1");
		document.getElementById("camposAlta").style.display="inline";
		document.getElementById("tablaIndicadoresCarga").style.display="none";
	}else{
		//alert("entra2");
		document.getElementById("camposAlta").style.display="none";
		document.getElementById("tablaIndicadoresCarga").style.display="inline";
	}
	

}

function muestraAltaProy(){
//funcion que va a ocultar o mostrar la parte de dar de alta
	expandir=document.getElementById("botonExpandir1").style.display;
	visible=document.getElementById("tablaProyectosCarga").style.display;
	//alert(visible);
	if(expandir=="inline"){
		
		document.getElementById("tablaProyectosAlta").style.display="inline";
	
	}else if(visible=="inline"){
		//alert("entra1");
		document.getElementById("tablaProyectosAlta").style.display="inline";
		document.getElementById("tablaProyectosCarga").style.display="none";
	}else{
		//alert("entra2");
		document.getElementById("tablaProyectosAlta").style.display="none";
		document.getElementById("tablaProyectosCarga").style.display="inline";
	}
	
}

function contraerInd(){
//Contrae tabla  Indicadores
	variable=document.getElementById("tablaIndicadoresCarga").style.display;
	if(variable=="inline"){
	
		document.getElementById("tablaIndicadoresCarga").style.display="none";
		document.getElementById("botonContraer").style.display="none";
		document.getElementById("botonExpandir").style.display="inline";
	
	}else{
	
		//document.getElementById("indicadorestablaVacia").style.display="none";
		document.getElementById("tablaIndicadoresCarga").style.display="inline";
		document.getElementById("botonContraer").style.display="inline";
		document.getElementById("botonExpandir").style.display="none";
	
	}
}

function contraerProy(){
//Contrae tabla proyectos
	variable=document.getElementById("tablaProyectosCarga").style.display;
	if(variable=="inline"){
	
		//document.getElementById("indicadorestablaVacia").style.display="inline";
		document.getElementById("tablaProyectosCarga").style.display="none";
		document.getElementById("botonContraer1").style.display="none";
		document.getElementById("botonExpandir1").style.display="inline";
	
	}else{
	
		//document.getElementById("indicadorestablaVacia").style.display="none";
		document.getElementById("tablaProyectosCarga").style.display="inline";
		document.getElementById("botonContraer1").style.display="inline";
		document.getElementById("botonExpandir1").style.display="none";
	
	}
}

function agregaIndicadorInteligente(){
	var nombre = document.getElementById("nombre").value;
	var unidad = document.getElementById("unidad").value;
	var meta = document.getElementById("meta").value;
	var resultado = document.getElementById("resultado").value;
	var peso = document.getElementById("peso").value;
	var frecuencia = document.getElementById("frecuencia").value;
	var sentido = document.getElementById("sentido").value;
	var entregamedible = document.getElementById("entregamedible").value;
	var tipo = document.getElementById("tipo").value;
	var corte = document.getElementById("corte").value;
	var rpond = document.getElementById("rpond").value;
	var usuario = document.getElementById("usuariohiden").value;
	var fecha = document.getElementById("hiddenMesAno").value;
	
	document.getElementById("fechahiden").value=fecha;
	
	//alert("entra"+usuario+"-"+fecha);
	if(nombre!= "" && unidad!= "" && meta!= "" && resultado!= "" && peso!= "" && frecuencia!= "" && sentido!= ""
		 && entregamedible!= "" && tipo!= "" && corte!= "" && rpond!= "" && usuario!= "" && fecha!= "")
		{
			document.getElementById("GuardaIndicadorInteligente").submit();
		}else{
	alert("Tienen que llenarse todos los campos ");
		}
}


function agregaProyectoPrioritario(){
	var nombre1 = document.getElementById("nbIniciativa").value;
	var cveInd = document.getElementById("selNI").value;
	var fhInicio = document.getElementById("datepicker100").value;
	var fhFin = document.getElementById("datepicker101").value;
	var peso = document.getElementById("inpPeso").value;
	//var usuario = document.getElementById("usuariohiden1").value;
	
	if(nombre1!= "" && cveInd!= "" && fhInicio!= "" && fhFin!= "" && peso!= "")
		{
			document.getElementById("nombre1").value = nombre1;
			document.getElementById("cveInd").value = cveInd;
			document.getElementById("fhIni").value = fhInicio;
			document.getElementById("fhFin").value = fhFin;
			document.getElementById("peso").value = peso;
			document.getElementById("GuardaProyectosPrioritarios").submit();
		}else{
			document.getElementById("alertas").style.display="inline";
			document.getElementById("mensaje").innerHTML="Tienen que llenarse todos los campos";
		}
}

function agregaActividad(){

	agregaAc=document.getElementById("agregaAc").value;
	if(agregaAc!=""){
		document.getElementById("act"+fila).value=agregaAc;
		cont++;
	}
	else{
		alert("Debe agregar una actividad");
	}
}

function ponderacion(){
	suma=0;
	for(pon=1;pon<=60;pon++){
		ponderacion[pon]=document.getElementById("por"+pon).value;
			if(ponderacion[pon]!="" && ponderacion[pon]!=null){
				//alert(ponderacion[pon]);
				suma=parseInt(suma)+parseInt(ponderacion[pon]);
				document.getElementById("ponde2").value=suma;
			}else{
				//alert("else");
				ponderacion[pon]=0;
				suma=parseInt(suma)+ponderacion[pon];
				document.getElementById("ponde2").value=suma;	
	}
}
	/*}if(por2!=""){
		suma=por1+por2;
		document.getElementById("ponde2").value=suma;
	}
	if(por3!=""){
		suma1=por1+por2+por3;
		document.getElementById("ponde2").value=suma1;
	}
	if(por4!=""){
		suma2=por1+por2+por3+por4;
		document.getElementById("ponde2").value=suma2;
	}
	if(por5!=""){
		suma3=por1+por2+por3+por4+por5;
		document.getElementById("ponde2").value=suma3;
	}*/
	if(document.getElementById("ponde2").value>100){
		alert("No se puede pasar de 100");
		document.getElementById("ponde2").style.background="red";
		document.getElementById("ponde2").style.color="white";
	}else
		{
		if(document.getElementById("ponde2").value<100){
		document.getElementById("ponde2").style.background="#DE952F";
		document.getElementById("ponde2").style.color="#FFFFFF";
		}
		
		}


}

function fun2(){
	var fechaFin= document.getElementById("datepicker100").value;

	arrFecha = fechaFin.split("/");
	var mesFin = parseInt(arrFecha[0]);
	mesFin = mesFin *2;
	var anioFin = parseInt(arrFecha[2]);
	var anioAct = parseInt(anoActual);
	//alert("hola");
	var mes=0;
	var arreglomeses=["pe","re","pf","rf","pm","rm","pa","ra","pma","rma","pjn","rjn","pjl","rjl","pag","rag","ps","rs","po","ro","pn","rn","pd","rd"];
	lon=arreglomeses.length;
	//alert(lon);
	for(m=0;m<arreglomeses.length;m++){
			mes=arreglomeses[m];
			//alert("mes: "+mes);
			por=[];
			porcentaje=[];
			ene=[];
			total=0;
			if((m<mesFin && anioFin == anioAct) || (anioAct < anioFin)){
				for(x=1;x<20;x++){
					//alert("antes de arreglo"+document.getElementById("pe"+x).value);
					//alert(x);
					variable2=document.getElementById("por"+x).value;
					variable1=document.getElementById(mes+x).value;
				//	variable3=document.getElementById()

					if(variable1=="" | variable2==""){
						variable1=0;
						variable2=0;
					}
					ene[x-1]=parseInt(variable1);
					//alert("despues de arreglo"+ene[x-1]);
					por[x-1]=parseInt(variable2);
						if(ene[x-1]!="" && por[x-1]!=""){
							//	alert(por[x-1]);
							//alert(ene[x]+"+"+por1);
							ene[x-1]=(ene[x-1]/100);
							porcentaje[x-1]=ene[x-1]*por[x-1];
							//alert(porcentaje);
							total=parseInt(total+porcentaje[x-1]);
							//alert("dentro for"+total);
						}
						if(mes=="pe" | mes=="re" | mes=="pf" | mes=="rf" | mes=="pm" | mes=="rm" | mes=="pa" | mes=="ra" | mes=="pma" | mes=="rma" | mes=="pjn" | mes=="rjn" | mes=="pjl" | mes=="rjl" | mes=="pag" | mes=="rag" | mes=="ps" | mes=="rs" | mes=="po" | mes=="ro" | mes=="pn" | mes=="rn" | mes=="pd" | mes=="rd"){
							switch(mes){
							case "pe":
								//alert("lape"+total);
								document.getElementById("Lape").innerHTML=parseInt(total);
								break;
							case "re":
								document.getElementById("Lare").innerHTML=parseInt(total);
								//la1=parseInt(document.getElementById("Lare").innerHTML);
								//document.getElementById("Lapf").innerHTML=total;
								break;
								
							case "pf":
								//alert("lape"+total);
								document.getElementById("Lapf").innerHTML=parseInt(total);
								break;
								
							case "rf":
								//la1=parseInt(document.getElementById("Larf").innerHTML);
								//alert("rf-la1-total: "+la1+"-"+"total");
								//if(document.getElementById(mes[x-1].value!="")){
									re=parseInt(document.getElementById("Lare").innerHTML);
									document.getElementById("Larf").innerHTML=parseInt(total+re);
								//}
								//document.getElementById("Larf").innerHTML=total+la1;
								break;
							case "pm":
								//alert("lape"+total);
								document.getElementById("Lapm").innerHTML=total;
								break;
								
							case "rm":
								rf=parseInt(document.getElementById("Larf").innerHTML);
								document.getElementById("Larm").innerHTML=parseInt(total+rf);
								break;
								
							case "pa":
								//alert("lape"+total);
							//	document.getElementById()
								document.getElementById("Lapa").innerHTML=parseInt(total);
								break;
								
							case "ra":
								rm=parseInt(document.getElementById("Larm").innerHTML)
								document.getElementById("Lara").innerHTML=parseInt(total+rm);
								break;
								
							case "pma":
								//alert("lape"+total);
								document.getElementById("Lapma").innerHTML=parseInt(total);
								break;
								
							case "rma":
								ra=parseInt(document.getElementById("Lara").innerHTML);
								document.getElementById("Larma").innerHTML=parseInt(total+ra);
								break;
								
							case "pjn":
								//alert("lape"+total);
								document.getElementById("Lapjn").innerHTML=parseInt(total);
								break;
								
							case "rjn":
								rma=parseInt(document.getElementById("Larma").innerHTML);
								document.getElementById("Larjn").innerHTML=parseInt(total+rma);
								break;
								
							case "pjl":
								//alert("lape"+total);
								document.getElementById("Lapjl").innerHTML=parseInt(total);
								break;
								
							case "rjl":
								rjn=parseInt(document.getElementById("Larjn").innerHTML);
								document.getElementById("Larjl").innerHTML=parseInt(total+rjn);
								break;
								
							case "pag":
								//alert("lape"+total);
								document.getElementById("Lapag").innerHTML=parseInt(total);
								break;
								
							case "rag":
								rjl=parseInt(document.getElementById("Larjl").innerHTML);
								document.getElementById("Larag").innerHTML=parseInt(total+rjl);
								break;
							
							case "ps":
								//alert("lape"+total);
								document.getElementById("Laps").innerHTML=parseInt(total);
								break;
								
							case "rs":
								rag=parseInt(document.getElementById("Larag").innerHTML);
								document.getElementById("Lars").innerHTML=parseInt(total+rag);
								break;
								
							case "po":
								//alert("lape"+total);
								document.getElementById("Lapo").innerHTML=parseInt(total);
								break;
								
							case "ro":
								rs=parseInt(document.getElementById("Lars").innerHTML);
								document.getElementById("Laro").innerHTML=parseInt(total+rs);
								break;
								
							case "pn":
								//alert("lape"+total);
								document.getElementById("Lapn").innerHTML=parseInt(total);
								break;
								
							case "rn":
								ro=parseInt(document.getElementById("Laro").innerHTML);
								document.getElementById("Larn").innerHTML=parseInt(total+ro);
								break;
							
							case "pd":
								//alert("lape"+total);
								document.getElementById("Lapd").innerHTML=parseInt(total);
								break;
								
							case "rd":
								rn=parseInt(document.getElementById("Larn").innerHTML);
								document.getElementById("Lard").innerHTML=parseInt(total+rn);
								break;									
							}
						}
						//document.getElementById("Lape").innerHTML=total;
				}
			}
				
		}
//	alert("dentro for 3"+total);
}

function eliminaAct(){
	
	for(x=1;x<=60;x++)
		{
		//alert(x);
			cb1=document.getElementById("1").checked;
			//alert("cb1"+cb1);
			cb=document.getElementById(x).checked;
			//alert(cb);
		if(cb){
			tr=document.getElementById("tr"+x).style.display="none";
			por=document.getElementById("por"+x).value="0";
		}
		else{//alert("no se elimino");}
		}
	}
}

function eliminaActCon(){
	
	for(x=1;x<=60;x++)
		{
		//alert(x);
			cb=document.getElementById(x).checked;
			//alert(cb);
		if(cb){
			tr=document.getElementById("tr"+x).style.display="none";
			por=document.getElementById("por"+x).value="0";
			a=document.getElementById("act"+x).value="";
			//alert("act con 0: "+a);
		}
		else{//alert("no se elimino");}
		}
	}
}

function agregaAc(){

	n1=document.getElementById("nombre1").value;
	uni=document.getElementById("unidad1").value;
	fecha=document.getElementById("datepicker100").value;
	fechaIni=document.getElementById("datepicker101").value;
	peso=document.getElementById("peso").value;
	fechVal=validarfecha(fechaIni,fecha);
	
	var fhValida;
	if(!fechVal){
		fecha="";
		document.getElementById("datepicker100").value=fecha;
		document.getElementById("datepicker101").value=fecha;
	}
	for(i=1;i <= 60 ; i++){
		var fechaAct = document.getElementById("datepicker"+i).value;
		if(fechaAct != ""){
			fhValida = validaFechaFin(document.getElementById("datepicker"+i));
			if(!fhValida){
				document.getElementById("hidenfecha"+i).value = "";
			}
		}
	}
	if(n1=="" || fechaIni == "" ||fecha=="" || peso=="" || uni =="Seleccione"){
		alert("Falta ingresar un campo requerido *");
	}else if(fhValida){
		var arreglo = ["Lape","Lare","Lapf","Larf","Lapm","Larm","Lapa","Lara","Lapma","Larma","Lapjn","Larjn","Lapjl","Larjl","Lapag","Larag","Laps","Lars","Lapo","Laro","Lapn","Larn","Lapd","Lard"];
		var arreglo2= ["lape","lare","lapf","larf","lapm","larm","lapa","lara","lapma","larma","lapjn","larjn","lapjl","larjl","lapag","larag","laps","lars","lapo","laro","lapn","larn","lapd","lard"];	
		for(x=0;x<=23;x++){
				p=document.getElementById(arreglo[x]).innerHTML;
				//alert("P en el Inner: "+p)	
				if(p==""){
						p=0;
						document.getElementById(arreglo2[x]).value=p;
						//alert("P en el if = 0: "+p)
				}	
				  c=document.getElementById(arreglo2[x]).value=p;
					//alert("C en el hiden con p: "+c)
		}	
	document.getElementById("GuardaActividades").submit();
	}	
}
/**
 * Valida que la fecha capturada sea mayor o igual a la actual
 * @param fecha
 * @returns {Boolean}
 */
function validarfecha(fechaIni,fecha){
	var isValid = false;
	var fechaActual = new Date();
	var anoActual=fechaActual.getFullYear();
	var mesActual=fechaActual.getMonth()+1;
	var diaActual=fechaActual.getDate();
	var anioSel, anioSelIni;
	var mesSel, mesSelIni;
	var diaSel, diaSelIni;
	if(fecha!="" && fechaIni!=""){//1
		arrFech = fecha.split("/");
		arrFech1 = fechaIni.split("/");//2
		if(arrFech1.length==3){
			mesSelIni = parseInt(arrFech1[0]);
			diaSelIni = parseInt(arrFech1[1]);
			anioSelIni = parseInt(arrFech1[2]);
			if(anioSelIni >= anoActual){
				isValid = true;
			}else if(anioSelIni == anoActual && mesSelIni <= mesActual){
				isValid = true;
			}else if(anioSelIni == anoActual && mesSelIni == mesActual && diaSelIni <= diaActual){
				isValid = true;
			}else{
				alert("La fecha inicial debe ser mayor o igual a la actual");
			}
			if(arrFech.length==3){
				mesSel = parseInt(arrFech[0]);
				diaSel = parseInt(arrFech[1]);
				anioSel = parseInt(arrFech[2]);
				if(anioSel > anoActual && anioSel >= anioSelIni){
					isValid = true;
				}else if(anioSel == anioSelIni && mesSel > mesSelIni){
					isValid = true;
				}else if(anioSel == anioSelIni && mesSel == mesSelIni && diaSel >= diaSelIni){
					isValid = true;
				}else{
					alert("La fecha final debe ser mayor a la fecha inicial");
				}
			}
		}
	}
	return isValid;
}


function actualizaActividad(){
	
	//var x=0;
	var lcb=[];
	for(x=1;x<=20;x++){
		cb=document.getElementById(x).checked;
		if(cb){
			//ac=document.getElementById("act"+x).value;
			a=document.getElementById("act"+x).value;
			lcb[x-1]=a;
			arre=document.getElementById("arre"+x).value=lcb[x-1];
			//alert("arreglo"+lcb[x-1]);
			//alert(a);
			//alert("arre2"+arre);
		}
	}
	document.getElementById("actualizaActividades").submit();
}

function ponerproyecto(){
	proyecto=document.getElementById("nombre1").value;
	document.getElementById("proyectohiden").value=proyecto;
}

function actualizaAcCon(){
	n1=document.getElementById("nombre1").value;
	uni=document.getElementById("unidad1").value;
	fecha=document.getElementById("datepicker100").value;
	fechaIni=document.getElementById("datepicker101").value;
	peso=document.getElementById("peso").value;
	pesoActTot=document.getElementById("ponde2").value;
	fechVal=validarfecha(fechaIni,fecha);
	var comp=true;
	var fhValida;
	if(!fechVal){
		fecha="";
		document.getElementById("datepicker100").value=fecha;
		document.getElementById("datepicker101").value=fecha;
	}
	for(i=1;i <= 60 ; i++){
		var nbAct = document.getElementById("act"+i).value;
		var fechaAct = document.getElementById("datepicker"+i).value;
		var pesoAct = document.getElementById("por"+i).value;
		if(nbAct!="" && pesoAct==""){
			comp=false;
		}
		if(fechaAct != ""){
			fhValida = validaFechaFin(document.getElementById("datepicker"+i));
			if(!fhValida){
				document.getElementById("hidenfecha"+i).value = "";
			}
		}else if(nbAct!="" && fechaAct==""){
			comp=false;
		}
	}
	if(n1=="" || fechaIni == "" || fecha=="" || peso=="" || uni =="Seleccione"){
		alert("Falta ingresar un campo requerido *");
	}else if(comp==false){
		alert("Las actividades deben tener un peso y una fecha.")
	}else if(fhValida){
	var arreglo = ["Lape","Lare","Lapf","Larf","Lapm","Larm","Lapa","Lara","Lapma","Larma","Lapjn","Larjn","Lapjl","Larjl","Lapag","Larag","Laps","Lars","Lapo","Laro","Lapn","Larn","Lapd","Lard"];
	var arreglo2= ["lape","lare","lapf","larf","lapm","larm","lapa","lara","lapma","larma","lapjn","larjn","lapjl","larjl","lapag","larag","laps","lars","lapo","laro","lapn","larn","lapd","lard"];	
	for(x=0;x<=23;x++){
			p=document.getElementById(arreglo[x]).innerHTML;
			//alert("P en el Inner: "+p)	
			if(p==""){
					p=0;
					document.getElementById(arreglo2[x]).value=p;
					//alert("P en el if = 0: "+p)
			}	
			  c=document.getElementById(arreglo2[x]).value=p;
				//alert("C en el hiden con p: "+c)
	}
	
	for(z=1;z<=20;z++){
		d=document.getElementById("datepicker"+z).value;
		document.getElementById("hidenfecha"+z).value=d;
	}
	
	var nombre=document.getElementById("act"+x);
	var fecha=document.getElementById("datepicker"+x);
	var porcentaje=document.getElementById("por"+x);
	var lape=document.getElementById("pe"+x);
	var lare=document.getElementById("re"+x);
	var lapf=document.getElementById("pf"+x);
	var larf=document.getElementById("rf"+x);
	var lapm=document.getElementById("pm"+x);
	var larm=document.getElementById("rm"+x);
	var lapa=document.getElementById("pa"+x);
	var lara=document.getElementById("ra"+x);
	var lapma=document.getElementById("pma"+x);
	var larma=document.getElementById("rma"+x);
	var lapjn=document.getElementById("pjn"+x);
	var larjn=document.getElementById("rjn"+x);
	var lapjl=document.getElementById("pjl"+x);
	var larjl=document.getElementById("rjl"+x);
	var lapag=document.getElementById("pag"+x);
	var larag=document.getElementById("rag"+x);
	var laps=document.getElementById("ps"+x);
	var lars=document.getElementById("rs"+x);
	var lapo=document.getElementById("po"+x);
	var laro=document.getElementById("ro"+x);
	var lapn=document.getElementById("pn"+x);
	var larn=document.getElementById("rn"+x);
	var lapd=document.getElementById("pd"+x);
	var lard=document.getElementById("rd"+x);
	var usuario1=document.getElementById("usuariohiden");
	var proyecto=document.getElementById("nombre1");
	
//	alert("revisa");
	document.getElementById("actualizaActividades").submit();
	}else{
		alert("Debes tener por lo menos una actividad en la prioridad");
	}
}

function actualizaURL(){
	var cont = document.getElementById("contURL").value;
	if(cont!=""&&cont!="0"){
		document.getElementById("actualizaURL").submit();
	}
}

function mesProyecto(){
	 var mes =  document.getElementById("mesNum").value;
	// alert("mes: "+mes); 
	 mes= parseInt(mes);
	 switch(mes){
	 case 1:
		 mes1=document.getElementById("Lape").innerHTML;
		 document.getElementById("programado").value=mes1;
		 mes1=document.getElementById("Lare").innerHTML;
		 document.getElementById("real").value=mes1;
	break;
	 case 2:
		 mesant=document.getElementById("Lare").innerHTML;
		 document.getElementById("inicial").value=mesant;
		 document.getElementById("avInicial").value=mesant;
		 
		 mes2=document.getElementById("Lapf").innerHTML;
		 document.getElementById("programado").value=mes2;
		 document.getElementById("avProg").value=mes2;
		 
		 mes2=document.getElementById("Larf").innerHTML;
		 document.getElementById("real").value=mes2;
		 document.getElementById("avReal").value=mes2;
		 
	break;
	 case 3:
		 mesant=document.getElementById("Larf").innerHTML;
		 document.getElementById("inicial").value=mesant;
		 document.getElementById("avInicial").value=mesant;
		 
		 mes3=document.getElementById("Lapm").innerHTML;
		 document.getElementById("programado").value=mes3;
		 document.getElementById("avProg").value=mes3;
		 
		 mes3=document.getElementById("Larm").innerHTML;
		 document.getElementById("real").value=mes3;
		 document.getElementById("avReal").value=mes3;
	break;
	 case 4:
		 mesant=document.getElementById("Larm").innerHTML;
		 document.getElementById("inicial").value=mesant;
		 document.getElementById("avInicial").value=mesant;
		 
		 mes4=document.getElementById("Lapa").innerHTML;
		 document.getElementById("programado").value=mes4;
		 document.getElementById("avProg").value=mes4;
		 
		 mes4=document.getElementById("Lara").innerHTML;
		 document.getElementById("real").value=mes4;
		 document.getElementById("avReal").value=mes4;
	break;
	 case 5:
		 mesant=document.getElementById("Lara").innerHTML;
		 document.getElementById("inicial").value=mesant;
		 document.getElementById("avInicial").value=mesant;
		 
		 mes5=document.getElementById("Lapma").innerHTML;
		 document.getElementById("programado").value=mes5;
		 document.getElementById("avProg").value=mes5;
		 
		 mes5=document.getElementById("Larma").innerHTML;
		 document.getElementById("real").value=mes5;
		 document.getElementById("avReal").value=mes5;
	break;
	 case 6:
		 mesant=document.getElementById("Larma").innerHTML;
		 document.getElementById("inicial").value=mesant;
		 document.getElementById("avInicial").value=mesant;
		 
		 mes6=document.getElementById("Lapjn").innerHTML;
		 document.getElementById("programado").value=mes6;
		 document.getElementById("avProg").value=mes6;
		 
		 mes6=document.getElementById("Larjn").innerHTML;
		 document.getElementById("real").value=mes6;
		 document.getElementById("avReal").value=mes6;
	break;
	 case 7:
		 mesant=document.getElementById("Larjn").innerHTML;
		 document.getElementById("inicial").value=mesant;
		 document.getElementById("avInicial").value=mesant;
		 
		 mes7=document.getElementById("Lapjl").innerHTML;
		 document.getElementById("programado").value=mes7;
		 document.getElementById("avProg").value=mes7;
		 
		 mes7=document.getElementById("Larjl").innerHTML;
		 document.getElementById("real").value=mes7;
		 document.getElementById("avReal").value=mes7;
	break;
	 case 8:
		 mesant=document.getElementById("Larjl").innerHTML;
		 document.getElementById("inicial").value=mesant;
		 document.getElementById("avInicial").value=mesant;
		 
		 mes8=document.getElementById("Lapag").innerHTML;
		 document.getElementById("programado").value=mes8;
		 document.getElementById("avProg").value=mesant;
		 
		 mes8=document.getElementById("Larag").innerHTML;
		 document.getElementById("real").value=mes8;
		 document.getElementById("avReal").value=mes8;
	break;
	 case 9:
		 mesant=document.getElementById("Larag").innerHTML;
		 document.getElementById("inicial").value=mesant;
		 document.getElementById("avInicial").value=mesant;
		 
		 mes9=document.getElementById("Laps").innerHTML;
		 document.getElementById("programado").value=mes9;
		 document.getElementById("avProg").value=mes9;
		 
		 mes9=document.getElementById("Lars").innerHTML;
		 document.getElementById("real").value=mes9;
		 document.getElementById("avReal").value=mes9;
	break;
	 case 10:
		 mesant=document.getElementById("Lars").innerHTML;
		 document.getElementById("inicial").value=mesant;
		 document.getElementById("avInicial").value=mesant;
		 
		 mes10=document.getElementById("Lapo").innerHTML;
		 document.getElementById("programado").value=mes10;
		 document.getElementById("avProg").value=mes10;
		 
		 mes10=document.getElementById("Laro").innerHTML;
		 document.getElementById("real").value=mes10;
		 document.getElementById("avReal").value=mes10;
	break;
	 case 11:
		 mesant=document.getElementById("Laro").innerHTML;
		 document.getElementById("inicial").value=mesant;
		 document.getElementById("avInicial").value=mesant;
		 
		 mes11=document.getElementById("Lapn").innerHTML;
		 document.getElementById("programado").value=mes11;
		 document.getElementById("avProg").value=mes11;
		 
		 mes11=document.getElementById("Larn").innerHTML;
		 document.getElementById("real").value=mes11;
		 document.getElementById("avReal").value=mes11;
	break;
	 case 12:
		 mesant=document.getElementById("Larn").innerHTML;
		 document.getElementById("inicial").value=mesant;
		 document.getElementById("avInicial").value=mesant;
		 //alert("case12");
		 mes12=document.getElementById("Lapd").innerHTML;
		 //alert("mes12: "+mes12);
		 document.getElementById("programado").value=mes12;
		 document.getElementById("avProg").value=mes12;
		 
		 mes12=document.getElementById("Lard").innerHTML;
		 document.getElementById("real").value=mes12;
		 document.getElementById("avReal").value=mes12;
	break;
	 }
}

function quitaGraficaProyec(){
	document.getElementById("container").style.display="none";
	document.getElementById("botonQuitarProyecto").style.display="none";
}
/**
 * Valida la fecha de la actividad no pase fecha fin del proyecto en el alta
 */
function validaFechaFin(componente){
	var valida = true;
	var fechaActividad = componente.value;
	var fechaFinProy = document.getElementById("datepicker100").value;
	var fechaIniProy = document.getElementById("datepicker101").value;
	
	var mensaje;
	if(fechaFinProy!="" && fechaActividad!="" && fechaIniProy!=""){
		var arrFhAct = fechaActividad.split("/");
		var arrFhFinP = fechaFinProy.split("/");
		var arrFhIniP = fechaIniProy.split("/");
		var anioAct = parseInt(arrFhAct[2]);
		var mesAct = parseInt(arrFhAct[0]);
		var diaAct = parseInt(arrFhAct[1]);
		var anioFin = parseInt(arrFhFinP[2]);
		var mesFin = parseInt(arrFhFinP[0]);
		var diaFin = parseInt(arrFhFinP[1]);
		var anioIni = parseInt(arrFhIniP[2]);
		var mesIni = parseInt(arrFhIniP[0]);
		var diaIni = parseInt(arrFhIniP[1]);
		if(anioAct == anioFin){
			if(mesAct > mesFin){
				componente.value="";
				valida = false;
				alert("La actividad no puede terminar después de la fecha fin de la prioridad");
			}else if(mesAct == mesFin && diaAct > diaFin){
				componente.value="";
				valida = false;
				alert("La actividad no puede terminar después de la fecha fin de la prioridad");
			}
		}else if(anioAct > anioFin){
			componente.value="";
			valida = false;
			alert("La actividad no puede terminar después de la fecha fin de la prioridad");
		}
		if(anioAct == anioIni){
			if(mesAct < mesIni){
				componente.value="";
				valida = false;
				alert("La actividad no puede terminar antes de la fecha inicio de la prioridad");
			}else if(mesAct == mesIni && diaAct < diaIni){
				componente.value="";
				valida = false;
				alert("La actividad no puede terminar antes de la fecha inicio de la prioridad");
			}
		}else if(anioAct < anioIni){
			componente.value="";
			valida = false;
			alert("La actividad no puede terminar antes de la fecha de inicio de la prioridad");
		}
	}
	return valida;
}

function validaURL(){
	var nombre = document.getElementById("nombreURL").value;
	var url = document.getElementById("descURL").value;
	var table = document.getElementById("tblURLs");
	if(nombre!="" && url!=""){
		contURL++;
		var row = table.insertRow(1);
		  var cell1 = row.insertCell(0);
		  var cell2 = row.insertCell(1);
		  var cell3 = row.insertCell(2);
		  cell1.innerHTML = nombre+"<input type='hidden' name='nombreURL"+contURL+"' value='"+nombre+"'>";
		  cell2.innerHTML = url+"<input type='hidden' name='descURL"+contURL+"' value='"+url+"'>";
		  cell3.innerHTML = "<a onclick='' id='' class='btn btn-danger btn-xs'>Borrar</a>";
		  document.getElementById("nombreURL").value="";
		  document.getElementById("descURL").value="";
		  document.getElementById("contURL").value=contURL;
	}
}

function borraURL(fila){
	var fil = "url"+fila;
	var url = document.getElementById(fil).value;
	document.getElementById("urlBorrar").value=url;
	document.getElementById("actualizaURL").action="borrarURL";
	document.getElementById("actualizaURL").submit();
}
