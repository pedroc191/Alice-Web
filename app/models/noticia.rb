class Noticia < ApplicationRecord
	extend FriendlyId
  	
  	friendly_id :slug, use: [:slugged, :finders]
end
