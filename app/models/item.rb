class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size, optional: true
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :ship_date
  belongs_to_active_hash :prefecture_address
  belongs_to_active_hash :item_condition
  belongs_to :category
  belongs_to :brand, optional: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :description, :money, :prefecture_address_id, \
            :category_id, :item_condition_id, :shipping_method_id, \
            :shipping_fee_id, :ship_date_id, :brand_id, presence: true
  validates :exhibition, :during_transaction, :soldout, inclusion: { in: [true, false] }
  validates :description, presence: true
  # validates :prefecture_address, presence: true
end
