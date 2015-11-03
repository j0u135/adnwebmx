function muestraNIs(){
	var area=document.getElementById("selArea").value;
	var dep=document.getElementById("selDepart").value;
	
	if(area==""||dep=="")	{
	
	alert("Seleccione una Area y Departamento");
	}
	else{
	}
	
}

function muestraResumen(){
	var area=document.getElementById("selArea").value;
	var dep=document.getElementById("selDepart").value;
	
	if(area==""||dep=="")	{
		alert("Seleccione una Area y Departamento");
	}
	else
		{
		//Colocar resto del codigo aqui
		}
}

function cargarDeptos(){
	var areaUsu = document.getElementById("selArea").value;
	document.getElementById("idArea").value = areaUsu;
	document.getElementById("cargaDeptos").submit();
}

function cargarNis(){
	var areaUsu = document.getElementById("selArea").value;
	var deptoUsu = document.getElementById("selDepart").value;
	var puestUsu = document.getElementById("selPuesto").value;
	document.getElementById("idArea").value = areaUsu;
	document.getElementById("idDepto").value = deptoUsu;
	document.getElementById("idPuesto").value = puestUsu;
	document.getElementById("cargaDeptos").submit();
}

function cargaPuestos(){
	var areaUsu = document.getElementById("selArea").value;
	var deptoUsu = document.getElementById("selDepart").value;
	document.getElementById("idArea").value = areaUsu;
	document.getElementById("idDepto").value = deptoUsu;
	document.getElementById("vistaNI").value = "0";
	document.getElementById("cargaDeptos").submit();
}

function buscarNIs(){
	var areaUsu = document.getElementById("selArea").value;
	var deptoUsu = document.getElementById("selDepart").value;
	var puestUsu = document.getElementById("selPuesto").value;
	var niUsu = document.getElementById("selNIs").value;
	document.getElementById("idArea").value = areaUsu;
	document.getElementById("idDepto").value = deptoUsu;
	document.getElementById("idPuesto").value = puestUsu;
	document.getElementById("buscaNI").value = "buscaNI";
	document.getElementById("idNi").value = niUsu;
	document.getElementById("cargaDeptos").submit();
}

function inicio(ini){
	muestraNIs();
}

function cargaConfigNI(j){
	var comboArea = document.getElementById("selArea");
	var nbArea = comboArea.options[comboArea.selectedIndex].text;
	var areaUsu = document.getElementById("selArea").value;
	var comboDepto = document.getElementById("selDepart");
	var nbDepto = comboDepto.options[comboDepto.selectedIndex].text;
	var deptoUsu = document.getElementById("selDepart").value;
	var comboPuesto = document.getElementById("selPuesto");
	var nbPuesto = comboPuesto.options[comboPuesto.selectedIndex].text;
	var puestUsu = document.getElementById("selPuesto").value;
	var nbNI = document.getElementById("nbIndicador"+j).value;
	var niUsu = document.getElementById("idIndicador"+j).value;
	document.getElementById("idAreaConf").value = areaUsu;
	document.getElementById("idDeptoConf").value = deptoUsu;
	document.getElementById("idPuestoConf").value = puestUsu;
	document.getElementById("idNiConf").value = niUsu;
	document.getElementById("nbAreaConf").value = nbArea;
	document.getElementById("nbDeptoConf").value = nbDepto;
	document.getElementById("nbPuestoConf").value = nbPuesto;
	document.getElementById("nbNIConf").value = nbNI;
	document.getElementById("cargaConfigNIs").submit();
}