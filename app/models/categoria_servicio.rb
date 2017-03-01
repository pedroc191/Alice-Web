class CategoriaServicio < ApplicationRecord
	
	extend FriendlyId
  	
	has_many :especialidades
	
  	friendly_id :nombre, use: :slugged
end
