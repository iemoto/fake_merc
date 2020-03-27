class SellItem < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item
  # belongs_to :sell_money, optional: true
end
