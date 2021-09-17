FactoryBot.define do
  factory :order_private   do
    postal_code       { '123-4567' }
    prefecture_id     { 3 }
    city_name         { '横浜市緑区' }
    house_number_id   { '青山1-1' }
    building_name     { '柳ビル103' }
    phone_number      { '0906678889' }  
    token             { "sk_test_4cf82ff10dffe578bef34c14" }  
  end
end

 