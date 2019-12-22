  ## ids
  |名前|Column|Type|Options|
  |--|------|----|-------|
  |カテゴリー大|categories_top_id(FK)|interger|null: false, foreign_key: true|
  |カテゴリー中|categories_mid_id(FK)|interger|null: false, foreign_key: true|
  |カテゴリー小|categories_bottom_id(FK)|interger|null: false, foreign_key: true|
  |商品(ID)|goods_id(FK)|interger|null: false, foreign_key: true|

  ### Association
  - belongs_to :categories_top
  - belongs_to :categories_mid
  - belongs_to :categories_bottom
  - has_many :goods


  ## usersテーブル

  |名前|Column|Type|Options|
  |---|------|----|-------|
  |ID|id|int|null: false |
  |メールアドレス|mail|varchar(255)|null: false, unique: true| 
  |パスワード|password|varchar(255)|null: false|
  |ニックネーム|nickname|varchar(255)|null: false, unique: true|
  |名前(全角)|name_full|varchar(255)|null: false|
  |名前（カナ）|name_cana|varchar(255)|null: false|
  |誕生日(年)|birth_year|date|null: false|
  |誕生日(月)|birth_month|date|null: false|
  |誕生日(日)|birth_day|date|null: false|
  |電話番号|call_number|interger|null: false, unique: true|
  |郵便番号|potal_code|interger|null: false|
  |都道府県|prefectures|varchar(255)|null: false|
  |市町村|municipalties|varchar(255)|null: false|
  |住所|adress|varchar(255)|null: false|
  |評価|evalution|varchar(255)|null: false|
  |ポイント|point|interger|null: false|

  ### Association
  - belongs_to :goods
  - has_many :credit_card
  ## credit_card
  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ID|id|interger|null: false|
  |カード番号|card_number|interger|null: false, unique: true|
  |有効期限(月)|expiration_date_month|date|null: false|
  |有効期限(年)|expiration_date_year|date|null: false|
  |セキュリティーコード|security_code|interger|null: false|

  ### Association
  - belongs_to :users

  ### goodsテーブル

  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ID|id|interger|null: false|
  |商品名|name|varchar(255)|null: false|
  |画像|image|string|null:　false|
  |商品説明|discription|text|null: false, foreign_key: true|
  |サイズ|size|varchar(255)|null: false|
  |商品の状態|condition|varchar(255)|null: false|
  |送料|delivery_fee|interger|null: false|
  |発送元の地域|prefectures|varchar(255)|null: false|
  |発送までの日数|days|date|null: false|
  |価格|fee|interger|null: false|
  |いいね|nice|interger|null: false|
  |不適切|inappropriate|varchar(255)|null: false|
  |コメント|comments|text|null: false|

  ### Asociation
  - has_many :users
  - has_many :brands
  - has_many :categories_top,through: :ids
  - has_many :categories_mid,through: :ids
  - has_many :categories_bottom,through: :ids
  - belongs_to :ids

  ### categories_topテーブル

  |名前|Column|Type|Options|
  |--|------|----|-------|
  |カテゴリー名|name|varchar(255)|null: false|
  |ID|category_id|interger|null: false, foreign_key: true|

  ### Asociation
  - has_many :ids
  - has_many :goods,through: :ids
  - belongs_to :categories_mid

  ### categories_midテーブル

  |名前|Column|Type|Options|
  |--|------|----|-------|
  |カテゴリー名|name|varchar(255)|null: false|
  |ID|id|interger|null: false, foreign_key: true|

  ### Asociation
  - has_many :ids
  - has_many :categories_top
  - has_many :goods,through: :ids
  - belongs_to :categories_bottom

  ### categories_bottomテーブル

  |名前|Column|Type|Options|
  |--|------|----|-------|
  |カテゴリー名|name|varchar(255)|null: false|
  |ID|id|interger|null: false, foreign_key: true|

  ### Asociation
  - has_many : ids
  - has_many :goods,through: :ids
  - has_many :categories_mid


  ### brandsテーブル
  |名前|Column|Type|Options|
  |--|------|----|-------|
  |ブランド名|name|varchar(255)|null: false|
  |ID|id|interger|null: false, foreign_key: true|

  ### Asociation
  - belongs_to :goods

  <!-- |カテゴリー|categories|interger|null: false, foreign_key: true|
  |ブランド|brand|varchar(255)|null: false, foreign_key: true| -->