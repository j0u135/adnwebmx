angular.module('DSHRControllers')

.controller('TablasController', ['$scope', function ($scope){
	
	$scope.submitHojaRuta = function(hojaruta){
		document.getElementById("mesNumerico").value = hojaruta.mes;
		document.getElementById("mesEnviado").value = hojaruta.mes_palabra;
		document.getElementById("usuarioRedireccion").value = $scope.selecciones.usuario;
		document.getElementById("anioSel").value = $scope.selecciones.year;
		document.getElementById("redireccion_hojaruta").action="CargaInterfazIndicadores";
		document.getElementById("redireccion_hojaruta").submit();
	}

	$scope.submitPrioridad = function(prioridad, mes_seleccionado, mes_texto){
		document.getElementById("hiddenRedireccion").value = prioridad.Nombre;
		document.getElementById("usuarioHR").value = $scope.selecciones.usuario;
		document.getElementById("mesBarra").value = mes_texto;
		document.getElementById("redireccion_prioridades").anioSel.value = $scope.selecciones.year;
		document.getElementById("redireccion_prioridades").mesNumerico.value = mes_seleccionado;
		document.getElementById("redireccion_prioridades").action="ServletRedireccionProy";
		document.getElementById("redireccion_prioridades").submit();
	}

	$scope.submitNIs = function(indicador, mes_seleccionado, idIndInte){
		document.getElementById("redireccion_nis").hiddenRedireccion.value = indicador.nb_indicador;
		document.getElementById("redireccion_nis").usuarioHR.value = $scope.selecciones.usuario;
		document.getElementById("redireccion_nis").anioSel.value = $scope.selecciones.year;
		document.getElementById("redireccion_nis").mesBarra.value = $scope.constantes.meses[mes_seleccionado - 1].nombre;
		document.getElementById("redireccion_nis").cveIndInte.value = idIndInte;
		document.getElementById("redireccion_nis").mesNumerico.value = mes_seleccionado;
		document.getElementById("redireccion_nis").action="servletRedireccion";
		document.getElementById("redireccion_nis").submit();
	}

}])