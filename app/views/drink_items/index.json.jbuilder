json.array!(@drink_items) do |drink_item|
  json.extract! drink_item, :id, :ingredient_id, :drink_id
  json.url drink_item_url(drink_item, format: :json)
end
