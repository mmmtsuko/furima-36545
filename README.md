

##usersテーブル

|Column           |Type       | Options       |
|-----------------|-----------|---------------|
|nickname         |string     |null:false     |
|email            |sering     |null:false     |
|password         |string     |null:false     |
|last_name        |string     |null:false     |
|first_name       |string     |null:false     |
|last_name_kana   |string     |null:false     |
|first_name_kana  |string     |null:false     |
|birthbay         | date      |null:false     |

Association
 .has_many orders
 .has_many items
 
 

##itemsテーブル

|Column           |Type       | Options       |
|-----------------|-----------|---------------|
|items_name       |string     |null:false     |
|text             |text       |null:false     |
|category_id      |integer    |null:false     |
|price            |integer    |null:false     |
|user             |referenc   |null:false     |


Association
 .belongs_to useres
 .belongs_to orders
 
 
 
##privatesテーブル
|Column           |Type       | Options       |
|-----------------|-----------|---------------|
|card_number      |string     |null:false     |
|card_month       |text       |null:false     |
|card_year        |integer    |null:false     |
|cared_cvc        |integer    |null:false     |
|card_month       |referenc   |null:false     |
|city_name        |string     |null:false     |
|building_name    |string     |null:false     |
|order            |string     |null:false     |


Association
 .belongs_to orders 


