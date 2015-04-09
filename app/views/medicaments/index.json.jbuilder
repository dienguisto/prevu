json.array!(@medicaments) do |medicament|
  json.extract! medicament, :id
  json.url medicament_url(medicament, format: :json)
end
