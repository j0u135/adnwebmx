angular.module('inicioADN', [])

.controller('presentacionesController', function($scope){
	$scope.presentaciones_iniciales_ang = presentaciones_iniciales;
	
	$scope.descripcion = "";
	$scope.url = "";
	$scope.activo = "";
	$scope.id = "";
	$scope.selected = 0;
	
	$scope.informarCampos = function(index){

		$scope.selected = index;
	
		$scope.descripcion = $scope.presentaciones_iniciales_ang[index-1].descripcion;
		$scope.id = $scope.presentaciones_iniciales_ang[index-1].id;
		$scope.url = $scope.presentaciones_iniciales_ang[index-1].url;
		$scope.activo = $scope.presentaciones_iniciales_ang[index-1].activo;
		
		$scope.cambiarColor()
	};
})