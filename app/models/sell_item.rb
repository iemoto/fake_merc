class SellItem < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item
  # validates :user_id, optional: true
  # validates :item_id, optional: true
  # validates :delibery_for, optional: true
  # validates :arrival_to, optional: true
  # validates :commition_fee, optional: true
end
