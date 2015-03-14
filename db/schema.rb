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

ActiveRecord::Schema.define(version: 20150314130854) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "adherents", force: :cascade do |t|
    t.string   "nom"
    t.string   "prenom"
    t.integer  "status_matrimonial"
    t.date     "date_de_naissance"
    t.string   "lieu_de_naissance"
    t.text     "adresse"
    t.string   "telephone1"
    t.string   "telephone2"
    t.string   "email"
    t.string   "username"
    t.string   "password_digest"
    t.integer  "status"
    t.boolean  "payer"
    t.datetime "last_activation"
    t.datetime "last_suspension"
    t.datetime "last_delete"
    t.datetime "paiement_date"
    t.float    "montant_cotisation"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "matricule"
  end

  add_index "adherents", ["email"], name: "index_adherents_on_email", unique: true, using: :btree
  add_index "adherents", ["matricule"], name: "index_adherents_on_matricule", unique: true, using: :btree
  add_index "adherents", ["username"], name: "index_adherents_on_username", unique: true, using: :btree

  create_table "assurances", force: :cascade do |t|
    t.string   "nom"
    t.string   "adresse"
    t.date     "date_adhesion"
    t.string   "numero_agrement"
    t.string   "couleur"
    t.boolean  "actif",             default: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

end
