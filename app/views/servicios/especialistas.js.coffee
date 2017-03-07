$('#prueba').empty()
$('#prueba').append("<%= escape_javascript(render(:partial => 'servicios/especialistas')) %>")
