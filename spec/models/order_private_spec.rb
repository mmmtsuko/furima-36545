require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_private = FactoryBot.build(:order_private, user_id: user.id, item_id: item.id)
    sleep(0.1)
  end


  describe '商品購入機能' do

    context "購入が成功する場合" do
        it 'すべての値が正しく入力されていれば保存できること' do
          expect(@order_private).to be_valid
        end

        it '建物名は空でも購入できる' do
          @order_private.building_name = ''
          expect(@order_private).to be_valid
        end
      
       it '郵便番号が「3桁ハイフン4桁」だと保存できる' do
          @order_private.postal_code = '333-3333'
          expect(@order_private).to be_valid
        end 

        it 'phone_numberは半角数字10桁だと保存できる' do
          @order_private.phone_number = '1234567890'
          expect(@order_private).to be_valid
        end

        it 'phone_numberは半角数字11桁でも保存できる' do
          @order_private.phone_number = '12345123451'
          expect(@order_private).to be_valid
        end
     end

      context "購入が失敗する場合" do
        it "カードのトークンがない場合" do
          @order_private.token = nil
          @order_private.valid?
          expect(@order_private.errors.full_messages).to include("Token can't be blank")
        end

        it "郵便番号がない場合" do
          @order_private.postal_code = nil
          @order_private.valid?
          expect(@order_private.errors.full_messages).to include("Postal code can't be blank")
        end
  
        it '郵便番号はハイフンがないと購入できない' do
          @order_private.postal_code = '1234567'
          @order_private.valid?
          expect(@order_private.errors.full_messages).to include("Postal code ハイフン込みの7桁半角数字で入力してください")
        end
        it '郵便番号が全角では購入できない' do
          @order_private.postal_code = '１２３４５６７'
          @order_private.valid?
          expect(@order_private.errors.full_messages).to include("Postal code ハイフン込みの7桁半角数字で入力してください")
        end

        it "都道府県がない場合" do
          @order_private.prefecture_id = 1
          @order_private.valid?
          expect(@order_private.errors.full_messages).to include("Prefecture can't be blank")
        end

        it "市区町村がない場合" do
          @order_private.city_name = ''
          @order_private.valid?
          expect(@order_private.errors.full_messages).to include("City name can't be blank")
        end

        it "番地がない場合" do
          @order_private.house_number_id = ''
          @order_private.valid?
          expect(@order_private.errors.full_messages).to include("House number can't be blank")
        end

        it "電話番号がない場合" do
          @order_private.phone_number = ''
          @order_private.valid?
          expect(@order_private.errors.full_messages).to include("Phone number can't be blank")
        end

        it "電話番号にハイフンがある場合" do
          @order_private.phone_number = '090-1111-2222'
          @order_private.valid?
          expect(@order_private.errors.full_messages).to include("Phone number 10桁or11桁の半角数字で入力してください。")
        end

        it '電話番号でが12桁以上では購入できない' do
          @order_private.phone_number = '123456789012'
        @order_private.valid?
        expect(@order_private.errors.full_messages).to include("Phone number 10桁or11桁の半角数字で入力してください。")
        end

        it 'userが紐付いていないと保存できない' do
          @order_private.user_id = nil
          @order_private.valid?
          expect(@order_private.errors.full_messages).to include("User can't be blank")
        end
        it 'itemが紐付いていないと保存できない' do
          @order_private.item_id = nil
          @order_private.valid?
          expect(@order_private.errors.full_messages).to include("Item can't be blank")
        end
      

        
      end

    end
  end