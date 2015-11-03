/**
 * Funciones para el jsp CargaArchivoCsv.jsp
 */
var fecha = new Date();
var anioActual = fecha.getFullYear();
var mesActual = fecha.getMonth(); //Lo regresa en número iniciando en 0 pera enero
var arrNombIndicador;
var arrIndiNomAnioUser;
var archConErr = false;
var selArch = false;

var contEne = 0;
var contFeb = 0;
var contMar = 0;
var contAbr = 0;
var contMay = 0;
var contJun = 0;
var contJul = 0;
var contAgo = 0;
var contSep = 0;
var contOct = 0;
var contNov = 0;
var contDic = 0;

/**
 * Inicia el arreglo de indicadores
 * @param array_js
 */
function iniciaArreglo(array_js,array_js2){
	var tamano = array_js.length;
	arrNombIndicador = new Array(tamano);
	arrNombIndicador = array_js;
	var tamano2 = array_js2.length;
	arrIndiNomAnioUser = new Array(tamano2);
	arrIndiNomAnioUser = array_js2;
}

/**
 * Carga el combo de año con el actual y el anterior
 */
function llenaCbAnio(){
	var combo = document.getElementById("cbAnio");
	var optdef = document.createElement("option");
	optdef.text = "[Selecciona]";
	var option = document.createElement("option");
	option.text = anioActual - 1;
	var option1 = document.createElement("option");
	option1.text = anioActual;
	combo.add(optdef);
	combo.add(option);
	combo.add(option1);
}

/**
 * Llena el combo de indicadores, partiendo del año seleccionado
 */
function llenaCbInd(){
	var combo = document.getElementById("cbAnio");
	var anioSel = combo.options[combo.selectedIndex].text;
	var comboInd = document.getElementById("indicador");
	limpiaCombo(comboInd);
	var optdef = document.createElement("option");
	optdef.text = "[Selecciona]";
	comboInd.add(optdef);
	for(a=0;a<arrIndiNomAnioUser.length; a++){
		var arr = arrIndiNomAnioUser[a].split('|');
		if(anioSel == arr[1]){
			var option = document.createElement("option");
			option.text = arr[0];
			comboInd.add(option);
			document.getElementById("fileInputInd").disabled = false;
		}
	}
	document.getElementById("indicador").disabled = false;
	document.getElementById("btnCarga").disabled = true;
	document.getElementById("anioSel").value = anioSel;
}

/**
 *Elimina las opciones de un combo 
 * @param combo
 */
function limpiaCombo(combo){
	var tamCombo = combo.options.length;
	if(tamCombo > 0){
		var i = tamCombo;
		while(i >= 0){
			combo.remove(i);
			i--;
		}
	}
}

/**
 * Obiene el nombre del mes a partir de un numero.
 * @param mesNum
 * @returns {String}
 */
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

/**
 * Valida el formato del archivo
 * @param files
 */
function processFiles(files){
    var file = files[0];
    if (file.name.split(".")[1].toUpperCase() != "CSV"){
      alert('Invalid csv file !');
      document.getElementById("btnCarga").disabled = true;
      return;
    }else{
    	//file_info
      document.getElementById('infoFile').innerHTML = "<p>File Name: "+file.name + " | "+file.size+" Bytes.</p>";
      document.getElementById("error").style.display="none";
      document.getElementById("alerta").style.display="none";
      archConErr = false;
      limpiarDiv();
      selArch = true;
      handleFileSelect();
      validaReq();
      
    }
  }

/**
 * Limpia la tabla
 */
function limpiarDiv(){
	var d = document.getElementById("fileOutput");
	var e = document.getElementById("escondidos");
	while (d.hasChildNodes()){
	d.removeChild(d.firstChild);
	}
	while (e.hasChildNodes()){
		e.removeChild(e.firstChild);
	}
}

/**
 *Procesamiento de archivo 
 */
function handleFileSelect(){
  var file = document.getElementById("fileInputInd").files[0];
  var reader = new FileReader();
  var link_reg = /(http:\/\/|https:\/\/)/i;
  contEne = 0;
  contFeb = 0;
  contMar = 0;
  contAbr = 0;
  contMay = 0;
  contJun = 0;
  contJul = 0;
  contAgo = 0;
  contSep = 0;
  contOct = 0;
  contNov = 0;
  contDic = 0;
  reader.onload = function(file) {
              var content = file.target.result;
              var rows = file.target.result.split(/[\r\n|\n]+/);
              var table = document.createElement('table');
              var indValido;
              table.setAttribute("width", "100%");
              table.setAttribute("id", "TblArch");
              table.setAttribute("align","center");
              table.setAttribute("style", "width:1170px");
              
              for (var i = 0; i < rows.length; i++){
                var tr = document.createElement('tr');
                var arr = rows[i].split(',');
                document.getElementById("cantInd").value = rows.length-1;
                var input = document.createElement('input');
                input.setAttribute("type", "hidden");
                var nbinput = "row"+i;
                input.setAttribute("name", nbinput);
                input.setAttribute("value", rows[i]);
                document.getElementById('escondidos').appendChild(input);
                
                for (var j = 0; j < arr.length; j++){
                  if (i==0){
                    var td = document.createElement('th');
                    td.setAttribute("width", "11%");
                    td.setAttribute("class", "negritas titulotablero");
                  }else{
                    var td = document.createElement('td');
                    var idRow = "Indicador" + i;
                    tr.setAttribute("id", idRow);
                    
                  }
                  if( link_reg.test(arr[j]) ){
                	var a = document.createElement('a');
                    if(i > 0 && j == 1){
                    	indValido = validaIndicador(arr[j]);
                    	if(indValido == "Error"){                    		
                    		tr.setAttribute("bgcolor", "red");
                    	}else{
                    		indValido = validaIndAnio(arr[j]);
                    		if(indValido == "ErrorAnio"){
                    			tr.setAttribute("bgcolor", "yellow");
                    		}
                    		var idTd = "td" + j;
                    		td.setAttribute("id", idTd);
                    	}
                    }
                    a.href = arr[j];
                    a.target = "_blank";
                    a.innerHTML = arr[j];
                    td.appendChild(a);
                  }else{
                    td.innerHTML = arr[j];
                   
                    if(i > 0 && j == 0){
                    	indValido = validaIndicador(arr[j]);
                    	if(indValido == "Error"){                    		
                    		tr.setAttribute("class", "mestableroerr");
                    		archConErr = true;
                    		document.getElementById("error").style.display="inline";
                    	}else{
                    		indValido = validaMes(arr[j]);
                    		var duplicado = validaDuplicado(arr[j]);
                    		if(indValido == "ErrorAnio"){
                    			tr.setAttribute("class", "mestablerowar");
                        		archConErr = true;
                        		document.getElementById("alerta").style.display="inline";
                    		}
                    		if(duplicado){
                    			tr.setAttribute("class", "mestablerowar");
                        		archConErr = true;
                        		document.getElementById("alerta").style.display="inline";
                    		}else{
                    			var idTd = "td" + j;
	                    		td.setAttribute("id", idTd);
	                    		td.setAttribute("class", "mestablero bordeazul");
                    		}
                    	}
                    }else{
                    	if(i==0){
                    		td.setAttribute("class", "negritas titulotablero");
                    	}else{
                    		td.setAttribute("class", "mestablero bordeazul");
                    	}
                    }
                  }
                  tr.appendChild(td);
                }
                table.appendChild(tr);
              }
              document.getElementById('fileOutput').appendChild(table);
              validaSeleccion();
          };
  reader.readAsText(file);
 }

/**
 * Compara los indicadores existentes con el del archivo
 * @param indi
 */
function validaIndicador(indi){
	var indOk = "Error";
	//Valida que exista
	for(i=0; i<12; i++){
		if(indi == regresaNombreMes(i)){
			indOk = "Ok";
		}
	}
	return indOk; 
}

/**
 * Valida que el mes pertenezca al año corriente o si se encuentra repetido
 */
function validaMes(mes){
	var combo = document.getElementById("cbAnio");
	var anioSel = combo.options[combo.selectedIndex].text;
	var indOk = "ErrorAnio";
	//Valida que exista en el año
	if(anioSel == anioActual){
		var mesInt = convierteMesAnum(mes);
		if(mesInt >= 0 && mesInt <= mesActual){
			indOk="Ok";
		}
	}else{
		indOk="Ok";
	}
	
	return indOk; 
}
/**
 * Convierte a número el mes enviado y summa 1 al contador de meses
 * @param mes
 * @returns {Number}
 */
function convierteMesAnum(mes){
	var mesInt;
	switch (mes) {
	case "Enero":
		mesInt = 0;
		contEne = contEne+1;
		break;
	case "Febrero":
		mesInt = 1;
		contFeb = contFeb+1;
		break;
	case "Marzo":
		mesInt = 2;
		contMar = contMar+1;
		break;
	case "Abril":
		mesInt = 3;
		contAbr = contAbr+1;
		break;
	case "Mayo":
		mesInt = 4;
		contMay = contMay+1;
		break;
	case "Junio":
		mesInt = 5;
		contJun = contJun+1;
		break;
	case "Julio":
		mesInt = 6;
		contJul = contJul+1;
		break;
	case "Agosto":
		mesInt = 7;
		contAgo = contAgo+1;
		break;
	case "Septiembre":
		mesInt = 8;
		contSep = contSep+1;
		break;
	case "Octubre":
		mesInt = 9;
		contOct = contOct+1;
		break;
	case "Noviembre":
		mesInt = 10;
		contNov = contNov+1;
		break;
	case "Diciembre":
		mesInt = 11;
		contDic = contDic+1;
		break;
	}
	return mesInt;
}
/**
 * 
 * @param mes
 * @returns {Boolean}
 */
function validaDuplicado(mes){
	var estaDuplicado = false;
	if(mes == "Enero" && contEne >= 2){
		estaDuplicado = true;
	}else if(mes == "Febrero" && contFeb >= 2){
		estaDuplicado = true;
	}else if(mes == "Marzo" && contMar >= 2){
		estaDuplicado = true;
	}else if(mes == "Abril" && contAbr >= 2){
		estaDuplicado = true;
	}else if(mes == "Mayo" && contMay >= 2){
		estaDuplicado = true;
	}else if(mes == "Junio" && contJun >= 2){
		estaDuplicado = true;
	}else if(mes == "Julio" && contJul >= 2){
		estaDuplicado = true;
	}else if(mes == "Agosto" && contAgo >= 2){
		estaDuplicado = true;
	}else if(mes == "Septiembre" && contSep >= 2){
		estaDuplicado = true;
	}else if(mes == "Octubre" && contOct >= 2){
		estaDuplicado = true;
	}else if(mes == "Noviembre" && contNov >= 2){
		estaDuplicado = true;
	}else if(mes == "Diciembre" && contDic >= 2){
		estaDuplicado = true;
	}
	return estaDuplicado;
}

/**
 * Valida datos requeridos
 */
function validaReq(){
	var combo = document.getElementById("cbAnio");
	var comboInd = document.getElementById("indicador");
	var indSel = comboInd.options[comboInd.selectedIndex].text;
	document.getElementById("indSel").value = indSel;
	
	//alert(archConErr + " - " +combo.selectedIndex+ " - " +comboMes.selectedIndex+ " - " +selArch);
	if((archConErr==false) && (combo.selectedIndex > 0) && (comboInd.selectedIndex > 0) && (selArch==true)){
		document.getElementById("btnCarga").disabled = false;
	}else{
		document.getElementById("btnCarga").disabled = true;
	}
}

/**
 * Valida los campos requeridos
 */
function validaSeleccion(){
	var todoOk = true;
	var combo = document.getElementById("cbAnio");
	var comboMes = document.getElementById("indicador");

	if(archConErr==true){
		alert("Favor de corregir el archivo");
		todoOk=false;
	}
	if(combo.selectedIndex <= 0){
		alert("Debe seleccionar un año");
		todoOk=false;
	}else if(comboMes.selectedIndex <= 0){
		alert("Debe seleccionar un indicador");
		todoOk=false;
	}
	if(!selArch){
		alert("Debe seleccionar un archivo");
		todoOk=false;
	}
	if(todoOk){
		document.getElementById("btnCarga").style.display="inline";
	}
}

/**
 * 
 */
function cargaArchivoPorMes(){	
	document.getElementById("cargaCsvIndicador").submit();
}

/**
 * Muestra el mensaje de salida en la pantalla
 * @param msj
 */
function validaCarga(msj){
	if(msj != "" && msj != "null"){
		document.getElementById("msjSpan").textContent=msj;
		document.getElementById("correcto").style.display="inline";
		document.getElementById("fileOutput").style.display="none";
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