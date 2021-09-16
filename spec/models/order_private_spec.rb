#bundle exec rspec spec/models/order_private_spec.rb
require 'rails_helper'

RSpec.describe OrderPrivate, type: :model do

  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_private = FactoryBot.build(:order_private, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題がない場合' do
      it '適切な情報を入力すると保存できる' do
        expect(@order_private).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空では保存できない' do
        @order_private.postal_code = ''
        @order_private.valid?
        expect(@order_private.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @order_private.prefecture_id = ''
        @order_private.valid?
        expect(@order_private.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @order_private.city = ''
        @order_private.valid?
        expect(@order_private.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @order_private.address = ''
        @order_private.valid?
        expect(@order_private.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_private.phone_number = ''
        @order_private.valid?
        expect(@order_private.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'postal_codeにハイフンがないと保存できない' do
        @order_private.postal_code = "1234567"
        @order_private.valid?
        expect(@order_private.errors.full_messages).to include("Postal code is invalid")
      end
      it 'phone_numberが12桁以上だと保存できない' do
        @order_private.phone_number = "090123456789"
        @order_private.valid?
       expect(@order_private.errors.full_messages).to include("Phone number is invalid")
      end
      it 'prefecture_idが1だと保存できない' do
        @order_private.prefecture_id = 1
        @order_private.valid?
        expect(@order_private.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it 'tokenが空では登録できない' do
        @order_private.token = ''
        @order_private.valid?
        expect(@order_private.errors.full_messages).to include("Token can't be blank")
      end
      it 'phone_numberが英数混合では登録できない' do
        @order_private.phone_number = "1234567890a"
        @order_private.valid?
        expect(@order_private.errors.full_messages).to include("Phone number is invalid")
      end
      it 'user_idが空では登録できない' do
        @order_private.user_id = ''
        @order_private.valid?
        expect(@order_private.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @order_private.item_id = ''
        @order_private.valid?
        expect(@order_private.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
  
      
  