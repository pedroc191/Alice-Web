// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
//
//= require jquery/jquery-3.1.1.min.js
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require metisMenu/jquery.metisMenu.js
//= require pace/pace.min.js
//= require peity/jquery.peity.min.js
//= require slimscroll/jquery.slimscroll.min.js
//= require inspinia.js
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require jquery.validate.localization/messages_es

/*=============================================================================
            Funcion para Igualar el Tamanio de 2 o mas Elementos
=============================================================================*/

function alturasIguales(elemento){
    var altura_elemento_base = 0;

    jQuery(elemento).each(function() {
            jQuery(this).height('auto');
    });

    jQuery(elemento).each(function() {
        if(altura_elemento_base < jQuery(this).height()){
            altura_elemento_base = jQuery(this).height();
        }
    });

    jQuery(elemento).each(function() {
        jQuery(this).height(altura_elemento_base);
    });
}
        $(function() {

            $('body').addClass('landing-page');
            $('body').attr('id', 'page-top');

           /*$('body').scrollspy({
                target: '.navbar-fixed-top',
                offset: 80
            });

            // Page scrolling feature
            $('a.page-scroll').bind('click', function(event) {
                var link = $(this);
                $('html, body').stop().animate({
                    scrollTop: $(link.attr('href')).offset().top - 50
                }, 500);
                event.preventDefault();
                $("#navbar").collapse('hide');
            });*/

            var cbpAnimatedHeader = (function() {
                var docElem = document.documentElement,
                        header = document.querySelector( '.navbar-default' ),
                        didScroll = false,
                        changeHeaderOn = 200;
                function init() {
                    window.addEventListener( 'scroll', function( event ) {
                        if( !didScroll ) {
                            didScroll = true;
                            setTimeout( scrollPage, 250 );
                        }
                    }, false );
                }
                function scrollPage() {
                    var sy = scrollY();
                    if ( sy >= changeHeaderOn ) {
                        $(header).addClass('navbar-scroll')
                    }
                    else {
                        $(header).removeClass('navbar-scroll')
                    }
                    didScroll = false;
                }
                function scrollY() {
                    return window.pageYOffset || docElem.scrollTop;
                }
                init();

            })();

            $('#sidebar-btn').click(function(){
                $('#sidebar').toggleClass('visible');
            });


        });