require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '出品がうまくいくとき' do
      it 'すべての情報があれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it '画像がないと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end

      it '商品名がないと登録できない' do
        @item.title = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end

      it '商品の説明がないと登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Description can't be blank"
      end

      it 'カテゴリーの情報がないと登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Category must be other than 1'
      end

      it '商品の状態の情報がないと登録できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Status must be other than 1'
      end

      it '配送料の負担の情報がないと登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Delivery fee must be other than 1'
      end

      it '発送元の地域の情報がないと登録できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Prefecture must be other than 1'
      end

      it '発送までの日数の情報がないと登録できない' do
        @item.days_of_ship_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include 'Days of ship must be other than 1'
      end

      it '価格の情報がないと登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Price can't be blank"
      end

      it '価格が299円以下だと登録できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be greater than or equal to 300'
      end

      it '価格が10,000,000円以上だと登録できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price must be less than or equal to 9999999'
      end

      it '価格が全角だと登録できない' do
        @item.price = '全角'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end

      it '価格が半角英字だと登録できない' do
        @item.price = 'abc'
        @item.valid?
        expect(@item.errors.full_messages).to include 'Price is not a number'
      end
    end
  end
end
