json.array!(@formules) do |formule|
  json.extract! formule, :id, :nom, :montant_adhesion, :montant_cotisation, :periode, :occurrence_periode
  json.url formule_url(formule, format: :json)
end
