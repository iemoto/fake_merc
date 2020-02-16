class Image < ApplicationRecord
  # belongs_to :item_id

  validates :image_url, presence: true
end
