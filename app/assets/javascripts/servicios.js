
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
//= require jasny/jasny-bootstrap.min.js

    
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
            // Used to skip the "Warning" step if the user is old enough.
            
        
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
        var fecha_solicitante = new Date(fecha_inicio.getFullYear() - 16, (fecha_inicio.getMonth()- 1), fecha_inicio.getDate());

        $('#fecha-n-solicitante .input-group.date').datepicker({
            todayBtn: "linked",
            keyboardNavigation: false,
            forceParse: false,
            autoclose: true,
            format: "dd/mm/yyyy",
            endDate: fecha_solicitante,
            language: "es"
        });

        $('#fecha-n-nuevo .input-group.date').datepicker({
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
        });

        $('#select-week .input-group.date').datepicker('setDate', fecha_inicio);
        $('#select-week .input-group.date').datepicker('update');
        $('#select-week .input-group.date').val(fecha_inicio);

        var calculate_week_range = function(e){

            var input = e.currentTarget;

            $('body').find('.datepicker-days table tbody tr').removeClass('week-active');

            var tr = $('body').find('.datepicker-days table tbody tr td.active.day').parent();
            tr.addClass('week-active');


            var date = e.date;
            var start_date = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay());
            var end_date = new Date(date.getFullYear(), date.getMonth(), date.getDate() - date.getDay() + 6);

            var text_date_inicio = start_date.getDate() + '/' + (start_date.getMonth() + 1) + '/' + start_date.getFullYear();

            var text_date_fin = end_date.getDate() + '/' + (end_date.getMonth() + 1) + '/' + end_date.getFullYear();
            $('#week-star input').val(text_date_inicio);
            $('#week-end input').val(text_date_fin);
            
            validar_link(start_date);
        }
        
        function validar_link(start_date) {
    
            var link = $('#boton_horario').attr('href');
            var link = link.substring(0, link.length - 10);

            var dia = '';
            var mes = '';
            
            if ((start_date.getMonth() + 1) <= 9){

                mes = '0'+ (start_date.getMonth() + 1);
            }
            else{
                mes = (start_date.getMonth() + 1);
            }
            
            if (start_date.getDate() <= 9){

                dia = '0' + start_date.getDate();
            }
            else{
                dia = start_date.getDate();
            }        
            var new_link = link + start_date.getFullYear() + '-' + mes + '-' + dia;
            
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
    function check_radio(chkradio) {
    
        var radios = $(chkradio);

        var value = '';

        for (var i = 0, length = radios.length; i < length; i++) {
            if (radios[i].checked) {
                // do whatever you want with the checked radio
                value = radios[i].value;

                // only one radio can be logically checked, don't check the rest
                break;
            }
        }
        return value;
    }
    function mostrar_datos(opcion) {
        
        if (opcion === 'paciente_solicita'){

            $('.paciente_diferente').css('display','none');
                 
            if (check_radio('input[name="tipo_usuario"]') === 'Usuario_nuevo'){

                // Nuevo Usuario y Solicita una cita para Si mismo
                    
                $('.paciente_solicita.viejo').css('display','none');
                $('.paciente_solicita.nuevo').css('display','block');
                $('.paciente_solicita.datos').css('display','block');
                $('#nuevo').text('Por favor ' + $('input[name="nombre_solicitante"]').val() + ' ' + $('input[name="apellido_solicitante"]').val());
                    
            }
            else{

                // Usuario Registrado y Solicita una cita para si mismo
                    
                $('.paciente_solicita.nuevo').css('display','none');
                $('.paciente_solicita.viejo').css('display','block');
                $('.paciente_solicita.datos').css('display','none');
            }
        }
        else{

            $('.paciente_solicita.nuevo').css('display','none');
            $('.paciente_solicita.viejo').css('display','none');
            $('.paciente_solicita.datos').css('display','none');
            $('.paciente_diferente').css('display','block');
        }
    }

    var capas = ["Usuario_viejo", "Usuario_nuevo"];
    function mostrar(capa) {
        for (i = 0, total = capas.length; i < total; i ++)
            document.getElementById(capas[i]).style.display = (capas[i] == capa) ? "block":"none";
    }
