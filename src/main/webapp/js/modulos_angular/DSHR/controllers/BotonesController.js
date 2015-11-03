angular.module('DSHRControllers')

.controller('BotonesController', ['$scope', 'DatosGeneralesHojaRutaService', 'getIndicadoresService', 'Prioridades',
	function($scope, DatosGeneralesHojaRutaService, getIndicadoresService, Prioridades){

	selecciones = $scope.selecciones;
	tablas = $scope.tablas;
	alertas = $scope.alertas;
	constantes = $scope.constantes;
	visuales = $scope.visuales;

	/************************ Funciones Locales ***********************************/
	var mensajeAlerta = function(mensaje, tipo){
		alertas.bandera = true;
		alertas.mensaje = mensaje;
		alertas.tipo = tipo;
	}

	var validarCamposTodos = function(){
		alertas.bandera = false;
		alertas.mensaje = "";
		alertas.lista_errores = [];
		if (selecciones.area == "" || selecciones.area == null || selecciones.area == constantes.NO_EXISTE){
			alertas.lista_errores.push({id:1, descripcion: "Combo \u00C0rea."});
		}
		if (selecciones.departamento == "" || selecciones.departamento == null || selecciones.departamento == constantes.NO_EXISTE){
			alertas.lista_errores.push({id:2, descripcion: "Combo Departamento."});
		}
		if (selecciones.puesto == "" || selecciones.puesto == null  || selecciones.puesto == constantes.NO_EXISTE){
			alertas.lista_errores.push({id:3, descripcion: "Combo Puesto."});
		}
		if (selecciones.year == "" || selecciones.year == null){
			alertas.lista_errores.push({id:4, descripcion: "Combo A\u00F1o."});
		}
		if (selecciones.usuario == "" || selecciones.usuario == null || selecciones.usuario == constantes.NO_EXISTE){
			alertas.lista_errores.push({id:5, descripcion: "Combo Usuario."});
		}
	}

	var validarCamposDepartamento = function(){
		alertas.bandera = false;
		alertas.mensaje = "";
		alertas.lista_errores = [];
		if (selecciones.area == "" || selecciones.area == null || selecciones.area == constantes.NO_EXISTE){
			alertas.lista_errores.push({id:1, descripcion: "Combo \u00C0rea."});
		}
		if (selecciones.departamento == "" || selecciones.departamento == null || selecciones.departamento == constantes.NO_EXISTE){
			alertas.lista_errores.push({id:2, descripcion: "Combo Departamento."});
		}

		if (selecciones.year == "" || selecciones.year == null){
			alertas.lista_errores.push({id:4, descripcion: "Combo A\u00F1o."});
		}
	}

	var validarCamposPuesto = function(){
		alertas.bandera = false;
		alertas.mensaje = "";
		alertas.lista_errores = [];
		if (selecciones.area == "" || selecciones.area == null || selecciones.area == constantes.NO_EXISTE){
			alertas.lista_errores.push({id:1, descripcion: "Combo \u00C0rea."});
		}
		if (selecciones.departamento == "" || selecciones.departamento == null || selecciones.departamento == constantes.NO_EXISTE){
			alertas.lista_errores.push({id:2, descripcion: "Combo Departamento."});
		}
		if (selecciones.puesto == "" || selecciones.puesto == null  || selecciones.puesto == constantes.NO_EXISTE){
			alertas.lista_errores.push({id:3, descripcion: "Combo Puesto."});
		}
		if (selecciones.year == "" || selecciones.year == null){
			alertas.lista_errores.push({id:4, descripcion: "Combo A\u00F1o."});
		}
	}

	/************************ Funciones Locales ***********************************/


	/************************ Funciones Expuestas ***********************************/
	$scope.getHojaRumboByUsuarioYYear = function(){
		tablas.prioridad = [];
		tablas.ni = [];
		DatosGeneralesHojaRutaService.getHojasByUsuarioYYear(
				selecciones.usuario, selecciones.year).then(function(d){
					tablas.hoja_ruta = d;
					if(d.length == 0){
						mensajeAlerta("No existe informaci\u00F3n para los filtros seleccionados.", "alert-info");
						visuales.mostrar_grafica = false;
					}
					else{
						selecciones.boton = constantes.botones.HOJA_RUTA;
					}
				});
	}

	$scope.getHojaRutaByDepartamentoYYear = function(){
		tablas.prioridad = [];
		tablas.ni = [];
		DatosGeneralesHojaRutaService.getHojaRutaByDepartamentoYYear(
				selecciones.departamento, selecciones.year).then(function(d){
					tablas.hoja_ruta = d;
					if(d.length == 0){
						mensajeAlerta("No existe informaci\u00F3n para los filtros seleccionados.", "alert-info");
						visuales.mostrar_grafica = false;
					}
					else{
						selecciones.boton = constantes.botones.HOJA_RUTA_DEPARTAMENTO;
					}
				});
	}

	$scope.getIndicadoresMesesByUsuarioYYear = function(){
		tablas.prioridad = [];
		tablas.hoja_ruta = [];
		validarCamposTodos();
		if (alertas.lista_errores.length == 0){
			getIndicadoresService.getIndicadoresMesesByUsuarioYYear(
				selecciones.usuario, selecciones.year).then(function(d){
					tablas.ni = d;
					if(d.length == 0){
						mensajeAlerta("No existe informaci\u00F3n para los filtros seleccionados.", "alert-info");
						visuales.mostrar_grafica = false;
					}
					else{
						selecciones.boton = constantes.botones.NI;
					}
				});
		}
		else{
			mensajeAlerta("Los siguientes campos son requeridos:", "alert-danger");
		}
	}

	$scope.getPrioridadesByUsuarioYYear = function(){
		tablas.ni = [];
		tablas.hoja_ruta = [];

		validarCamposTodos();
		if (alertas.lista_errores.length == 0){
			Prioridades.getPrioridadesByUsuarioYYear(selecciones.usuario, selecciones.year)
			.then(function(d){
				tablas.prioridad = d;
				if(d.length == 0){
					mensajeAlerta("No existe informaci\u00F3n para los filtros seleccionados.", "alert-info");
					visuales.mostrar_grafica = false;
				}else{
					selecciones.boton = constantes.botones.PRIORIDADES;
				}
			})
		}
		else{
			mensajeAlerta("Los siguientes campos son requeridos:", "alert-danger");
		}
	}

	$scope.getHojaRuta = function(){
		if(selecciones.departamento == 0){
			validarCamposDepartamento();
			if (alertas.lista_errores.length == 0){
				$scope.getHojaRutaByAreaYYear();
			}
			else{
				mensajeAlerta("Los siguientes campos son requeridos:", "alert-danger");
			}
		}
		else if(selecciones.puesto == 0){
			validarCamposPuesto();
			if (alertas.lista_errores.length == 0){
				$scope.getHojaRutaByDepartamentoYYear();
			}
			else{
				mensajeAlerta("Los siguientes campos son requeridos:", "alert-danger");
			}
		}
		else{
			validarCamposTodos();
			if (alertas.lista_errores.length == 0){
				$scope.getHojaRumboByUsuarioYYear();
			}
			else{
				mensajeAlerta("Los siguientes campos son requeridos:", "alert-danger");
			}
		}
	}

	$scope.getHojaRutaByAreaYYear = function(){
		tablas.prioridad = [];
		tablas.ni = [];
		DatosGeneralesHojaRutaService.getHojaRutaByAreaYYear(selecciones.area, selecciones.year)
			.then(function (d){
				tablas.hoja_ruta = d;
				if(d.length == 0){
					mensajeAlerta("No existe informaci\u00F3n para los filtros seleccionados.", "alert-info");
					visuales.mostrar_grafica = false;
				}
				else{
					selecciones.boton = constantes.botones.HOJA_RUTA_AREA;
				}
			});
	}

	/************************ Funciones Expuestas ***********************************/


	/************************* Inicio ******************************/
	/************************* Inicio ******************************/

}])