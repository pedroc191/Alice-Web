class Servicio < ApplicationRecord

	extend FriendlyId
  	
	belongs_to :especialidad
	has_many :especialista_servicios
	has_many :especialistas, through: :especialista_servicios
  
  	friendly_id :nombre, use: :slugged
end
