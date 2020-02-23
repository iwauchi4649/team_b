FactoryBot.define do
# 仮想ユーザーの設定
  factory :user do
      sequence(:email) { |n| "hoge#{n}@example.com"}
      nickname           {Faker::Name.last_name}
      firstname_full          {Faker::Name.name}
      lastname_full          {Faker::Name.name}
      firstname_cana          {Faker::Name.name}
      lastname_cana          {Faker::Name.name}
      birth_day         {2000}
      point              {0}
      password           {"hogehoge"}
      password_confirmation {"hogehoge"}
      # DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP {nil}
      created_at         {nil}
      updated_at         {nil}
      uid                {nil}
      provider           {nil}
      name               {nil}
      image              {nil}
  end

end
  