require 'rails_helper'

RSpec.describe SellItem, type: :model do
  # describe '新規会員登録' do
  #   it 'nick_name,email,passwordが全部ある場合、登録できる' do
  #     user = build(:user)
  #     expect(user).to be_valid
  #   end
  #   it 'nick_nameがない場合、登録できない' do
  #     user = build(:user, nick_name: nil)
      # user.valid?
  #     expect(user.errors[:nick_name]).to include("can't be blank")
  #   end
  describe '商品出品' do
    it '必須項目が全部ある場合、登録できる' do
      item = build(:image_url, :name, :description, :category_id, :item_condition_id, :shipping_fee_id, :prefecture_address_id, :ship_date_id, :money)
      item.valid?
      expect(item).to be_valid
    end
    it '出品画像がない場合、登録できない' do
      image = build(:image, image_url: nil)
      image.valid?
      expect(image.errors[:image_url]).to include("can't be blank")
    end
    it '商品名がない場合、登録できない' do
      @item = Item.new(:item, name: nil)
      @item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end
    it '商品説明がない場合、登録できない' do
      item = build(:item, description: nil)
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end
    it 'カテゴリーがない場合、登録できない' do
      item = build(:item, category_id: nil)
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end
    it '商品の状態がない場合、登録できない' do
      item = build(:item, item_condition_id: nil)
      item.valid?
      expect(item.errors[:item_condition_id]).to include("can't be blank")
    end
    it '配送料の負担がない場合、登録できない' do
      item = build(:item, shipping_fee_id: nil)
      item.valid?
      expect(item.errors[:shipping_fee_id]).to include("can't be blank")
    end
    it '発送元の地域がない場合、登録できない' do
      item = build(:item, prefecture_address_id: nil)
      item.valid?
      expect(item.errors[:prefecture_address_id]).to include("can't be blank")
    end
    it '発送までの日数がない場合、登録できない' do
      item = build(:item, ship_date_id: nil)
      item.valid?
      expect(item.errors[:ship_date_id]).to include("can't be blank")
    end
    it '販売価格がない場合、登録できない' do
      item = build(:item, money: nil)
      item.valid?
      expect(item.errors[:money]).to include("can't be blank")
    end
    end
  end
