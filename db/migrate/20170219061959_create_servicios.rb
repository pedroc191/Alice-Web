class CreateServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :servicios do |t|
      t.string :codigo
      t.references :especialidad, foreign_key: true
      t.string :nombre
      t.string :slug
      t.string :estatus

      t.timestamps
    end
    add_index :servicios, :slug, unique: true
  end
end
