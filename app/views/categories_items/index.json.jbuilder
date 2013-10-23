json.array!(@categories_items) do |categories_item|
  json.extract! categories_item, :category_id, :item_id
  json.url categories_item_url(categories_item, format: :json)
end
