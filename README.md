

##usersテーブル

|Column             |Type       | Options                   |
|-------------------|-----------|---------------------------|
|nickname           |string     |null:false                 |
|email              |string     |null:false,unique:true     |
|encrypted_password |string     |null:false                 |
|last_name          |string     |null:false                 |
|first_name         |string     |null:false                 |
|last_name_kana     |string     |null:false                 |
|first_name_kana    |string     |null:false                 |
|birthbay           | date      |null:false                 |

Association
 .has_many orders
 .has_many items
 
 

##itemsテーブル

|Column             |Type         | Options                      |
|-------------------|-------------|------------------------------|
|item_name          |string       |null:false                    |
|text               |text         |null:false                    |
|category_id        |integer      |null:false                    |
|sales_status_id    |integer      |null:false                    |
|shipping_fee_id    |integer      |null:false                    |
|prefecture_id      |integer      |null:false                    |
|date_of_shipment_id|integer      |null:false                    |
|price              |integer      |null:false                    |
|user               |references   |null:false,foreign_key: true  |



Association
 .belongs_to usere
 .belongs_to order
 
 
 
##privatesテーブル
|Column           |Type       | Options                     |
|-----------------|-----------|-----------------------------|
|postal_code      |string     |null:false                   |
|prefecture_id    |integer    |null:false                   |  
|city_name        |string     |null:false                   |
|house-number_id  |string     |null:false                   |
|building_name    |string     |                             |
|phone_number     |string     |null:false                   |
|order            |string     |null:false,foreign_key: true |


Association
 .belongs_to order


##ordersテーブル

|Column           |Type       | Options                      |
|-----------------|-----------|------------------------------|
|user             |referenc   |null:false ,foreign_key:true  |
|item             |referenc   |null:false ,foreign_key:true  |

Association
.belongs_to user
.belongs_to  item
.belongs_to  private