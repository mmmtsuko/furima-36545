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
end

#お名前(全角)は、名字と名前がそれぞれ必須であること。
#お名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。
#お名前カナ(全角)は、名字と名前がそれぞれ必須であること。
#お名前カナ(全角)は、全角（カタカナ）での入力が必須であること。
#生年月日が必須であること。
