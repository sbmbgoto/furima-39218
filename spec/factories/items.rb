FactoryBot.define do
  factory :item do
    name                      {Faker::Commerce.product_name}
    category_id               {Faker::Number.between(from: 2, to: 11)}
    condition_id              {Faker::Number.between(from: 2, to: 7)}
    shipping_burden_id        {Faker::Number.between(from: 2, to: 3)}
    prefecture_id             {Faker::Number.between(from: 2, to: 48)}
    introduction              {Faker::Lorem.sentence}
    expected_shipping_date_id {Faker::Number.between(from: 2, to: 4)}
    price                     {Faker::Number.between(from: 300, to: 9999999)}

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('spec/fixtures/furima-footer.png'), filename: 'furima-footer.png')
    end
  end
end
