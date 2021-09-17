class Order < ApplicationRecord
  has_one :private
  belongs_to :user
  belongs_to :item
end