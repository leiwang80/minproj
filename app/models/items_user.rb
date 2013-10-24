class ItemsUser < ActiveRecord::Base
  belongs_to :item
  belongs_to :user
  
  def self.name_all(offset=0, limit=100)
    sql = "select items_users.*, items.name as item_name, users.name as user_name
         from items_users inner join items on items_users.item_id = items.id
         inner join users on items_users.user_id = users.id limit 100"
     results = ActiveRecord::Base.connection.execute(sql)
     
     return results
  end
end
