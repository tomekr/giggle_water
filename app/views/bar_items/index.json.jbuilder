json.array!(@bar_items) do |bar_item|
  json.extract! bar_item, :id, :ingredient_id, :bar_id
  json.url bar_item_url(bar_item, format: :json)
end
