class Item < ApplicationRecord
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  with_options presence: true do
    validates :title
    validates :description
    validates :category_id, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_fee, numericality: { other_than: 1 }
    validates :prefecture, numericality: { other_than: 1 }
    validates :days_of_ship, numericality: { other_than: 1 }

    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  end

  has_one_attached :image
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :days_of_ship
end
