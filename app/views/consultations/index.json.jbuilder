json.array!(@consultations) do |consultation|
  json.extract! consultation, :id, :description, :montant_total, :type_categorie_medical_id, :adherent_id, :pharmacy_id
  json.url consultation_url(consultation, format: :json)
end
