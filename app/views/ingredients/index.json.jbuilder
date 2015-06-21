json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id
  json.url ingredient_url(ingredient, format: :json)
end
