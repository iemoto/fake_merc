class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :size
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :ship_date
  belongs_to_active_hash :prefecture_address  
  belongs_to_active_hash :item_condition
  belongs_to :category, optional: true
  belongs_to :brand, optional: true
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  # validates :name, :money, presence: true
end
