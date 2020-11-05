FactoryBot.define do
  factory :user do
    nickname { Faker::Name.last_name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    first_name { Gimei::Name.first.kanji }
    family_name { Gimei::Name.last.kanji }
    first_name_k { Gimei::Name.first.katakana }
    family_name_k { Gimei::Name.last.katakana }
    birth_day { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
