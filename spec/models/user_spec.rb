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

    it "nicknameが空だと登録できない" do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
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
  end
end
end
