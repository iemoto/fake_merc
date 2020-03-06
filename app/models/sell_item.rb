class SellItem < ApplicationRecord
  belongs_to :user
  belongs_to :item

  # validates :user_id, :item_id, :delibery_for, :arrival_to, :commition_fee,  presence: true,
end
