
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

jQuery(document).ready(function() {
    alturasIguales('.content-list-servicios');
});

jQuery(window).load(function() {
    alturasIguales('.content-list-servicios');
});

jQuery(window).resize(function() {
    alturasIguales('.content-list-servicios');
});