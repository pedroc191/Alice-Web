
/* STEPS WIZARD */
//= require steps/jquery.steps.min.js

//= require datapicker/bootstrap-datepicker.js

$(document).ready(function() {
    alturasIguales('.content-especialista');
    alturasIguales('.col-sm-8');
    $('.landing-page #servicio .content-especialista .btn-dark-blue').css('position','inherit');
    $('.landing-page #servicio .content-especialista .btn-dark-blue').css('bottom','0px');
});

$(window).on('load', function() {
    alturasIguales('.content-especialista');
    alturasIguales('.col-sm-8');
    $('.landing-page #servicio .content-especialista .btn-dark-blue').css('position','inherit');
    $('.landing-page #servicio .content-especialista .btn-dark-blue').css('bottom','0px');
});

$(window).on('resize', function() {
    alturasIguales('.content-especialista');    
    alturasIguales('.col-sm-8');
});


/* STEPS WIZARD */
//= require steps/jquery.steps.min.js

//= require datapicker/bootstrap-datepicker.js

//= require datapicker/locales/bootstrap-datepicker.es.js


    $(function() {

        $("#wizard").steps({
            labels: {
                cancel: "Cancelar",
                current: "Paso comun:",
                pagination: "Paginacion",
                finish: "Solicitar",
                next: "Siguiente",
                previous: "Anterior",
                loading: "Cargando ..."
            }
        });
        /*$("#form").steps({
            bodyTag: "fieldset",
            onStepChanging: function (event, currentIndex, newIndex) {
                // Always allow going backward even if the current step contains invalid fields!
                if (currentIndex > newIndex) {
                    return true;
                }

                // Forbid suppressing "Warning" step if the user is to young
                if (newIndex === 3) {
                    return false;
                }

                var form = $(this);

                // Clean up if user went backward before
                if (currentIndex < newIndex) {
                    // To remove error styles
                    $(".body:eq(" + newIndex + ") label.error", form).remove();
                    $(".body:eq(" + newIndex + ") .error", form).removeClass("error");
                }

                // Disable validation on fields that are disabled or hidden.
                form.validate().settings.ignore = ":disabled,:hidden";

                // Start validation; Prevent going forward if false
                return form.valid();
            },
            onStepChanged: function (event, currentIndex, priorIndex) {
                // Suppress (skip) "Warning" step if the user is old enough.
                if (currentIndex === 2) {
                    $(this).steps("next");
                }

                // Suppress (skip) "Warning" step if the user is old enough and wants to the previous step.
                if (currentIndex === 2 && priorIndex === 3) {
                    $(this).steps("previous");
                }
            },
            onFinishing: function (event, currentIndex) {
                var form = $(this);

                // Disable validation on fields that are disabled.
                // At this point it's recommended to do an overall check (mean ignoring only disabled fields)
                form.validate().settings.ignore = ":disabled";

                // Start validation; Prevent form submission if false
                return form.valid();
            },
            onFinished: function (event, currentIndex) {
                var form = $(this);

                // Submit form input
                form.submit();
            }
            }).validate({
                    errorPlacement: function (error, element) {
                        element.before(error);
                    },
                    rules: {
                        confirm: {
                            equalTo: "#password"
                        }
                    }
                });
        */

        var fecha_inicio = new Date();
        var fecha_fin = new Date(fecha_inicio.getFullYear(), 11, 31);
        

        $('#select-week .input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            format: "dd/mm/yyyy",
            startDate: fecha_inicio,
            endDate: fecha_fin,
            maxViewMode: 1,
            language: "es"

        }).on('show', function(e){

            var tr = $('body').find('.datepicker-days table tbody tr');

            tr.mouseover(function(){
                $(this).addClass('week');
            });

            tr.mouseout(function(){
                $(this).removeClass('week');
            });

            $('.datepicker').addClass('dateweek');
            calculate_week_range(e);

        }).on('hide', function(e){
            calculate_week_range(e);

        }).on('click', function(e) {
            
        });

        $('#select-week .input-group.date').datepicker('setDate', fecha_inicio);
        $('#select-week .input-group.date').datepicker('update');
        $('#select-week .input-group.date').val(fecha_inicio);

        var calculate_week_range = function(e){

            var input = e.currentTarget;

            // remove all active class
            $('body').find('.datepicker-days table tbody tr').removeClass('week-active');

            // add active class
            var tr = $('body').find('.datepicker-days table tbody tr td.active.day').parent();
            tr.addClass('week-active');

            // find start and end date of the week

            var date = e.date;
            var start_date = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
            var end_date = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);

            // make a friendly string

            var text_date_inicio = start_date.getDate() + '/' + (start_date.getMonth() + 1) + '/' + start_date.getFullYear();

            var text_date_fin = end_date.getDate() + '/' + (end_date.getMonth() + 1) + '/' + end_date.getFullYear();
            $('#week-star input').val(text_date_inicio);
            $('#week-end input').val(text_date_fin);

            validar_link(start_date);

        }

        function validar_link(start_date) {
    
            var link = $('#boton_horario').attr('href');
            console.log(link)
            var link = link.substring(0, link.length - 10)
            console.log(link)

            var dia = '';
            var mes = '';
            
            if ((start_date.getMonth() + 1) <= 9)
            {
                mes = '0'+ (start_date.getMonth() + 1);
            }
            else{
                mes = (start_date.getMonth() + 1);
            }
            
            if (start_date.getDate() <= 9)
            {
                dia = '0' + start_date.getDate();
            }
            else{
                dia = start_date.getDate();
            }        
            var new_link = link + start_date.getFullYear() + '-' + mes + '-' + dia;
            console.log(new_link);
            
            $('#boton_horario').attr('href', new_link);
        }

        function Inicializar_fecha () {
                    
            var date = new Date();

            var start_date = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
            var end_date = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);

            // make a friendly string

            var text_date_inicio = start_date.getDate() + '/' + (start_date.getMonth() + 1) + '/' + start_date.getFullYear();

            var text_date_fin = end_date.getDate() + '/' + (end_date.getMonth() + 1) + '/' + end_date.getFullYear();
            $('#week-star input').val(text_date_inicio);
            $('#week-end input').val(text_date_fin);

        }
        Inicializar_fecha();
        
        $('#data_2 .input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        });

        $('#data_3 .input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            calendarWeeks: true,
            autoclose: true
        });
    });

    var capas = ["Usuarioviejo", "Usuarionuevo"];
    function mostrar(capa) {
        for (i = 0, total = capas.length; i < total; i ++)
            document.getElementById(capas[i]).style.display = (capas[i] == capa) ? "block":"none";
    }
