class SellItem < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :item
  # has_many :images, dependent: :destroy
end
