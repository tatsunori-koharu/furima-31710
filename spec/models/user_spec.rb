require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての情報を記入すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが６文字以上の半角で英字と数字を含めていれば登録できる" do
        @user.password = "iii999"
        @user.password_confirmation = "iii999"
        expect(@user).to be_valid
      end
      it "first_nameが全角文字であれば登録できる" do
        @user.first_name = "山"
        expect(@user).to be_valid
      end
      it "last_nameが全角文字であれば登録できる" do
        @user.last_name = "川"
        expect(@user).to be_valid
      end
      it "first_name_furiganaが全角カナ文字であれば登録できる" do
        @user.first_name_furigana = "ヤマ"
        expect(@user).to be_valid
      end
      it "last_name_furiganaが全角カナ文字であれば登録できる" do
        @user.last_name_furigana = "カワ"
        expect(@user).to be_valid
      end
    end
    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank" )
      end
      it "重複したnicknameが存在すると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Nickname has already been taken")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank" )
      end
      it "重複したemailが存在すると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank" )
      end
      it "passwordが５文字以下だと登録できない" do
        @user.password = "ii999"
        @user.password_confirmation = "ii999"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)" )
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = "iii999"
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password" )
      end
      it "passwordに英字と数字を含んでいないと登録できない" do
        @user.password = "iiiiii"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password ６文字以上の半角英数字" )
      end
      it "first_nameが空だと登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank" )
      end
      it "first_nameが全角文字以外だと登録できない" do
        @user.first_name = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "first_name_furiganaが空だと登録できない" do
        @user.first_name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank" )
      end
      it "first_name_furiganaが全角カナ文字以外だと登録できない" do
        @user.first_name_furigana = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana 全角カナを使用してください")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank" )
      end
      it "last_nameが全角文字以外だと登録できない" do
        @user.last_name = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name 全角文字を使用してください")
      end
      it "last_name_furiganaが空だと登録できない" do
        @user.last_name_furigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank" )
      end
      it "last_name_furiganaが全角カナ文字以外だと登録できない" do
        @user.last_name_furigana = "abe"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana 全角カナを使用してください")
      end
      it "birthdayが空だと登録できない" do
        @user.birthday= ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank" )
      end
    end
  end
end
