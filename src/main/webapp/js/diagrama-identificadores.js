//Variable aplicación AngularJs
var appADN = angular.module('appADN', ['BasicPrimitives']);
/*Variable Global para cada uno de los Items*/
var items = [];
var experimento = 33;
var ItemSeleccionado_Obj = null;
var deptos =[];

//Inicia controlador AngularJs
appADN.controller('controllerADN', ['$scope', '$window', function ($scope,$window) {
	
	$scope.index = 1; //Inicia el indice en 1 pues solo muestra el inicial, debe ser dinámico cuando se cargue de la base de datos

	var options = new primitives.orgdiagram.Config();
	
	//Variable que indica a que puesto se seleccionaran los demás elementos
	$scope.cursor_asociar = "";
	//Variablrs para indicar si se está editando o asociando (mostrar los formularios correspondientes)
	$scope.bandera_asociar = false;
	$scope.bandera_editar = false;
	//Lista para almacenar los puestos del indicador seleccionado
	$scope.lista_puestos = [];
	
	//Función para generar la estructura de datos del árbol a partir del stream guardado en la base de datos
	function generarEstructura(stream){
		var NUMERO_PARAMETROS = 7;

		var arreglo;
		//los elementos del stream están separados por el pipe
		arreglo = stream.split("|");
		var tam_arreglo = arreglo.length;
		var j = 0;

		for(var i=0; i < tam_arreglo; i++){
			//cada seis elementos componen un indicador del árbol
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
					items.push(
						new primitives.orgdiagram.ItemConfig({
							id: id_arr,
							parent: parent_arr,
							title: title_arr,
							description: description_arr,
							asociados: asociados_arr,
							itemTitleColor: color_arr,
							itemDepto: depto_arr,
						})
					);
					j ++;
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
	var stream = parent.document.getElementById("valorRecibidoIndicadores").value;
	//var stream = document.getElementById("valorRecibidoIndicadores").value;

	/*Llenado de los Items en Duro*/
	if (stream == "") {
		items = [
			new primitives.orgdiagram.ItemConfig({
				id: 0,
				parent: null,
				title: "NI Inicial",
				description: "NI Inicial",
				asociados: [],
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
	options.items = items;
	options.deptos = deptos;
	options.cursorItem = 0;
	options.highlightItem = 0;
	options.hasSelectorCheckbox = primitives.common.Enabled.False;//Sin seleccion
	options.maximumColumnsInMatrix = 1;
	options.pageFitMode=primitives.orgdiagram.PageFitMode.FitToPage;
    options.selectionPathMode = primitives.orgdiagram.SelectionPathMode.None;
    options.orientationType= primitives.common.OrientationType.Top;
    options.horizontalAlignment= primitives.common.HorizontalAlignmentType.Left;
    options.templates = [getZoom0Template(), getZoom1Template(), getZoom2Template(), getZoom3Template(), getZoom4Template()];
	options.defaultTemplateName = "Zoom2";
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
				$scope.bandera_editar = false;
				if ($scope.bandera_asociar == false) {
					$scope.cursor_asociar = data.context.id;
					options.cursorItem = data.context.id;
					$scope.bandera_asociar = true;
				}
				else {
					      asociar_item(items,$scope.cursor_asociar,data.context.id);
				}
			break;
			case "editar":
				$('#editar').modal('show');
				$scope.cursor_asociar = "";
				$scope.bandera_asociar = false;
				options.cursorItem = data.context.id;
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
		}		$scope.$apply();
	};//Función para botones laterales
	options.enablePanning = false;//Deshabilitar panning para no interferir con Drag and Drop
	options.onCursorChanged = function(e, data){

		$scope.bandera_editar = false;
		//listar los puestos asignados cada que se seleccione un nuevo indicador
		listaPuestosEnIndicador(data.context.id);
		$scope.puesto_seleccionado = data.context.id;
		options.cursorItem = data.context.id;	
		//$scope.bandera_asociar = false;
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
			var item = items[$scope.myOptions_idnt.cursorItem]
			item.itemTitleColor = '#'+hex;
			$scope.$apply();
		}
	});
	
	//Selección de Depto
	$scope.selDepto = function(){
		var valor = $(this).val();
        alert(valor);
        var item = items[$scope.myOptions_idnt.cursorItem]
        item.itemDepto=valor;
        $scope.$apply();
	};

	Array.prototype.contains = function ( needle ) {
		for (i in this) {
			if (this[i] == needle) return true;
		}
		return false;
	}

	//Se publican las opciones
	$scope.myOptions_idnt = options;

	//Función para asociar un indicador a otro
	function asociar_item (items, cursor_asociar, id_asociado){
		if(cursor_asociar != id_asociado){
			var item_receptor = items[cursor_asociar];
			if(item_receptor.asociados == null){
				item_receptor.asociados = [];
			}
			if(!item_receptor.asociados.contains(id_asociado)){
				item_receptor.asociados[item_receptor.asociados.length] = id_asociado;
			}
		}
	}

	//Eliminar la asociación de indicadores
	$scope.eliminarAsociado = function(item_id, id_eliminar){
		$scope.myOptions_idnt.items[item_id].asociados.splice(id_eliminar, 1);
	}
	

	$scope.setCursorItem = function (item) {
		$scope.myOptions_idnt.cursorItem = item;
		//cursor_asociar = "";
		$scope.bandera_editar = false;
		//$scope.bandera_asociar = false;
	};

	//Función para decidir que se muestra en el panel izquierdo
	$scope.mostrarItem = function (item) {
		if (item.id == $scope.myOptions_idnt.cursorItem){
			setColorInicial(item.id);
			return true;
		}else{
			return false;
		}					
	}
	
	setColorInicial = function (index) {
		var item = items[index];
		$('.color-box').css('background-color', item.itemTitleColor);

	}


	$scope.asociar = function(){
		$scope.cursor_asociar = $scope.myOptions_idnt.cursorItem;
		$scope.bandera_asociar = true;
	}

	$scope.salir_asociar = function(item){
		$scope.bandera_asociar = false;
		$scope.myOptions_idnt.cursorItem = item;
		$scope.cursor_asociar = "";
	}


	//No se usa 
	$scope.setHighlightItem = function (item) {
		$scope.myOptions_idnt.highlightItem = item;
	};

	//Genera la lista de los puestos del indicador con el index dado
	listaPuestosEnIndicador = function (index){
		if(index != null && index != ""){	
			$scope.lista_puestos = [];
			for (var i = 0; i < parent.items_org.length ; i++) {
				if(parent.items_org[i].asociados != null){
					if(parent.items_org[i].asociados.contains(index)){
						$scope.lista_puestos.push(parent.items_org[i].title);
					}
				}
			}
		}
	}
	
	//Valida si el indicador dado tiene puestos asociados.
	tiene_puestos = function (index) {
		for (var i = 0; i < parent.items_org.length ; i++) {
			if(parent.items_org[i].asociados != null){
				if(parent.items_org[i].asociados.contains(index)){
					return true;
				}
			}
		}
		return false;
	}
	
	//Función para setear las variables de la ventana modal dependiendo del indicador seleccionado.
	$scope.filtrar = function (index) {
		titulo_modal = items[index].title;
		document.getElementById('nombre').value = titulo_modal;
		descripcion_modal = items[index].description;
		document.getElementById('definicion').value = descripcion_modal;
		document.getElementById('combo_nombre').value = titulo_modal;
	}
	
	//función angular para borrar elemento
	$scope.deleteItem = function (index) {
		if($scope.tieneHijos(index)){
			alert("No se puede eliminar este elemento ya que tiene indicadores descendientes.");
			return;
		}
		
		if (items[index].parent != null) {
			
			//Ciclo para validar si el identificador está asociado a algún puesto (accesibles a variables de iframe)
			for (var i = 0; i < parent.items_org.length ; i++) {
				if(parent.items_org[i].asociados != null){
					if(parent.items_org[i].asociados.contains(index)){
						alert("No se puede eliminar el identificador ya que está asociado al puesto: " + parent.items_org[i].title);
						return;
					}
				}
			}
			
			//Ciclo para arreglar el indice de los asociados si se elimina un identificador (muy costoso) (accesibles a variables de iframe)
			for (var i = 0; i < parent.items_org.length ; i++) {
				if(parent.items_org[i].asociados != null){
					var ident_asociados = parent.items_org[i].asociados;
				
					for (var j = 0; j < ident_asociados.length ; j++) {
						if(ident_asociados[j] > index){
							parent.items_org[i].asociados[j] = ident_asociados[j] - 1;
						}
					}
				}
			}

			//Ciclo para eliminar la asociación del elemento a eliminar con los demás indicadores
			for (var i = 0; i < items.length ; i++) {
				if(items[i].asociados != null){
					var ident_asociados = items[i].asociados;
				
					for (var j = 0; j < ident_asociados.length ; j++) {
						if(ident_asociados[j] == index){
							items[i].asociados.splice(j, 1);
						}
					}
				}
			}

			$scope.myOptions_idnt.items.splice(index, 1);
			$scope.bandera_editar = false;
			$scope.bandera_asociar = false;
			//Se reescribe el Id para no perder órden al eliminar.
			

			for(var i=0;i<items.length; i++){
				if(items[i].parent > index){
					items[i].parent --;
				}
				items[i].id = i;
			}
			$scope.index --;
		}
		else{
			alert("No se puede eliminar el elemento raíz.");
		}
	}

	$scope.cerrarPanel = function () {
		$scope.bandera_editar = false;
		$scope.bandera_asociar = false;
	}

	//función angular para crear nuevo elemento
	$scope.addItem = function (index, parent) {
		var id = $scope.index++;
		var item = items[parent];
		var color = item.itemTitleColor;
		var depto = deptos;
		//$scope.myOptions_idnt.items.splice(index, 0, new primitives.orgdiagram.ItemConfig({
		//Se cambia el indice al agregar un item, del indice del padre +1 (index) por la longitud +1 (id)
		$scope.myOptions_idnt.items.splice(id, 0, new primitives.orgdiagram.ItemConfig({
			id: id,
			parent: parent,
			title: "Nuevo NI " + id,
			description: "New description " + id,
			asociados: [],
			itemTitleColor: color,
			itemDepto: depto,
		}));
	}

	$scope.tieneHijos = function(index){

		for (var i = 0; i < items.length; i++) {
			if( items[i].parent == index ){
				return true;
			}
		}
		return false;
	}

//////////Función para la creació de la vista del template
	function getZoom0Template() {
		var result = new primitives.orgdiagram.TemplateConfig();
		result.name = "Zoom0";
		result.itemSize = new primitives.common.Size(40, 22);
		result.minimizedItemSize = new primitives.common.Size(5, 5);
		result.minimizedItemCornerRadius = 5;
		result.highlightPadding = new primitives.common.Thickness(1, 1, 1, 1);
		var itemTemplate = jQuery(
				   '<div class="bp-item" style="box-shadow: -1px 1px 6px 2px rgba(0,0,0,0.20);>'
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
		result.itemSize = new primitives.common.Size(70, 32);
		result.minimizedItemSize = new primitives.common.Size(5, 5);
		result.minimizedItemCornerRadius = 5;
		result.highlightPadding = new primitives.common.Thickness(1, 1, 1, 1);
		var itemTemplate = jQuery(
				'<div class="bp-item bp-corner-all bt-item-frame" style="box-shadow: -1px 1px 3px 1px rgba(0,0,0,0.20);">'
				+ '<div name="titleBackground" class="bp-item bp-corner-all bp-title-frame" style=" border-style: none; border-radius: 2px; background:{{itemConfig.itemTitleColor}};top: 0px; left: 0px; width: 70px; height: 5px;"></div>'
				+ '<div name="description" class="bp-item" style= "left:4px; bottom: 4px;top: 10px; width: 60px; height: 28px;text-align: left; color:#2e5a99; font-size: 7px; font-family: Arial;">{{itemConfig.title}}</div>'
				+ '<div ng-show="itemConfig.tiene_puesto" class="bp-item bp-corner-all" style="color: #f08113 ;background: #FFC1100; bottom: 3px; right: 2px; width: 15px; height: 10px; font-size: 14px">'
				+ '<div style="padding: 0px 1px 0px 1px;"><i class="fa fa-user"></i></div>'
			
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
		result.itemSize = new primitives.common.Size(90, 56);
		result.minimizedItemSize = new primitives.common.Size(10, 10);
		result.minimizedItemCornerRadius = 5;
		result.highlightPadding = new primitives.common.Thickness(2, 2, 2, 2);
		var itemTemplate = jQuery(
			'<div class="bp-item bp-corner-all bt-item-frame" style="box-shadow: -1px 1px 3px 1px rgba(0,0,0,0.20);">'
				+ '<div name="titleBackground" class="bp-item bp-corner-all bp-title-frame" style=" border-style: none; border-radius: 2px; background:{{itemConfig.itemTitleColor}};top: 0px; left: 0px; width: 90px; height: 5px;"></div>'
				+ '<div name="description" class="bp-item" style= "left:4px; bottom: 4px;top: 10px; width: 80px; height: 48px;text-align: left; color:#2e5a99; font-size: 9px; font-family: Arial;">{{itemConfig.title}}</div>'
				+ '<div ng-show="itemConfig.tiene_puesto" class="bp-item bp-corner-all" style="color: #f08113 ;background: #FFC1100; bottom: 3px; right: 2px; width: 15px; height: 10px; font-size: 14px">'
				+ '<div style="padding: 0px 1px 0px 1px;"><i class="fa fa-user"></i></div>'
			
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
		result.itemSize = new primitives.common.Size(130, 80);
		result.minimizedItemSize = new primitives.common.Size(10, 10);
		result.minimizedItemCornerRadius = 5;
		result.highlightPadding = new primitives.common.Thickness(2, 2, 2, 2);
		var itemTemplate = jQuery(
			'<div class="bp-item bp-corner-all bt-item-frame" style="box-shadow: -1px 1px 3px 1px rgba(0,0,0,0.20);">'
				+ '<div name="titleBackground" class="bp-item bp-corner-all bp-title-frame" style="background:{{itemConfig.itemTitleColor}};top: 1px; left: 20px; width: 120px; height: 78px;">'
					+ '<div name="title" class="bp-item bp-title" style= "left: 2px; bottom: 4px;top: 10px; width: 100px; height: 50px;"><textarea disabled style="width: 100px; height: 77px; text-align: left; font-size: 11px; font-family: Arial; border: 1px solid;border-color: transparent;background:{{itemConfig.itemTitleColor}}">{{itemConfig.title}}</textarea></div>'
				+ '</div>'
				+ '<div class="bp-item bp-corner-all" style="color: #000 ;background: #fff; bottom: 2px; right: 1px; width: 15px; height: 10px; font-size: 8px">'
					+ '<div style="padding: 0px 3px 0px 1px;">{{itemConfig.title.substring(0,1)}}{{itemConfig.id}}</div>'
				+ '</div>'
				+ '<div ng-show="itemConfig.tiene_puesto" class="bp-item bp-corner-all" style="color: #f08113 ;background: #FFC1100; top: 3px; left: 3px; width: 15px; height: 10px; font-size: 14px">'
					+ '<div style="padding: 0px 1px 0px 1px;"><i class="fa fa-user"></i></div>'
				+ '</div>'
				+ '<div class="bp-item" style="top: 15px; left:1px; width: 18px; height: 62px; padding: 0px">'
					+ '<div ng-repeat="item in itemConfig.asociados" style="color: #fff; display: block; background: {{items_l[item].itemTitleColor}}; border: 1px solid; border-radius: 4px; padding: 0px; width: 16px; height: 12px;font-size: 8px; margin: 2px;">'
						+ '{{items_l[item].title.substring(0,1)}}{{items_l[item].id}}'
					+ '</div>'
				+ '</div>'
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
				+' <div name="icon" class="bp-item" style="color:#3aa4c2; text-align: center; top: 25px; left:5px; width: 13px; height: 13px;font-size: 14px;"><i class="fa fa-info-circle"></i></div>'
				+ '<div name="description" class="bp-item" style="top: 25px; left: 20px; width: 190px; height: 45px; font-size: 11px;">{{itemConfig.description}}</div>'
				+ '<div name="icon" class="bp-item" style="color:#f08113; text-align: center; top: 48px; left:7px; width: 15px; height: 15px;font-size: 14px;"><i class="fa fa-user"></i></div>'
				+ '<div class="bp-item bp-photo-frame" style="top: 66px; left: 5px; width: 210px; height: 45px; overflow-x:hidden; overflow-y:scroll;">'
					+ '<div><ul style="list-style-type: none; padding: 2px 2px 2px 10px" ng-repeat="puesto in listapuestos"><li>-{{puesto}}</li></div>'
				+ '</div>'
			+ '</div>'
			
			
		
			

		).css({
			width: result.itemSize.width + "px",
			height: result.itemSize.height + "px"
		}).addClass("bp-item bp-corner-all bt-item-frame");
		result.itemTemplate = itemTemplate.wrap('<div>').parent().html();
		return result;
    }

	
	//Detecta el evento de cambiar la página y obtiene la lista de puestos seleccionados para refrescar la información 
    window.updatedata2 = function(datos) {
        $scope.$apply(function(){
        	listaPuestosEnIndicador($scope.puesto_seleccionado);
        });
    };
      

}]);//Fin del controlador

		
angular.module('BasicPrimitives', [], function ($compileProvider) {
			
	$compileProvider.directive('bpIndDiagram', function ($compile) {

		function link(scope, element, attrs) {
			var itemScopes = [];
			var config = new primitives.orgdiagram.Config();

			angular.extend(config, scope.options);


			config.onItemRender = onTemplateRender;
			//config.onCursorChanged = onCursorChanged;
			config.onHighlightChanged = onHighlightChanged;

			

			var chart = jQuery(element).orgDiagram(config);
			
			$('#toggle-colapsar').change(function() {
			    var msg= $(this).prop('checked');
			    	
			    if(msg==false){
			    	chart.orgDiagram({
			    		pageFitMode : primitives.orgdiagram.PageFitMode.FitToPage
			    		
		                  
		                });
			    	
			    	
			    }
			    else{
			    	chart.orgDiagram({
			    		pageFitMode : primitives.orgdiagram.PageFitMode.None
		                  
		                });
			    	
			    	
			    }
			    chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
			  });

		
		
	   
		    $('#toggle-tipo').change(function() {
		    var msg= $(this).prop('checked');
		    	
		    if(msg==false){
		    	chart.orgDiagram({
		    		hasButtons: primitives.common.Enabled.Auto
	                  
	                });
		    	
		    	
		    }
		    else{
		    	chart.orgDiagram({
		    		hasButtons: primitives.common.Enabled.False
	                  
	                });
		    	
		    	
		    }
		    chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
		  });

			
			$("#slider").slider({
		        value: 2,
		        min: 1,
		        max: 4,
		        step: 1,
		        
		        slide: function (event, ui) {
		        	 
		        	chart.orgDiagram({
		                defaultTemplateName: "Zoom" + ui.value
		            });
		    /*    	
		      if(ui.value<=2){
		        	 chart.orgDiagram({
		        		 hasButtons : primitives.common.Enabled.False
		                  
		                });
		      }
		      else{
		    	  chart.orgDiagram({
		        		 hasButtons : primitives.common.Enabled.Auto
		                  
		                });
		      }
		      */
		            chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
		        }
		    });	
		
			 
			 jQuery("#Top").click(function (e) {
	                chart.orgDiagram({
	                    orientationType: primitives.common.OrientationType.Top,
	                    horizontalAlignment: primitives.common.HorizontalAlignmentType.Center
	                });
	                chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
	            });

			jQuery("#Left").click(function (e) {
				    chart.orgDiagram({
                       orientationType: primitives.common.OrientationType.Top,
                       horizontalAlignment: primitives.common.HorizontalAlignmentType.Center
                    });
                    chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
				     
				     chart.orgDiagram({
	                    orientationType: primitives.common.OrientationType.Left,
	                    horizontalAlignment: primitives.common.HorizontalAlignmentType.Left
	                });
	                chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
	            });

	            jQuery("#Right").click(function (e) {
	            	chart.orgDiagram({
	                       orientationType: primitives.common.OrientationType.Top,
	                       horizontalAlignment: primitives.common.HorizontalAlignmentType.Center
	                    });
	                    chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
					    
	            	
	            	
	            	chart.orgDiagram({
	                    orientationType: primitives.common.OrientationType.Rigth,
	                    horizontalAlignment: primitives.common.HorizontalAlignmentType.Left
	                });
	                chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
	            });

	            jQuery("#Bottom").click(function (e) {
	                chart.orgDiagram({
	                    orientationType: primitives.common.OrientationType.Bottom,
	                    horizontalAlignment: primitives.common.HorizontalAlignmentType.Center
	                });
	                chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
	            });

			scope.$watch('options.highlightItem', function (newValue, oldValue) {
				var highlightItem = chart.orgDiagram("option", "highlightItem");
				if (highlightItem != newValue) {
					chart.orgDiagram("option", { highlightItem: newValue });
					chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.PositonHighlight);
				}
			});

			scope.$watch('options.cursorItem', function (newValue, oldValue) {
				var cursorItem = chart.orgDiagram("option", "cursorItem");
				if (cursorItem != newValue) {
					chart.orgDiagram("option", { cursorItem: newValue });
					chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
				}
			});

			scope.$watchCollection('options.items', function (items) {
				chart.orgDiagram("option", { items: items });
				chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
			});
			
			//Función para recivir el evento que indica el cambio de página y pinta el indicador de puestos asociados "P"
			window.updatedata = function(datos) {
				scope.$apply(function(){
					chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
				});
			};

			//Función para el render de cada item
			function onTemplateRender(event, data) {
				var itemConfig = data.context;
				switch (data.renderingMode) {
					case primitives.common.RenderingMode.Create://Modo Nuevo Item
						var itemScope = scope.$new();
						itemScope.itemConfig = itemConfig;
						itemScope.items_l = scope.options.items;
						itemScope.cursorItem_l = scope.options.cursorItem;
						$compile(data.element.contents())(itemScope);
						if(tiene_puestos(itemScope.itemConfig.id)){
							itemScope.itemConfig.tiene_puesto = true;
						}
						else{
							itemConfig.tiene_puesto = false;
						}
						if (!scope.$parent.$$phase) {
								itemScope.$apply();
						}
						data.element.draggable({//Propiedades del drag del nuevo elemento
							revert: "invalid",
							containment: "document",
							appendTo: "body",
							helper: "clone",
							cursor: "move",
							"zIndex": 10000,
							delay: 300,
							distance: 10,
							start: function (event, ui) {
								fromValue = parseInt(jQuery(this).attr("data-value"), 10);
								fromChart = "orgdiagram";
							}
						});
						data.element.droppable({//Propiedades del drop del nuevo elemento
							greedy: true,
							drop: function (event, ui) {
								if (!event.cancelBubble) {
									console.log("Drop accepted!");
									toValue = parseInt(jQuery(this).attr("data-value"), 10);
									toChart = "orgdiagram";
									Reparent(fromChart, fromValue, toChart, toValue);
									primitives.common.stopPropagation(event);
								} else {
									  console.log("Drop ignored!");
								}
							},
							over: function (event, ui) {
								toValue = parseInt(jQuery(this).attr("data-value"), 10);
								toChart = "orgdiagram";
								jQuery("#orgdiagram").orgDiagram({ "highlightItem": toValue });
								jQuery("#orgdiagram").orgDiagram("update", primitives.common.UpdateMode.PositonHighlight);
							},
							accept: function (draggable) {

								return (jQuery(this).css("visibility") == "visible");
							}
						});
						itemScopes.push(itemScope);
					break;
					case primitives.common.RenderingMode.Update:
						/* Update widgets here */
						var itemScope = data.element.contents().scope();
						if(tiene_puestos(itemConfig.id)){
							itemConfig.tiene_puesto = true;
						}else{
							itemConfig.tiene_puesto = false;
						}
						itemScope.itemConfig = itemConfig;
						itemScope.items_l = scope.options.items;
						itemScope.cursorItem_l = scope.options.cursorItem;
					break;
				}
				var itemConfig = data.context;

				data.element.attr("data-value", itemConfig.id);
				//RenderField(data, itemConfig);//Ya no es necesario

			}//Fin de la función para el render de cada item


			//Función para recolocar el elemento movido con su padre
			function Reparent(fromChart, value, toChart, toParent) {
				/* following verification needed in order to avoid conflict with jQuery Layout widget */

				for (var index = 0; index < items.length; index++) {
					var child = items[index];
				}

				if (fromChart != null && value != null && toChart != null) {
					console.log("Reparent fromChart:" + fromChart + ", value:" + value + ", toChart:" + toChart + ", toParent:" + toParent);
					var item = items[value];
					var fromItems = jQuery("#" + fromChart).orgDiagram("option", "items");
					var toItems = jQuery("#" + toChart).orgDiagram("option", "items");
					if (toParent != null) {
						var toParentItem = items[toParent];
						if (!isParentOf(item, toParentItem)) {

							var children = getChildrenForParent(item);
							children.push(item);
					 		for (var index = 0; index < children.length; index++) {
								var child = children[index];
								fromItems.splice(primitives.common.indexOf(fromItems, child), 1);
								toItems.push(child);
							}
							item.parent = toParent;
						} else {
							console.log("Droped to own child!");
						}
					} else {
						var children = getChildrenForParent(item);
						children.push(item);
						for (var index = 0; index < children.length; index++) {
							var child = children[index];
							fromItems.splice(primitives.common.indexOf(fromItems, child), 1);
							toItems.push(child);
						}
						item.parent = null;
					}
				}
				for (var i = 0; i < items.length; i++) {
					items[i].id = i;
				};
				chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Recreate);
				scope.$apply();
			}
			//Fin de la función para recolocar el elemento movido con su padre

			//Función para obtener los hijos del elemento movido
			function getChildrenForParent(parentItem) {
				var children = {};
				for (var id in items) {
					var item = items[id];
					if (children[item.parent] == null) {
						children[item.parent] = [];
					}
					children[item.parent].push(id);
				}
				var newChildren = children[parentItem.id];
				var result = [];
				if (newChildren != null) {
					while (newChildren.length > 0) {
						var tempChildren = [];
						for (var index = 0; index < newChildren.length; index++) {
							var item = items[newChildren[index]];
							result.push(item);
							if (children[item.id] != null) {
								tempChildren = tempChildren.concat(children[item.id]);
							}
						}
						newChildren = tempChildren;
					}
				}
				return result;
			}//Fin de la función para obtener los hijos del elemento movido

			function isParentOf(parentItem, childItem) {
				var result = false,
					index,
					len,
					itemConfig;
				if (parentItem.id == childItem.id) {
					result = true;
				} else {
					while (childItem.parent != null) {

						childItem = items[childItem.parent];
						if (childItem.id == parentItem.id) {
							result = true;
							break;
						  }
					 }
				}
				return result;
			};


			function ResizePlaceholder() {
				var panel = jQuery("#centerpanel");
				var panelSize = new primitives.common.Rect(0, 0, panel.innerWidth(), panel.innerHeight());
				var position = new primitives.common.Rect(0, 0, panelSize.width / 2, panelSize.height);
				position.offset(-2);
				var position2 = new primitives.common.Rect(panelSize.width / 2, 0, panelSize.width / 2, panelSize.height);
				position2.offset(-2);

				jQuery("#orgdiagram").css(position.getCSS());
			}

			function onButtonClick(e, data) {
				scope.onButtonClick();
				scope.$apply();
			}

			function onCursorChanged(e, data) {
				scope.options.cursorItem = data.context ? data.context.id : null;
				scope.onCursorChanged();
				scope.$apply();
			}

			function onHighlightChanged(e, data) {
				scope.options.highlightItem = data.context ? data.context.id : null;
				scope.onHighlightChanged();
				scope.$apply();
			}

			element.on('$destroy', function () {
				/* destroy items scopes */
				for (var index = 0; index < scopes.length; index++) {
					 itemScopes[index].$destroy();
				}

				/* destory jQuery UI widget instance */
				chart.remove();
			});
		};
	return {
		scope: {
			options: '=options',
			onCursorChanged: '&onCursorChanged',
			onHighlightChanged: '&onHighlightChanged',
			listapuestos: '=listapuestos',
		},
		link: link
	};
});
});
