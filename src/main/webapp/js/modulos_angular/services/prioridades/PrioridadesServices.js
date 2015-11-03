angular.module('PrioridadesServices', [])

.factory('Prioridades', function($http){

	var funciones = {

		getPrioridadesByUsuarioYYear: function(usuario, year){
			var promise =
			$http({
				method:'POST',
				url: 'getPrioridadesByUsuarioYYear',
				data: {
						usuario: {User: usuario},
						year: year
					}
				}
			).then(function(response){
				return response.data;
			})
			return promise;
		},

	}

	return funciones;

})