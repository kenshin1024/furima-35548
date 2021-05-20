require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
 end

describe 'ユーザー新規登録' do
  context '新規登録できるとき'do
  it 'ユーザー情報が全て正しく入力されれば登録できる' do
    expect(@user).to be_valid
  end  
end
  context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'last_name_kanaが空では登録できない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'first_name_kanaが空では登録できない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it 'すでに登録されているメールアドレスは登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it '@を含まないメールアドレスは登録できない' do
        @user.email = "aiueo"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it '5文字以下のパスワードは登録できない' do
        @user.password = "aiue2"
        @user.password_confirmation = "aiue2"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it '半角英字のみのパスワードは登録できない' do
        @user.password = "aiueoa"
        @user.password_confirmation = "aiueoa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "半角数字のみのパスワードは登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it 'password_confirmationの値がpasswordと一致しなければ登録できない' do
        @user.password_confirmation = 'admin'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '英数字の含まれるlast_nameは登録できない' do
        @user.last_name = "a山"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end
      it '英数字の含まれるlast_nameは登録できない' do
        @user.first_name = "b太郎"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      it '英数字の含まれるlasr_name_kanaは登録できない' do
        @user.last_name_kana = "aヤマ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it '英数字の含まれるfirst_name_kanaは登録できない' do
        @user.first_name_kana = "bタロウ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it '半角カタカナの含まれるlast_name_kanaは登録できない' do
        @user.last_name_kana = "ｱﾍﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it '半角カタカナの含まれるfirst_name_kanaは登録できない' do
        @user.first_name_kana = "ﾌﾄｼ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
      it 'ひらがなの含まれるlast_name_kanaは登録できない' do
        @user.last_name_kana = "あべ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end
      it 'ひらがなの含まれるfirst_name_kanaは登録できない' do
        @user.first_name_kana = "ふとし"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end
    end
  end
end
