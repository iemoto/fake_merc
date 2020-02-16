class SellItem < ApplicationRecord
  # belongs_to :user_id
  # belongs_to :item_id

  validates :delibery_for, :arrival_to, :commition, presence: true
end
