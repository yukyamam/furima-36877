FactoryBot.define do
  factory :item do
    # image                   {}
    item_name               {'ポケモン新作ゲームカセット'}
    description             {'ルビー・サファイアの復刻版です！'}
    category_id             {6}
    condition_id            {2}
    delivery_fee_id         {3}
    prefecture_id           {12}
    scheduled_delivery_id   {4}
    price                   {5000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  end
end
