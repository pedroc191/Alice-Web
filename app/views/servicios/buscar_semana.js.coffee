$('#prueba2').empty()
$('#prueba2').append("<%= escape_javascript(render(:partial => 'servicios/buscar_semana')) %>")
