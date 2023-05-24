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
    image                     {Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/furima-footer.png'), 'image/png')}
  end
end
