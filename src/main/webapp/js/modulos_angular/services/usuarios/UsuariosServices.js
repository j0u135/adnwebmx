angular.module('UsuarioServices', [])

.factory('ObtenerUsuariosService', function($http){

	var funciones = {

		getUsuariosByPuesto: function(puesto){
			var promise =
			$http({
				method: 'POST',
				url: 'getUsusariosByPuesto',
				data: {
					idPuesto: puesto
				}
			}).then(function(response){
				return response.data;
			})
			return promise;
		},

	}
	return funciones;

})

