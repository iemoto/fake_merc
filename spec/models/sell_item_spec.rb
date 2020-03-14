require 'rails_helper'

RSpec.describe SellItem, type: :model do
  describe '商品出品' do
    it '必須項目が全部ある場合、登録できる' do
      item = build(:item, brand_id: nil, size_id: nil)
      item.valid?
      expect(item).to be_valid
    end
    it '出品画像がない場合、登録できない' do
      image = build(:image, image_url: nil)
      image.valid?
      expect(image.errors[:image_url]).to include("can't be blank")
    end
    it '商品名がない場合、登録できない' do
      item = build(:item, name: nil)
      item.valid?
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
