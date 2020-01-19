lady = Category.create(:name=>"レディース")

lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")

lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])

mans = Category.create(:name=>"メンズ")

mans_tops = mans.children.create(:name=>"トップス")
mans_jacket = mans.children.create(:name=>"ジャケット/アウター")

mans_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
mans_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])

appliances = Category.create(:name=>"家電・スマホ・カメラ")

appliances_phone = appliances.children.create(:name=>"スマートフォン/携帯電話")
appliances_accessorie = appliances.children.create(:name=>"スマホ/アクセサリー")

appliances_phone.children.create([{:name=>"スマートフォン本体"}, {:name=>"バッテリー/充電器"},{:name=>"その他"}])
appliances_accessorie.children.create([{:name=>"Android用ケース"}, {:name=>"iPhone用ケース"}, {:name=>"カバー"},{:name=>"その他"}])