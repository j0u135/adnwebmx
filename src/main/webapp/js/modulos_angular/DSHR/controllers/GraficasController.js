angular.module('DSHRControllers')

.controller('GraficasController', ['$scope', function ($scope){

	selecciones = $scope.selecciones;
	tablas = $scope.tablas;
	alertas = $scope.alertas;
	constantes = $scope.constantes;
	visuales = $scope.visuales;

	/********************** Modelos *****************************/
	$scope.graficas = {};
	graficas = $scope.graficas;

	var base = {
		chart: {
			type: 'bar'
			},
		title: {
			text: ""
		},
		xAxis: {
			categories: []
		},
		yAxis: {
			title: {
				text: ""
			}
		},
		series: []	        
	};

	/********************** Modelos *****************************/

	/******************** Funciones Locales *******************************/
	var obtenerResultadosData12Meses = function(lista_meses){
		var data = [];
		for (var i = 0; i < 12; i++){
			var encontrado = false;
			for (var j = 0; j < lista_meses.length; j ++){
				if( i == lista_meses[j].mes){
					data.push(lista_meses[j].resultado);
					encontrado = true;
				}
			}
			if(encontrado == false){
				data.push(0);
			}
		}
		return data;
	}
	/******************** Funciones Locales *******************************/

	/********************** Funciones Expuestas *****************************/
	$scope.obtenerDatosGrafica = function (){
		console.log(visuales.mostrar_grafica);
		switch(selecciones.boton){
			case constantes.botones.HOJA_RUTA:
				var meses = ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'];
				var titulo_principal = "Hojas de Ruta";
				var titulo_x = "Promedio";
				var titulo_y = "Promedio";

				var serie_base = {
					name: titulo_x
				};
				serie_base.data = obtenerResultadosData12Meses(tablas.hoja_ruta);;

				graficas.hoja_ruta = base;
				graficas.hoja_ruta.title.text = titulo_principal;
				graficas.hoja_ruta.xAxis.categories = meses;
				graficas.hoja_ruta.yAxis.title.text = titulo_y;

				graficas.hoja_ruta.series = [];
				graficas.hoja_ruta.series.push(serie_base);
			        
			    $('#indicadorGrafica').highcharts(graficas.hoja_ruta);
			break;

			case constantes.botones.NI:
				var meses = ['Ene','Feb','Mar','Abr','May','Jun','Jul','Ago','Sep','Oct','Nov','Dic'];
				var titulo_principal = "N\u00FAmeros Inteligentes";
				var titulo_y = "Promedio";

				graficas.ni = base;
				graficas.ni.title.text = titulo_principal;
				graficas.ni.xAxis.categories = meses;
				graficas.ni.yAxis.title.text = titulo_y;

				graficas.ni.series = [];
				for(var i = 0; i < tablas.ni.length; i ++ ){
					var titulo_x = tablas.ni[i].nb_indicador;
					var serie_base = {};
					serie_base.name = titulo_x;
					serie_base.data = obtenerResultadosData12Meses(tablas.ni[i].meses);
					graficas.ni.series.push(serie_base);
				}

				$('#indicadorGrafica').highcharts(graficas.ni);
			break;

			case constantes.botones.PRIORIDADES:
				var prioridades = [];
				var serie_planeado = {
					name: "Avance Planeado",
					data: []
				};
				var serie_real = {
					name: "Avance Real",
					data: []
				};
				for(var i = 0; i < tablas.prioridad.length; i ++ ){
					
					prioridades.push(tablas.prioridad[i].Nombre);
					
					serie_planeado.data.push(tablas.prioridad[i].ultimoMesPlaneado);
					serie_real.data.push(tablas.prioridad[i].ultimoMesReal);
				}

				var titulo_principal = "Prioridades";
				var titulo_y = "Prioridades";
				graficas.prioridad = base;
				graficas.prioridad.title.text = titulo_principal;
				graficas.prioridad.xAxis.categories = meses;
				graficas.prioridad.yAxis.title.text = titulo_y;

				graficas.prioridad.series = [];
				graficas.prioridad.series.push(serie_planeado);
				graficas.prioridad.series.push(serie_real);				

				$('#indicadorGrafica').highcharts(graficas.prioridad);
			break;

			case constantes.botones.HOJA_RUTA_DEPARTAMENTO:
				var titulo_principal = "Hoja de Ruta";
				var titulo_y = "Hoja de Ruta";
				
				var promedio_serie = {
					name: "Promedio Anual",
					data: []
				};
				var evaluados_serie = {
					name: "Meses Evaluados",
					data: []
				};
				var aprobados_serie = {
					name: "Meses Aprobados",
					data: []
				};
				var porcentaje_serie = {
					name: "Porcentaje de Aprobaciones",
					data: []
				};

			    var usuarios = [];
				for(var i = 0; i < tablas.hoja_ruta.length; i ++ ){
					
					usuarios.push(tablas.hoja_ruta[i].usuario.Nombre);
					
					promedio_serie.data.push(tablas.hoja_ruta[i].promedio_anual);
					evaluados_serie.data.push(tablas.hoja_ruta[i].meses_evaluados);
					aprobados_serie.data.push(tablas.hoja_ruta[i].meses_aprobados);
					porcentaje_serie.data.push(tablas.hoja_ruta[i].porcentaje_aprobado);

				}

				graficas.hoja_departamento = base;
				graficas.hoja_departamento.title.text = titulo_principal;
				graficas.hoja_departamento.xAxis.categories = usuarios;
				graficas.hoja_departamento.yAxis.title.text = titulo_y;

				graficas.hoja_departamento.series = [];
				graficas.hoja_departamento.series.push(promedio_serie);
				graficas.hoja_departamento.series.push(evaluados_serie);
				graficas.hoja_departamento.series.push(aprobados_serie);
				graficas.hoja_departamento.series.push(porcentaje_serie);
				
				$('#indicadorGrafica').highcharts(graficas.hoja_departamento);
			break;

			case constantes.botones.HOJA_RUTA_AREA:
				var titulo_principal = "Hoja de Ruta";
				var titulo_y = "Hoja de Ruta";
				
				var promedio_serie = {
					name: "Promedio Anual",
					data: []
				};
				var evaluados_serie = {
					name: "Meses Evaluados",
					data: []
				};
				var aprobados_serie = {
					name: "Meses Aprobados",
					data: []
				};
				var porcentaje_serie = {
					name: "Porcentaje de Aprobaciones",
					data: []
				};

			    var departamentos = [];
				for(var i = 0; i < tablas.hoja_ruta.length; i ++ ){
					
					departamentos.push(tablas.hoja_ruta[i].departamento.nb_Departamento);
					
					promedio_serie.data.push(tablas.hoja_ruta[i].promedio_anual);
					evaluados_serie.data.push(tablas.hoja_ruta[i].meses_evaluados);
					aprobados_serie.data.push(tablas.hoja_ruta[i].meses_aprobados);
					porcentaje_serie.data.push(tablas.hoja_ruta[i].porcentaje_aprobado);

				}

				graficas.hoja_area = base;
				graficas.hoja_area.title.text = titulo_principal;
				graficas.hoja_area.xAxis.categories = departamentos;
				graficas.hoja_area.yAxis.title.text = titulo_y;

				graficas.hoja_area.series = [];
				graficas.hoja_area.series.push(promedio_serie);
				graficas.hoja_area.series.push(evaluados_serie);
				graficas.hoja_area.series.push(aprobados_serie);
				graficas.hoja_area.series.push(porcentaje_serie);
				
				$('#indicadorGrafica').highcharts(graficas.hoja_area);
			break;

		}
	}

	$scope.$watch('visuales.mostrar_grafica', function (bandera_actual, bandera_anterior){
		if(!bandera_anterior && bandera_actual){
			$scope.obtenerDatosGrafica();		
		}
	});

	$scope.$watch('selecciones.boton', function ( bandera_actual, bandera_anterior){
		if(visuales.mostrar_grafica){
			$scope.obtenerDatosGrafica();
		}
	});
	/********************** Funciones Expuestas *****************************/

	/********************** Inicio *****************************/
	/********************** Inicio *****************************/

}])