class EspecialistaServicio < ApplicationRecord
  belongs_to :servicio
  belongs_to :especialista
end
