angular.module('CulturaController', ['CulturaServicesModule'])

.controller('culturaMainController', ['$scope', 'Cultura', function ($scope, Cultura) {

	/************* Modelos ************/
	$scope.lista_valores = {};
	$scope.lista_principios = {};
	$scope.lista_misiones = {};
	$scope.lista_editable = {};
	$scope.vista;
	$scope.vista_texto;
	$scope.item_seleccionado;
	$scope.bandera_editar = false;
	$scope.item_editable = {};
	$scope.nuevo_item = {};
	$scope.vista_editar = true;
	/************* Modelos ************/

	/************* Funciones Locales ************/
	var seleccionaVista = function(id_vista){
		switch(id_vista) {
		    case 1:
		        $scope.lista_editable = $scope.lista_valores;
				$scope.vista_texto = "Valores";
		        break;
		    case 2:
		        $scope.lista_editable = $scope.lista_principios;
				$scope.vista_texto = "Principios";
		        break;
		    case 3:
		        $scope.lista_editable = $scope.lista_misiones;
				$scope.vista_texto = "Misiones";
		        break;
		    default:
		    	break;
		}
	}

	$scope.seleccionarDetalle = function(index){
		if($scope.bandera_editar != true){
			$scope.item_seleccionado = index;
		}
	}
	/************* Funciones Locales ************/

	/************* Funciones Expuetas ************/
	$scope.getCulturaDetalle = function (){
		Cultura.getCulturaDetalle()
			.then(function (d){
				$scope.lista_valores = d.valores;
				$scope.lista_principios = d.principios;
				$scope.lista_misiones = d.misiones;
				seleccionaVista($scope.vista);
			})
	}

	$scope.editarItemCultura = function(item){
		Cultura.editarItemCultura(item)
			.then(function (d){
				$scope.getCulturaDetalle();
				$scope.bandera_editar = false;
				$scope.item_editable = {};
			})
	}

	$scope.iniciaVentanaEditar = function(id_vista){
		$scope.item_seleccionado = 0;
		$scope.bandera_editar = false;
		$scope.item_editable = {};
		$scope.item_nuevo = {};
		$scope.vista_editar = true;
		$scope.vista = id_vista;
		seleccionaVista(id_vista);
	}

	$scope.camposEditarItem = function(item){
		$scope.bandera_editar = true;
		$scope.item_editable = angular.copy(item);
	}

	$scope.cancelaEditarItem = function(){
		$scope.bandera_editar = false;
		$scope.item_editable = {};
	}

	$scope.cancelarNuevoItem = function(){
		$scope.nuevo_item = {};
		$scope.vista_editar = true;
	}

	$scope.nuevoItemCultura = function(item){
		item.tipo = $scope.vista;
		Cultura.nuevoItemCultura(item)
			.then(function (d){
				$scope.getCulturaDetalle();
				$scope.nuevo_item = {};
				$scope.vista_editar = true;
			})
	}

	$scope.eliminaItemCultura = function(item){
		Cultura.eliminaItemCultura(item)
			.then(function (d){
				$scope.getCulturaDetalle();
				$scope.nuevo_item = {};
				$scope.vista_editar = true;
			})
	}

	/************* Funciones Expuetas ************/

	/************* Arranque ************/
	$scope.getCulturaDetalle();
	/************* Arranque ************/

}])