json.array!(@souscriptions) do |souscription|
  json.extract! souscription, :id, :adherent_id, :formule_id, :paye, :date_paiement, :actif, :actif, :date_activation, :date_expiration
  json.url souscription_url(souscription, format: :json)
end
