class SellMoney < ApplicationRecord
  belongs_to :user
  belongs_to :sell_item, optional: true
  validates :user, :sell_item, presence: true
end
