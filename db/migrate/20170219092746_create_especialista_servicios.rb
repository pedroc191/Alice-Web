class CreateEspecialistaServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :especialista_servicios do |t|
      t.string :codigo
      t.references :servicio, foreign_key: true
      t.references :especialista, foreign_key: true
      t.string :estatus

      t.timestamps
    end
  end
end
