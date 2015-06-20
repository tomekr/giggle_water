json.array!(@drinks) do |drink|
  json.extract! drink, :id, :name, :glass, :directions, :source
  json.url drink_url(drink, format: :json)
end
