class BuyerOder
  include ActiveModel:Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city_name, :house_num, :building_name, :phone_num, :buyer_id

  with_options presence: true do
    validates :user_id
    validates :item_id

    validates :postal_code
    validates :prefecture_id
    validates :city_name
    validates :house_num
    validates :phone_num

    # validates :buyer_id
    # 【メモ】上記が必要ない理由は、この時点で生成されていない（参照できない）から
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, house_num: house_num, building_name: building_name, phone_num: phone_num, buyer_id: buyer.id)
  end
end