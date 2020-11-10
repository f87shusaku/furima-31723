FactoryBot.define do
  factory :order_multiple_address do
    postal_code { '888-8888' }
    municipalities { 'テスト市テスト区' }
    address { 'テスト1-1' }
    phone_number { 11_111_111_111 }
    prefecture_id { 2 }
    token { 'ab_cde000000000' }
  end
end
