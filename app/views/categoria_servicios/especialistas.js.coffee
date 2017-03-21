$('#prueba').empty()
$('#prueba').append("<%= escape_javascript(render(:partial => 'categoria_servicios/especialistas')) %>")