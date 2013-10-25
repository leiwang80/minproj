This mini project using ruby on rails.

Data/Relationship model:
Admin: name, standard devise fields
User: name
Item: name
Category: name

Admin can log in (see below)
User can purchase many Items
Items can be purchased by many users
Items have many categories

Recommended items are defined as:
Based on the purchased items, recommend items that most closely related based on the category similarity.
Must have at least 1 category in common. Must not have already been purchased by the user.

Example:
Item 1 is "Nike Dunks" with categories "Shoes", "Basketball", and "Nike"
Item  2 is "Nike Street Basketball" with categories "Balls", "Basketball" and "Nike"
Item 3 is "Addidas Jersey" with categories "Clothing", "Basketball", and "Addidas"
Item 4 is "Golf bag" with categories "Golf", "Accessories"

If user purchased item1, then they should be recommended [item 2, item 3] 
(Note: item 2 is higher precedence because it has 2 matching categories)


The app has following functionality:

1. Once logged in, admin can see a table that contains all users and their items purchased. 
Item categories are listed by each item.
TABLE COLUMNS:
User's name, Item purchased name, Item's category names

2. Clicking on a user's name will bring up a page showing:
User name, items purchased (with associated categories),  recommended items (in order of relevance)
