class Especialidad < ApplicationRecord

	extend FriendlyId
  	
	belongs_to :categoria_servicio
	has_many :servicios

  	friendly_id :nombre, use: :slugged
end
