# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def parse_line(line)
  line.strip!
  i = line.index(/\s/)
  return [nil, nil] if i.nil? || i == 0
  
  d1 = line[0..(i-1)]
  len = line.length
  d2 = line[(i+1)..len]
  d2.strip!
  return [d1, d2]
end

USERS = Rails.root.join('db', 'data', 'mini_proj-users.csv')
ITEMS = Rails.root.join('db', 'data', 'mini_proj-items.csv')
CATEGORIES = Rails.root.join('db', 'data', 'mini_proj-categories.csv')
CATEGORIES_ITEMS = Rails.root.join('db', 'data', 'mini_proj-categories_items.csv')
ITEMS_USERS = Rails.root.join('db', 'data', 'mini_proj-items_users.csv')
FILES = [USERS, ITEMS, CATEGORIES, CATEGORIES_ITEMS, ITEMS_USERS]

FILES.each do |f|
  unless File.exist?(f) && File.readable?(f)
    puts("File #{f} does not exist or is not readable.")
    exit
  end
end

puts "Delete existing User data, load User data from file..."
User.delete_all
user_file = File.open(USERS, 'r')
while (line = user_file.gets)
  d1, d2 = parse_line(line)
  next if d1.nil? || d1.to_i == 0
  User.create(id: d1.to_i, name: d2.to_s)
end
user_file.close

puts "Delete existing Item data, load Item data from file..."
Item.delete_all
item_file = File.open(ITEMS, 'r')
while (line = item_file.gets)
  d1, d2 = parse_line(line)
  next if d1.nil? || d1.to_i == 0
  Item.create(id: d1.to_i, name: d2.to_s)
end
item_file.close

puts "Delete existing Category data, load Category data from file..."
Category.delete_all
category_file = File.open(CATEGORIES, 'r')
while (line = category_file.gets)
  d1, d2 = parse_line(line)
  next if d1.nil? || d1.to_i == 0
  Category.create(id: d1.to_i, name: d2.to_s)
end
category_file.close

puts "Delete existing CategoriesItem data, load CategoriesItem data from file..."
CategoriesItem.delete_all
categories_item_file = File.open(CATEGORIES_ITEMS, 'r')
while (line = categories_item_file.gets)
  d1, d2 = parse_line(line)
  next if d1.nil? || d1.to_i == 0 ||d2.nil? || d2.to_i == 0
  CategoriesItem.create(item_id: d1.to_i, category_id: d2.to_i)
end
categories_item_file.close

puts "Delete existing ItemUser data, load ItemUser data from file..."
ItemsUser.delete_all
items_user_file = File.open(ITEMS_USERS, 'r')
while (line = items_user_file.gets)
  d1, d2 = parse_line(line)
  next if d1.nil? || d1.to_i == 0 ||d2.nil? || d2.to_i == 0
  ItemsUser.create(user_id: d1.to_i, item_id: d2.to_i)
end
items_user_file.close

