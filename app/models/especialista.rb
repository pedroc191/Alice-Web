class Especialista < ApplicationRecord

  	has_many :especialista_servicios
	has_many :servicios, through: :especialista_servicios

end
