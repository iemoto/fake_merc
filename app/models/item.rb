class Item < ApplicationRecord
  belongs_to :prefecture_address_id
  belongs_to :categorie_id
  belongs_to :item_condition_id
  belongs_to :shippong_fee_id
  belongs_to :shipping_fee_side
  belongs_to :shipping_method_id
  belongs_to :ship_date_id
  belongs_to :brand_id
  belongs_to :size_id

  validates :name, :despriction, :money, :sold_out, :shipping_fee_side, presence: true
end
