require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it "nickname,email、password,password_confirmation,family_name,first_name,family_name_k,first_name_k,birth_dayが存在すれば登録できること" do
      expect(@user).to be_valid
    end

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

    it "メールアドレスが一意性であること" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "メールアドレスは、@を含む必要があること" do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it "passwordが空では登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank", "Password confirmation doesn't match Password")
    end

    it "パスワードは、6文字以上での入力が必須であること" do
      @user.password = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password","Password is too short (minimum is 6 characters)")
    end

    it "パスワードは、半角英数字混合での入力が必須であること" do
      @user.password = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "パスワードは、確認用を含めて2回入力すること" do
      @user.password = "11aa11"
      @user.password_confirmation = "11aa11"
      expect(@user).to be_valid
    end

    it "パスワードとパスワード（確認用）、値の一致が必須であること" do
      @user.password = "11aa11"
      @user.password_confirmation = "11aa12"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "family_nameが空では登録できない" do
      @user.family_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name can't be blank")
    end

    it "first_nameが空では登録できない" do
      @user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "ユーザー本名は、全角（漢字・ひらがな・カタカナ）での入力が必須であること" do
      @user.family_name = "yamada"
      @user.first_name = "tarou"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid", "Family name is invalid")
    end

    it "family_name_kが空では登録できない" do
      @user.family_name_k = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name k can't be blank")
    end

    it "first_name_kが空では登録できない" do
      @user.first_name_k = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k can't be blank")
    end

    it "ユーザー本名のフリガナは、全角（カタカナ）での入力が必須であること" do
      @user.family_name_k = "やまだ"
      @user.first_name_k = "たろう"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name k is invalid", "Family name k is invalid")
    end

    it "birth_dayが空では登録できない" do
      @user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
  
end
