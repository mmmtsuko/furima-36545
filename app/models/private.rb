class Private < ApplicationRecord
    include Active Model::Model
    attr_accessor :postal_code, :prefecture_id, :city_name, :house_number_id, :building_name, :phone_number, :user_id, :item_id, :token
    
    
    
    with_options presence: true do
    
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :city_name
    validates :house_number_id
    validates :building_name
    validates :user_id
    validates :item_id
    validates :token
    validates :phone_number, format: {with: /\A[0-9]{10,11}\z/, message: "is invalid. Include hyphen(-)"}
    end
    validates :prefecture_id,numericality: {other_than: 1, message: "can't be blank"}
    
    def save
      order = Order.create(item_id: item_id, user_id: user_id)
        Address.create(ここに記述をたすこと
          
    
    end
    
    end
    
end