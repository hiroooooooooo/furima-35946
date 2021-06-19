class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  validates :category_id, numericality: { other_than: 1 }
  belongs_to :status
  validates :status_id, numericality: { other_than: 1 }
  belongs_to :delivery_fee
  validates :delivery_fee, numericality: { other_than: 1 }
  belongs_to :prefecture
  validates :prefecture, numericality: { other_than: 1 }
  belongs_to :days_of_ship
  validates :days_of_ship, numericality: { other_than: 1 }
  
end
