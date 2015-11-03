angular.module('organigrama.controllers',['BasicPrimitives_2'])

controller.('organigramaController', ['$scope', function($scope){

	var items_org = [];
	var deptos =[];

	//Variable donde se almacenan los indicadores del arbol de indicadores.
	$scope.items_identificadores  = [];
	$scope.texto_tipo_arbol = "Vista Puestos";
	$scope.texto_titulo = "Diagrama de Numeros Inteligentes";
	$scope.index = 1; //Inicia el indice en 1 pues solo muestra el inicial, debe ser dinámico cuando se cargue de la base de datos
	$scope.lista_indicadores = [];
	
	var options = new primitives.orgdiagram.Config();
	$scope.cursor_asociar = "";

	$scope.bandera_asociar = false;
	$scope.bandera_editar = false;

	$scope.mostrar_identificadores = true;
	$scope.mostrar_organigrama = false;

	var generarEstructura = function (stream){
		var NUMERO_PARAMETROS = 7;

		var arreglo;	
		arreglo = stream.split("|");
		var tam_arreglo = arreglo.length;
		var j = 0;

		for(var i=0; i < tam_arreglo; i++){
			switch (i % NUMERO_PARAMETROS){
				case 0:
					id_arr = arreglo[i];
				break;
				case 1:
					parent_arr = arreglo[i];
					parent_arr = parent_arr == "" ? null : parent_arr;
				break;
				case 2:
					title_arr = arreglo[i];
				break;
				case 3:
					description_arr = arreglo[i];
				break;
				case 4:
					asociados_str = arreglo[i];
					asociados_arr = asociados_str == "" ? null : asociados_str.split(",");
				break;
				case 5:
					depto_arr = arreglo[i]; 
				break;
				case 6:
					color_arr = arreglo[i];
					items_org.push(
						new primitives.orgdiagram.ItemConfig({
							id: id_arr,
							parent: parent_arr,
							title: title_arr,
							description: description_arr,
							asociados: asociados_arr,
							itemTitleColor: color_arr,
							itemDepto: depto_arr,
							lista_NIs:["NI1","NI2","NI3"],
						})
					);
					j++;
				break;
			}
		}
		$scope.index = j;
	}

	var stringDeptos=parent.document.getElementById("deptos").value;
	if(stringDeptos!=""){
		var arreglo;
		//los elementos del stream están separados por el pipe
		arreglo = stringDeptos.split("|");
		var tam_arr = arreglo.length;
		for(var i=0; i < tam_arr; i++){
			deptos[i] = arreglo[i];
		}
	}
	
	//En esta variable se debe informar lo que obtengamos de la consulta de los arboles.
	//var stream = document.getElementById("valorRecibidoDiagrama").value;
	var stream = parent.document.getElementById("valorRecibidoDiagrama").value;
	
	if (stream == "") {
		/*Llenado de los Items en Duro*/
		items_org = [
			new primitives.orgdiagram.ItemConfig({
				id: 0,
				parent: null,
				title: "Puesto Inicial",
				description: "Descripción del Puesto",
				asociados: [],
				lista_NIs:["NI1","NI2","NI3"],
				itemTitleColor: primitives.common.Colors.RoyalBlue,
				itemDepto: 0,
			})
		];
	}
	else{
		generarEstructura(stream)
	}
	
	//Se agregan los botones para la edición
	var buttons = [];
	var button_agregar = new primitives.orgdiagram.ButtonConfig();
	button_agregar.name = "agregar";
	button_agregar.icon = "ui-icon-plus";
	button_agregar.tooltip = "Agregar"
	button_agregar.size = new primitives.common.Size(20, 20);
	buttons.push(button_agregar);

	var button_asociar = new primitives.orgdiagram.ButtonConfig();
	button_asociar.name = "asociar";
	button_asociar.icon = "ui-icon-flag";
	button_asociar.tooltip = "Asociar"
	button_asociar.size = new primitives.common.Size(20, 20);
	buttons.push(button_asociar);

	var button_editar = new primitives.orgdiagram.ButtonConfig();
	button_editar.name = "editar";
	button_editar.icon = "ui-icon-pencil";
	button_editar.tooltip = "Editar"
	button_editar.size = new primitives.common.Size(20, 20);
	buttons.push(button_editar);

	var button_borrar = new primitives.orgdiagram.ButtonConfig();
	button_borrar.name = "borrar";
	button_borrar.icon = "ui-icon-close";
	button_borrar.tooltip = "Borrar"
	button_borrar.size = new primitives.common.Size(20, 20);
	buttons.push(button_borrar);
	
	//Se llenan las opciones del chart
	options.items = items_org;
	options.deptos = deptos;
	options.cursorItem = 0;
	options.highlightItem = 0;
	options.hasSelectorCheckbox = primitives.common.Enabled.False;//Sin seleccion
	options.templates = [getZoom0Template(), getZoom1Template(), getZoom2Template(), getZoom3Template(), getZoom4Template()];
	options.defaultTemplateName = "Zoom3";
	options.maximumColumnsInMatrix = 1;
	options.pageFitMode = primitives.orgdiagram.PageFitMode.FitToPage;
    options.linesWidth=2;
	options.normalLevelShift=40;
	options.linesColor="#3b393b";
	options.minimalVisibility= primitives.common.Visibility.Dot;
	options.arrowsDirection=primitives.common.GroupByType.Children;
    
	options.buttons = buttons;
	options.hasButtons = primitives.common.Enabled.Auto;
	options.onButtonClick = function(e, data){
		switch (data.name) {
			case "asociar":
				//Se obtiene la varibale del iframe items identificadores
				$('#asocia').modal('show');
				var myFrame = window.frames[0].window;
				$scope.items_identificadores = myFrame.items;
				$scope.bandera_editar = false;
				if ($scope.bandera_asociar == false) {
					$scope.cursor_asociar = data.context.id;
					options.cursorItem = data.context.id;
					listaIndicadoresEnPuesto(data.context.id);
					$scope.bandera_asociar = true;
				}
			break;
			case "editar":
				
				$('#editar').modal('show');
				var myFrame = window.frames[0].window;
				$scope.items_identificadores = myFrame.items;
				$scope.cursor_asociar = "";
				$scope.bandera_asociar = false;
				options.cursorItem = data.context.id;
				listaIndicadoresEnPuesto(data.context.id);
				$scope.bandera_editar = true;
			break;
			case "agregar":
				$scope.cursor_asociar = "";
				$scope.bandera_editar = false;
				$scope.bandera_asociar = false;
				$scope.addItem($scope.index + 1, data.context.id);
			break;
            case "borrar":
				
				$scope.cursor_asociar = "";
				$scope.bandera_editar = false;
				$scope.bandera_asociar = false;
				$scope.deleteItem(data.context.id);
				
			break;
		}
		$scope.$apply();
	};//Función para botones laterales
	options.enablePanning = false;//Deshabilitar panning para no interferir con Drag and Drop
	options.onCursorChanged = function(e, data){
		var myFrame = window.frames[0].window;
		options.cursorItem = data.context.id;
		$scope.items_identificadores = myFrame.items;
		var id= data.context.id;
		var items= myFrame.items;
		
		listaIndicadoresEnPuesto(data.context.id);
		cursor_asociar = "";
		$scope.bandera_editar = false;
		$scope.bandera_asociar = false;
		$scope.$apply();
	}
	//Funcion para cambiar el template al dar click
	options.onCursorChanging= function onCursorChanging(e, data) {
      
       data.oldContext.templateName = null;
       data.context.templateName = "Zoom4";
   }
	//Se agrega la opcion pahacer el drop
	jQuery("#orgdiagram").droppable({
		greedy: true,
		drop: function (event, ui) {
			if (!event.cancelBubble) {
				toValue = null;
				toChart = name;
				Reparent(fromChart, fromValue, toChart, toValue);
				primitives.common.stopPropagation(event);
			}
		}
	});

	//Función al cargar la página para crear el elemento color picker
	$('.color-box').colpick({
		layout:'hex',
		color:'111111',
		onSubmit:function(hsb,hex,rgb,el) {
			$(el).css('background-color', '#'+hex);
			$(el).colpickHide();
			var item = items_org[$scope.myOptions.cursorItem]
			item.itemTitleColor = '#'+hex;
			$scope.$apply();
		}
	});

	Array.prototype.contains = function ( needle ) {
		for (i in this) {
			if (this[i] == needle) return true;
		}
		return false;
	}

	//Se publican las opciones
	$scope.myOptions = options;

	$scope.asociar_identificador = function (items, cursor_asociar, asociado){
		var item_receptor = items[cursor_asociar];
		if(item_receptor.asociados == null){
			item_receptor.asociados = [];
		}
		if(!item_receptor.asociados.contains(asociado.id)){
			item_receptor.asociados[item_receptor.asociados.length] = asociado.id;
		}
		var myFrame = window.frames[0].window;
		$scope.items_identificadores = myFrame.items;
		listaIndicadoresEnPuesto($scope.myOptions.cursorItem);
		//$scope.bandera_editar = true;
	}

	
	$scope.eliminarAsociado = function(item_id, id_eliminar){
		$scope.myOptions.items[item_id].asociados.splice(id_eliminar, 1);
		var myFrame = window.frames[0].window;
		$scope.items_identificadores = myFrame.items;
		listaIndicadoresEnPuesto($scope.myOptions.cursorItem);
	}
	
	$scope.setCursorItem = function (item) {
		$scope.myOptions.cursorItem = item;
		//cursor_asociar = "";
		$scope.bandera_editar = false;
		//$scope.bandera_asociar = false;
	};

	//Función para decidir que se muestra en el panel izquierdo
	$scope.mostrarItem = function (item) {
		if (item.id == $scope.myOptions.cursorItem){
			setColorInicial(item.id);
			return true;
		}else{
			return false;
		}					
	}


	$scope.asociar = function(){
		$scope.cursor_asociar = $scope.myOptions.cursorItem;
		$scope.bandera_asociar = true;
	}

	$scope.salir_asociar = function(item){
		$scope.bandera_asociar = false;
		$scope.myOptions.cursorItem = item;
		$scope.cursor_asociar = "";
	}


	//No se usa 
	$scope.setHighlightItem = function (item) {
		$scope.myOptions.highlightItem = item;
	};
	
	setColorInicial = function (index) {
		var item = items_org[index];
		$('.color-box').css('background-color', item.itemTitleColor);

	}

	listaIndicadoresEnPuesto = function (index){
		$scope.lista_indicadores = [];
		if(items_org[index].asociados != null){
			for (var i = 0; i < items_org[index].asociados.length ; i++) {
				$scope.lista_indicadores.push($scope.items_identificadores[items_org[index].asociados[i]].title);
			}
		}
	}


	//función angular para borrar elemento
	$scope.deleteItem = function (index) {
		if($scope.tieneHijos(index)){
			alert("No se puede eliminar este elemento ya que tiene elementos descendientes.");
			return;
		}
		if (items_org[index].parent != null) {
			$scope.myOptions.items.splice(index, 1);
			$scope.bandera_editar = false;
			$scope.bandera_asociar = false;
			//Se reescribe el Id para no perder órden al eliminar.
			for(var i=0;i<items_org.length; i++){
				if(items_org[i].parent > index){
					items_org[i].parent --;
				}
				items_org[i].id = i;
			}
			$scope.index = items_org.length;
		}
		else{
			alert("No se puede eliminar el elemento raíz.");
		}
	}

	$scope.tieneHijos = function(index){
		for (var i = 0; i < items_org.length; i++) {
			if( items_org[i].parent == index ){
				return true;
			}
		}
		return false;
	}


	//función angular para crear nuevo elemento
	$scope.addItem = function (index, parent) {
		var id = $scope.index++;
		var item = items_org[parent];
		var color = item.itemTitleColor;
		var depto = deptos;
		//$scope.myOptions.items.splice(index, 0, new primitives.orgdiagram.ItemConfig({
		//Se cambia el indice al agregar un item, del indice del padre +1 (index) por la longitud +1 (id)
		$scope.myOptions.items.splice(id, 0, new primitives.orgdiagram.ItemConfig({
			id: id,
			parent: parent,
			title: "Nuevo Puesto " + id,
			description: "Descripción " + id,
			asociados: [],
			itemTitleColor: color,
			itemDepto: depto,
			lista_NIs:["NI1","NI2","NI3"],
		}));
	}

	$scope.cerrarPanel = function () {
		$scope.bandera_editar = false;
		$scope.bandera_asociar = false;
	}

	$scope.cambiarDiagrama = function () {
		var myFrame = window.frames[0].window;
		//alert(myFrame.experimento);
		myFrame.experimento = 1;
		
		//alert(myFrame.experimento);
		if($scope.mostrar_organigrama == true){
			$scope.mostrar_organigrama = false;
			$scope.mostrar_identificadores = true;
			$scope.texto_tipo_arbol = "Vista Puestos"
			$scope.texto_titulo = "Diagrama de Numeros Inteligentes";	
		}
		else{
			$scope.mostrar_organigrama = true;
			$scope.mostrar_identificadores = false;
			$scope.texto_tipo_arbol = "Vista Numeros Inteligentes"
			$scope.texto_titulo = "Diagrama de Puestos Clave";
		}
		
		$scope.bandera_editar = false;
		$scope.bandera_asociar = false;
		
		//Esta no sé para que es la puso Ricardo
		cambiar();
		//Lineas para informar las variables del frame.
		document.getElementById('iframe').contentWindow.updatedata($scope.texto_tipo_arbol);
		document.getElementById('iframe').contentWindow.updatedata2($scope.texto_tipo_arbol);
	}


	$scope.guardarEstructuras = function(){
		var myFrame = window.frames[0].window;
		var items_i = myFrame.items;

		var elem_stream_identificadores = document.getElementById("stream_identificadores");
		//alert("indicadores" + generarStream(items_i));
		elem_stream_identificadores.value = generarStreamInd(items_i);

		var elem_stream_organigrama = document.getElementById("stream_organigrama");
		//alert("organigrama" + generarStream(items_org));
		elem_stream_organigrama.value = generarStreamInd(items_org);
//*********************************************************************************************************************		
		//document.getElementById("hiddenValidacion").value="Validado";
		//alert("Validacion correcta");
		guardarArbol();
	}
	
	function guardarArbol(){
		if(document.getElementById("diagramaVisible").value=="Indicadores"){
			var combo = document.getElementById("area");
			var selected = combo.options[combo.selectedIndex].text;
			document.getElementById("idAreaSel").value=selected;
			if(selected!=""){
				document.getElementById("guardaArbol").submit();
			}else{
				alert("Debe seleccionar un área");
			}
		}else if(document.getElementById("diagramaVisible").value=="Diagrama"){
			var areaUsu = document.getElementById("area").value;
			//var deptoUsu = document.getElementById("depto").value;
			document.getElementById("idAreaSel").value=areaUsu;
			//document.getElementById("idDeptoSel").value=deptoUsu;
			if(areaUsu>0){
				document.getElementById("guardaArbol").action="GuardarDiagrama";
				document.getElementById("guardaArbol").submit();
			}else{
				alert("Debe seleccionar un área");
			}
		}
	}


	function generarStreamInd(items_x){
		var stream = "";
		var stream_asociados;

		for (var i = 0; i < items_x.length ; i++) {
			var stream_asociados = "";
			if (i != 0) {
				stream = stream + "|"
			};
			stream = stream + items_x[i].id + "|"; 
			var p = "";
			if(items_x[i].parent != null){
				p = items_x[i].parent;
			}
			stream = stream + p + "|" + items_x[i].title + "|" + items_x[i].description;	
			if(items_x[i].asociados != null && items_x[i].asociados.length > 0 ){
				for (var j = 0; j < items_x[i].asociados.length; j++) {
					if (j != 0) { stream_asociados = stream_asociados + "," };
					stream_asociados = stream_asociados + items_x[i].asociados[j];
				};
			}
			else{
				stream_asociados = "";
			}
			stream = stream + "|" + stream_asociados +"|" + items_x[i].itemDepto+"|" + items_x[i].itemTitleColor;
		}
		return stream;
	}
	
/**	function generarStreamOrg(items_x){
		var stream = "";
		var stream_asociados;
		var stream_asocEstrat;

		for (var i = 0; i < items_x.length ; i++) {
			var stream_asociados = "";
			if (i != 0) {
				stream = stream + "|"
			};
			stream = stream + items_x[i].id + "|"; 
			var p = "";
			if(items_x[i].parent != null){
				p = items_x[i].parent;
			}
			stream = stream + p + "|" + items_x[i].title + "|" + items_x[i].description;	
			if(items_x[i].asociados != null && items_x[i].asociados.length > 0 ){
				for (var j = 0; j < items_x[i].asociados.length; j++) {
					if (j != 0) { stream_asociados = stream_asociados + "," };
					stream_asociados = stream_asociados + items_x[i].asociados[j];
				};
			}
			else{
				stream_asociados = "";
			}
			if(items_x[i].asocEstrat != null && items_x[i].asocEstrat.length > 0 ){
				for (var j = 0; j < items_x[i].asocEstrat.length; j++) {
					if (j != 0) { stream_asocEstrat = stream_asocEstrat + "," };
					stream_asocEstrat = stream_asocEstrat + items_x[i].asocEstrat[j];
				};
			}
			else{
				stream_asocEstrat = "";
			}
			stream = stream + "|" + stream_asociados +"|" +stream_asocEstrat +"|" + items_x[i].itemTitleColor;
		}
		return stream;
	}
**/
	//Función para la creació de la vista del template
	function getZoom0Template() {
		var result = new primitives.orgdiagram.TemplateConfig();
		result.name = "Zoom0";
		result.itemSize = new primitives.common.Size(40, 22);
		result.minimizedItemSize = new primitives.common.Size(5, 5);
		result.minimizedItemCornerRadius = 5;
		result.highlightPadding = new primitives.common.Thickness(1, 1, 1, 1);
		var itemTemplate = jQuery(
				   '<div class="bp-item">'
        		+ '<div name="title" class="bp-item" style="top: 0px; left: 0px; width: 40px; height: 22px; font-size: 7px; text-align:center;">{{itemConfig.title}}</div>'
        + '</div>'

		).css({
			width: result.itemSize.width + "px",
			height: result.itemSize.height + "px"
		}).addClass("bp-item bp-corner-all bt-item-frame");
		result.itemTemplate = itemTemplate.wrap('<div>').parent().html();
		return result;
	}
	
	function getZoom1Template() {
		var result = new primitives.orgdiagram.TemplateConfig();
		result.name = "Zoom1";
		result.itemSize = new primitives.common.Size(70, 22);
		result.minimizedItemSize = new primitives.common.Size(5, 5);
		result.minimizedItemCornerRadius = 5;
		result.highlightPadding = new primitives.common.Thickness(1, 1, 1, 1);
		var itemTemplate = jQuery(
				  '<div class="bp-item">'
	            + '<div name="title" class="bp-item" style="top: 0px; left: 0px; width: 70px; height: 22px; font-size: 9px; text-align:center;">{{itemConfig.title}}</div>'
	           
	        + '</div>'
		).css({
			width: result.itemSize.width + "px",
			height: result.itemSize.height + "px"
		}).addClass("bp-item bp-corner-all bt-item-frame");
		result.itemTemplate = itemTemplate.wrap('<div>').parent().html();
		return result;
	}
	
	function getZoom2Template() {
		var result = new primitives.orgdiagram.TemplateConfig();
		result.name = "Zoom2";
		result.itemSize = new primitives.common.Size(78, 36);
		result.minimizedItemSize = new primitives.common.Size(5, 5);
		result.minimizedItemCornerRadius = 5;
		result.highlightPadding = new primitives.common.Thickness(2, 2, 2, 2);
		var itemTemplate = jQuery(

				'<div class="bp-item bp-corner-all bt-item-frame" style="box-shadow: -1px 1px 3px 1px rgba(0,0,0,0.20);">'
				+ '<div name="titleBackground" class="bp-item bp-corner-all bp-title-frame" style=" border-style: none; border-radius: 2px; background:{{itemConfig.itemTitleColor}};top: 1px; left: 1px; right: 1px; width: 76px; height: 4px;"></div>'
				+ '<div name="description" class="bp-item" style= "left:1px; bottom: 4px;top: 6px; width: 76px; height: 27px;text-align: left;  font-size: 8px; font-family: Trebuchet MS, Tahoma, Verdana, Arial, sans-serif;">{{itemConfig.title}}</div>'
				  + '</div>'
			

		).css({
			width: result.itemSize.width + "px",
			height: result.itemSize.height + "px"
		}).addClass("bp-item bp-corner-all bt-item-frame");
		result.itemTemplate = itemTemplate.wrap('<div>').parent().html();
		return result;
	}
	function getZoom3Template() {
    	var result = new primitives.orgdiagram.TemplateConfig();
		result.name = "Zoom3";
		result.itemSize = new primitives.common.Size(100, 67);
		result.minimizedItemSize = new primitives.common.Size(10, 10);
		result.minimizedItemCornerRadius = 5;
		result.highlightPadding = new primitives.common.Thickness(2, 2, 2, 2);
		var itemTemplate = jQuery(
			
				'<div class="bp-item bp-corner-all bt-item-frame" style="box-shadow: -1px 1px 3px 1px rgba(0,0,0,0.20);">'
				+ '<div name="titleBackground" class="bp-item bp-corner-all bp-title-frame" style=" border-style: none; border-radius: 2px; background:{{itemConfig.itemTitleColor}};top: 1px; left: 1px; right: 1px; width: 96px; height: 10px;"></div>'
				+ '<div name="description" class="bp-item" style= "left:15px; bottom: 4px;top: 15px; width: 80px; height: 48px;text-align: left;  font-size: 10px; font-family: Trebuchet MS, Tahoma, Verdana, Arial, sans-serif;">{{itemConfig.title}}</div>'
				  + '</div>'
				
				
			

		).css({
			width: result.itemSize.width + "px",
			height: result.itemSize.height + "px"
		}).addClass("bp-item bp-corner-all bt-item-frame");
		result.itemTemplate = itemTemplate.wrap('<div>').parent().html();
		return result;
    }

	function getZoom4Template() {
    	var result = new primitives.orgdiagram.TemplateConfig();
		result.name = "Zoom4";
		result.itemSize = new primitives.common.Size(220,120);
		result.minimizedItemSize = new primitives.common.Size(5, 5);
		result.minimizedItemCornerRadius = 5;
		result.highlightPadding = new primitives.common.Thickness(2, 2, 2, 2);
		var itemTemplate = jQuery(
				'<div class="bp-item bp-corner-all bt-item-frame" style="box-shadow: -1px 1px 3px 1px rgba(0,0,0,0.20);">'
				+ '<div name="titleBackground" class="bp-item bp-corner-all bp-title-frame" style="background:{{itemConfig.itemTitleColor}};top: 2px; left: 2px; width: 216px; height: 20px;">'
					+ '<div name="title" class="bp-item bp-title" style="text-align: center; top: 4px; right: 6px; width: 208px; height: 18px;font-size: 12px;">{{itemConfig.title}}</div>'
				+ '</div>'
				+'<div name="icon" class="bp-item" style="color:#3aa4c2; text-align: center; top: 25px; left:5px; width: 13px; height: 13px;font-size: 14px;"><i class="fa fa-info-circle"></i></div>'
				+ '<div name="description" class="bp-item" style="top: 25px; left: 20px; width: 190px; height: 45px; font-size: 11px;">{{itemConfig.description}}</div>'
				+ '<div class="bp-item bp-photo-frame" style="top: 66px; left: 5px; width: 210px; height: 45px; font-size:9px; overflow-x:hidden; overflow-y:scroll;">{{itemConfig.asociados[1]}}'
				 +'<ul style="list-style-type: none; padding: 2px 2px 2px 10px"><li ng-repeat="indicador in itemConfig.lista_NIs">-{{indicador}}</li></ul>'
				+'</div>'
				+'<div name="icon" class="bp-item" style="color:#f08113; text-align: center; top: 50px; left:7px; width: 15px; height: 15px;font-size: 14px;"><i class="fa fa-bar-chart"></i></div>'
				+ '</div>'


		).css({
			width: result.itemSize.width + "px",
			height: result.itemSize.height + "px"
		}).addClass("bp-item bp-corner-all bt-item-frame");
		result.itemTemplate = itemTemplate.wrap('<div>').parent().html();
		return result;
    }



}])

;