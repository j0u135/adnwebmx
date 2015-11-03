angular.module('CulturaServicesModule', [])

.factory('Cultura', function ($http) {
	var funciones = {
		getCulturaDetalle: function (){
			var promise = 
				$http({
					method: 'GET',
					url: 'getCulturaDetalle'
				}).then(function (response){
					return response.data;
				})
			return promise;
		},
		editarItemCultura: function(item){
			var promise =
			$http({
				method: 'POST',
				url: 'editarItemCultura',
				data: item
			}).then(function (response){
				return response.data;
			})
			return promise;
		},
		nuevoItemCultura: function(item){
			var promise =
				$http({
					method:'POST',
					url: 'nuevoItemCultura',
					data: item
				}).then(function (response){
					return response.data;
				})
			return promise;
		},
		eliminaItemCultura: function(item){
			var promise =
			$http({
				method: 'POST',
				url: 'eliminaItemCultura',
				data: item
			}).then(function (response){
				return response.data;
			})
			return promise;
		}
	}
	return funciones;
})