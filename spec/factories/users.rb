FactoryBot.define do
  factory :user do
    nickname              {'test'}
    # email                 {'test@com'}
    email                 {Faker::Internet.free_email}
    password              {'test00'}
    password_confirmation {password}
    last_kanji            {'村田'}
    first_kanji           {'浩之'}
    last_kana             {'ムラタ'}
    first_kana            {'ヒロユキ'}
    birthday              {'1983-05-19'}
  end
end