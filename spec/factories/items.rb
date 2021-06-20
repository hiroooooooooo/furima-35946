FactoryBot.define do
  factory :item do
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    title { 'タイトル' }
    description { '説明' }
    category_id { 2 }
    status_id { 2 }
    delivery_fee_id { 2 }
    prefecture_id { 2 }
    days_of_ship_id { 2 }
    price { 300 }
  end
end
