FactoryBot.define do
  factory :item do
    item_name              { Faker::Name.initials(number: 5)}
    text                   { Faker::Lorem.sentence }
    category_id            {2}
    sales_status_id        {2}
    shipping_fee_id        {2}
    prefecture_id          {2}
    date_of_shipment_id    {2}
    price                  {1000}
    association :user
  

    after(:build) do |item|
     item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'item-sample.png')
    end

  end
end