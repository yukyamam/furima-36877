require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録/ユーザー情報" do
    it "emailが空では登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailは一意でなければ登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailは＠を含まなければ登録できない" do
      @user.email = "yamamoto.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end
    it "passwordは6文字以上でなければ登録できない" do
      @user.password = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordはpassword_confirmationと一致しなければ登録できない" do
      @user.password_confirmation = "tanaka"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end

end



# user1 = User.new(nickname: "yukyamam", email: "yamamoto@yamamoto.com", password: "yamamoto", password_confirmation: "yamamoto", family_name: "山本", first_name: "侑果", family_name_kana: "ヤマモト", first_name_kana: "ユウカ", birth: "2000-01-20")

# user2 = User.new(nickname: "akitanak", email: "yamamoto@yamamoto.com", password: "tanaka", password_confirmation: "tanaka", family_name: "田中", first_name: "秋穂", family_name_kana: "タナカ", first_name_kana: "アキホ", birth: "2000-12-31")
