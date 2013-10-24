class Item < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories
  has_many :categories_items
  has_many :items_users
  
  def category_list
    category_name_array = categories.collect{|c| c.name}
    return category_name_array.join(',')   
  end

end
