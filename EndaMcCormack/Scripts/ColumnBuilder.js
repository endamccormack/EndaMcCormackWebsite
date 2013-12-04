
function handleResponse2(response) {
  	for (var i = 0; i <= response.items.length; i++) {
  		
			var split = (response.items[i].labels)[0].split("[]",3)

			document.getElementById("wrapper").innerHTML +=
			'<div class="columnArticle"> \
			<div class="column-ribbon-wrapper"> \
				<div class="column-ribbon-front"> \
					<div class="column-ribbonRight"></div> \
					<div class="column-ribbonCenter"><center><img class="dojoIcon" src="/Content/Images/CoderDojo/coderDojoSmall.gif"></center></div> \
					<div class="column-ribbonLeft"><p></p></div> \
				</div> \
				<div class="column-ribbon-edge-topleft"></div> \
				<div class="column-ribbon-edge-topright"></div> \
				<div class="column-ribbon-edge-bottomleft"></div> \
				<div class="column-ribbon-edge-bottomright"></div> \
				<div class="column-ribbon-back-left"></div> \
			</div>	\
			<div class="postContent"> \
				<img src="' + split[2] + '"> </img> \
				<p class="theName">' + split[0] + ' </p> \
				<p class="title">' + split[1] + ' </p> \
				<P> ' + response.items[i].content +' </p> \
			</div> \
		</div> ';

			
  	}
    
  }