# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170219211634) do

  create_table "categoria_servicios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "slug"
    t.string   "estatus"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_categoria_servicios_on_slug", unique: true, using: :btree
  end

  create_table "especialidades", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.integer  "categoria_servicio_id"
    t.string   "nombre"
    t.string   "slug"
    t.string   "estatus"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.index ["categoria_servicio_id"], name: "index_especialidades_on_categoria_servicio_id", using: :btree
    t.index ["slug"], name: "index_especialidades_on_slug", unique: true, using: :btree
  end

  create_table "especialista_servicios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.integer  "servicio_id"
    t.integer  "especialista_id"
    t.string   "estatus"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["especialista_id"], name: "index_especialista_servicios_on_especialista_id", using: :btree
    t.index ["servicio_id"], name: "index_especialista_servicios_on_servicio_id", using: :btree
  end

  create_table "especialistas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.string   "nombre"
    t.string   "descripcion"
    t.string   "estatus"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "friendly_id_slugs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "servicios", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "codigo"
    t.integer  "especialidad_id"
    t.string   "nombre"
    t.string   "slug"
    t.string   "estatus"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["especialidad_id"], name: "index_servicios_on_especialidad_id", using: :btree
    t.index ["slug"], name: "index_servicios_on_slug", unique: true, using: :btree
  end

  add_foreign_key "especialidades", "categoria_servicios"
  add_foreign_key "especialista_servicios", "especialistas"
  add_foreign_key "especialista_servicios", "servicios"
  add_foreign_key "servicios", "especialidades"
end
