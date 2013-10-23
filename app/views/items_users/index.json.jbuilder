json.array!(@items_users) do |items_user|
  json.extract! items_user, :item_id, :user_id
  json.url items_user_url(items_user, format: :json)
end
