

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
|category_id        |integer      |null:false                    |カテゴリー
|sales_status_id    |integer      |null:false                    |商品の状態
|shipping_fee_id    |integer      |null:false                    |発送料の負担
|prefecture_id      |integer      |null:false                    |県
|date_of_shipment_id|integer      |null:false                    |出荷日
|price              |integer      |null:false                    |ねだん
|user               |references   |null:false,foreign_key: true  |



Association
 .belongs_to  user
 .has_one_to  order
 
 
 
##orderテーブル
|Column           |Type         | Options                     |
|-----------------|-------------|-----------------------------|
|postal_code      |string       |null:false                   |
|prefecture_id    |integer      |null:false                   |  
|city_name        |string       |null:false                   |
|house_number_id  |string       |null:false                   |
|building_name    |string       |                             |
|phone_number     |string       |null:false                   |
|order            |references   |null:false,foreign_key: true |


Association
 .belongs_to order


##privateテーブル

|Column           |Type        | Options                      |
|-----------------|------------|------------------------------|
|user             |references  |null:false ,foreign_key:true  |
|item             |references  |null:false ,foreign_key:true  |

Association
.belongs_to  user
.belongs_to  item
.has_one     private