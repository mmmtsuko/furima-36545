class Item < ApplicationRecord
  belongs_to  :user
  has_one_to  :order
 
 extend ActiveHash::Associations::ActiveRecordExtensions
   belongs_to :Category
   belongs_to :sales_status
   belongs_to :shipping_fee
   belongs_to :prefectre
   belongs_to :date_of_shipment
 
  end


