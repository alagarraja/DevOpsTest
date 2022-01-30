({
	loadMap : function(component,accsToken) {
        alert(accsToken);
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
        
          var map = L.map('map', {
            crs: crs
          }).setView([53.448904,-2.360773], 16);
        	
          L.esri.tiledMapLayer({
            url: 'https://tiles.arcgis.com/tiles/qHLhLQrcvEnxjtPr/arcgis/rest/services/OS_Open_Background_2/MapServer',
            maxZoom: 19,
            minZoom: 6,
          }).addTo(map);
          
        var dma = L.esri.featureLayer({
            url: 'https://services5.arcgis.com/5eoLvR0f8HKb7HWP/arcgis/rest/services/DMA/FeatureServer/0/query?token='+accsToken
          }).addTo(map);
        
        component.set("v.map", map);
	}
})