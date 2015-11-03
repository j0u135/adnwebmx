angular.module('CommonsServices',[])

.factory('DepAreaPuestoService', function($http){

	var funciones = {

		cargaInicio: function(){
			var promise = 
				$http({method : 'GET', url : 'getAreas'})
					.then( function(response) {
						return response.data;
					});
			return promise
		},
		cargaDepartamentos: function(area){
			var promise = 
				$http({method : 'POST', url : 'getDepartamentos', 
					data: {idArea:area}})
						.then(function(response){
							return response.data;
						});
			return promise;
		},
		cargaPuestos: function(departamento){
			var promise = 
				$http({method : 'POST', url : 'getPuestos', 
					data: {id_Departamento:departamento}})
						.then(function(response){
							return response.data;
						});
			return promise;
		},
	}
	
	return funciones;
}) 