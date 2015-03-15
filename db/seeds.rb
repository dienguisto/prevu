# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Groupe.delete_all
Tag.delete_all

Tag.create(libelle: 'Mugiwara')
Tag.create(libelle: 'Konowa')
Tag.create(libelle: 'Fac dof')

Groupe.create(nom: 'Dahira ESP')
Groupe.create(nom: 'ESP')
Groupe.create(nom: 'Fac science')
Groupe.create(nom: 'Grd Yoff')
