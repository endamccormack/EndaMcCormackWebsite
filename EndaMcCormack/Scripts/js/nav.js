jquery_1_5(document).ready(function () {
    var currentPage = jquery_1_7_2_min(this).attr('title');
    var color;

    var navSelected;
    switch (currentPage) {
        case 'Home - The Endangered Droid - Enda Mc Cormack':
            navSelected = 'homeNav';
            break;
        case 'Portfolio - The Endangered Droid - Enda Mc Cormack':
            navSelected = 'portfolioNav';
            break;
        case 'Blog - The Endangered Droid - Enda Mc Cormack':
            navSelected = 'blogNav';
            break;
        case 'Contact - The Endangered Droid - Enda Mc Cormack':
            navSelected = 'contactNav';
            break;
        case 'Tutorials - The Endangered Droid - Enda Mc Cormack':
            navSelected = 'tutorialsNav';
            break;
        default:
            navSelected = 'homeNav';
    }
    //normal links
    jquery_1_7_2_min('#main a').mouseenter(function () {
        if (!jquery_1_7_2_min(this).hasClass('nonJsLink')) {
            if (!jquery_1_7_2_min(this).is('div.postHeader a')) {
                if (!jquery_1_7_2_min(this).is(':animated')) {
                    color = jquery_1_7_2_min(this).css('background-color');
                }
                jquery_1_7_2_min(this).clearQueue().animate({ color: color, backgroundColor: '#fff' }, 200);
            }
        }

    });


    jquery_1_7_2_min('#main a').mouseleave(function () {
        if (!jquery_1_7_2_min(this).hasClass('nonJsLink')) {
            if (!jquery_1_7_2_min(this).is('div.postHeader a')) {
                jquery_1_7_2_min(this).clearQueue().animate({ color: '#fff', backgroundColor: color }, 200);
            }
        }

    });
    //Post headers links
    jquery_1_7_2_min('div.postHeader').mouseenter(function () {
            if (!jquery_1_7_2_min(this).is(':animated')) {
                color = jquery_1_7_2_min(this).css('background-color');
            }
            jquery_1_7_2_min(this).clearQueue().animate({ backgroundColor: '#fff', color: color }, 200);
    });

    jquery_1_7_2_min('div.postHeader').mouseleave(function () {
        jquery_1_7_2_min(this).clearQueue().animate({ backgroundColor: color, color: '#fff' }, 200);
    });






    jquery_1_7_2_min('.skill').each(function () {
        jquery_1_7_2_min('.skill,' + "#" + this.id + "Content").mouseenter(function () {
            jquery_1_7_2_min('#' + this.id + 'Content').slideDown('fast');
            jquery_1_7_2_min('#' + this.id + ' ul li').clearQueue().animate({ color: '#212962', backgroundColor: '#fff' }, 200);
            //alert(this.id);
        });
        jquery_1_7_2_min('.skill').mouseleave(function () {
            jquery_1_7_2_min('#' + this.id + 'Content').stop();
            jquery_1_7_2_min('#' + this.id + 'Content').slideUp('fast');
            jquery_1_7_2_min('#' + this.id + ' ul li').clearQueue().animate({ color: '#fff', backgroundColor: '#212962' }, 200);
            //alert(this);
        });
    });

    jquery_1_7_2_min('.toe').hover(function () {
        jquery_1_7_2_min(this).clearQueue().animate({ 'marginTop': '-10px' }, "fast");
        jquery_1_7_2_min(this).clearQueue().css('color', '#3b5f92');
    });
    jquery_1_7_2_min('.toe').mouseleave(function () {
        jquery_1_7_2_min(this).animate({ 'marginTop': '0px' }, "fast");
        jquery_1_7_2_min(this).css('color', '#212962');

    });

    jquery_1_5('#' + navSelected + ' a').css('width', '200px');

    jquery_1_5('#nav ul li a').hover(function () {
        jquery_1_5('li#' + navSelected + ' a').removeClass("active").stop(':animated').animate({ width: "50px" }, { duration: 450, easing: "easeInOutQuad", complete: "callback" });
        jquery_1_5("#homeNav a").removeAttr("width");
        if (jquery_1_5(this).is(':animated')) {
            jquery_1_5(this).addClass("active").stop().animate({ width: "200px" }, { duration: 450, easing: "easeOutQuad", complete: "callback" });
        } else {
            jquery_1_5(this).addClass("active").stop().animate({ width: "200px" }, { duration: 400, easing: "easeOutQuad", complete: "callback" });
        }

    }, function () {
        if (jquery_1_5(this).is(':animated')) {
            jquery_1_5(this).removeClass("active").stop().animate({ width: "50px" }, { duration: 400, easing: "easeInOutQuad", complete: "callback" })
        } else {
            jquery_1_5(this).removeClass("active").stop(':animated').animate({ width: "50px" }, { duration: 450, easing: "easeInOutQuad", complete: "callback" });

        }
    });

    jquery_1_5("div#nav").mouseleave(function () {
        jquery_1_5('li#' + navSelected + ' a').addClass("active").stop().animate({ width: "200px" }, { duration: 400, easing: "easeOutQuad" });
    });
    jquery_1_5('#toTop').click(function () {
        jquery_1_5('body,html').animate({ scrollTop: 0 }, 600);
    });
});