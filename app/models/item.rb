class Item < ApplicationRecord
  # belongs_to :prefecture_address_id
  # belongs_to :categorie_id
  # belongs_to :item_condition_id
  # belongs_to :shippong_fee_id
  # belongs_to :shipping_fee_side
  # belongs_to :shipping_method_id
  # belongs_to :ship_date_id
  # belongs_to :brand_id
  # belongs_to :size_id
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true
  validates :name, :description, :money, :prefecture_address_id, \
            :category_id, :item_condition_id, :shipping_method_id, \
            :shipping_fee_id, :ship_date_id, :brand_id, presence: true
  validates :exhibition, :during_transaction, :soldout, inclusion: { in: [true, false] }
  validates :description, presence: true
  # validates :prefecture_address, presence: true
end
