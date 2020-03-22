![GitHub contributors](https://img.shields.io/github/contributors/TAKUYA-KUSAKABE/fake_merc)
![GitHub closed pull requests](https://img.shields.io/github/issues-pr-closed-raw/TAKUYA-KUSAKABE/fake_merc)
![GitHub closed issues](https://img.shields.io/github/issues-closed/TAKUYA-KUSAKABE/fake_merc)
![GitHub top language](https://img.shields.io/github/languages/top/TAKUYA-KUSAKABE/fake_merc)
![GitHub code size in bytes](https://img.shields.io/github/languages/code-size/TAKUYA-KUSAKABE/fake_merc)
![GitHub watchers](https://img.shields.io/github/watchers/TAKUYA-KUSAKABE/fake_merc?style=social)


<h1 align-items='center'>Fake Mercari</h1>

![fake](/materials/topPage.png)

# ER図
![ER](/materials/ER.png)

# DB設計
## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nick_name|String|null: false,index: true|
|email|String|null: false,index: true,unique: true|
|password|String|null: false|

### Association
- has_one :delivery_users,dependent: :delete_all
- has_one :parsonal_users,dependent: :delete_all
- has_one :credit_cards,dependent: :delete_all
- has_many :point_moneys,dependent: :delete_all
- has_one :user_profiles,dependent: :delete_all
- has_many :user_ratings
- has_many :to_dos,dependent: :delete_all
- has_many :likes
- has_many :sell_comments
- has_many :sell_items,dependent: :delete_all
- has_many :buy_items,dependent: :delete_all
- has_many :sell_moneys,dependent: :delete_all
- has_many :buy_comments

## Delivery_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user|References|
|first_name|String|null: false|
|last_name|String|null: false|
|first_name_kana|String|null: false|
|last_name_kana|String|null: false|
|post_number|Integer|null: false|
|prefecture_address|References |null: false|
|municipality_address|String|null: false|
|street_address|String|null: false|
|building_name_adress|String|
|phone_number|Integer|

### Association
- belongs_to :user

## Parsonal_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user|References|null: false|
|birth_year|Integer|null: false|
|birth_month|Integer|null: false|
|birth_day|Integer|null: false|
|post_number|Integer|
|prefecture_address|References|null: false|
|municipality_address|String|
|street_address|String|
|building_name_adress|String|

### Association
- belongs_to :user

## Credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user|References|null: false|
|card_number|Integer|null: false|
|card_month|Integer|null: false|
|card_year|Integer|null: false|
|security_code|Integer|null: false|

### Association
- belongs_to :user

## Point_moneysテーブル
|Column|Type|Options|
|------|----|-------|
|user|References|null: false|
|point_moneys|Integer|null: false|
|sell_money|References|
|buy_item|References|

### Association
- belongs_to :user
- belongs_to :sell_money
- belongs_to :buy_item

## User_profilesテーブル
|Column|Type|Options|
|------|----|-------|
|user|References|null: false|
|profile|String|

### Association
- belongs_to :user

## User_ratingsテーブル
|Column|Type|Options|
|------|----|-------|
|user|References|null: false|
|good|Integer|
|nomal|Integer|
|bad|Integer|
|sell_item|References|
|buy_item|References|

### Association
- belongs_to :user
- belongs_to :sell_item
- belongs_to :buy_item

## To_dosテーブル
|Column|Type|Options|
|------|----|-------|
|user|References|null: false|
|sell_item|References|
|buy_item|References|

### Association
- belongs_to :user
- belongs_to :sell_item
- belongs_to :buy_item

## Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|String|null: false|
|despriction|String|null: false|
|money|Integer|null: false|
|sold_out|boolean|null: false|
|prefecture_address|References|null: false|
|categorie|References|null: false|
|item_condition|References|null: false|
|shipping_fee|References|null: false|
|shipping_fee_side|boolean|null: false|
|shipping_method|References|null: false|
|ship_date|References|null: false|
|shipping_method|References|null: false|
|brand|References|
|size|References|null: false|

### Association
- has_many :categorie

## Likesテーブル
|Column|Type|Options|
|------|----|-------|
|Item|References|null: false,foreign_key: ture|
|user|References|null: false,foreign_key: ture|

### Association
- belongs_to :item
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|item|References|null: false|
|image_url|String|null: false|

### Association
- belongs_to :item

## Sell_Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|References|null: false|
|sell_item|References|null: false|
|sell_message|String|null: false|

### Association
- belongs_to :user
- belongs_to :sell_item

## Categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|String|null: false|
|ancestry|String|null: false|
|brand|boolean|null: false|
|size|boolean|null: false|

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size_categorie|String|null: false|

### Association
- belongs_to :item

## Sell_Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|References|null: false|
|item|References|null: false|
|delibery_for|boolean|null: false|
|arrival_to|boolean|null: false|
|commition|integer|null: false|

### Association
- belongs_to :user
- has_many :items,dependent: :delete_all
- has_many :user_ratings
- has_many :to_dos,dependent: :delete_all
- has_many :sell_comments,dependent: :delete_all
- has_many :buy_items,dependent: :delete_all
- has_many :sell_moneys

## Buy_Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|user|References|null: false|
|Arrival_confirmation|boolean|null: false|
|sell_item|References|null: false|

### Association
- belongs_to :user
- belongs_to :sell_item
- has_many :point_moneys
- has_many :user_ratings
- has_many :to_dos,dependent: :delete_all
- has_many :buy_comments,dependent: :delete_all

## Sell_moneysテーブル
|Column|Type|Options|
|------|----|-------|
|user|References|null: false|
|sell_item|References|null: false|
|sell_money|Integer|null: false|

### Association
- belongs_to :user
- belongs_to :sell_item
- has_many :point_moneys

## Buy_Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user|References|null: false|
|buy_item|References|null: false|
|buy_message|String|null: false|

### Association
- belongs_to :user
- belongs_to :buy_item
