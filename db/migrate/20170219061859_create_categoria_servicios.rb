class CreateCategoriaServicios < ActiveRecord::Migration[5.0]
  def change
    create_table :categoria_servicios do |t|
      t.string :codigo
      t.string :nombre
      t.string :slug
      t.string :estatus

      t.timestamps
    end
    add_index :categoria_servicios, :slug, unique: true
  end
end
