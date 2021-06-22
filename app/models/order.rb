class Order < ApplicationRecord

  # with_options presence: true do
  #   validates :postal_code
  #   validates :prefecture_id
  #   validates :city_name
  #   validates :house_num
  #   validates :phone_num
  # end
  
  belongs_to :buyer
end
