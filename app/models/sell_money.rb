class SellMoney < ApplicationRecord
  belongs_to :user
  belongs_to :sell_item
  validates :user, :sell_item, presence: true
end
