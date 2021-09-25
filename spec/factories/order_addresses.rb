FactoryBot.define do
  factory :order_address do
    postal_code     { '123-4567' }
    prefecture_id   { 11 }
    city            { '横浜市緑区' }
    address         { '青山1-1-1' }
    building        { 'いずみ荘203' }
    phone_number    { '09012345678' }
  end
end
