# coding: utf-8

# Create dummy users

users = []
50.times do |no|
  gimei = Gimei.person
  users << User.new(
    user_name: Faker::Internet.user_name,
    email: Faker::Internet.email,
    first_name: gimei.first.kanji,
    first_name_kana: gimei.first.hiragana,
    last_name: gimei.last.kanji,
    last_name_kana: gimei.last.hiragana,
    birthday: Faker::Time.between(40.years.ago, 18.years.ago, :all).to_s[0, 10],
    univ_id: University.pluck(:id).sample,
  )
end

