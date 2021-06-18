class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGIX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  # validates :password, length: {minimum: 6}, format: {with:VALID_PASSWORD_REGIX, message: 'Include both letters and numbers'}
  validates :password, format: { with: VALID_PASSWORD_REGIX, message: 'Include both letters and numbers' }

  with_options presence: true do
    validates :nickname
    validates :birthday

    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: 'Input full-width characters' } do
      validates :last_kanji
      validates :first_kanji
    end
    with_options format: { with: /\A[ァ-ヶ一ー]+\z/, message: 'Input full-width katakana characters' } do
      validates :last_kana
      validates :first_kana
    end
  end
end
