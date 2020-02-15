class SellItem < ApplicationRecord
  belongs_to :prefecture_address_id
  belongs_to :categorie_id
  belongs_to :item_condition_id
  belongs_to :shippong_fee_id
  belongs_to :shipping_fee_side
  belongs_to :shipping_method_id
  belongs_to :ship_date_id
  belongs_to :brand_id
  belongs_to :size_id

  validates :name, :despriction, :money, :sold_out, :prefecture_address_id, :categorie_id, :item_condition_id, :shipping_fee_id, :shipping_fee_side,
            :ship_date_id, :shipping_method_id, :brand_id, :size_id, presence: true
end
