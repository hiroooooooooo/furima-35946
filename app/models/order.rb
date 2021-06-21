class Order < ApplicationRecord

  with_options presence: true do
    validates :postal_code, presence: true
    validates :prefecture_id, presence: true
    validates :city_name, presence: true
    validates :house_num, presence: true
    validates :phone_num, presence: true
  end
  
  belongs_to :buyer
end
