class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角（漢字・ひらがな・カタカナ）で入力してください" } do
      validates :last_kanji
      validates :first_kanji
    end
    with_options format: { with: /\A[ァ-ヶ]+\z/, message: "全角（カタカナ）で入力してください" } do
    validates :last_kana
    validates :first_kana
    end
    validates :birthday
  end
  
end
