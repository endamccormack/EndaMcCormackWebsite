var mainCWidth;


var width = $(window).width()/3;
$(window).resize(function(){
      	mainCWidth = $('.columnArticle').width();
      	$('.column-ribbon-front').css( "width", mainCWidth + 20 );
  		  $('.column-ribbon-edge-topright').css( "left", mainCWidth );
        $('.column-ribbon-edge-topright2').css( "left", mainCWidth + 40 );

});

$(document).ready(function() {

      mainCWidth = $('.columnArticle').width();
      $('.column-ribbon-front').css( "width", mainCWidth + 20 );
      $('.column-ribbon-edge-topright').css( "left", mainCWidth );
      $('.column-ribbon-edge-topright2').css( "left", mainCWidth + 40 );
    
});