function initialize() {
	  var mapOptions = {
	    zoom: 16,
	    center: new google.maps.LatLng(54.278548,-8.460141),
	    mapTypeId: google.maps.MapTypeId.HYBRID,
	      panControl: false,
		  zoomControl: true,
		  mapTypeControl: false,
		  scaleControl: false,
		  streetViewControl: false,
		  overviewMapControl: true
	  }
	

	// Create custom marker
	var marker = new google.maps.Marker({
    position: new google.maps.LatLng(54.278548,-8.460141),
    icon: new google.maps.MarkerImage( 
	    "/Content/Images/CoderDojo/coderDojoSmall.gif",
	    null, /* size is determined at runtime */
	    null, /* origin is 0,0 */
	    null, /* anchor is bottom center of the scaled image */
	    new google.maps.Size(32, 32)
       )
    });

	  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
	  marker.setMap(map);
	}

	function loadScript() {
	  var script = document.createElement("script");
	  script.type = "text/javascript";
	  script.src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyAFaMgyNCb_5sdcjmh5AbhG2B-eaCjsN5Y&sensor=true&callback=initialize";
	  document.body.appendChild(script);
	}


	window.onload = loadScript;
