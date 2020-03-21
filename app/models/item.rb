class Item < ApplicationRecord
  has_many :images
  has_one :sell_item
  has_many :brands
  accepts_nested_attributes_for :images, allow_destroy: true
  accepts_nested_attributes_for :brands

  validates :name, :description, :money, :prefecture_address_id, \
            :category_id, :item_condition_id, :shipping_method_id, \
            :shipping_fee_id, :ship_date_id, presence: true
  validates :exhibition, :during_transaction, :soldout, inclusion: { in: [true, false] }
end
