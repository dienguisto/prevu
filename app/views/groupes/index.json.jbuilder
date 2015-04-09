json.array!(@groupes) do |groupe|
  json.extract! groupe, :id, :nom
  json.url groupe_url(groupe, format: :json)
end
