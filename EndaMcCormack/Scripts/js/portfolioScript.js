var $ = jquery_1_7_2_min;
var sectionHeight = $('div.portfolioSection').height();
var sectionWidth = $('div.portfolioSection').width();
var blankSpaceHeight = $('div.blankspace').height();

$(document).ready(function () {
    var theWidth = $('div#mainContent').width();


    if ($('div#mainContent').width() < 910 && $('div.portfolioSection').height() == 300) {

        sectionHeight = $('div.portfolioSection').height() * 0.7875;
        sectionWidth = $('div.portfolioSection').width() * 0.7875;
        blankSpaceHeight = sectionHeight - 54;

        theWidth = $('div#mainContent').width();

        $('div.portfolioSection').animate({ 'width': sectionWidth, 'height': sectionHeight });
        $(' div.blankSpace').animate({ 'height': blankSpaceHeight });

        $('div.caption').css('font-size', '16px');
    }
    else {
        sectionHeight = 300;
        sectionWidth = 450;

        theWidth = $('div#mainContent').width();

        $('div.portfolioSection').animate({ 'width': sectionWidth, 'height': sectionHeight });
        blankSpaceHeight = 246;
        $(' div.blankSpace').animate({ 'height': blankSpaceHeight });

        $('div.caption').css('font-size', '20px');
    }

    $('div.portfolioSection').css('margin-left', (theWidth - (sectionWidth * 2)) / 4);
    $('div.portfolioSection').css('margin-right', (theWidth - (sectionWidth * 2)) / 4);

    $(window).resize(function () {
        theWidth = $('div#mainContent').width();

        var theWidth = $('div#mainContent').width();
        $('div.portfolioSection').css('margin-left', (theWidth - (sectionWidth * 2)) / 4);
        $('div.portfolioSection').css('margin-right', (theWidth - (sectionWidth * 2)) / 4);

        if ($('div#mainContent').width() < 910 && $('div.portfolioSection').height() == 300) {
            sectionHeight = $('div.portfolioSection').height() * 0.7875;
            sectionWidth = $('div.portfolioSection').width() * 0.7875;
            blankSpaceHeight = sectionHeight - 54;

            $('div.portfolioSection').clearQueue();
            $('div.blankSpace').clearQueue();

            $('div.portfolioSection').stop();
            $('div.blankSpace').stop();

            $('div.portfolioSection').animate({ 'width': sectionWidth, 'height': sectionHeight }, 100);
            $(' div.blankSpace').animate({ 'height': blankSpaceHeight }, 500);

            $('div.caption').css('font-size', '16px');
        }
        else if ($('div#mainContent').width() >= 910 && $('div.portfolioSection').height() != 300) {
            sectionHeight = 300;
            sectionWidth = 450;
            blankSpaceHeight = 246;

            $('div.portfolioSection').stop();
            $('div.blankSpace').stop();

            $('div.portfolioSection').animate({ 'width': sectionWidth, 'height': sectionHeight }, 100);
            $('div.blankSpace').animate({ 'height': blankSpaceHeight }, 500);

            $('div.caption').css('font-size', '20px');
        }
    });

    $('div.portfolioSection').each(function () {
        $(this).hover(function () {
            $('#' + this.id + 'Blank').stop();
            $('#' + this.id + 'Cap').stop();

            // $('#' + this.id + 'Cap').animate({ 'height': '90px' },0 );
            //$('#' + this.id + 'Cap').animate({ 'height': '56px', opacity: 0.90 }, 350);
            $('#' + this.id + 'Blank').animate({ 'height': '0px' }, 350);
            $('#' + this.id + 'Cap').animate({ 'height': sectionHeight + 2, opacity: 0.90 }, 350);
        });

        $(this).mouseleave(function () {
            $('#' + this.id + 'Blank').stop();
            $('#' + this.id + 'Cap').stop();

            $('#' + this.id + 'Blank').animate({ 'height': blankSpaceHeight }, 200);
            //$('#' + this.id + 'Cap').animate({ 'height': '64px', opacity: 1.0 }, {duration: 200}, complete: function(){ return true;} );
            $('#' + this.id + 'Cap').animate({
                height: '56px',
                opacity: 1.0
            }, {
                duration: 200,
                complete: function () {
                    $('#' + this.id + 'Cap').animate({ 'height': '54px', opacity: 1.0 }, 200);
                }
            });
        });
    });
});
