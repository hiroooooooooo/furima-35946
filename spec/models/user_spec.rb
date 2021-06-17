require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    # 何かしらの処理
  end
  
  describe "ユーザー新規登録" do
    it "emailが空だと登録できない" do
    end
    it "emailに一意性がないと登録できない" do
    end
    it "emailに@が含まれていないと登録できない" do
    end
    it "passwordが空だと登録できない" do
    end
    it "passwordが6文字未満だと登録できない" do
    end
    it "passwordに英字と数字の両方が含まれていないと登録できない" do
    end
    it "passwordと、再確認passwordが一致していないと登録できない" do
    end
    it "nicknameが空だと登録できない" do
    end
    it "birthdayが空だと登録できない" do
    end
    it "last_kanjiが空だと登録できない" do
    end
    it "last_kanjiは全角でないと登録できない" do
    end
    it "first_kanjiが空だと登録できない" do
    end
    it "first_kanjiは全角でないと登録できない" do
    end
    it "last_kanaが空だと登録できない" do
    end
    it "last_kanaは全角カタカナでないと登録できない" do
    end
    it "first_kanaが空だと登録できない" do
    end
    it "first_kanaは全角カタカナでないと登録できない" do
    end
  end
end

# Email can't be blank
# Password can't be blank
# Password Include both letters and numbers
# Nickname can't be blank
# Birthday can't be blank
# Last kanji can't be blank
# Last kanji Input full-width characters
# First kanji can't be blank
# First kanji Input full-width characters
# Last kana can't be blank
# Last kana Input full-width katakana characters
# First kana can't be blank
# First kana Input full-width katakana characters