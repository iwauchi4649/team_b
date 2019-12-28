FactoryBot.define do
# 仮想ユーザーの設定
  factory :user do
      sequence(:email) { |n| "hoge#{n}@example.com"}
      nickname           {"user"}
      name_full          {"メルカリ太郎"}
      name_cana          {"メルカリタロウ"}
      birth_year         {"2000"}
      birth_month        {"12"}
      birth_day          {"12"}
      call_number        {"09012345678"}
      point              {"0"}
      password           {"hogehoge"}
  end

end