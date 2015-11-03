angular.module('HojaRutaServices', [])

.factory('DatosGeneralesHojaRutaService', function($http){
	var funciones = {

		getYears: function(){
			var promise = 
			$http({	method: 'GET',
					url: 'getYearsHojaRuta'})
				.then(function(response){
					return response.data;
				});
			return promise;
		},
		getHojasByUsuarioYYear: function(usuario, year){
			var promise = 
				$http({
					method: 'POST',
					url: 'getHojaRumboByUsuarioYYear',
					data:{
						usuario: {User: usuario},
						year: year
					}
				}).then(function(response){
					return response.data;
				});
			return promise;
		},
		getHojaRutaByDepartamentoYYear: function(departamento, year){
			var promise = 
				$http({
					method: 'POST',
					url: 'getHojaRutaByDepartamentoYYear',
					data:{
						id_departamento: departamento,
						year: year
					}
				}).then(function(response){
					return response.data;
				});
			return promise;	
		},
		getHojaRutaByAreaYYear: function(area, year){
			var promise=
				$http({
					method:'POST',
					url: 'getHojaRutaByAreaYYear',
					data: {
						area: area,
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