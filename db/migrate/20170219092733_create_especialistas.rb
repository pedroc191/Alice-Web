class CreateEspecialistas < ActiveRecord::Migration[5.0]
  def change
    create_table :especialistas do |t|
      t.string :codigo
      t.string :nombre
      t.string :descripcion
      t.string :estatus

      t.timestamps
    end
  end
end
