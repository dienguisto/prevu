json.array!(@ordonnances) do |ordonnance|
  json.extract! ordonnance, :id, :prix_total, :adherent_id, :pharmacy_id
  json.url ordonnance_url(ordonnance, format: :json)
end
