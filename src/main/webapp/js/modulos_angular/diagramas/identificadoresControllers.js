angular.module('indicadores.controllers', ['BasicPrimitives_2'])

/*Variable Global para cada uno de los Items*/
var items = [];
var experimento = 33;
var ItemSeleccionado_Obj = null;
var deptos =[];

//Inicia controlador AngularJs
.controller('controllerADN', function ($scope,$window) {
	
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
			var item = items[$scope.myOptions.cursorItem]
			item.itemTitleColor = '#'+hex;
			$scope.$apply();
		}
	});
	
	//Selección de Depto
	$scope.selDepto = function(){
		var valor = $(this).val();
        alert(valor);
        var item = items[$scope.myOptions.cursorItem]
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
	$scope.myOptions = options;

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
		$scope.myOptions.items[item_id].asociados.splice(id_eliminar, 1);
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
	
	setColorInicial = function (index) {
		var item = items[index];
		$('.color-box').css('background-color', item.itemTitleColor);

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

			$scope.myOptions.items.splice(index, 1);
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
		//$scope.myOptions.items.splice(index, 0, new primitives.orgdiagram.ItemConfig({
		//Se cambia el indice al agregar un item, del indice del padre +1 (index) por la longitud +1 (id)
		$scope.myOptions.items.splice(id, 0, new primitives.orgdiagram.ItemConfig({
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
				+'<div name="icon" class="bp-item" style="color:#3aa4c2; text-align: center; top: 25px; left:5px; width: 13px; height: 13px;font-size: 14px;"><i class="fa fa-info-circle"></i></div>'
				+ '<div name="description" class="bp-item" style="top: 25px; left: 20px; width: 190px; height: 45px; font-size: 11px;">{{itemConfig.description}}</div>'
				+ '<div class="bp-item bp-photo-frame" style="top: 66px; left: 5px; width: 210px; height: 45px;"></div>'
				+'<div name="icon" class="bp-item" style="color:#f08113; text-align: center; top: 68px; left:7px; width: 15px; height: 15px;font-size: 14px;"><i class="fa fa-user"></i></div>'
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
      

});