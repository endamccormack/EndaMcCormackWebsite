		function handleResponse2(response) {
	      	for (var i = 0; i < response.items.length; i++) {
	      		//document.getElementById("content").innerHTML += "<h1>" + response.items[i].title + "</h1>" + response.items[i].content;
	      		
					//document.getElementById("wrapper").innerHTML +=
					//'<div class="article">'+ response.items[i].content  +'</div>';
					var date = new Date(response.items[i].published.toString());
					document.getElementById("wrapper").innerHTML +=
	      		'<div class="article"> \
					<div class="ribbon-wrapper"> \
						<div class="ribbon-front"> \
							<div class="ribbonRight"><p>'+ date.getDate() + '/' + date.getMonth() + '/' + date.getFullYear() + '</p></div> \
							<div class="ribbonCenter"><img class="dojoIcon" src="/Content/Images/CoderDojo/coderDojoSmall.gif"></div> \
							<div class="ribbonLeft"><p>'+ response.items[i].title + '</p></div> \
						</div> \
						<div class="ribbon-edge-topleft"></div> \
						<div class="ribbon-edge-topright"></div> \
						<div class="ribbon-edge-bottomleft"></div> \
						<div class="ribbon-edge-bottomright"></div> \
					</div>	<div class="postContent">' + response.items[i].content  + '</div><p></p> </div>';
	      	}
	        
	      }