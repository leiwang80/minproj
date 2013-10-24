class User < ActiveRecord::Base
  has_and_belongs_to_many :items
  has_many :items_users
   
  MAX_SUGGESTED_ITEM = 9
  # related_categories is array of categories that has user's purchased items.
  def related_category_ids
    items_ids = items.collect{ |i| i.id.to_s }
    item_id_list = '(' + items_ids.join(',') + ')'
    
    #Category.joins(categories_items: :item).where("items.id in #{item_id_list}").uniq
    sql = "select distinct categories.id from categories 
          inner join categories_items on categories.id = categories_items.category_id
          inner join items on items.id = categories_items.item_id
          where items.id in #{item_id_list}"
    results = ActiveRecord::Base.connection.execute(sql)

    return results.collect{|r| r["id"].to_s}
  end
  
  def related_items
    category_ids = related_category_ids
    return [] if category_ids.empty?
    
    category_id_list = '(' + category_ids.join(',') + ')'
    
    sql = "select item_id, items.name, count(item_id) from  
          categories_items inner join items on items.id = categories_items.item_id
          where categories_items.category_id in #{category_id_list}
          group by item_id, items.name"
    
          results = ActiveRecord::Base.connection.execute(sql)

          results.sort!{|a, b| -a["count(item_id)"] <=> -b["count(item_id)"]}
          return results
  end
  
  def suggested_items
    items_ids = items.collect{ |i| i.id }
    s_items = related_items   
    s_items.delete_if{ |i| items_ids.include?(i["item_id"]) }
    
    return s_items
  end
  
end
