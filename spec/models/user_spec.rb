require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    it "emailが空だと登録できない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it "emailに一意性がないと登録できない" do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.valid?
      expect(another_user.errors.full_messages).to include "Email has already been taken"
    end

    it "emailに@が含まれていないと登録できない" do
      @user.email = "testtest"
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end

    it "passwordが空だと登録できない" do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end

    it "passwordが6文字未満だと登録できない" do
      @user.password = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end

    it "passwordに英字のみでは登録できない" do
      @user.password = "abcdef"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end

    it "passwordに数字のみでは登録できない" do
      @user.password = "123456"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password Include both letters and numbers"
    end

    it "passwordと、再確認passwordが一致していないと登録できない" do
      @user.password_confirmation = "654321"
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it "nicknameが空だと登録できない" do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it "birthdayが空だと登録できない" do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Birthday can't be blank"
    end

    it "last_kanjiが空だと登録できない" do
      @user.last_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last kanji can't be blank"
    end

    it "last_kanjiは全角でないと登録できない" do
      @user.last_kanji = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last kanji Input full-width characters"
    end

    it "first_kanjiが空だと登録できない" do
      @user.first_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First kanji can't be blank"
    end

    it "first_kanjiは全角でないと登録できない" do
      @user.first_kanji = "abc"
      @user.valid?
      expect(@user.errors.full_messages).to include "First kanji Input full-width characters"
    end

    it "last_kanaが空だと登録できない" do
      @user.last_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "Last kana can't be blank"
    end

    it "last_kanaは全角カタカナでないと登録できない" do
      @user.last_kana = "むらた"
      @user.valid?
      expect(@user.errors.full_messages).to include "Last kana Input full-width katakana characters"
    end

    it "first_kanaが空だと登録できない" do
      @user.first_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana can't be blank"
    end

    it "first_kanaは全角カタカナでないと登録できない" do
      @user.first_kana = "ひろゆき"
      @user.valid?
      expect(@user.errors.full_messages).to include "First kana Input full-width katakana characters"
    end

  end
end