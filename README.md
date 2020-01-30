# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

# DB設計
## Usersテーブル

|Column|Type|Options|
|------|----|-------|
|nick_name|string|null: false,index: true|
|email|string|null: false,index: true,unique: true|
|password|string|null: false|

### Association
- has_many :groups_users
- hss_many :groups, through: :groups_users
- has_many :chats

## Delivery_usersテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|post_number|string|null: false,index: true,unique: true|
|prefecture_address|references|null: false|
|municipality_address|string|null: false|
|municipality_address|string|null: false|


### Association
- has_many :groups_users
- hss_many :groups, through: :groups_users
- has_many :chats

## chatsテーブル

|Column|Type|Options|
|------|----|-------|
|content|string||
|image|string||
|user|references|null: false, foreign_key: true|
|group|references|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
