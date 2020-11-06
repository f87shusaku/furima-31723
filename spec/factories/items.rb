FactoryBot.define do
  factory :item do
    item_name { '商品名' }
    item_comment { '商品の説明' }
    category_id { 2 }
    status_id { 2 }
    burden_id { 2 }
    prefectures_id { 2 }
    days_to_ship_id { 2 }
    price { 9_999_999 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
