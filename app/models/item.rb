class Item < ActiveRecord::Base
  has_and_belongs_to_many :users
  has_and_belongs_to_many :categories

  @@category_hash = {}
  
  def set_category_hash
    
  end

end
