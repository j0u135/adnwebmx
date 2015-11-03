angular.module('IndicadoresInteligentesServices', [])

.factory('getIndicadoresService', function($http){

	var funciones ={

		getIndicadoresByUsuarioYYear: function(usuario, year){
			var promise = 
				$http({
					method: 'POST',
					url: 'getIndicadoresByUsuarioYear',
					data:{
						usuario: {User: usuario},
						year: year
					}
				}).then(function(response){
					return response.data;
				});
			return promise;
		},
		getIndicadoresMesesByUsuarioYYear: function(usuario, year){
			var promise = 
				$http({
					method: 'POST',
					url: 'getIndicadoresMesesByUsuarioYYear',
					data:{
						usuario: {User: usuario},
						year: year
					}
				}).then(function(response){
					return response.data;
				});
			return promise;
		},
		getIndicadores: function(){
			var promise =
				$http({
					url: 'getIndicadores',
					method: 'GET'
				}).then(function (response){
					return response.data;
				});
			return promise;
		},
		getIndicadorResultados: function(id_indicador, year){
			console.log(year);
			var promise =
				$http({
					url: 'getIndicadorResultados',
					method: 'POST',
					data: {
						idIndicador: id_indicador,
						year: year
					}
				}).then(function (response){
					return response.data;
				});
			return promise;
		}
	}
	return funciones;

})