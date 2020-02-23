FactoryBot.define do
  factory :good do
    user_id              {1}
    category_id          {1}
    buyer_id             {1}
    name                 {"りんご"}
    condition            {"新品に近い"}
    discription          {"おいしい"}
    size                 {"S"}
    delivery_type        {"送料込み"}
    prefecture           {"東京都"}
    day                  {"2~3日で発送"}
    fee                  {"1000"}
    brand                {"シャネル"}
  end
end