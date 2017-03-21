$('#categoria-servicios .container').empty()
$('#categoria-servicios .container').append("<%= escape_javascript(render(:partial => 'categoria_servicios/especialidades')) %>")