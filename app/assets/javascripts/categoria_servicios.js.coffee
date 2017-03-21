$ ->
  $(document).on 'click', '#boton_especialistas', (evt) ->
    $.ajax 'especialistas',
      type: 'GET'
      dataType: 'script'
      data: {
        servicio_id: $("#boton_especialistas").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

$ ->
  $(document).on 'click', '#boton_especialidad', (evt) ->
    $.ajax 'especialidades',
      type: 'GET'
      dataType: 'script'
      data: {
        servicio_id: $("#boton_especialidad").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

