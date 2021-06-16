class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_kanji, presence: true
  validates :first_kanji, presence: true
  validates :last_kana, presence: true
  validates :first_kana, presence: true
  validates :birthday, presence: true
  
end
