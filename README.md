
  ## usersテーブル

  |名前|Column|Type|Options|
  |---|------|----|-------|
  |ID|id|integer|null: false|
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
  |ポイント|point|integer |null: false|

  ### Association
  - has_many :goods
  - has_many :credit_cards
  - has_many :evalutions
  - has_many :comments

  ## credit_cards
  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ID|id|integer |null: false|
  |ユーザーID|user_id|integer |null: false,foreign_key: true|
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
  |カテゴリーID|category_id|integer |null: false,foreign_key: true|
  |ブランドID|brand_id|integer |null: false,foreign_key: true|
  |ユーザーID|user_id|integer |null: false,foreign_key: true|
  |いいねID|like_id|integer |null: false,foreign_key: true|
  |商品名|name|string|null: false|
  |商品説明|discription|text|null: false|
  |サイズ|size|string|null: false|
  |送料|delivery_fee|integer |null: false|
  |発送元の地域|prefectures|string|null: false|
  |発送までの日数|days|date|null: false|
  |価格|fee|integer |null: false|

  ### Asociation
  - belongs_to :user
  - belongs_to :brand
  - belongs_to :categorie
  - belongs_to :like
  - has_many :photos,dependent: :destroy
  - has_many :conditions,dependent: :destroy
  - has_many :comments,dependent: :destroy


  ### wrongテーブル
  名前|Column|Type|Options|
  |--|------|----|-------|
  |ID|id|integer |null: false|
  |商品ID|good_id|integer |null: false,|
  |不適切|wrong|string|null: false|

  ### Asociation
  belongs_to :good

  ### comments
  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ID|id|integer |null: false|
  |ユーザーID|id|integer |null: false,foreign_key: true|
  |コメント|comment|text|null: false|

  ### Asociation
  belongs_to :user

  ### conditionsテーブル
  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ID|id|integer |null: false|
  |グッズID|good_id|integer |null: false,foreign_key: true|
  |商品の状態|condition|string|null: false|

  ### Asociation
  belongs_to :good
  
  ### likesテーブル
  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ID|id|integer |null: false|
  |ユーザーID|user_id|integer |null: false,foreign_key: true|
  |いいね|like|integer |null: false|

  ### Asociation
  belongs_to :user

  ### photos
  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ID|id|string|null: false|
  |グッズID|good_id|string|null: false,foreign_key: true|
  |画像|image|string|null: false|

  ### Asociation
  belongs_to :good

  ### evalutions
  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ID|id|string|null: false|
  |ユーザーID|user_id|integer |null: false,foreign_key: true|
  |評価|evalution|string|null: false|

  ### Asociation
  belongs_to :user

  ### categoriesテーブル
  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ID|id|integer |null: false|
  |カテゴリー名|name|string|null: false|
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
