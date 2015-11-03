angular.module('ScoreCardControllers', ['ScoreCardServices'])

.controller('ScoreCardMainController', ['$scope', '$sce', 'ScoreCard', function($scope, $sce, ScoreCard){

	/******************** Modelos *********************/
	$scope.score_card = {};
	$scope.nueva_card = {};
	$scope.editar_card = {};
	/******************** Modelos *********************/

	/******************** Funciones Locales *********************/
	/******************** Funciones Locales *********************/

	/******************** Funciones Expuestas *********************/
	$scope.trustSrc = function(src) {
    	return $sce.trustAsResourceUrl(src);
  	}

	$scope.getScoreCard = function(){
		ScoreCard.getScoreCard()
			.then(function (d){
				$scope.score_card = d;
			})
	}

	$scope.ventanaNuevaCard = function(){
		$scope.nueva_card = {};
	}

	$scope.crearScoreCard = function(card){
		ScoreCard.crearScoreCard(card)
			.then(function (d){
				$scope.nueva_card = {};
				$scope.getScoreCard();			
			})
	}

	$scope.crearScoreCard = function(card){
		ScoreCard.crearScoreCard(card)
			.then(function (d){
				$scope.nueva_card = {};
				$scope.getScoreCard();
				$('#nuevaScoreCardModal').modal('hide');
			})
	}

	$scope.ventanaEditarCard = function(card){
		$scope.editar_card = angular.copy($scope.score_card);
	}

	$scope.editarScoreCard = function(card){
		ScoreCard.editarScoreCard(card)
			.then(function (d){
				$scope.editar_card = {};
				$scope.getScoreCard();
				$('#editarScoreCardModal').modal('hide');	
			})
	}

	/******************** Funciones Expuestas *********************/

	/******************** Inicio *********************/
	$scope.getScoreCard();
	/******************** Inicio *********************/

}])