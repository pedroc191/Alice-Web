
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
//= require datapicker/bootstrap-datepicker-es.js
//= require datapicker/locales/bootstrap-datepicker.es.js

    
$(function() {
    var form = $("#wizard").show();
     
    form.steps({
        headerTag: "h3",
        bodyTag: "fieldset",
        transitionEffect: "slideLeft",
        labels: {
            cancel: "Cancelar",
            current: "Paso comun:",
            pagination: "Paginacion",
            finish: "Solicitar",
            next: "Siguiente",
            previous: "Anterior",
            loading: "Cargando ..."
        },
        onStepChanging: function (event, currentIndex, newIndex)
        {
            // Allways allow previous action even if the current form is not valid!
            if (currentIndex > newIndex)
            {
                return true;
            }
            // Forbid next action on "Warning" step if the user is to young
            if (newIndex === 3 && Number($("#age-2").val()) < 18)
            {
                return false;
            }
            
            
            // Needed in some cases if the user went back (clean up)
            if (currentIndex < newIndex)
            {
                // To remove error styles
                form.find(".body:eq(" + newIndex + ") label.error").remove();
                form.find(".body:eq(" + newIndex + ") .error").removeClass("error");
            }
            form.validate().settings.ignore = ":disabled,:hidden";
            return form.valid();
        },
        onStepChanged: function (event, currentIndex, priorIndex)
        {
            console.log($('input[name="tipo_paciente"]').val());
            // Used to skip the "Warning" step if the user is old enough.
            
            if ($('input[name="tipo_paciente"]').val() === 'paciente_solicita')
            {
                $('input[name="nombre_paciente"]').prop( "disabled", true );
                $('input[name="cedula_paciente"]').prop( "disabled", true );
                $('input[name="email_paciente"]').prop( "disabled", true );
                $('input[name="fecha_nacimiento_paciente"]').prop( "disabled", true );

                if ($('input[name="tipo_usuario"]').val() === 'Usuario_nuevo')
                {
                    // Nuevo Usuario y Solicita una cita para Si mismo
                    $('input[name="sexo_paciente"]').prop( "disabled", false );
                    $('input[name="telefono_paciente"]').prop( "disabled", false);
                    $('input[name="direccion_paciente"]').prop( "disabled", false );

                    $('input[name="sexo_paciente"]').val('');
                    $('input[name="telefono_paciente"]').val('');
                    $('input[name="direccion_paciente"]').val('');
                }
                else{

                    // Usuario Registrado y Solicita una cita para si mismo
                    $('input[name="sexo_paciente"]').prop( "disabled", true );
                    $('input[name="telefono_paciente"]').prop( "disabled", true);
                    $('input[name="direccion_paciente"]').prop( "disabled", true );

             
                $('input[name="nombre_paciente"]').val('');
                $('input[name="cedula_paciente"]').val('');
                $('input[name="email_paciente"]').val('');
                $('input[name="fecha_nacimiento_paciente"]').val('');
                }
            }
            if ($('input[name="tipo_paciente"]').val() === 'paciente_diferente')
            {
                $('input[name="nombre_paciente"]').prop( "disabled", false );
                $('input[name="cedula_paciente"]').prop( "disabled", false );
                $('input[name="email_paciente"]').prop( "disabled", false );
                $('input[name="fecha_nacimiento_paciente"]').prop( "disabled", false );

                $('input[name="sexo_paciente"]').prop( "disabled", false);
                $('input[name="telefono_paciente"]').prop( "disabled", false);
                $('input[name="direccion_paciente"]').prop( "disabled", false);                    

                $('input[name="nombre_paciente"]').val('');
                $('input[name="cedula_paciente"]').val('');
                $('input[name="email_paciente"]').val('');
            }
            // Used to skip the "Warning" step if the user is old enough and wants to the previous step.
            if (currentIndex === 2 && priorIndex === 3)
            {
                form.steps("previous");
            }
        },
        onFinishing: function (event, currentIndex)
        {
            form.validate().settings.ignore = ":disabled";
            return form.valid();
        },
        onFinished: function (event, currentIndex)
        {
            alert("Submitted!");
        }
    }).validate({
        errorPlacement: function errorPlacement(error, element) { element.before(error); }
    });

        var fecha_inicio = new Date();
        var fecha_fin = new Date(fecha_inicio.getFullYear(), 11, 31);
        
        $('#data_2 .input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            format: "dd/mm/yyyy",
            endDate: fecha_inicio,
            language: "es"
        });

        $('#data_3 .input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            format: "dd/mm/yyyy",
            endDate: fecha_inicio,
            language: "es"
        });

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
        }).on('changeDate', function(e) {
            
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

            validar_link(start_date);

        }
        Inicializar_fecha();
        
    });

    var capas = ["Usuario_viejo", "Usuario_nuevo"];
    function mostrar(capa) {
        for (i = 0, total = capas.length; i < total; i ++)
            document.getElementById(capas[i]).style.display = (capas[i] == capa) ? "block":"none";
    }
