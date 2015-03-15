json.array!(@structure_aperitrices) do |structure_aperitrice|
  json.extract! structure_aperitrice, :id, :nom, :adresse, :date_adhesion
  json.url structure_aperitrice_url(structure_aperitrice, format: :json)
end
