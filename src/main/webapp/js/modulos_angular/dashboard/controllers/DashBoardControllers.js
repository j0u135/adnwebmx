angular.module('DashBoardControllers', ['IndicadoresInteligentesServices', 'HojaRutaServices'])

.controller('MainController', ['$scope', 'getIndicadoresService', 'DatosGeneralesHojaRutaService', function($scope, getIndicadoresService, DatosGeneralesHojaRutaService){

	/*****************Modelos*********************/
	$scope.lista_indicadores = [];
	$scope.indicador_seleccionado = null;
	$scope.lista_resultados = "";
	$scope.lista_years = [];
	$scope.year_seleccionado = "";
	$scope.lista_data = [];

	$scope.catalogoMeses = [
		'Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'
	];
	/*****************Modelos*********************/


	/******************** Funciones Locales ******************/
	var obtenerResultadosData12Meses = function(lista_meses){
		var data = [];
		for (var i = 0; i < 12; i++){
			var encontrado = false;
			for (var j = 0; j < lista_meses.length; j++){
				if( i+1 == lista_meses[j].mes){
					data.push(lista_meses[j].resultado);
					encontrado = true;
				}
			}
			if(encontrado == false){
				data.push(0);
			}
		}
		return data;
	}
	/******************** Funciones Locales ******************/


	/****************Funciones Expuestas**********************/
	$scope.getIndicadores = function(){
		getIndicadoresService.getIndicadores()
			.then(function (d){
				$scope.lista_indicadores = d;
			})
	}

	$scope.getIndicadorResultados = function(id_indicador, year){
		getIndicadoresService.getIndicadorResultados(id_indicador, year)
			.then(function (d){
				$scope.lista_resultados = d;
				$scope.lista_data.push(obtenerResultadosData12Meses($scope.lista_resultados.meses));
			})
	}

	$scope.changeSelectIndicador = function(){
		$scope.lista_resultados = "";
		$scope.lista_data = [];
		if( $scope.year_seleccionado != "" && $scope.year_seleccionado != null ){
			$scope.getIndicadorResultados($scope.indicador_seleccionado, $scope.year_seleccionado);
		}
	}

	$scope.getYears = function(){
		DatosGeneralesHojaRutaService.getYears()
			.then(function (d){
				$scope.lista_years = d;
			})
	}

	$scope.changeSelectYear = function(){
		$scope.lista_resultados = "";
		$scope.lista_data = [];
		if( $scope.indicador_seleccionado != "" && $scope.indicador_seleccionado != null ){
			$scope.getIndicadorResultados($scope.indicador_seleccionado, $scope.year_seleccionado);			
		}
	}


	/****************Funciones Expuestas**********************/


	/*******************Ejecuciones de Inicio*******************/
	$scope.getYears();
	$scope.getIndicadores()
	/*******************Ejecuciones de Inicio*******************/

}])