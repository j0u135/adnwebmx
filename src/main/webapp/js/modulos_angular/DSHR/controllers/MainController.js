angular.module('DSHRControllers', ['CommonsServices', 'HojaRutaServices', 'UsuarioServices', 'IndicadoresInteligentesServices', 'PrioridadesServices'])

.controller('MainController', ['$scope', function($scope){

	
	/************** Modelos ************************/
	$scope.selecciones = {};
	$scope.tablas = {};
	$scope.alertas = {};
	$scope.visuales = {};

	/********************** Constantes **************************/
	$scope.constantes = {};
	$scope.constantes.botones = {};

	$scope.constantes.TODOS = 0;
	$scope.constantes.NO_EXISTE = -1;

	$scope.constantes.botones.HOJA_RUTA = 0;
	$scope.constantes.botones.HOJA_RUTA_AREA = 1;
	$scope.constantes.botones.HOJA_RUTA_DEPARTAMENTO = 2;
	$scope.constantes.botones.NI = 3;
	$scope.constantes.botones.PRIORIDADES = 4;

	$scope.constantes.meses = [
		{id:1, nombre: "Enero"},
		{id:2, nombre: "Febrero"},
		{id:3, nombre: "Marzo"},
		{id:4, nombre: "Abril"},
		{id:5, nombre: "Mayo"},
		{id:6, nombre: "Junio"},
		{id:7, nombre: "Julio"},
		{id:8, nombre: "Agosto"},
		{id:9, nombre: "Septiembre"},
		{id:10, nombre: "Octubre"},
		{id:11, nombre: "Noviembre"},
		{id:12, nombre: "Diciembre"},
	];

}])