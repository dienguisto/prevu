# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150322163825) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adherents", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.integer  "status_matrimonial"
    t.date     "date_de_naissance"
    t.string   "lieu_de_naissance"
    t.string   "password_digest"
    t.integer  "status"
    t.datetime "last_activation"
    t.datetime "last_suspension"
    t.datetime "last_delete"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "matricule"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "password_salt"
    t.integer  "sexe"
    t.integer  "affiliation"
    t.integer  "parrain_id"
    t.integer  "groupe_id"
    t.integer  "contact_id"
    t.integer  "type_piece_identite"
    t.string   "numero_piece_identite"
    t.string   "email"
  end

  add_index "adherents", ["groupe_id"], name: "index_adherents_on_groupe_id", using: :btree
  add_index "adherents", ["matricule"], name: "index_adherents_on_matricule", unique: true, using: :btree

  create_table "adherents_tags", id: false, force: :cascade do |t|
    t.integer "adherent_id", null: false
    t.integer "tag_id",      null: false
  end

  create_table "affectation_aperitrices", force: :cascade do |t|
    t.integer  "groupe_id"
    t.integer  "structure_aperitrice_id"
    t.boolean  "actif",                   default: true, null: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "affectation_aperitrices", ["groupe_id"], name: "index_affectation_aperitrices_on_groupe_id", using: :btree
  add_index "affectation_aperitrices", ["structure_aperitrice_id"], name: "index_affectation_aperitrices_on_structure_aperitrice_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "titre"
    t.string   "nom"
    t.string   "prenom"
    t.string   "telephone"
    t.string   "adresse"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  create_table "detail_ordonnances", force: :cascade do |t|
    t.integer  "quantite"
    t.float    "prix_unitaire"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "ordonnance_id"
    t.integer  "medicament_id"
  end

  create_table "entites", force: :cascade do |t|
    t.integer  "entite_id"
    t.string   "entite_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "entites", ["entite_type", "entite_id"], name: "index_entites_on_entite_type_and_entite_id", using: :btree

  create_table "formation_sanitaires", force: :cascade do |t|
    t.integer  "niveau",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "formules", force: :cascade do |t|
    t.integer  "structure_assurance_id"
    t.string   "nom",                                null: false
    t.integer  "periode",                            null: false
    t.integer  "occurrence_periode",     default: 1, null: false
    t.float    "montant_adhesion",                   null: false
    t.float    "montant_cotisation",                 null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "formules", ["structure_assurance_id"], name: "index_formules_on_structure_assurance_id", using: :btree

  create_table "formules_structure_sanitaires", id: false, force: :cascade do |t|
    t.integer "structure_sanitaire_id", null: false
    t.integer "formule_id",             null: false
  end

  create_table "groupes", force: :cascade do |t|
    t.integer  "structure_assurance_id"
    t.string   "nom",                    null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "groupes", ["structure_assurance_id"], name: "index_groupes_on_structure_assurance_id", using: :btree

  create_table "medicaments", force: :cascade do |t|
    t.string   "nom"
    t.string   "reference"
    t.boolean  "actif"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "micro_assurances", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mutuelles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ordonnances", force: :cascade do |t|
    t.float    "prix_total"
    t.integer  "adherent_id"
    t.integer  "pharmacy_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ordonnances", ["adherent_id"], name: "index_ordonnances_on_adherent_id", using: :btree
  add_index "ordonnances", ["pharmacy_id"], name: "index_ordonnances_on_pharmacy_id", using: :btree

  create_table "pharmacies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "structure_aperitrices", force: :cascade do |t|
    t.string   "nom"
    t.string   "adresse"
    t.date     "date_adhesion"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "structure_aperitrices", ["nom"], name: "index_structure_aperitrices_on_nom", unique: true, using: :btree

  create_table "structure_assurances", force: :cascade do |t|
    t.string   "nom"
    t.string   "adresse"
    t.date     "date_adhesion"
    t.string   "numero_agrement"
    t.string   "couleur",           limit: 10
    t.boolean  "actif",                        default: false
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "structure_id"
    t.string   "structure_type"
  end

  create_table "structure_sanitaires", force: :cascade do |t|
    t.string   "nom",                               null: false
    t.string   "adresse"
    t.date     "date_adhesion"
    t.boolean  "actif",             default: false
    t.integer  "structure_id"
    t.string   "structure_type"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  add_index "structure_sanitaires", ["structure_type", "structure_id"], name: "index_structure_sanitaires_on_structure_type_and_structure_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "libelle"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "role"
    t.integer  "entite_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["entite_id"], name: "index_users_on_entite_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "adherents", "groupes"
  add_foreign_key "affectation_aperitrices", "groupes"
  add_foreign_key "affectation_aperitrices", "structure_aperitrices"
  add_foreign_key "formules", "structure_assurances"
  add_foreign_key "groupes", "structure_assurances"
  add_foreign_key "ordonnances", "adherents"
  add_foreign_key "ordonnances", "pharmacies"
  add_foreign_key "users", "entites"
end
