var seleccionActiva="";

function inicio(){
	
	
	
}

function cambiaVista(seleccion){
	
	seleccionActiva=seleccion;
	
	if(seleccion=="HR"){
		
		document.getElementById("bhrd").style.display="none"
		document.getElementById("bnih").style.display="none"
		document.getElementById("bpph").style.display="none"
		document.getElementById("tablaIndicadores").style.display="none"
		document.getElementById("tablaProyectos").style.display="none"
		
		document.getElementById("bhrh").style.display="inline"
		document.getElementById("bnid").style.display="inline"
		document.getElementById("bppd").style.display="inline"
		document.getElementById("tablaHojaRumbo").style.display="inline"
		
		
	}else if(seleccion=="II"){
		
		document.getElementById("bhrh").style.display="none"
		document.getElementById("bnid").style.display="none"
		document.getElementById("bpph").style.display="none"
		document.getElementById("tablaHojaRumbo").style.display="none"
		document.getElementById("tablaProyectos").style.display="none"
		
		document.getElementById("bhrd").style.display="inline"
		document.getElementById("bnih").style.display="inline"
		document.getElementById("bppd").style.display="inline"
		document.getElementById("tablaIndicadores").style.display="inline"
		
		
	}else{
		
		document.getElementById("bhrh").style.display="none"
		document.getElementById("bnih").style.display="none"
		document.getElementById("bppd").style.display="none"
		document.getElementById("tablaHojaRumbo").style.display="none"
		document.getElementById("tablaIndicadores").style.display="none"
		
		document.getElementById("bhrd").style.display="inline"
		document.getElementById("bnid").style.display="inline"
		document.getElementById("bpph").style.display="inline"
		document.getElementById("tablaProyectos").style.display="inline"
		
		
	}
	
	
}

function ejecutaGraficas(activacion){
	
	if(seleccionActiva=="HR"){
		
		graficaIndicadorHR(activacion);
		
	}else if(seleccionActiva=="II"){
		
		graficaIndicadorII(activacion);
		
	}else{
		
		graficaIndicadorPP(activacion);
		
	}
	
}


function graficaIndicadorHR(R){
//Graficara el indicador seleccionado
	numElem=document.getElementById("elementosHR").value;
	meses=["ene","feb","mar","abr","may","jun","jul","ago","sep","oct","nov","dic"];
	
	serieParcial=[];
	//serieParcialR=[];
	serieIndicadores=[];
	//resultadoIndicador=[];
	contadorHR=0;
	
	
	
	for(a=0;a<numElem;a++){
		
		if((document.getElementById("checkbox-1-"+(a)).checked)==true){
			
			datos=[];
				usuario=document.getElementById("usuario"+(a)).value;
				dato=document.getElementById("resultado"+(a)).value;
				anio=document.getElementById("anio"+(a)).value;
				mes=document.getElementById("mes"+(a)).value;
			
				mes=parseInt(mes);
				for(s=0;s<12;s++){
					
					if(s==mes){
					
						datos[s]=parseInt(dato);
					}else{
					
						datos[s]=0;
					}
					
				}
				
	
				
				serieParcial= {
		            name: usuario,
		            data: datos
		        }
				
				
				serieIndicadores[contadorHR]=serieParcial;
				
				contadorHR=contadorHR+1;
			
			}

	}		

		if(contadorHR!=0){
		
			$('#container').highcharts({
				chart: {
		            type: R
		        },
		        title: {
		            text: 'Resultados HR '+ anio,
		            x: -20 //center
		        },
		        
		        xAxis: {
		            categories: meses
		        },
		       
		        tooltip: {
		            valueSuffix: ''
		        },
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        series: serieIndicadores
		    });
		}
	
}


function graficaIndicadorII(R){
	//Graficara el indicador seleccionado
		numElemII=document.getElementById("hiddenElementosII").value;
		meses=["ene","feb","mar","abr","may","jun","jul","ago","sep","oct","nov","dic"];
		metaIndicador=[];
		serieParcial=[];
		serieParcialR=[];
		serieIndicadores=[];
		resultadoIndicador=[];


		contadorII=0;
		for(a=0;a<numElemII;a++){
			
			if((document.getElementById("checkbox-2-"+(a)).checked)==true){
				//alert("entra"+ document.getElementById("checkbox-2-"+(a+1)).checked);
				
				datosAnual=document.getElementById("resultadoAnual"+(a)).value;
				datosAnual=datosAnual.split("--");
				
				metaIndicador=[];
				resultadoIndicador=[];
								
				for(o=0;o<(datosAnual.length-1);o++){
				
					if(datosAnual[o]!=""){
						
						dato=datosAnual[o].split("-");
						if(dato[0]!="vacio"){
						
							metaIndicador[o]=dato[0];
						
						}else{
						
							metaIndicador[o]="0";
						
						}
						if(dato[1]!="vacio"){
						
							resultadoIndicador[o]=dato[1];
						
						}else{
						
							resultadoIndicador[o]="0";
						
						}
						
					
					}else{
					
						metaIndicador[o]=0;
						resultadoIndicador[o]=0;
					
					}
					
				
				}
				metaIndicador=parsearArreglo(metaIndicador);
				resultadoIndicador=parsearArreglo(resultadoIndicador);
				
				nombreI=document.getElementById("nombreI"+(a)).value;
				//alert(metaIndicador);
				//alert(nombreI);
				serieParcial={
					name: nombreI,
					data: metaIndicador
				}
				
				serieParcialR={
					type: R,
					name: 'Res '+nombreI,
					data: resultadoIndicador,
					marker: {
						lineWidth: 2,
						lineColor: Highcharts.getOptions().colors[3],
						fillColor: 'white'
					}
				}

				
				serieIndicadores[contadorII]=serieParcial;
				serieIndicadores[contadorII+1]=serieParcialR;
				contadorII=contadorII+2;
				
				
				 
			}
			
			
		}
		
		
		if(contadorII!=0){
			
			$('#container').highcharts({
				chart: {
		            type: R
		        },
		        title: {
		            text: 'Resultados Indicadores Inteligentes ',
		            x: -20 //center
		        },
		        
		        xAxis: {
		            categories: meses
		        },
		       
		        tooltip: {
		            valueSuffix: ''
		        },
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        series: serieIndicadores
		    });	
		}
		
	}


function graficaIndicadorPP(R){
	//Graficara el indicador seleccionado
		numElemII=document.getElementById("hiddenElementosPP").value;
		meses=["ene","feb","mar","abr","may","jun","jul","ago","sep","oct","nov","dic"];
		metaIndicador=[];
		serieParcial=[];
		serieParcialR=[];
		serieIndicadores=[];
		resultadoIndicador=[];


		contadorII=0;
		for(a=0;a<numElemII;a++){
			
			if((document.getElementById("checkbox-3-"+(a)).checked)==true){
				//alert("entra"+ document.getElementById("checkbox-2-"+(a+1)).checked);
				
				datosAnual=document.getElementById("datosP"+(a)).value;
				datosAnual=datosAnual.split("--");
				
				metaIndicador=[];
				resultadoIndicador=[];
								
				for(o=0;o<(datosAnual.length-1);o++){
				
					if(datosAnual[o]!=""){
						
						dato=datosAnual[o].split("-");
						if(dato[0]!="vacio"){
						
							metaIndicador[o]=dato[0];
						
						}else{
						
							metaIndicador[o]="0";
						
						}
						if(dato[1]!="vacio"){
						
							resultadoIndicador[o]=dato[1];
						
						}else{
						
							resultadoIndicador[o]="0";
						
						}
						
					
					}else{
					
						metaIndicador[o]=0;
						resultadoIndicador[o]=0;
					
					}
					
				
				}
				metaIndicador=parsearArreglo(metaIndicador);
				resultadoIndicador=parsearArreglo(resultadoIndicador);
				
				nombreI=document.getElementById("nombreP"+(a)).value;
				//alert(metaIndicador);
				//alert(nombreI);
				serieParcial={
					name: nombreI,
					data: metaIndicador
				}
				
				serieParcialR={
					type: R,
					name: 'Res '+nombreI,
					data: resultadoIndicador,
					marker: {
						lineWidth: 2,
						lineColor: Highcharts.getOptions().colors[3],
						fillColor: 'white'
					}
				}

				
				serieIndicadores[contadorII]=serieParcial;
				serieIndicadores[contadorII+1]=serieParcialR;
				contadorII=contadorII+2;
				
				
				 
			}
			
			
		}
		
		
		if(contadorII!=0){
			
			$('#container').highcharts({
				chart: {
		            type: R
		        },
		        title: {
		            text: 'Resultados Proyectos Prioritarios',
		            x: -20 //center
		        },
		        
		        xAxis: {
		            categories: meses
		        },
		       
		        tooltip: {
		            valueSuffix: ''
		        },
		        legend: {
		            layout: 'vertical',
		            align: 'right',
		            verticalAlign: 'middle',
		            borderWidth: 0
		        },
		        series: serieIndicadores
		    });	
		}
		
	}


function parsearArreglo(arreglo){

	for(x=0;x<arreglo.length;x++){
 
		temp=arreglo[x];
		temp=parseInt(temp);
		arreglo[x]=temp; 
	
	}
	return arreglo;
}

