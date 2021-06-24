require 'rails_helper'

RSpec.describe BuyerOrder, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_order = FactoryBot.build(:buyer_order, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '購入できるとき' do
      it 'すべての値が正しく入力されていれば購入できる' do
        expect(@buyer_order).to be_valid
      end

      it '建物名は空でも購入できる' do
        @buyer_order.building_name = nil
        expect(@buyer_order).to be_valid
      end
    end

    context '購入できないとき' do
      it 'tokenが空だと購入できない' do
        @buyer_order.token = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Token can't be blank"
      end

      it '郵便番号がないと購入できない' do
        @buyer_order.postal_code = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Postal code can't be blank", 'Postal code is invalid'
      end

      it '郵便番号にハイフンが含まれていないと購入できない' do
        @buyer_order.postal_code = '1234567'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Postal code is invalid'
      end

      it '郵便番号に半角英字が含まれていると購入できない' do
        @buyer_order.postal_code = 'abc-defg'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Postal code is invalid'
      end

      it '郵便番号が半角英数字混合だと購入できない' do
        @buyer_order.postal_code = 'abc-1234'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Postal code is invalid'
      end

      it '郵便番号に全角が含まれていると購入できない' do
        @buyer_order.postal_code = '郵便-番号'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Postal code is invalid'
      end

      it '郵便番号が6桁だと購入できない' do
        @buyer_order.postal_code = '123-456'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Postal code is invalid'
      end

      it '郵便番号が8桁だと購入できない' do
        @buyer_order.postal_code = '123-45678'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Postal code is invalid'
      end

      it '都道府県がないと登録できない' do
        @buyer_order.prefecture_id = 1
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Prefecture must be other than 1'
      end

      it '市区町村がないと登録できない' do
        @buyer_order.city_name = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "City name can't be blank"
      end

      it '番地がないと登録できない' do
        @buyer_order.house_num = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "House num can't be blank"
      end

      it '電話番号がないと登録できない' do
        @buyer_order.phone_num = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Phone num can't be blank", 'Phone num is invalid'
      end

      it '電話番号が9桁だと登録できない' do
        @buyer_order.phone_num = 123_456_789
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Phone num is too short (minimum is 10 characters)'
      end

      it '電話番号が12桁だと登録できない' do
        @buyer_order.phone_num = 123_456_789_012
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Phone num is too long (maximum is 11 characters)'
      end

      it '電話番号が全角だと登録できない' do
        @buyer_order.phone_num = '電話番号'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Phone num is invalid'
      end

      it '電話番号が半角英字だと登録できない' do
        @buyer_order.phone_num = 'abcdefghijk'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Phone num is invalid'
      end

      it '電話番号が半角英数字混合だと登録できない' do
        @buyer_order.phone_num = 'abc4567890'
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Phone num is invalid'
      end

      it 'user_idが紐付いていないと購入できない' do
        @buyer_order.user_id = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("User can't be blank")
      end

      it 'item_idが紐付いていないと購入できない' do
        @buyer_order.item_id = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
