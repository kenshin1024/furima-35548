FactoryBot.define do
  factory :item do
    title               {"a"}
    description         {"a"}
    category_id         {2}
    condition_id        {2}
    delivery_fee_id     {2}
    prefecture_id       {2}
    scheduled_delivery_id  {2}
    price               {500}
    user_id             {1}

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/sample.png'), filename: 'sample.png')
    end
  end
end
