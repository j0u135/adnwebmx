angular.module('PresentacionInicialServices', [])

.factory('PresentacionInicial', function($http){
	var funciones = {
		getPresentacionActiva: function(){
			var promise = 
			$http({
				method: 'GET',
				url: 'getPresentacionActiva'
			}).then(function(response){
				return response.data;
			})
			return promise;
		},
		getPresentaciones: function(){
			var promise =
			$http({
				method: 'GET',
				url: 'getPresentaciones'
			}).then(function(response){
				return response.data;
			})
			return promise;
		},
		guardarPresentacion: function(presentacion){
			var promise =
			$http({
				method: 'POST',
				url: 'guardarPresentacion',
				data: presentacion
			}).then(function(response){
				return response.data;
			});
			return promise;
		},
		newPresentacionInicial: function(presentacion){
			var promise =
			$http({
				method: 'POST',
				url: 'newPresentacionInicial',
				data: presentacion
			}).then(function(response){
				return response.data;
			})
			return promise;
		},
		deletePresentacionInicial: function(presentacion){
			var promise =
			$http({
				method: 'POST',
				url: 'deletePresentacionInicial',
				data: presentacion
			}).then(function(response){
				return response.data;
			})
			return promise;
		},
	}
	return funciones;
})