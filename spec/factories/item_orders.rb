FactoryBot.define do
  factory :item_order do
    transient do
      address { Gimei.address }
    end

    prefecture_id  {Faker::Number.between(from: 2, to: 48)}
    city           {address.city.kanji}
    addresses      {address.town.kanji}
    building       {Faker::Lorem.word}
    phone_number   {Faker::Number.number(digits: rand(10..11))}
    post_code      { Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s }
    token          {"tok_abcdefghijk00000000000000000"}

  end
end
