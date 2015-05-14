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

ActiveRecord::Schema.define(version: 20150512120604) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adherents", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.integer  "status_matrimonial"
    t.date     "date_de_naissance"
    t.string   "lieu_de_naissance"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "status"
    t.datetime "last_activation"
    t.datetime "last_suspension"
    t.datetime "last_delete"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
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
    t.integer  "structure_assurance_id"
    t.string   "profession"
    t.string   "numero_assurance"
    t.string   "numero_police"
  end

  add_index "adherents", ["email"], name: "index_adherents_on_email", unique: true, using: :btree
  add_index "adherents", ["groupe_id"], name: "index_adherents_on_groupe_id", using: :btree
  add_index "adherents", ["matricule"], name: "index_adherents_on_matricule", unique: true, using: :btree
  add_index "adherents", ["structure_assurance_id"], name: "index_adherents_on_structure_assurance_id", using: :btree

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

  create_table "categorie_acte_medicals", force: :cascade do |t|
    t.string   "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comptes", force: :cascade do |t|
    t.integer  "proprietaire_id"
    t.string   "proprietaire_type"
    t.float    "total_versement",   default: 0.0, null: false
    t.float    "solde",             default: 0.0, null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.float    "total_retrait",     default: 0.0, null: false
  end

  add_index "comptes", ["proprietaire_type", "proprietaire_id"], name: "index_comptes_on_proprietaire_type_and_proprietaire_id", using: :btree

  create_table "consultations", force: :cascade do |t|
    t.text     "description"
    t.float    "montant_total"
    t.integer  "adherent_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "type_acte_medical_id"
    t.integer  "formation_sanitaire_id"
    t.float    "montant_pris_en_charge",    null: false
    t.float    "montant_paye_par_adherent", null: false
    t.integer  "structure_assurance_id"
    t.integer  "origine_id"
    t.date     "date_referencement"
  end

  add_index "consultations", ["structure_assurance_id"], name: "index_consultations_on_structure_assurance_id", using: :btree

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

  create_table "cotisations", force: :cascade do |t|
    t.integer  "adherent_id"
    t.integer  "souscription_id"
    t.float    "montant",         null: false
    t.date     "pour_la_date",    null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "cotisations", ["adherent_id"], name: "index_cotisations_on_adherent_id", using: :btree
  add_index "cotisations", ["pour_la_date"], name: "index_cotisations_on_pour_la_date", using: :btree
  add_index "cotisations", ["souscription_id"], name: "index_cotisations_on_souscription_id", using: :btree

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

  create_table "formule_structure_sanitaires", force: :cascade do |t|
    t.integer  "formule_id"
    t.integer  "formation_sanitaire_id"
    t.boolean  "actif",                  default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "formule_structure_sanitaires", ["formation_sanitaire_id"], name: "index_formule_structure_sanitaires_on_formation_sanitaire_id", using: :btree
  add_index "formule_structure_sanitaires", ["formule_id"], name: "index_formule_structure_sanitaires_on_formule_id", using: :btree

  create_table "formules", force: :cascade do |t|
    t.integer  "structure_assurance_id"
    t.string   "nom",                                null: false
    t.integer  "periode",                            null: false
    t.integer  "occurrence_periode",     default: 1, null: false
    t.float    "montant_adhesion",                   null: false
    t.float    "montant_cotisation",                 null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.float    "ticket_moderateur",                  null: false
  end

  add_index "formules", ["structure_assurance_id"], name: "index_formules_on_structure_assurance_id", using: :btree

  create_table "groupes", force: :cascade do |t|
    t.string   "nom",                     null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "structure_aperitrice_id"
    t.integer  "structure_assurance_id"
  end

  add_index "groupes", ["structure_aperitrice_id"], name: "index_groupes_on_structure_aperitrice_id", using: :btree
  add_index "groupes", ["structure_assurance_id"], name: "index_groupes_on_structure_assurance_id", using: :btree

  create_table "mandataires", force: :cascade do |t|
    t.string   "prenom",       null: false
    t.string   "nom",          null: false
    t.string   "telephone"
    t.string   "adresse"
    t.integer  "type_piece"
    t.string   "numero_piece"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

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
    t.float    "montant_total"
    t.integer  "adherent_id"
    t.integer  "pharmacy_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.float    "montant_pris_en_charge"
    t.float    "montant_paye_par_adherent"
    t.integer  "structure_assurance_id"
  end

  add_index "ordonnances", ["adherent_id"], name: "index_ordonnances_on_adherent_id", using: :btree
  add_index "ordonnances", ["pharmacy_id"], name: "index_ordonnances_on_pharmacy_id", using: :btree
  add_index "ordonnances", ["structure_assurance_id"], name: "index_ordonnances_on_structure_assurance_id", using: :btree

  create_table "pharmacies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "souscriptions", force: :cascade do |t|
    t.integer  "adherent_id"
    t.integer  "formule_id"
    t.boolean  "paye",            default: false
    t.datetime "date_paiement"
    t.boolean  "actif",           default: false
    t.datetime "date_activation"
    t.date     "date_expiration"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "souscriptions", ["adherent_id"], name: "index_souscriptions_on_adherent_id", using: :btree
  add_index "souscriptions", ["formule_id"], name: "index_souscriptions_on_formule_id", using: :btree

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
    t.string   "nom"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "type_acte_medicals", force: :cascade do |t|
    t.string   "nom"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "categorie_acte_medical_id"
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
    t.integer  "creator_id"
  end

  add_index "users", ["creator_id"], name: "index_users_on_creator_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["entite_id"], name: "index_users_on_entite_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "versements", force: :cascade do |t|
    t.integer  "compte_id",              null: false
    t.integer  "mandataire_id"
    t.float    "montant",                null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "structure_assurance_id"
  end

  add_index "versements", ["compte_id"], name: "index_versements_on_compte_id", using: :btree
  add_index "versements", ["mandataire_id"], name: "index_versements_on_mandataire_id", using: :btree
  add_index "versements", ["structure_assurance_id"], name: "index_versements_on_structure_assurance_id", using: :btree

  add_foreign_key "adherents", "groupes"
  add_foreign_key "adherents", "structure_assurances"
  add_foreign_key "affectation_aperitrices", "groupes"
  add_foreign_key "affectation_aperitrices", "structure_aperitrices"
  add_foreign_key "cotisations", "adherents"
  add_foreign_key "cotisations", "souscriptions"
  add_foreign_key "formule_structure_sanitaires", "formation_sanitaires"
  add_foreign_key "formule_structure_sanitaires", "formules"
  add_foreign_key "formules", "structure_assurances"
  add_foreign_key "groupes", "structure_aperitrices"
  add_foreign_key "groupes", "structure_assurances"
  add_foreign_key "ordonnances", "adherents"
  add_foreign_key "ordonnances", "pharmacies"
  add_foreign_key "souscriptions", "adherents"
  add_foreign_key "souscriptions", "formules"
  add_foreign_key "users", "entites"
  add_foreign_key "versements", "comptes"
  add_foreign_key "versements", "mandataires"
  add_foreign_key "versements", "structure_assurances"
end
