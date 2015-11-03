
var cont=1;
var meses=["en","feb","mar","ab","may","jun","jul","ag","se","oc","nov","dic"];

function inicio(){
	
	
	hidden2=document.getElementById("hidden2").value;
	if(hidden2!=""){
		alert(document.getElementById("hidden2").value);
	}
	
	hidden3=document.getElementById("hidden3").value;
	if(hidden3!=""){
		alert(document.getElementById("hidden3").value);
	}
	
	hidden4=document.getElementById("hidden4").value;
	if(hidden4!=""){
		alert(document.getElementById("hidden4").value);
	}
	
	obtieneMes();
	asignaComboMes();
	ponderacion();

	fun2();
//Ejecutara las funciones que se consideren de inicio

//Evaluacion de resultados cargados de las tablas, si es menor a la meta se pone rojo, igual o mayor verde.
//ponderacion por tabla

//LLenado de barras de resultado parcial
}

function obtieneMes(){
	//Obtiene mes actual
	var fechaActual = new Date(); 
	mesActual=fechaActual.getMonth();
	anoActual=fechaActual.getFullYear();
	arregloMeses=["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"];
	document.getElementById("hiddenMesAno").value=arregloMeses[mesActual]+"-"+anoActual;
	mes=arregloMeses[mesActual];
	alert(document.getElementById("hiddenMesAno").value);
	}

function asignaComboMes(){
	document.getElementById("comboSelectMes").value=mes;
	}

function ponderacionTotal(){
//Sumara las ponderaciones debajo de las tablas, si la ponderacion no es 100% se colorea rojo

}

function ponderacionTablas(){
//Calcula los pesos de las tablas y asigna ponderacion por tabla


}

function resultados(){
//Calcula sumatoria de cada indicador y proyecto multiplicado por su peso
//Indicadores (resultado/meta)*peso
//Proyectos (real/prog)*peso

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


function modificaIndicador(){
//Funcion para modificar indicadores existentes

}

function borraIndicador(){
//Funcion que borrara el indicador

}

function siguienteInd(){
//Ver paginacion siguiente indicador

}

function anteriorInd(){
//Ver paginacion anterior indicador

}

function seleccionaMes(){
//Esta funcion se ejecuta al seleccionar un mes

}

function graficaIndicador(){
//Graficara el indicador seleccionado


}

function graficaProyecto(){
//Funcion para graficar el proyecto seleccionado

}

function notasSeguimiento(){
//Funcion para guardar las notas de seguimiento

}

function flujoAprobacion(){
//Funcion para flujo de aprobacion

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
	
	alert("entra"+usuario+"-"+fecha);
	if(nombre!= "" && unidad!= "" && meta!= "" && resultado!= "" && peso!= "" && frecuencia!= "" && sentido!= ""
		 && entregamedible!= "" && tipo!= "" && corte!= "" && rpond!= "" && usuario!= "" && fecha!= "")
		{
			document.getElementById("GuardaIndicadorInteligente").submit();
		}else{
	alert("Tienen que llenarse todos los campos ");
		}
}


function agregaProyectoPrioritario(){
	var nombre1 = document.getElementById("nombre1").value;
	var unidad1 = document.getElementById("unidad1").value;
	var fecha1 = document.getElementById("fecha1").value;
	var inicial = document.getElementById("inicial").value;
	var programado = document.getElementById("programado").value;
	var real = document.getElementById("real").value;
	var peso = document.getElementById("peso").value;
	//var usuario = document.getElementById("usuariohiden1").value;
	
	if(nombre1!= "" && unidad1!= "" && fecha1!= "" && inicial!= "" && programado!= "" && real!= "" && peso!= "")
		{
			document.getElementById("GuardaProyectosPrioritarios").submit();
		}else{
	alert("Tienen que llenarse todos los campos ");
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
	for(pon=1;pon<20;pon++){
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
		document.getElementById("ponde2").style.color="while";
	}else
		{
		document.getElementById("ponde2").style.background="#3ADF00";
		document.getElementById("ponde2").style.color="#FFFFFF";
		}
}

function fun(){
	
	//alert("hola fun");
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
								re=parseInt(document.getElementById("Lare").innerHTML);
								//total=parseInt(total+re);
								document.getElementById("Lapf").innerHTML=parseInt(total);
								document.getElementById("Lapf").innerHTML=parseInt(total+re);
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
								rf=parseInt(document.getElementById("Larf").innerHTML);
								document.getElementById("Lapm").innerHTML=parseInt(total+rf);
								break;
								
							case "rm":
								rf=parseInt(document.getElementById("Larf").innerHTML);
								document.getElementById("Larm").innerHTML=parseInt(total+rf);
								break;
								
							case "pa":
								//alert("lape"+total);
								pm=parseInt(document.getElementById("Lapm").innerHTML);
								document.getElementById("Lapa").innerHTML=parseInt(total+pm);
								break;
								
							case "ra":
								rm=parseInt(document.getElementById("Larm").innerHTML)
								document.getElementById("Lara").innerHTML=parseInt(total+rm);
								break;
								
							case "pma":
								//alert("lape"+total);
								pa=parseInt(document.getElementById("Lapa").innerHTML);
								document.getElementById("Lapma").innerHTML=parseInt(total+pa);
								break;
								
							case "rma":
								ra=parseInt(document.getElementById("Lara").innerHTML);
								document.getElementById("Larma").innerHTML=parseInt(total+ra);
								break;
								
							case "pjn":
								//alert("lape"+total);
								pma=parseInt(document.getElementById("Lapma").innerHTML);
								document.getElementById("Lapjn").innerHTML=parseInt(total+pma);
								break;
								
							case "rjn":
								rma=parseInt(document.getElementById("Larma").innerHTML);
								document.getElementById("Larjn").innerHTML=parseInt(total+rma);
								break;
								
							case "pjl":
								//alert("lape"+total);
								pjn=parseInt(document.getElementById("Lapjn").innerHTML);
								document.getElementById("Lapjl").innerHTML=parseInt(total+pjn);
								break;
								
							case "rjl":
								rjn=parseInt(document.getElementById("Larjn").innerHTML);
								document.getElementById("Larjl").innerHTML=parseInt(total+rjn);
								break;
								
							case "pag":
								//alert("lape"+total);
								pjl=parseInt(document.getElementById("Lapjl").innerHTML);
								document.getElementById("Lapag").innerHTML=parseInt(total+pjl);
								break;
								
							case "rag":
								rjl=parseInt(document.getElementById("Larjl").innerHTML);
								document.getElementById("Larag").innerHTML=parseInt(total+rjl);
								break;
							
							case "ps":
								//alert("lape"+total);
								pag=parseInt(document.getElementById("Lapag").innerHTML);
								document.getElementById("Laps").innerHTML=parseInt(total+pag);
								break;
								
							case "rs":
								rag=parseInt(document.getElementById("Larag").innerHTML);
								document.getElementById("Lars").innerHTML=parseInt(total+rag);
								break;
								
							case "po":
								//alert("lape"+total);
								ps=parseInt(document.getElementById("Laps").innerHTML);
								document.getElementById("Lapo").innerHTML=parseInt(total+ps);
								break;
								
							case "ro":
								rs=parseInt(document.getElementById("Lars").innerHTML);
								document.getElementById("Laro").innerHTML=parseInt(total+rs);
								break;
								
							case "pn":
								//alert("lape"+total);
								po=parseInt(document.getElementById("Lapo").innerHTML);
								document.getElementById("Lapn").innerHTML=parseInt(total+po);
								break;
								
							case "rn":
								ro=parseInt(document.getElementById("Laro").innerHTML);
								document.getElementById("Larn").innerHTML=parseInt(total+ro);
								break;
							
							case "pd":
								//alert("lape"+total);
								pn=parseInt(document.getElementById("Lapn").innerHTML);
								document.getElementById("Lapd").innerHTML=parseInt(total+pn);
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
//	alert("dentro for 3"+total);
}

/*
function aPE(){
c=[];
d=[];
a=0;
	for(x=1;x<6;x++){
		c[x]=parseInt(document.getElementById("por"+x).value);
		d[x]=parseInt(document.getElementById("ape"+x).value);
		por=(d[x]/100);
		a=a+(c[x]*por);
		document.getElementById("Lape").innerHTML=a;
	}
}

function aRE(){
	c=[];
	d=[];
	a=0;
		for(x=1;x<6;x++){
			c[x]=parseInt(document.getElementById("por"+x).value);
			d[x]=parseInt(document.getElementById("are"+x).value);
			por=(d[x]/100);
			a=a+(c[x]*por);
			document.getElementById("Lare").innerHTML=a;
			if(a<100){
			document.getElementById("Lapf").innerHTML=a;
			}
		}
	}

function aPF(){
	c=[];
	d=[];
	a=0;
		for(x=1;x<6;x++){
			c[x]=parseInt(document.getElementById("por"+x).value);
			d[x]=parseInt(document.getElementById("apf"+x).value);
			por=(d[x]/100);
			a=a+(c[x]*por);
			//document.getElementById("Lapf").innerHTML=a;
		}
	}

	function aRF(){
		c=[];
		d=[];
		a=0;
			for(x=1;x<6;x++){
				c[x]=parseInt(document.getElementById("por"+x).value);
				d[x]=parseInt(document.getElementById("arf"+x).value);
				por=(d[x]/100);
				a=a+(c[x]*por);
				z=parseInt(document.getElementById("Lapf").innerHTML);
				document.getElementById("Larf").innerHTML=parseInt(a+z);
				z1=document.getElementById("Larf").innerHTML=parseInt(a+z);
				if(z1<=100){
					document.getElementById("Lapm").innerHTML=z1;
					}
			}
		}

function aPM(){
		c=[];
		d=[];
		a=0;
			for(x=1;x<6;x++){
				c[x]=parseInt(document.getElementById("por"+x).value);
				d[x]=parseInt(document.getElementById("apm"+x).value);
				por=(d[x]/100);
				a=a+(c[x]*por);
				//document.getElementById("Lapm").innerHTML=a;
			}
		}

function aRM(){
			c=[];
			d=[];
			a=0;
				for(x=1;x<6;x++){
					c[x]=parseInt(document.getElementById("por"+x).value);
					d[x]=parseInt(document.getElementById("arm"+x).value);
					por=(d[x]/100);
					a=a+(c[x]*por);
					z1=parseInt(document.getElementById("Lapm").innerHTML);
					if(z1<100){
					document.getElementById("Larm").innerHTML=parseInt(z1+a);
					}
				}
}

function aPA(){
	c=[];
	d=[];
	a=0;
		for(x=1;x<6;x++){
			c[x]=parseInt(document.getElementById("por"+x).value);
			d[x]=parseInt(document.getElementById("apa"+x).value);
			por=(d[x]/100);
			a=a+(c[x]*por);
			document.getElementById("Lapa").innerHTML=a;
		}
	}

function aRA(){
		c=[];
		d=[];
		a=0;
			for(x=1;x<6;x++){
				c[x]=parseInt(document.getElementById("por"+x).value);
				d[x]=parseInt(document.getElementById("ara"+x).value);
				por=(d[x]/100);
				a=a+(c[x]*por);
				document.getElementById("Lara").innerHTML=a;
			}
		}

function aPMA(){
	c=[];
	d=[];
	a=0;
		for(x=1;x<6;x++){
			c[x]=parseInt(document.getElementById("por"+x).value);
			d[x]=parseInt(document.getElementById("apma"+x).value);
			por=(d[x]/100);
			a=a+(c[x]*por);
			document.getElementById("Lapma").innerHTML=a;
		}
	}

function aRMA(){
		c=[];
		d=[];
		a=0;
			for(x=1;x<6;x++){
				c[x]=parseInt(document.getElementById("por"+x).value);
				d[x]=parseInt(document.getElementById("arma"+x).value);
				por=(d[x]/100);
				a=a+(c[x]*por);
				document.getElementById("Larma").innerHTML=a;
			}
		}

function aPJN(){
	c=[];
	d=[];
	a=0;
		for(x=1;x<6;x++){
			c[x]=parseInt(document.getElementById("por"+x).value);
			d[x]=parseInt(document.getElementById("apjn"+x).value);
			por=(d[x]/100);
			a=a+(c[x]*por);
			document.getElementById("Lapjn").innerHTML=a;
		}
	}

function aRJN(){
		c=[];
		d=[];
		a=0;
			for(x=1;x<6;x++){
				c[x]=parseInt(document.getElementById("por"+x).value);
				d[x]=parseInt(document.getElementById("arjn"+x).value);
				por=(d[x]/100);
				a=a+(c[x]*por);
				document.getElementById("Larjn").innerHTML=a;
			}
		}

function aPJL(){
	c=[];
	d=[];
	a=0;
		for(x=1;x<6;x++){
			c[x]=parseInt(document.getElementById("por"+x).value);
			d[x]=parseInt(document.getElementById("apjl"+x).value);
			por=(d[x]/100);
			a=a+(c[x]*por);
			document.getElementById("Lapjl").innerHTML=a;
		}
	}

function aRJL(){
		c=[];
		d=[];
		a=0;
			for(x=1;x<6;x++){
				c[x]=parseInt(document.getElementById("por"+x).value);
				d[x]=parseInt(document.getElementById("arjl"+x).value);
				por=(d[x]/100);
				a=a+(c[x]*por);
				document.getElementById("Larjl").innerHTML=a;
			}
}*/



/*function fun(){
	for(x=1;x<=contador;x++){
		for(m=0;m<12;m++){
			mes=meses[m];
			valor1=document.getElementById("mes"+x).value;
				if(valor!=""){
					temp[x-1]=valor1;
				}
				else{
					temp[x-1]=0;
				}
					switch (temp[x]){
						case m=0:
							ene[x]=temp[x];
						break;
						case m=1:
							feb[x]=temp[x];
						break;
						case m=2:
							mar[x]=temp[m];
						break;
						case m=3:
							abr[x]=temp[x];
						break;
						case m=4:
							may[x]=temp[x];
						break;
						case m=5:
							jun[x]=temp[x];
						break;
						case m=6:
							jul[x]=temp[x];
						break;
						case m=7:
							ago[x]=temp[x];
						break;
						case m=8:
							sep[x]=temp[x];
						break;
						case m=9:
							oct[x]=temp[x];
						break;
						case m=1:
							nov[x]=temp[x];
						break;
						case m=11:
							dic[x]=temp[x];
						break;
					}
		}
	}
}*/

function fun2(){
	
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
//	alert("dentro for 3"+total);
}

function eliminaAct(){
	
	for(x=1;x<=20;x++)
		{
		alert(x);
			cb1=document.getElementById("1").checked;
			alert("cb1"+cb1);
			cb=document.getElementById(x).checked;
			alert(cb);
		if(cb){
			tr=document.getElementById("tr"+x).style.display="none";
			por=document.getElementById("por"+x).value="0";
		}
		else{//alert("no se elimino");}
		}
	}
}

function eliminaActCon(){
	
	for(x=1;x<=20;x++)
		{
		alert(x);
			cb=document.getElementById(x).checked;
			alert(cb);
		if(cb){
			tr=document.getElementById("tr"+x).style.display="none";
			por=document.getElementById("por"+x).value="0";
		}
		else{//alert("no se elimino");}
		}
	}
}

function agregaActividad(){
	
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
	
	document.getElementById("GuardaActividades").submit();
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
			alert("arreglo"+lcb[x-1]);
			alert(a);
			alert("arre2"+arre);
		}
	}
	document.getElementById("actualizaActividades").submit();
}

function ponerproyecto(){
	proyecto=document.getElementById("nombre1").value;
	document.getElementById("proyectohiden").value=proyecto;
}


