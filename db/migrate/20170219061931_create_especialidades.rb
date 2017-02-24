class CreateEspecialidades < ActiveRecord::Migration[5.0]
  def change
    create_table :especialidades do |t|
      t.string :codigo
      t.references :categoria_servicio, foreign_key: true
      t.string :nombre
      t.string :slug
      t.string :estatus

      t.timestamps
    end
    add_index :especialidades, :slug, unique: true
  end
end
