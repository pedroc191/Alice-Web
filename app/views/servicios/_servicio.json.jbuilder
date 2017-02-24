json.extract! servicio, :id, :codigo, :especialidad_id, :nombre, :estatus, :created_at, :updated_at
json.url servicio_url(servicio, format: :json)