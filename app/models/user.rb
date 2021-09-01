class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


 validates :nickname, precedence: true
 validates :email, precedence:true, 
 validates :encrypted_passwprd, precedence: true
 validates :last_name, precedence: true
 validates :first_name, precedence: true
 validates :last_name_kana, precedence: true
 validates :first_name_kana, precedence: true
 validates :birthbay, precedence: true

 has_many orders
 has_many items
 
end