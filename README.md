
  ## usersテーブル

  |名前|Column|Type|Options|
  |---|------|----|-------|
  |ID|id|integer|null: false, foreign_key: true|
  |メールアドレス|mail|string|null: false, unique: true| 
  |パスワード|password|string|null: false|
  |ニックネーム|nickname|string|null: false, unique: true|
  |名前(全角)|name_full|string|null: false|
  |名前（カナ）|name_cana|string|null: false|
  |誕生日(年)|birth_year|date|null: false|
  |誕生日(月)|birth_month|date|null: false|
  |誕生日(日)|birth_day|date|null: false|
  |電話番号|call_number|integer |null: false, unique: true|
  |郵便番号|potal_code|integer |null: false|
  |都道府県|prefectures|string|null: false|
  |市町村|municipalties|string|null: false|
  |住所|adress|string|null: false|
  |評価|evalution|string|null: false|
  |ポイント|point|integer |null: false|

  ### Association
  - has_many :goods
  - has_many :credit_cards
  ## credit_cards
  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ユーザーID|user_id|integer |null: false|
  |ID|id|integer |null: false|
  |カード番号|card_number|integer |null: false, unique: true|
  |有効期限(月)|expiration_date_month|date|null: false|
  |有効期限(年)|expiration_date_year|date|null: false|
  |セキュリティーコード|security_code|integer |null: false|

  ### Association
  - belongs_to :user

  ### goodsテーブル

  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ID|id|integer |null: false|
  |フォトID|photo_id|integer | null: false|
  |クレジットID|credit_id|integer | null: false|
  |ユーザーID|user_id|integer |null: false|
  |商品名|name|string|null: false|
  |商品説明|discription|text|null: false|
  |サイズ|size|string|null: false|
  |商品の状態|condition|string|null: false|
  |送料|delivery_fee|integer |null: false|
  |発送元の地域|prefectures|string|null: false|
  |発送までの日数|days|date|null: false|
  |価格|fee|integer |null: false|
  |いいね|nice|integer |null: false|
  |不適切|inappropriate|string|null: false|
  |コメント|comments|text|null: false|

  ### Asociation
  - belongs_to :user
  - belongs_to :brand
  - belongs_to :categorie
  - has_many :photos,dependent: :destroy

  ### photos
  |名前|Column|Type|Options|
  |グッズID|good_id|string|null: false|
  |ID|id|string|null: false|
  |グッズID|goods_id|string|null: false|
  |画像|image|string|null: false|

  ### Asociation
  belongs_to :good
  ### categoriesテーブル

  |名前|Column|Type|Options|
  |--|------|----|-------|
  |カテゴリー名|name|string|null: false|
  |ID|id|integer |null: false|
  |アンセストリー|ansestry|string |null: false|


  ### Asociation
  - has_many :goods,dependent: :destroy


  ### brandsテーブル
  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ブランド名|name|string|null: false|
  |ID|id|integer |null: false|

  ### Asociation
  - has_many :goods, dependent: :destroy
