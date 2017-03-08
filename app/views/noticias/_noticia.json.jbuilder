json.extract! noticia, :id, :titulo, :descripcion, :created_at, :updated_at
json.url noticia_url(noticia, format: :json)
