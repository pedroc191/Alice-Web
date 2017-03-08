$ ->
  $(document).on 'click', '#boton_especialidad', (evt) ->
    $.ajax 'especialistas',
      type: 'GET'
      dataType: 'script'
      data: {
        servicio_id: $("#boton_especialidad").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")