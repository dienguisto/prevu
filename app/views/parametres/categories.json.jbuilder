json.array!(@categories) do |categ|
  json.extract! categ, :id, :nom
end
