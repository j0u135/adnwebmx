angular.module('DSHRControllers')

.controller('InputController', ['$scope', 'DepAreaPuestoService', 'DatosGeneralesHojaRutaService', 'ObtenerUsuariosService',
	function($scope, DepAreaPuestoService, DatosGeneralesHojaRutaService, ObtenerUsuariosService){

	selecciones = $scope.selecciones;
	tablas = $scope.tablas;
	alertas = $scope.alertas;
	visuales = $scope.visuales;
	constantes = $scope.constantes;

	/********************* Modelos ***********************************/ 
	$scope.combos = {};
	/********************* Modelos ***********************************/ 


	/************** Funciones Internas ************************/
	var mensajeAlerta = function(mensaje, tipo){
		alertas.bandera = true;
		alertas.mensaje = mensaje;
		alertas.tipo = tipo;
	}
	
	var validacionComboAreas = function(){
		if( $scope.combos.area.length <= 0){
			var vacio = {'idArea':constantes.NO_EXISTE, 'area':'NO EXISTEN AREAS'};
			$scope.combos.area.push(vacio);
			selecciones.area = constantes.NO_EXISTE;
			mensajeAlerta("No existen areas dadas de alta en la aplicación." , "alert-info");
		}
		else{
			if($scope.combos.area.length == 1){
				selecciones.area = $scope.combos.area[0].idArea;
				$scope.changeAreas();
			}
		}
	}

	var validacionComboDepartamentos = function(){
		if( $scope.combos.departamento.length <= 0){
			var vacio = {'id_Departamento':constantes.NO_EXISTE, 'nb_Departamento':'NO EXISTEN DEPARTAMENTOS'};
			$scope.combos.departamento.push(vacio);
			selecciones.departamento = constantes.NO_EXISTE;
			mensajeAlerta("No existen departamentos para el área seleccionada.", "alert-info");
		}else{
			if($scope.combos.departamento.length == 1){
				selecciones.departamento = $scope.combos.departamento[0].id_Departamento;
				$scope.changeDepartamentos();
			}
			else{
				var todos = {'id_Departamento':constantes.TODOS, 'nb_Departamento':'Todos'};
				$scope.combos.departamento.push(todos);
			}
		}
	}

	var validacionComboPuestos = function(){
		if( $scope.combos.puesto.length <= 0){
			var vacio = {'idPuesto':constantes.NO_EXISTE, 'nb_Puesto':'NO EXISTEN PUESTOS'};
			$scope.combos.puesto.push(vacio);
			selecciones.puesto = constantes.NO_EXISTE;
			mensajeAlerta("No existen puestos para el departamento seleccionado.", "alert-info");
		}else{
			if($scope.combos.puesto.length == 1){
				selecciones.puesto = $scope.combos.puesto[0].idPuesto;
				$scope.changePuestos();
			}
			else{
				var todos = {'idPuesto':constantes.TODOS, 'nb_Puesto':'Todos'};
				$scope.combos.puesto.push(todos);
			}
		}
	}

	var validacionComboUsuarios = function(){
		if( $scope.combos.usuario.length <= 0){
			var vacio = {'User':constantes.NO_EXISTE, 'Nombre':'NO EXISTEN USUARIOS'};
			$scope.combos.usuario.push(vacio);
			selecciones.usuario = constantes.NO_EXISTE;
			mensajeAlerta("No existen usuarios para el puesto seleccionado.", "alert-info");
		}
		else{
			if($scope.combos.usuario.length == 1){
				selecciones.usuario = $scope.combos.usuario[0].User;
				$scope.changeUsuarios();
			}
		}
	}

	var limpiaTablas = function(){
		tablas.hoja_ruta = [];
		tablas.ni = [];
		tablas.prioridad = [];
		visuales.mostrar_grafica = false;
	}

	var limpiarAlertas = function (){
		alertas.bandera = false;
		alertas.mensaje = "";
		alertas.lista_errores = [];
	}

	var limpiarChangeAreas = function(){
		$scope.combos.departamento = [];
		selecciones.departamento = null;
		limpiarChangeDepartamentos();
		limpiarAlertas();
		limpiaTablas();
	}

	var limpiarChangeDepartamentos = function(){
		$scope.combos.puesto = [];
		selecciones.puesto = null;
		limpiarChangePuestos();
		limpiarAlertas();
		limpiaTablas();	
	}

	var limpiarChangePuestos = function(){
		$scope.combos.usuario = [];
		selecciones.usuario = null;
		limpiarChangeUsuarios();
		limpiarAlertas();
		limpiaTablas();	
	}

	var limpiarChangeYears = function(){
		limpiaTablas();	
		limpiarAlertas();
	}


	var limpiarChangeUsuarios = function(){
		limpiarAlertas();
		limpiaTablas();
	}
	/************** Funciones Internas ************************/


	/************** Funciones Expuestas ************************/
	$scope.getAreas = function(){
		DepAreaPuestoService.cargaInicio().then(function(d){
			$scope.combos.area = d;
			validacionComboAreas();
		});
	}

	$scope.getYears = function(){
		DatosGeneralesHojaRutaService.getYears().then(function(d){
			$scope.combos.year = d;
			if( $scope.combos.year.length == 1){
				selecciones.year = $scope.combos.year[0];
			}
		})
	}

	$scope.changeAreas = function(){
		limpiarChangeAreas();
		DepAreaPuestoService.cargaDepartamentos(selecciones.area).then(function(d){
			$scope.combos.departamento = d;
			validacionComboDepartamentos();
		});
	};

	$scope.changeDepartamentos = function(){
		limpiarChangeDepartamentos()
		if(selecciones.departamento != constantes.TODOS){
			DepAreaPuestoService.cargaPuestos(selecciones.departamento).then(function(d){
				$scope.combos.puesto = d;
				validacionComboPuestos();
			})
		}
	};

	$scope.changePuestos = function(){
		limpiarChangePuestos();
		if(selecciones.puesto != constantes.TODOS){
			ObtenerUsuariosService.getUsuariosByPuesto(selecciones.puesto)
			.then(function(d){
				$scope.combos.usuario = d;
				validacionComboUsuarios();
			});
		}
	}

	$scope.changeYears = function(){
		limpiarChangeYears();
	}

	$scope.changeUsuarios = function(){
		limpiarChangeUsuarios();
	}

	$scope.getResultadoMes = function(meses, indice){
		for(var i = 0; i < meses.length; i++){
			if(meses[i].mes == indice){
				return meses[i].resultado;
			}
		}
		return "-";
	}

	$scope.getidIndIntMes = function(meses, indice){
		for(var i = 0; i < meses.length; i++){
			if(meses[i].mes == indice){
				return meses[i].idIndInte;
			}
		}
		return 0;
	}
	/************** Funciones Expuestas ************************/


	/************** Funciones lanzadas desde el inicio ************************/
	$scope.getAreas();
	$scope.getYears();

}])