# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

USERS = Rails.root.join('db', 'data', 'mini_proj-users.csv')
ITEMS = Rails.root.join('db', 'data', 'mini_proj-items.csv')
CATEGORIES = Rails.root.join('db', 'data', 'mini_proj-categories.csv')
CATEGORIES_ITEMS = Rails.root.join('db', 'data', 'mini_proj-categories_items.csv')
ITEMS_USERS = Rails.root.join('db', 'data', 'mini_proj-items_users.csv')

unless File.exist?(USERS) && File.readable?(USERS)
  puts("File #{USERS} does not exist or is not readable.")
  exit
end
user_file = File.open(USERS, 'r')
puts "Delete existing User data, load User data from file..."
User.delete_all

while (line = user_file.gets)
  line.strip!
  i = line.index(/\s/)
  next if i.nil? || i == 0
  
  id = line[0..(i-1)].to_i
  next if id==0
  name = line[(i+1)..200]
  name.strip!
  User.create(id: id, name: name)
end

user_file.close