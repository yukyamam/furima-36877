require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録/ユーザー情報" do
    it "nicknameが空では登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
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
      expect(@user.errors.full_messages).to include("Password can't be blank")
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
    it "passwordが英字のみでは登録できない" do
      @user.password = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが数字のみでは登録できない" do
      @user.password = "111111"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが全角を含むと登録できない" do
      @user.password = "あiu１23"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "姓(全角)が空だと登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end
    it "姓(全角)に半角文字が含まれていると登録できない" do
      @user.family_name = "ﾔﾏﾓﾄ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name is invalid")
    end
    it "名(全角)が空だと登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "名(全角)に半角文字が含まれていると登録できない" do
      @user.first_name = "ﾕｳｶ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "姓(カナ)が空だと登録できない" do
      @user.family_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana can't be blank")
    end
    it "姓（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.family_name_kana = "山本"
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kana is invalid")
    end
    it "名(カナ)が空だと登録できない" do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "名（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない" do
      @user.first_name_kana = "侑果"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it "生年月日が空だと登録できない" do
      @user.birth = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth can't be blank")
    end
  end

end



# user1 = User.new(nickname: "yukyamam", email: "yamamoto@yamamoto.com", password: "yamamoto", password_confirmation: "yamamoto", family_name: "山本", first_name: "侑果", family_name_kana: "ヤマモト", first_name_kana: "ユウカ", birth: "2000-01-20")

# user2 = User.new(nickname: "akitanak", email: "yamamoto@yamamoto.com", password: "tanaka", password_confirmation: "tanaka", family_name: "田中", first_name: "秋穂", family_name_kana: "タナカ", first_name_kana: "アキホ", birth: "2000-12-31")
