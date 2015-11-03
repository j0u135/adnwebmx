var cont=1;
var meses=["en","feb","mar","ab","may","jun","jul","ag","se","oc","nov","dic"];

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

function eliminaAct(){
	
	for(x=2;x<=20;x++)
		{
			cb=document.getElementById(x).checked;
			
		if(cb){
			tr=document.getElementById("tr"+x).style.display="none";
			por=document.getElementById("por"+x).value="0";
		}
		else{//alert("no se elimino");}
		}
	}
}

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
								pe=parseInt(document.getElementById("Lape").innerHTML);
								//re=parseInt(document.getElementById("Lare").innerHTML);
								//total=parseInt(total+re);
								document.getElementById("Lapf").innerHTML=parseInt(total+pe);
								//document.getElementById("Larf").innerHTML=parseInt(total+re);
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
								pf=parseInt(document.getElementById("Lapf").innerHTML);
								document.getElementById("Lapm").innerHTML=parseInt(total+pf);
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