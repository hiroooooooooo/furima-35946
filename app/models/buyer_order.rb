class BuyerOrder
  include ActiveModel::Model
  # [memo] attr_accessorに:tokenを指定することで、このモデルでtokenを扱えるようになる
  attr_accessor :price, :token, :user_id, :item_id, :postal_code, :prefecture_id, :city_name, :house_num, :building_name,
                :phone_num

  with_options presence: true do
    validates :token

    validates :user_id
    validates :item_id

    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/ }
    validates :prefecture_id, numericality: { other_than: 1 }
    validates :city_name
    validates :house_num
    validates :phone_num, format: { with: /\A\d+\z/ }, length: { minimum: 10, maximum: 11 }

    # [memo] validates :buyer_id
    # [memo] 上記が必要ない理由は、この時点で生成されていない（参照できない）から
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Order.create(postal_code: postal_code, prefecture_id: prefecture_id, city_name: city_name, house_num: house_num,
                 building_name: building_name, phone_num: phone_num, buyer_id: buyer.id)
  end
end
