FactoryBot.define do
  factory :buyer_order do

    token {"tok_abcdefghijk00000000000000000"}

    postal_code { '123-4567' }
    prefecture_id { 2 }
    city_name { '横浜市' }
    house_num { '1-1' }
    phone_num { "1234567890" }

  end
end
