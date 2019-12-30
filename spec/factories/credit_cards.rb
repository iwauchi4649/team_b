FactoryBot.define do
  # 仮想ユーザーの設定
  factory :credit_card do
    user_id                {"1"}
    sequence(:card_number)  { |n| "1234567891234567#{n}"}
    expiration_date_month   {"1"}
    expiration_date_year    {"1"}
    security_code            {"1"}
  end
end
