class  OrderAddress
include Active Model::Model
attr_accessor :postal_code, :prefecture_id, :city_name, :house_number_id, :building_name, :phone_number, :user_id, :item_id, :token

validates :postal_code
validates :prefecture_id
validates :city_name
validates :house_number_id
validates :building_name
validates :user_id
validates :item_id
validates :token
validates :phone_number




def save


end

end
