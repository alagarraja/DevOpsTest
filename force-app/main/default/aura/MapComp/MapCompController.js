({
	jsLoaded : function(component, event, helper) {
		
    	var action = component.get("c.getToken");
        var accessTkn;
		action.setCallback(this, function(response) {
            
            var state = response.getState();
            if (state === "SUCCESS") {
				component.set("v.accToken", JSON.stringify(response.getReturnValue()) );
                var tkn = component.get("v.accToken");
                alert(tkn);
                
                var crs = new L.Proj.CRS('EPSG:27700', '+proj=tmerc +lat_0=49 +lon_0=-2 +k=0.9996012717 +x_0=400000 +y_0=-100000 +ellps=airy +towgs84=446.448,-125.157,542.06,0.15,0.247,0.842,-20.489 +units=m +no_defs', {
                    origin: [-5781523.997920001, 4883853.592504997],
                    resolutions: [
                      132291.9312505292,
                      66145.9656252646,
                      26458.386250105836,
                      19843.789687579378,
                      13229.193125052918,
                      6614.596562526459,
                      2645.8386250105837,
                      1322.9193125052918,
                      661.4596562526459,
                      264.5838625010584,
                      132.2919312505292,
                      66.1459656252646,
                      26.458386250105836,
                      19.843789687579378,
                      13.229193125052918,
                      6.614596562526459,
                      2.6458386250105836,
                      1.3229193125052918,
                      0.6614596562526459
                    ]
                  });
                        
                  var incidentLayer,baseLat,baseLong,baseLatLng,incidentLayer,featLayer;
                  var map = L.map('map', {
                    crs: crs
                  }).setView([53.448904,-2.360773], 16);
                  var drawnItems = L.featureGroup().addTo(map);
                
                 L.esri.tiledMapLayer({
                    url: 'https://tiles.arcgis.com/tiles/qHLhLQrcvEnxjtPr/arcgis/rest/services/OS_Open_Background_2/MapServer',
                    maxZoom: 18,
                    minZoom: 6,
                  }).addTo(map);
                  
                  L.control.layers({}, {'drawlayer':drawnItems}, { position: 'topright', collapsed: true }).addTo(map);
                  
                var MyCustomMarker = L.Icon.extend({
                options: {
                    shadowUrl: null,
                    iconAnchor: new L.Point(12, 12),
                    iconSize: new L.Point(24, 24),
                    iconUrl: '/resource/Leaflet_Draw/Leaflet.draw-develop/src/images/spritesheet.png'
                }
            });
           
        var options = {
                position: 'topleft',
                draw: {
                    polyline: false,
                    polygon: {
                        allowIntersection: false, // Restricts shapes to simple polygons
                        drawError: {
                            color: '#e1e100', // Color the shape will turn when intersects
                            message: '<strong>Oh snap!<strong> you can\'t draw that!' // Message that will show when intersect
                        },
                        shapeOptions: {
                            color: '#bada55'
                        }
                    },
                    circle: false, // Turns off this drawing tool
                    rectangle: false,
                    marker: false,
                    circlemarker: false
                },
                edit: {
                    featureGroup: drawnItems, //REQUIRED!!
                    remove: false
                }
            };
	
			var drawControl = new L.Control.Draw(options);
            map.addControl(drawControl);
            
                map.on(L.Draw.Event.CREATED, function (e) {
                    var type = e.layerType,
                        layer = e.layer;
                
                    if (type === 'marker') {
                        layer.bindPopup('A popup!');
                    }
                
                	if (type === 'polygon') {
                        
                        var points = layer._latlngs;
                        alert('inside map--> '+points);
                        
                        map.eachLayer(function (layer) { 
                           // alert('marker latlng--> '+ layer.getLatLng() );
                        });
                    
                    }
                    
                drawnItems.addLayer(layer);
            });
                            
                var dma = L.esri.featureLayer({
                    url: 'https://services5.arcgis.com/5eoLvR0f8HKb7HWP/arcgis/rest/services/DMA/FeatureServer/0/query?token='+tkn
                }).addTo(map);
                
            //    var da = L.esri.featureLayer({
             //       url: 'https://services5.arcgis.com/5eoLvR0f8HKb7HWP/arcgis/rest/services/DRAINAGEAREA/FeatureServer/0/query?token='+tkn,
            //        style:{color:'brown',weight:2}
             //   }).addTo(map);
            
            }
            
        });
        
        $A.enqueueAction(action);
	}
})