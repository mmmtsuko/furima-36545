class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  belongs_to :category
  belongs_to :sales_status
  belongs_to :shipping_fee
  belongs_to :prefecture
  belongs_to :date_of_shipment
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :item_name, length: { maximum: 40 }
    validates :text, length: { maximum: 1000 }
    validates :price, format: { with: /\A[0-9]+\z/ }, inclusion: { in: 300..9_999_999 }
    validates :image
  end

  with_options numericality: { other_than: 1, message: "can't be blank" } do
    validates :category_id
    validates :sales_status_id
    validates :shipping_fee_id
    validates :prefecture_id
    validates :date_of_shipment_id
  end

end