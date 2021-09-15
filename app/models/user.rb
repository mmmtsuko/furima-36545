class User < ApplicationRecord
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :orders
  has_many :items

 
 with_options presence: true do
   validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i}
   validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
   validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/}
   validates :last_name_kana, format: { with: /\A[ァ-ヶー]+\z/}
   validates :first_name_kana, format: { with: /\A[ァ-ヶー]+\z/}
   validates :birthbay
   validates :nickname
  end


 

  #|postal_code 郵便番号    
 #|prefecture_id  都道府県   
 #|city_name  市町村   
 #|house_number_id 番地 
 #|building_name 建物  
 #|phone_number  電話番号  
           
 








end

