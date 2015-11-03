angular.module('BasicPrimitives', [], function ($compileProvider) {
			
	$compileProvider.directive('bpOrgDiagram', function ($compile) {

		function link(scope, element, attrs) {
			var itemScopes = [];
			var config = new primitives.orgdiagram.Config();

			angular.extend(config, scope.options);


			config.onItemRender = onTemplateRender;
			//config.onCursorChanged = onCursorChanged;
			config.onHighlightChanged = onHighlightChanged;

			

			var chart = jQuery(element).orgDiagram(config);
			
			$('#toggle-colapsar').change(function() {
			    var msg= $(this).prop('checked');
			    	
			    if(msg==false){
			    	chart.orgDiagram({
			    		pageFitMode : primitives.orgdiagram.PageFitMode.FitToPage
			    		
		                  
		                });
			    	
			    	
			    }
			    else{
			    	chart.orgDiagram({
			    		pageFitMode : primitives.orgdiagram.PageFitMode.None
		                  
		                });
			    	
			    	
			    }
			    chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
			  });

		
		
	   
		    $('#toggle-tipo').change(function() {
		    var msg= $(this).prop('checked');
		    	
		    if(msg==false){
		    	chart.orgDiagram({
		    		hasButtons: primitives.common.Enabled.Auto
	                  
	                });
		    	
		    	
		    }
		    else{
		    	chart.orgDiagram({
		    		hasButtons: primitives.common.Enabled.False
	                  
	                });
		    	
		    	
		    }
		    chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
		  });

			
			$("#slider").slider({
		        value: 2,
		        min: 1,
		        max: 4,
		        step: 1,
		        
		        slide: function (event, ui) {
		        	 
		        	chart.orgDiagram({
		                defaultTemplateName: "Zoom" + ui.value
		            });
		    /*    	
		      if(ui.value<=2){
		        	 chart.orgDiagram({
		        		 hasButtons : primitives.common.Enabled.False
		                  
		                });
		      }
		      else{
		    	  chart.orgDiagram({
		        		 hasButtons : primitives.common.Enabled.Auto
		                  
		                });
		      }
		      */
		            chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
		        }
		    });	
		
			 
			 jQuery("#Top").click(function (e) {
	                chart.orgDiagram({
	                    orientationType: primitives.common.OrientationType.Top,
	                    horizontalAlignment: primitives.common.HorizontalAlignmentType.Center
	                });
	                chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
	            });

			jQuery("#Left").click(function (e) {
				    chart.orgDiagram({
                       orientationType: primitives.common.OrientationType.Top,
                       horizontalAlignment: primitives.common.HorizontalAlignmentType.Center
                    });
                    chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
				     
				     chart.orgDiagram({
	                    orientationType: primitives.common.OrientationType.Left,
	                    horizontalAlignment: primitives.common.HorizontalAlignmentType.Left
	                });
	                chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
	            });

	            jQuery("#Right").click(function (e) {
	            	chart.orgDiagram({
	                       orientationType: primitives.common.OrientationType.Top,
	                       horizontalAlignment: primitives.common.HorizontalAlignmentType.Center
	                    });
	                    chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
					    
	            	
	            	
	            	chart.orgDiagram({
	                    orientationType: primitives.common.OrientationType.Rigth,
	                    horizontalAlignment: primitives.common.HorizontalAlignmentType.Left
	                });
	                chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
	            });

	            jQuery("#Bottom").click(function (e) {
	                chart.orgDiagram({
	                    orientationType: primitives.common.OrientationType.Bottom,
	                    horizontalAlignment: primitives.common.HorizontalAlignmentType.Center
	                });
	                chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
	            });

			scope.$watch('options.highlightItem', function (newValue, oldValue) {
				var highlightItem = chart.orgDiagram("option", "highlightItem");
				if (highlightItem != newValue) {
					chart.orgDiagram("option", { highlightItem: newValue });
					chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.PositonHighlight);
				}
			});

			scope.$watch('options.cursorItem', function (newValue, oldValue) {
				var cursorItem = chart.orgDiagram("option", "cursorItem");
				if (cursorItem != newValue) {
					chart.orgDiagram("option", { cursorItem: newValue });
					chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
				}
			});

			scope.$watchCollection('options.items', function (items) {
				chart.orgDiagram("option", { items: items });
				chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
			});
			
			//Función para recivir el evento que indica el cambio de página y pinta el indicador de puestos asociados "P"
			window.updatedata = function(datos) {
				scope.$apply(function(){
					chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Refresh);
				});
			};

			//Función para el render de cada item
			function onTemplateRender(event, data) {
				var itemConfig = data.context;
				switch (data.renderingMode) {
					case primitives.common.RenderingMode.Create://Modo Nuevo Item
						var itemScope = scope.$new();
						itemScope.itemConfig = itemConfig;
						itemScope.items_l = scope.options.items;
						itemScope.cursorItem_l = scope.options.cursorItem;
						$compile(data.element.contents())(itemScope);
						if(tiene_puestos(itemScope.itemConfig.id) != undefined && tiene_puestos(itemScope.itemConfig.id)){
							itemScope.itemConfig.tiene_puesto = true;
						}
						else{
							itemConfig.tiene_puesto = false;
						}
						if (!scope.$parent.$$phase) {
								itemScope.$apply();
						}
						data.element.draggable({//Propiedades del drag del nuevo elemento
							revert: "invalid",
							containment: "document",
							appendTo: "body",
							helper: "clone",
							cursor: "move",
							"zIndex": 10000,
							delay: 300,
							distance: 10,
							start: function (event, ui) {
								fromValue = parseInt(jQuery(this).attr("data-value"), 10);
								fromChart = "orgdiagram";
							}
						});
						data.element.droppable({//Propiedades del drop del nuevo elemento
							greedy: true,
							drop: function (event, ui) {
								if (!event.cancelBubble) {
									console.log("Drop accepted!");
									toValue = parseInt(jQuery(this).attr("data-value"), 10);
									toChart = "orgdiagram";
									Reparent(fromChart, fromValue, toChart, toValue);
									primitives.common.stopPropagation(event);
								} else {
									  console.log("Drop ignored!");
								}
							},
							over: function (event, ui) {
								toValue = parseInt(jQuery(this).attr("data-value"), 10);
								toChart = "orgdiagram";
								jQuery("#orgdiagram").orgDiagram({ "highlightItem": toValue });
								jQuery("#orgdiagram").orgDiagram("update", primitives.common.UpdateMode.PositonHighlight);
							},
							accept: function (draggable) {

								return (jQuery(this).css("visibility") == "visible");
							}
						});
						itemScopes.push(itemScope);
					break;
					case primitives.common.RenderingMode.Update:
						/* Update widgets here */
						var itemScope = data.element.contents().scope();
						if(tiene_puestos(itemScope.itemConfig.id) != undefined && tiene_puestos(itemConfig.id)){
							itemConfig.tiene_puesto = true;
						}else{
							itemConfig.tiene_puesto = false;
						}
						itemScope.itemConfig = itemConfig;
						itemScope.items_l = scope.options.items;
						itemScope.cursorItem_l = scope.options.cursorItem;
					break;
				}
				var itemConfig = data.context;

				data.element.attr("data-value", itemConfig.id);
				//RenderField(data, itemConfig);//Ya no es necesario

			}//Fin de la función para el render de cada item


			//Función para recolocar el elemento movido con su padre
			function Reparent(fromChart, value, toChart, toParent) {
				/* following verification needed in order to avoid conflict with jQuery Layout widget */

				for (var index = 0; index < items.length; index++) {
					var child = items[index];
				}

				if (fromChart != null && value != null && toChart != null) {
					console.log("Reparent fromChart:" + fromChart + ", value:" + value + ", toChart:" + toChart + ", toParent:" + toParent);
					var item = items[value];
					var fromItems = jQuery("#" + fromChart).orgDiagram("option", "items");
					var toItems = jQuery("#" + toChart).orgDiagram("option", "items");
					if (toParent != null) {
						var toParentItem = items[toParent];
						if (!isParentOf(item, toParentItem)) {

							var children = getChildrenForParent(item);
							children.push(item);
					 		for (var index = 0; index < children.length; index++) {
								var child = children[index];
								fromItems.splice(primitives.common.indexOf(fromItems, child), 1);
								toItems.push(child);
							}
							item.parent = toParent;
						} else {
							console.log("Droped to own child!");
						}
					} else {
						var children = getChildrenForParent(item);
						children.push(item);
						for (var index = 0; index < children.length; index++) {
							var child = children[index];
							fromItems.splice(primitives.common.indexOf(fromItems, child), 1);
							toItems.push(child);
						}
						item.parent = null;
					}
				}
				for (var i = 0; i < items.length; i++) {
					items[i].id = i;
				};
				chart.orgDiagram("update", primitives.orgdiagram.UpdateMode.Recreate);
				scope.$apply();
			}
			//Fin de la función para recolocar el elemento movido con su padre

			//Función para obtener los hijos del elemento movido
			function getChildrenForParent(parentItem) {
				var children = {};
				for (var id in items) {
					var item = items[id];
					if (children[item.parent] == null) {
						children[item.parent] = [];
					}
					children[item.parent].push(id);
				}
				var newChildren = children[parentItem.id];
				var result = [];
				if (newChildren != null) {
					while (newChildren.length > 0) {
						var tempChildren = [];
						for (var index = 0; index < newChildren.length; index++) {
							var item = items[newChildren[index]];
							result.push(item);
							if (children[item.id] != null) {
								tempChildren = tempChildren.concat(children[item.id]);
							}
						}
						newChildren = tempChildren;
					}
				}
				return result;
			}//Fin de la función para obtener los hijos del elemento movido

			function isParentOf(parentItem, childItem) {
				var result = false,
					index,
					len,
					itemConfig;
				if (parentItem.id == childItem.id) {
					result = true;
				} else {
					while (childItem.parent != null) {

						childItem = items[childItem.parent];
						if (childItem.id == parentItem.id) {
							result = true;
							break;
						  }
					 }
				}
				return result;
			};


			function ResizePlaceholder() {
				var panel = jQuery("#centerpanel");
				var panelSize = new primitives.common.Rect(0, 0, panel.innerWidth(), panel.innerHeight());
				var position = new primitives.common.Rect(0, 0, panelSize.width / 2, panelSize.height);
				position.offset(-2);
				var position2 = new primitives.common.Rect(panelSize.width / 2, 0, panelSize.width / 2, panelSize.height);
				position2.offset(-2);

				jQuery("#orgdiagram").css(position.getCSS());
			}

			function onButtonClick(e, data) {
				scope.onButtonClick();
				scope.$apply();
			}

			function onCursorChanged(e, data) {
				scope.options.cursorItem = data.context ? data.context.id : null;
				scope.onCursorChanged();
				scope.$apply();
			}

			function onHighlightChanged(e, data) {
				scope.options.highlightItem = data.context ? data.context.id : null;
				scope.onHighlightChanged();
				scope.$apply();
			}

			element.on('$destroy', function () {
				/* destroy items scopes */
				for (var index = 0; index < scopes.length; index++) {
					 itemScopes[index].$destroy();
				}

				/* destory jQuery UI widget instance */
				chart.remove();
			});
		};
	return {
		scope: {
			options: '=options',
			onCursorChanged: '&onCursorChanged',
			onHighlightChanged: '&onHighlightChanged',
		},
		link: link
	};
});
});
