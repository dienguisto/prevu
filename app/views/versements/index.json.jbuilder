json.array!(@versements) do |versement|
  json.extract! versement, :id, :compte_id, :mandataire_id, :montant
  json.url versement_url(versement, format: :json)
end
