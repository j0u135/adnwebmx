angular.module('InicioControllers', ['PresentacionInicialServices'])

.controller('MainController', ['$scope', '$sce', 'PresentacionInicial', function($scope, $sce, PresentacionInicial){

	/************ Modelos ************/
	$scope.presentacion_activa;
	$scope.presentaciones;
	$scope.presentacion_seleccionada;
	$scope.bandera_editar = false;
	$scope.presentacion_editable = {};
	$scope.nueva_presentacion = {'activo': false};
	$scope.vista_editar = true;
	$scope.lista_errores = [];
	$scope.error = "";
	/************ Modelos ************/



	/************ Funciones Auxiliares ************/

	var actualizaPresentaciones = function(){
		$scope.getPresentaciones();
		$scope.getPresentacionActiva();
	}

	var validaCampos = function(presentacion){
		if(presentacion.descripcion == "" || presentacion.descripcion == null || presentacion.descripcion == undefined){
			$scope.lista_errores.push("Descripci\u00F2n.");
		}
		if(presentacion.url == "" || presentacion.url == null || presentacion.url == undefined){
			$scope.lista_errores.push("URL.");
		}
	}
	/************ Funciones Auxiliares ************/



	/************ Funciones Expuestas ************/

	$scope.getPresentacionActiva = function(){
		PresentacionInicial.getPresentacionActiva()
			.then(function(d){
				$scope.presentacion_activa = d;
			})
	}

	$scope.getPresentaciones = function(){
		PresentacionInicial.getPresentaciones()
			.then(function(d){
				$scope.presentaciones = d;
			})
	}

	$scope.ventanaPresentaciones = function(){
		$scope.presentacion_seleccionada = "";
		$scope.bandera_editar = false;
		$scope.presentacion_editable = {};
		$scope.getPresentaciones();
		$scope.vista_editar = true;
		$scope.nueva_presentacion = {'activo': false};
		$scope.lista_errores = [];
	}
	
	$scope.seleccionarPresentacion = function(index){
		if($scope.bandera_editar != true){
			$scope.presentacion_seleccionada = index;
		}
	}

	$scope.editarPresentacion = function(presentacion){
		$scope.bandera_editar = true;
		$scope.presentacion_editable = angular.copy(presentacion);
	}

	$scope.cancelaEditarPresentacion = function(){
		$scope.bandera_editar = false;
		$scope.presentacion_editable = {};
		$scope.lista_errores = [];
	}

	$scope.guardarPresentacion = function(presentacion){
		validaCampos(presentacion);
		if($scope.lista_errores.length == 0){
			PresentacionInicial.guardarPresentacion(presentacion)
				.then(function(d){
					actualizaPresentaciones();
					$scope.bandera_editar = false;
					$scope.presentacion_editable = {};
					$scope.lista_errores = [];
				});
		}
		else{
			$scope.error = "Los siguientes campos son obligatorios:";
		}
	}

	$scope.activarPresentacion = function(presentacion){
		presentacion.activo = true;
		$scope.guardarPresentacion(presentacion);
	}

	$scope.newPresentacionInicial = function(presentacion){
		validaCampos(presentacion);
		if($scope.lista_errores.length == 0){
			PresentacionInicial.newPresentacionInicial(presentacion)
				.then(function(d){
					actualizaPresentaciones();
					$scope.nueva_presentacion = {'activo': false};
					$scope.vista_editar = true;
					$scope.lista_errores = [];
				});
		}
		else {
			$scope.error = "Los siguientes campos son obligatorios:";
		}
	}

	$scope.cancelarNewPresentacion = function(){
		$scope.nueva_presentacion = {'activo': false};
		$scope.vista_editar = true;
		$scope.lista_errores = [];
	}

	$scope.deletePresentacionInicial = function(presentacion){
		PresentacionInicial.deletePresentacionInicial(presentacion)
			.then(function(d){
				actualizaPresentaciones();
			})
	}

	$scope.trustSrc = function(src) {
    	return $sce.trustAsResourceUrl(src);
  	}
  	

	/************ Funciones Expuestas ************/



	/************ Ejecuciones de arranque ************/

	$scope.getPresentacionActiva();

	/************ Ejecuciones de arranque ************/

}])