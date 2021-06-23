require 'rails_helper'

RSpec.describe BuyerOrder, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      @buyer_order = FactoryBot.build(:buyer_order, user_id: user.id)
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
      it 'tokengaが空だと購入できない' do
        @buyer_order.token = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include "Token can't be blank"
      end

      it '郵便番号がないと購入できない' do
        @buyer_order.postal_code = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ""
      end

      it '郵便番号にハイフンが含まれていないと購入できない' do
        @buyer_order.postal_code = "12345678"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ""
      end

      it '郵便番号に半角英字が含まれていると購入できない' do
        @buyer_order.postal_code = "abc-defg"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ""
      end

      it '郵便番号が半角英数字混合だと購入できない' do
        @buyer_order.postal_code = "abc-1234"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ""
      end

      it '郵便番号に全角が含まれていると購入できない' do
        @buyer_order.postal_code = "郵便-番号"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ""
      end

      it '郵便番号が6桁だと購入できない' do
        @buyer_order.postal_code = "123-456"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ""
      end

      it '郵便番号が8桁だと購入できない' do
        @buyer_order.postal_code = "123-45678"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ""
      end

      it '都道府県がないと登録できない' do
        @buyer_order.prefecture_id = 1
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include 'Prefecture must be other than 1'
      end

      it '市区町村がないと登録できない' do
        @buyer_order.city_name = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ''
      end

      it '番地がないと登録できない' do
        @buyer_order.house_num = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ''
      end

      it '電話番号がないと登録できない' do
        @buyer_order.phone_num = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ''
      end

      it '電話番号が9桁だと登録できない' do
        @buyer_order.phone_num = 123456789
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ''
      end

      it '電話番号が12桁だと登録できない' do
        @buyer_order.phone_num = 123456789012
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ''
      end

      it '電話番号が全角だと登録できない' do
        @buyer_order.phone_num = "電話番号"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ''
      end

      it '電話番号が半角英字だと登録できない' do
        @buyer_order.phone_num = "abcdefghijk"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ''
      end

      it '電話番号が半角英数字混合だと登録できない' do
        @buyer_order.phone_num = "abc4567890"
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include ''
      end

      it 'userが紐付いていないと購入できない' do
        @donatiobuyer_ordern_address.user_id = nil
        @buyer_order.valid?
        expect(@buyer_order.errors.full_messages).to include("User can't be blank")
      end
  end
end
