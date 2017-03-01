json.extract! categoria_servicio, :id, :codigo, :nombre, :estatus, :created_at, :updated_at
json.url categoria_servicio_url(categoria_servicio, format: :json)