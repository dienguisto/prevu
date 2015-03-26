json.extract! @ordonnance, :id, :prix_total, :adherent_id, :pharmacy_id, :created_at, :updated_at
json.date @ordonnance.created_at.strftime("%a, %e %b %Y ")

json.detail_ordonnances @ordonnance.detail_ordonnances do |detail|
  json.medicament detail.medicament.nom
  json.quantite detail.quantite
  json.prix_unitaire detail.prix_unitaire
end
