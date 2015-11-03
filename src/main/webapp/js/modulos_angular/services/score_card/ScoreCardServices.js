angular.module('ScoreCardServices', [])

.factory('ScoreCard', function($http){
	var funciones ={
		getScoreCard: function(){
			var promise = 
				$http({
					method: 'GET',
					url: 'getScoreCard'
				}).then(function (response){
					return response.data;
				});
			return promise;
		},
		editarScoreCard: function(card){
			var promise =
				$http({
					method: 'POST',
					url: 'editarScoreCard',
					data: card
				}).then(function (response){
					return response.data;
				});
			return promise;
		},
		crearScoreCard: function(card){
			var promise =
				$http({
					method: 'POST',
					url: 'crearScoreCard',
					data: card
				}).then(function (response){
					return response.data;
				});
			return promise;
		},
		eliminarScoreCard: function(card){
			var promise =
				$http({
					method: 'POST',
					url: 'eliminarScoreCard',
					data: card
				}).then(function (response){
					return response.data;
				});
			return promise;
		}
	}
	return funciones;
})