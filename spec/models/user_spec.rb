require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
end

describe 'ユーザー新規登録' do
  context '新規登録がうまくいくとき' do
    it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
      @user.valid?
    end
    it "nicknameが6文字以下で登録できる" do
      @user.nickname = "aaaaaa"
      expect(@user).to be_valid
    end
    it "passwordが6文字以上であれば登録できる" do
      @user.password = "abc000"
      @user.password_confirmation = "abc000"
      expect(@user).to be_valid
    end
  end


  context '新規登録がうまくいかないとき' do

    it "emailに＠が抜けては登録できない" do
      @user.email = 'ii'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    
    it "emailが空では登録できない" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "重複したemailが存在する場合登録できないこと" do
     @user.save
     anoter_user = FactoryBot.build(:user)
     anoter_user.email = @user.email
     anoter_user.valid?
     expect(anoter_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが空では登録できない" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが英字のみでは登録できない" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
   
    it "passwordが数字のみでは登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
     
    it "全角文字を含むパスワードでは登録できない" do
      @user.password = "AVCDEF"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it "passwordが６文字以上でないと登録できない" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end    
   
    it "passwordが存在してもpassword_confirmationが空では登録できない" do
      @user.password_confirmation = ""
    
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'last_nameが空だと登録出来ない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'last_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.last_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name is invalid')
    end

    it 'first_nameが空だと登録出来ない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'first_nameが全角（漢字・ひらがな・カタカナ）でないと登録できない' do
      @user.first_name = 'aaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name is invalid')
    end
    
    it 'last_name_kanaが空だと登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'last_name_kanaが全角（カタカナ）でないと登録できない' do
      @user.last_name_kana = 'ああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Last name kana is invalid')
    end

    it 'first_name_kanaが空だと登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'first_name_kanaが全角（カタカナ）でないと登録できない' do
      @user.first_name_kana = 'ああああ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kana is invalid')
    end

    it "生年月日が空だと登録できない" do
      @user.birthbay = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthbay can't be blank")
    end
  end
 end
end


