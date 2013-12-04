var mainCWidth;
$(document).ready(function() {
	mainCWidth = $('.article').width();
	var query = window.location.search.substring(1);

  	$('.ribbon-front').css( "width", mainCWidth + 20 );
  	$('.ribbon-edge-topright').css( "left", mainCWidth );
  	$('.ribbon-edge-topright2').css( "left", mainCWidth + 40 );
});

var width = $(window).width();
$(window).resize(function(){
   if($(this).width() != width){
      	mainCWidth = $('.article').width();
      	$('.ribbon-front').css( "width", mainCWidth + 20 );
  		$('.ribbon-edge-topright').css( "left", mainCWidth );
   }
});