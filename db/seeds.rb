lady = Category.create(:name=>"レディース")
mans = Category.create(:name=>"メンズ")
appliances = Category.create(:name=>"家電・スマホ・カメラ")
hobby = Category.create(name: "おもちゃ・ホビー・グッズ")

# レディースの子カテゴリ
lady_tops = lady.children.create(:name=>"トップス")
lady_jacket = lady.children.create(:name=>"ジャケット/アウター")
# レディースの孫カテゴリ
lady_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
lady_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])
# メンズの子カテゴリ
mans_tops = mans.children.create(:name=>"トップス")
mans_jacket = mans.children.create(:name=>"ジャケット/アウター")
# メンズの孫カテゴリ
mans_tops.children.create([{:name=>"Tシャツ/カットソー(半袖/袖なし)"}, {:name=>"Tシャツ/カットソー(七分/長袖)"},{:name=>"その他"}])
mans_jacket.children.create([{:name=>"テーラードジャケット"}, {:name=>"ノーカラージャケット"}, {:name=>"Gジャン/デニムジャケット"},{:name=>"その他"}])
# 家電・スマホ・カメラの子カテゴリ
appliances_phone = appliances.children.create(:name=>"スマートフォン/携帯電話")
appliances_accessorie = appliances.children.create(:name=>"スマホ/アクセサリー")
# 家電・スマホ・カメラの孫カテゴリ
appliances_phone.children.create([{:name=>"スマートフォン本体"}, {:name=>"バッテリー/充電器"},{:name=>"その他"}])
appliances_accessorie.children.create([{:name=>"Android用ケース"}, {:name=>"iPhone用ケース"}, {:name=>"カバー"},{:name=>"その他"}])
# おもちゃ・ホビー・グッズの子カテゴリ
hobby_toy = hobby.children.create(name: "おもちゃ")
hobby_card = hobby.children.create(name: "トレーディングカード")
hobby_figure = hobby.children.create(name: "フィギュア")
# おもちゃ・ホビー・グッズの孫カテゴリ
hobby_toy.children.create([{name: "キャラクターグッズ"}, {name: "ぬいぐるみ"}, {name: "小物/アクセサリー"}, {name: "模型/プラモデル"}, {name: "ミニカー"}, {name: "トイラジコン"}, {name: "プラモデル"}, {name: "ホビーラジコン"}, {name: "鉄道模型"}, {name: "その他"}])
hobby_card.children.create([{name: "遊戯王"}, {name: "マジック：ザ・ギャザリング"}, {name: "ポケモンカードゲーム"}, {name: "デュエルマスターズ"}, {name: "バトルスピリッツ"}, {name: "プリパラ"}, {name: "アイカツ"}, {name: "カードファイト!!ヴァンガード"}, {name: "ヴァイスシュヴァルツ"}, {name: "プロ野球オーナーズリーグ"}, {name: "ベースボールヒーローズ"}, {name: "ドラゴンボール"}, {name: "スリーブ"}, {name: "その他"}])
hobby_figure.children.create([{name: "コミック/アニメ"}, {name: "特撮"}, {name: "ゲームキャラクター"}, {name: "SF/ファンタジー/ホラー"}, {name: "アメコミ"}, {name: "スポーツ"}, {name: "ミリタリー"}, {name: "その他"}])